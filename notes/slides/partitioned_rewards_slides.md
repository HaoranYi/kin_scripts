---
marp: true
---

# Partitioned Epoch Reward Distribution

https://github.com/solana-foundation/solana-improvement-documents/pull/15

by Haoran Yi (@solana labs)

----

# Background

- long block time at epoch boundary because of paying out rewards (i.e. 550K active stake accounts)

```
update_rewards_with_thread_pool_us
                             num_nodes     mean      25%   median      75%      90%
epoch parent_slot slot
400   172799999   172800004       1856   6.0446   4.7005   5.5542   6.9978   8.2098
                  172800008       1849   5.9215   4.6368   5.5042   6.7184   8.0151
                  172800012       1820   6.4132   4.9909   5.9759   7.3126   8.7821
                  172800016       1817   6.1725   4.8232   5.7501   7.1026   8.4538
                  172800020       1860  22.5487  14.1648  19.3020  25.9193  37.9001
                  172800024       1825   5.7729   4.6952   5.4360   6.5741   7.4773
                  172800028       1816   5.7738   4.6650   5.4328   6.5811   7.4315
                  172800032       1814   5.7824   4.6077   5.4334   6.5606   7.6282
                  172800036       1816   5.7568   4.6698   5.4193   6.4865   7.4628
```

----

# New Approach
- Spread out reward distribution over multiple blocks
- Two phases
    - Reward Calculation Phase
    - Reward Distribution Phase

----

# Rewards Calculation
- Compute all the rewards to be distributed
- Last for N = 1000 block height
- Use a background service to do the calculation

----

# Rewards Distribution
- Distribute the rewards over M blocks
- Each block distribute 64 * 64 rewards (4K total)
- Reward distribution happens before TXN processing

----

# EpochRewardHistory Sysvar Account
- maintains a history of epoch rewards (i.e. 512)

```
struct RewardHistoryEntry {
   total_reward_in_lamport: u64,          // total rewards for this epoch
   distributed_reward_in_lamport: u64,    // already distributed reward amount
   root_hash: Option<Hash>,               // hash computed from all EpochRewardReserves
}

type EpochReward = (Epoch, RewardHistoryEntry);

struct RewardHistory {
   rewards: [EpochReward; 512],
}
```

----

# EpochRewardReserve Sysvar Account
- tracks the reward to be distributed for a block

```
crate::declare_sysvar_id!("SysvarRewardReserve11111111111111111111111111111", EpochRewardReserve);

struct EpochRewardReserve {
   reserve_hash: Hash,
   balance: u64
}
```
- `address = hash("SysvarRewardReserve11111111111111111111111111111", block_height)`.

----

# Reward Hash

```
root_hash = Hash(EpochRewardReserve[..].reserve_hash)



                     +-------------+
                     |             |
                     |  root_hash  |
                     |             |
                     +------+------+
                            |
    +--------------+--------+-----------+
    |              |                    |
+---+----+   +-----+--+             +---+-----+
|reserve |   | reserve|   ......    | reserve |
| hash   |   |  hash  |             |  hash   |
+--------+   +--------+             +---------+

```

----

# Impact
- Restrict stake account access during reward period
    - i.e. withdraw, merge, split stakes need to wait
    - new transaction error: LockedRewardAccountsDuringEpochReward.
- Snapshot and cluster restart during reward period
    - new field in snapshot
        - `reward_calculation_result: Option<RewardCalculationResult>`
    - cluster restart load reward_calculation_result
        - resume reward distribution


----

# Q&A

https://github.com/solana-foundation/solana-improvement-documents/pull/15
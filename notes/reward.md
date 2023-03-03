# Solana Rewards

Problem to pay vote reward at epoch boundary?

1. vote reward computation depends on stake rewards
    - reward/point * point
        - point is based on stakes and delegated time portion for the vote credit
    - stake_state commission split 
        - discard fractional rewards
In short, vote rewards depends on stake_rewards. Can't be done without stake_rewards.

    13.5, 12.5  --> 25
    13.5, 12.5  --> 26  (sum up)
    
fn bank.get_stake_accounts

Aggregated sum of the stakes per vote nodes (into_grouping_map.aggregate, then reduce on the total)
::VoteAccounts


Bank::staked_nodes() --> map<voter, stake>

self.stakes_cache
            .stakes()
            .staked_nodes()
            .par_iter()
            .for_each(|(pubkey, _)| {
                minimized_account_set.insert(*pubkey);
            });



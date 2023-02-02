# Accounts DB

AccountsDB manages account's data. Account data, state of the newwork, a special
implementation of the log-like database - Append-only database. The underlying
storage is `AppendVec`. And the accounts_DB maintains a index with (pubkey, slot)
for lookup of accounts data, and caches.

![Alt text](./out/accounts_db_diagram/accounts_db_diagram.svg)

## AppendVec

All accounts data are stored on AppendVec. AppendVec is a append-only memory
mapped files. One AppendVec stores all the accounts update for a slot. Each
entry in the AppendVec is a key-value pair: (pubkey, account_data).

AppendVec storage file name `<Slot>.<id>`. `id` is unique increasing number.
Historically, a slot can have multiple AppendVec storages. Each replay of a
block will create a new AppendVec file for that slot. However, after introducing
the write cache, all the writes for a slot are first cached and only dumped to
AppendVec after block is rooted. So there will be one appendVec for a slot.

### AncientAppendVec
To reduce the number of AppendVec files. Old AppendVec files that are 1-epoch
ago are squashed into AncientAppendVec, which contains all the AppendVec for
`slot < curr-slots_in_epoch`.

## Account-DB index

A different view of the accounts-db to facilitate fast lookup of pubkey and
accounts data history for slots from AppendVecs.

Format:
- pubkey -> SlotList.
- SlotList ->[(slot, offset_in_appendvec)]

Index doesn't store the accounts data, rather it stores the offset in the
AppendVec for the accounts data.

The index is also stored on the disk by memory mapped files.

## Accounts-DB read cache

A read-only cache, which get populated when reading. When writing, updated entries are removed from the cache.
Format:
- (pubkey, slot)-> data

## Accounts-DB write cache

Instead of saving every writes to the account to AppendVec individually when
replay the blocks, a write cache is introduced to hold all the account data
update for a slot. Format:
- slot->(pubkey, accounts).

And the contents of the cached are dumped into AppendVec only during cache flush
- A Batch Stores.

When a block is rooted, the entry (slot, cache_entry) in the cache becomes
candidate to flush.

Account caches are managed by `Accounts-db background service`, which periodically
flush clean and store accounts cache entries into disk AppendVec.

- Cache data structure
```
    slot-->CachedAccounts
             --> (pubkey, account), statistics, flags (is_frozen)
```

# Accounts DB

Account data, state of the newwork, a special implementation of the log-like database. Append-only database. Index by pubkey, slots. 

## AppendVec

All accounts data are stored on AppendVec. AppendVec is a append-only memory mapped files. Each AppendVed stores the accounts associated with a slot, which are updated during a specific slot. Each entry in the AppendVec contains a (pubkey, account_data).

## Account-DB index

A different view of the accounts-db to facilitate fast lookup of pubkey and accounts data history for slots from AppendVecs.
pubkey -> SlotList. SlotList -> [(slot, offset_in_appendvec)]

Index doesn't store the accounts data, rather it stores the offset in the AppendVec for the accounts data.

The index is also stored on the disk by memory mapped files.

## Accounts-DB read cache

read-only cache, when get populated during reading, when writing, remove from the cache.
(pubkey, slot)-> data

## Accounts-DB write cache

Instead of saving every writes to the account to AppendVec individually, holding all the account data in accounts-cache, slot->(pubkey, accounts). And only store them during cache flush. Batch stores. When a block is rooted, the cache (slot, cache_entry) becomes candidate to flush.
Accounts-db background service periodically, flush clean and store accounts caches into disk AppendVec.
Cache data structure
    slot-->CachedAccounts
             --> (pubkey, account), statistics, flags (is_frozen)

# solana Gossip

Resulted are stored in CRDS (database)

IndexMap: iter order is by the sequence of insertion and removals
    - m.get(cursor)
    - insert maintains the order

Bound of range
    - included/excluded

BTree
    - range bound

CrdsData
    - ContactInfo
    - vote
    - EpochSlots


crds - cluster replicated data store
    - gossip storage
    pubkey --> value lables
        each value label -> crds value
    one level hashmap, where key=(pubkey, value_lable), val= byte array of serialized data

   // use enum and struct to represent the crds value variant
    struct CrdsValue {
        signature
        CrdsData
    }

    enum CrdsData {
        ContactInfo(ContactInfo),
        Vote(Vote),
        ...
    }

    struct ContactInfo {
        ...
    }

    struct Vote {
        ...
    }


core/voting_service.rs
    - handle_vote
         cluster_info.send_transaction() // cluster_info hold a socket to the leader to send vote transaction
         push_vote() to crds for gossip

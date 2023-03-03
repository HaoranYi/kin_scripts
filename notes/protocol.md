# Solana Protocol

This document summarizes the network protocols used in the solana network.

## Turbine

Block shred fetch and broadcast.  
Turbine layers: leader --> layer 1 --> layer 2.
1-n: layer is constructed from weighter shuffle of nodes layer by layer.
leader push the shreds on socket, then downstream nodes pull from the channel, then push further down ...

## Gossip

Randomly send message to neighboring nodes. And neighboring nodes sends to its neighbors when receiving the message.

It is used to communicate info across cluster.

- Vote for blocks: (slot, votes) process for confirmation faster

- Cluster Info: (node_contact_info) of the cluster

- Epoch Slot: (leader schedule of the epoch)

## Repairs

Request and response
    - nodes that are missing shreds, will look up the cluster info and find out the most likely nodes to ask for shreds with repair request.
    - peers received the repair requests, will transmit the shreds from its block store and then send repaired shreds to the requesting nodes
    - type of request
        - specific shred
        - slot
        - parent slot

repair request message

```
#[derive(Debug, AbiEnumVisitor, AbiExample, Deserialize, Serialize)]
#[frozen_abi(digest = "3bgE3sYHRqetvpo4fcDL6PTV3z2LMAtY6H8BoLFSjCwf")]
pub enum RepairProtocol {
    LegacyWindowIndex(LegacyContactInfo, Slot, u64),
    LegacyHighestWindowIndex(LegacyContactInfo, Slot, u64),
    LegacyOrphan(LegacyContactInfo, Slot),
    LegacyWindowIndexWithNonce(LegacyContactInfo, Slot, u64, Nonce),
    LegacyHighestWindowIndexWithNonce(LegacyContactInfo, Slot, u64, Nonce),
    LegacyOrphanWithNonce(LegacyContactInfo, Slot, Nonce),
    LegacyAncestorHashes(LegacyContactInfo, Slot, Nonce),
    Pong(ping_pong::Pong),
    WindowIndex {
        header: RepairRequestHeader,
        slot: Slot,
        shred_index: u64,
    },
    HighestWindowIndex {
        header: RepairRequestHeader,
        slot: Slot,
        shred_index: u64,
    },
    Orphan {
        header: RepairRequestHeader,
        slot: Slot,
    },
    AncestorHashes {
        header: RepairRequestHeader,
        slot: Slot,
    },
}
```
Nonce ~ once: non-repeating, ok, I lied. with very low probability of repeating, but unable to predict. usually a random number/pseud number
    to protect from replay attack
    usually used with a timestamp.
    the server will remember the nounce it has seen. and ignore duplicates.
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

## Repair

Request and response
    - nodes that are missing shreds, will look up the cluster info and find out the most likely nodes to ask for shreds with repair request.
    - peers received the repair requests, will transmit the shreds from its block store and then send repaired shreds to the requesting nodes
    - type of request
        - specific shred
        - slot
        - parent slot

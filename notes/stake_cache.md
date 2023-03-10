# Stake Cache

Cache for the vote accounts and Stake accounts.

StakeAccounts with delegations are cached in im::HashMap. Each bank makes are copy of it. When updating, it will clone the node 64 values and updates it parents. log_64(n)

## im::HashMap

immutable data structure originated from functional programming paradigm.
immutable data structure can be copied and modified efficiently without altering the original.
cons list - a  typical example of immutable list.
The underlying implementation uses structure sharing, i.e. share the tail of the list.
    - reduce the memory usage
    - copy is cheap

64 values are stored in a node.
when the value in the node is modified, the node is cloned. And its parents are
also cloned. And its parent parent ... are cloned. Only tails are shared.

The value in the node must be clone. so for large data wrap them in Rc.

[1,2,3,4]
[0] ->[1,2,3,4]
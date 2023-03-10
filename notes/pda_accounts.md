# PDA accounts

standard account has both private and public keys
    - private key: [u8; 32]
    - pubkey: [u8; 32]
total 64 bytes (ED25519)

PDAs
    - parent program ID
    - seeds
    - bump seed

hash(parent_prog_id, seeds, bump_seed), bump_seed = 255
    bump_seed-- when on the curve

PDA as hashmap
    - key-value pairs
    - store state/data for parent program

https://www.alchemy.com/overviews/program-derived-address

Mainly to power horse for DApp

user_login --> core program --> Pfp program --> PDA created
                                                (pubkey, seend, bump)


user_login --> core program --> Pfp program --> PDA verified
                                                (pubkey, seend, bump)

PDA can only be run from its parent program, where the parent program are
verified with the private_key.


# how to add native program in solana validators

stake_instruction.rs
    - process_instruction

builtins
    entry function
        - system_program::process_instruction
        - vote_processor::process_instruction
        - stake_instruction::process_instruction
    use program id to distribute to entry function (map)

add a buildin program
    - create program derived account for the buildin program (owner)
    - buildin program defines instructions to update accounts
    - those instructions can be processed in transaction (access network state through context)
    - those instructions can be processed in bank_runtime
import workshop_ofac.aleo;

/*
====================================================================================================================
TASK 0: Name Your Token

TODO: 
    1. Choose what your token program will be named! This should be longer than 10 characters to avoid additional
       network fees and not conflict with any existing program on the network
        - ex) `dogecoin_token.aleo`
    2. Change the name of the program below
        - ex) `program dogecoin_token.aleo {`
    3. Change the "program" field in the program.json file to match the name of your new program

====================================================================================================================  
*/
program project_zero.aleo {
    mapping balances: address => u64;  // On-chain mapping between user addresses and public token balances

    record Token {
        owner: address,  // The token owner
        amount: u64,     // The token amount
    }

    @noupgrade
    async constructor() {}





    /*
    ====================================================================================================================
    TASK 1: Mint (Public)

    This feature mints new tokens by updating the public mapping value of the recipient
    
    TODO:
        `mint_public`:
            1. Query the `address_check` function in `workshop_ofac.aleo` with the `recipient` field
            2. Pass the returned Future and other appropriate fields to the `mint_public_onchain` function

        `mint_public_onchain`:
            1. Await the `address_check` Future
            2. Set the value for `recipient` in the `balances` mapping to the current value plus `amount` 

    
    ====================================================================================================================  
    */
    async transition mint_public(
        public recipient: address, 
        public amount: u64
    ) -> Future {
        let address_check : Future = workshop_ofac.aleo/address_check(recipient);

        // TODO: Fill in here
        return mint_public_onchain(recipient, amount, address_check);
    }

    async function mint_public_onchain(
        public recipient: address, 
        public amount: u64,
        public address_check : Future
    ) {
        address_check.await();

        // TODO: Fill in here
    }















    
}

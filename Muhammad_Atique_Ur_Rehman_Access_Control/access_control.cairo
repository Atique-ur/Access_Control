#[starknet::contract]
mod AccessControl {  //groups all contract code together.

    use starknet::get_caller_address; ////use imports built-in Starknet tools.
    use starknet::ContractAddress;

    // storage variables
    #[storage]  
    struct Storage {
        owner: ContractAddress, //
    }

    // Constructor sets deployer as owner
    #[constructor]
    fn constructor(ref self: ContractState) {
        let caller = get_caller_address();  //
        self.owner.write(caller);
    }

    // Only owner can call this function
    #[external(v0)]
    fn protected_function(ref self: ContractState) {   //

        let caller = get_caller_address();  //checks condition if false:transaction fails

        let owner = self.owner.read();
        assert(caller == owner, 'Access denied'); // use comparison operator check equallity
    }

    // Transfer ownership to another address
    #[external(v0)]
    fn transfer_ownership(  //function to change owner.
        ref self: ContractState,
        new_owner: ContractAddress  //stores new owner's address.
    ) {

        let caller = get_caller_address();
        let owner = self.owner.read();

        assert(caller == owner, 'Only owner'); //cannot change storage just view

        self.owner.write(new_owner);   //new owner added
    }

    // returns current owner address
    #[view]
    fn get_owner(self: @ContractState) -> ContractAddress {
        self.owner.read()
    }
}
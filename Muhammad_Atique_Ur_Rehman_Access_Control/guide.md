#Access control in Cairo

## introduction
Access control is used in smart contracts to restrict certain functions to authorized users only.
users can access only few fuctions that they own/allowed.


## Concepts Used
- storage variables
- Constructor
- External functions: that can be called by users or other contracts from outside the smart contract.
- View functions : restricted user can view only
- Caller address validation : checking the person calling the function is authorized to perform that action?

## constructor()
This function sets the deployer as the owner of the contract.

## protected_function()
This function can only be called by the owner.

## transfer_ownership()
This function transfers ownership to another address.

## get_owner()
This function returns the current owner address.

## Conclusion
This assignment demonstrates how access control can be implemented in Cairo smart contracts using owner verification.
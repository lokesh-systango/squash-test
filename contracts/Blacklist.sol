// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
  *  @title ERC721Token contract for creating ERC721 standard (Non-Fungible) Token.
  *  @author The Systango Blockchain Team.
*/

contract BlackList {

    /**
     * @dev Mapping between the address and boolean for blacklisting.
    */ 
    mapping (address => bool) public blackList;

    /** 
     *  @dev Event to trigger the addition of address to blacklist mapping
    */
    event AddedToBlackList(address _user);

    /** 
     * @dev Event to trigger the removal of address from blacklist mapping
    */
    event RemovedFromBlackList(address _user);

    /**
     * @dev This function would add an address to the blacklist mapping.
     * @param user, The account to be added to blacklist.
     * @return _addToBlackList, function successfully added and return blocklist user status true.
    */ 
    function _addToBlackList(address user) internal virtual returns (bool) {
        blackList[user] = true;
        emit AddedToBlackList(user);
        return true;
    }

    /** 
     * @dev This function would remove an address from the blacklist mapping.
     * @param user, The account to be removed from blacklist.
     * @return _removeFromBlackList, function successfully removed and return blocklist user status true.
    */
    function _removeFromBlackList(address user) internal virtual returns (bool) {
        blackList[user] = false;
        emit RemovedFromBlackList(user);
        return true;
    }

    /** 
     * @dev This function would check an address from the blacklist mapping.
     * @param _user, The account to be checked from blacklist mapping.
     * @return _isBlackListUser, function return the user which is added in blacklist
     */
    function _isBlackListUser(address _user) internal virtual returns (bool){
        return blackList[_user];
    }

    /** 
     * @dev Modifier to check address from the blacklist mapping
     * @param _user, The account to be checked from blacklist mapping
    */
    modifier whenNotBlackListedUser(address _user) {
        require(!_isBlackListUser(_user), "ERC721Token: This address is in blacklist");
        _;
    }
}

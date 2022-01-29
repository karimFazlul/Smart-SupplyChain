// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/supplyChain.sol";

contract SupplyChainTest {
   
    bytes32[] proposalNames;
   
    SmartSupplyChain supplyChain;
    
    function beforeAll () public {
        proposalNames.push(bytes32("candidate1"));
        supplyChain = new SmartSupplyChain();
    }
    // ==================== Test-1 ============================
    // adds a manager to the contract
    function checkMemberAdd() public{
        bool newMember; 
        newMember = supplyChain.addMember(101, "user1", "user1@test.com", "12345", "manager","KL");
        Assert.equal(newMember, true, "A new user has successfully been added to the contract");
    }

    // ==================== Test-2 ============================
    //   creates a new shipment
    // need to add a manager to contract before exicuting this test
    function createShipmentOrder() public{
        bool newShipment;
        uint[] memory products = new uint[](10);
        newShipment = supplyChain.createShipmentOrder(2002,'10/12/2021 12:00:00', 102,103, 102, 1001, products,101);
        Assert.equal(newShipment, true, "A new shipment order has successfully been created");
    }
    // ==================== Test-3 ============================
    //  manager approves ownership transfer
    // need to add a manager to contract before exicuting this test
    function checkOwnershipTranfer() public{
        string memory role;
        role = supplyChain.approveOwnershipTransfer(101,2002, "yes");
        Assert.equal(role, "manager", "Manager has approved ownership transfer");
    }

    // ==================== Test-4 ============================
    // adds a seller to the contract
    function checkMemberAdd2() public{
        bool newMember; 
        newMember = supplyChain.addMember(102, "user2", "user2@test.com", "12345", "seller","KL");
        Assert.equal(newMember, true, "A new seller has successfully been added to the contract");
    }
    // ==================== Test-5 ============================
    // creates a new product
    // need to add a seller to contract before exicuting this test
    function checkProductAdd() public {
        bool nweProduct;
        nweProduct = supplyChain.addProduct(1001, "Prod1",  "Description", 1, 102);
        Assert.equal(nweProduct, true, "A new product has successfully been added to the contract");
    }
	// ==================== Test-6 ============================
    //  creates a new order
    // need to add a seller to contract before exicuting this test
    function checkProductOrder() public{
        bool newOrder;
        newOrder = supplyChain.createProductOrder(1011, 2002, 101 ,101, 102);
        Assert.equal(newOrder, true, "A new product order has successfully been created");

    }

    

    // ==================== Test-7 ============================
    // adds a shipper to the contract
    function checkMemberAdd3() public{
        bool newMember; 
        newMember = supplyChain.addMember(103, "user3", "user3@test.com", "12345", "shipper","KL");
        Assert.equal(newMember, true, "A new shipper has successfully been added to the contract");
    }

    // ==================== Test-8 ============================
    // adds a customs officer to the contract
    function checkMemberAdd4() public{
        bool newMember; 
        newMember = supplyChain.addMember(104, "user4", "user4@test.com", "12345", "customs","KL");
        Assert.equal(newMember, true, "A  customs officer has successfully been added to the contract");
    }

    // ==================== Test-9 ============================
    //  customs approves ownership transfer
    // need to add a manager to contract before exicuting this test
    function checkOwnershipTranfer2() public{
        string memory role;
        role = supplyChain.approveOwnershipTransfer(104,2002, "yes");
        Assert.equal(role, "customs", "Customs has approved ownership transfer");
    }

    // ==================== Test-10 ============================
    //  transfer ownership from seller to shipper
    // need to add a seller and a shipper to contract before exicuting this test
    //  transferOwnership(uint from_userID, uint to_userID, uint s_id, string memory _timestamp) public returns (bool x)
    function checktransferedOwnership() public{
        bool transferedOwnershipToShipper;
        transferedOwnershipToShipper = supplyChain.transferOwnership(102, 103, 2002 ,"12/12/2021 10:00:00");
        Assert.equal(transferedOwnershipToShipper, true, "Ownership has successfully been transfered from seller to shipper");

    }
    
}





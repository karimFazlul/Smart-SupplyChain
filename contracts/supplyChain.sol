// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;
pragma experimental ABIEncoderV2;

contract SmartSupplyChain {
    address owner;
    
    // enum Status {
    //     Pending,
    //     Shipped,
    //     Accepted,
    //     Rejected,
    //     Canceled
    // }
    // enum Locations { 
    //     One,Two, Three, Four, Five, Six, 
    //     Seven, Eight, Nine, Ten
    // }
    

    struct User {
        uint id;
        string name;
        string email;
        string password;
        string role;
        string _address;
    }
    // struct Product{
    //     uint id;
    //     string name;
    //     string description;
    //     uint weight;
    // }
    

    // struct ProductOrder{
    //     uint id;
    //     uint shipment_id;
    //     uint []products_id;
    //     uint buyer_id;
    //     uint seller_id;
    //     Locations location;
    //     bool sencorConfirmation;
    //     bool byuerConfirmation;
    //     string deliveryStatus;
    // }
   

    // struct Delivery{
    //     uint id;
    //     uint order_id;
        
    // }
    
    struct ShipmentOrder{
        uint id;
        string timestamp; 
        uint buyerID;
        uint sellerID;
        uint cargoID;
        uint []productID;  // holds id of products
        uint ownerID;
        string ownership;
        bool approvedByManager;
        bool approvedByCustoms;
        string status;
        string location;
    }
    // struct trackShipmentOrder{
    //     uint shipmentID;
    //     string timestamp;
    //     string ownership;
    //     bool traceDataVarifiedByManager;
    //     bool traceDataVarifiedByBiller;

    // }
    // mapping (uint => trackShipmentOrder[]) tracks;
    // modifier _managerAndBillerOnly(uint _userID) {
    //     User memory  _user = user[_userID];
       
    //     require(
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("manager")))||
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("biller")))
    //         ,
    //         "Only Manager or Biller can perform this action."
    //     );
    //     _;
    // }

    // function gettrack(uint s_id, uint id)public returns (uint, string memory , string memory,bool, bool) {
    //     trackShipmentOrder memory t = tracks[s_id][id];
    //     return (t.shipmentID, t.timestamp, t.ownership, t.traceDataVarifiedByManager,t.traceDataVarifiedByBiller);
    // }
    // function varifyTraceData(uint _userID, uint s_id, uint id)public _managerAndBillerOnly(_userID){
    //     User memory  _user = user[_userID];
    //     if(keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("manager")))){
    //         trackShipmentOrder memory t = tracks[s_id][id];
    //         t.traceDataVarifiedByManager = true;
    //         // traceDataVarifiedByManager = true;
    //     }
    //     if(keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("biller")))){
    //         trackShipmentOrder memory t = tracks[s_id][id];
    //         t.traceDataVarifiedByBiller = true;
    //         // traceDataVarifiedByBiller = true;
    //     }

    // }
    // struct CergoClass{
    //     uint id;
    //     string name;
    //     string origin;
    //     string destination;
    //     string timestamp;
    //     uint []shipments; // shioment id
    // }
    // mapping for all memners
    mapping (uint => User) user;
    uint  []allMembers; // holds id of all members

    // mapping for all orders
    mapping (uint => ShipmentOrder) Order;
    uint []allOrder; // holds id of all order

    // mapping for cergos
    // mapping (uint => CergoClass) Cergo;
    // uint []cergos; // holds id of all cerhos

    // mapping(uint => ProductOrder) productOrder;
    // uint []allProductOrder; // holds all  id

    // mapping(uint => Product) product;
    // uint []allProducts; // holds all products id

    // modifier _ownerOnly(){
    //     require(msg.sender == owner, "Only Owner of the cortract can perform this action.");
    //      _;
    // }
    // function for adding members(buyer,seller,custom officer, ...)  to the current contract
    //  only owner of the smart contract can add members
    function addMember(
        uint  _id, string memory _name, 
        string memory _email, string memory _password, 
        string memory _role, string memory _userAddress
    ) public {

        // get the refrence of the user that has _address as its key of the mapping table
        // User storage  _user = user[_address]; // key of hash(mapping) table
        User storage  _user = user[_id]; // key of hash(mapping) table
        _user.id = _id;
        _user.name = _name;
        _user.email = _email;
        _user.password = _password;
        _user._address = _userAddress;
        _user.role = _role;
        allMembers.push(_id); 

    }
    // modifier _sellerOnly(uint userID){
    //     User memory _user = user[userID];
    //     require(
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("seller"))),
    //         "Only Seller can perform this action."
    //     );
    //     _;
    // }
    // // add new product
    // function addProduct(uint _prodID, string memory _prodName,  string memory _prodDescription, uint _prodWeight, uint  sellerID) public _sellerOnly(sellerID){
    //     Product storage _product = product[_prodID];
    //     _product.id = _prodID;
    //     _product.name = _prodName;
    //     _product.description = _prodDescription;
    //     _product.weight = _prodWeight;
    //     allProducts.push(_prodID); 

    
    // }

    // add new product order
    // function createProductOrder(uint _id, uint  _shipmentID, uint[] memory productsID,uint _buyerID, uint _sellerID, Locations  _location) public _sellerOnly(_sellerID){
    //         ProductOrder memory _productOrder = productOrder[_id];
    //         _productOrder.id = _id;
    //         _productOrder.shipment_id = _shipmentID;
    //         _productOrder.products_id = productsID;
    //         _productOrder.seller_id = _sellerID;
    //         _productOrder.buyer_id = _buyerID;
    //         _productOrder.location = _location;
    //         _productOrder.deliveryStatus = "Pending";
    //         _productOrder.byuerConfirmation = false;
    //         _productOrder.sencorConfirmation = false;
    //         allProductOrder.push(_id);
               
    // }
    
    // modifier _sellerOrDistributorOnly(uint userID){
    //     User memory _user = user[userID];
    //     require(
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("seller")))||
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("distributor"))),
    //         "Only Seller or Distributor can perform this action."
    //     );
    //     _;
    // }
    // function updateDeliveryStatus(uint _prodOrderID, uint _userID, string memory _status)public _sellerOrDistributorOnly(_userID){
    //     ProductOrder memory _productOrder = productOrder[_prodOrderID];
    //     _productOrder.deliveryStatus = _status;
    // }


    modifier _managerOnly(uint _userID) {
        User memory  _user = user[_userID];
       
        require(
            keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("manager"))),
            "Only Manager can perform this action."
        );
        _;
    }
    // function for creating order
    // only shipping manager can create a shipment order
    function createShipmentOrder(
        uint _id, string memory _timestamp, uint _ownerID,
        uint  _buyerID, uint  _sellerID, 
        uint  _cargoID, uint[] memory _productID, uint _userID,
        string memory _status, string memory _location
    ) public _managerOnly(_userID){
        
        // get the refrence of the user that has _address as its key of the mapping table
        ShipmentOrder storage  _order = Order[_id]; // key of hash(mapping) table
        _order.id = _id;
        _order.ownerID = _ownerID;
        _order.timestamp = _timestamp;
        _order.buyerID = _buyerID;
        _order.sellerID = _sellerID;
        _order.cargoID = _cargoID;
        _order.productID = _productID;
        _order.ownership = "seller";
        _order.approvedByManager = false;
        _order.approvedByCustoms = false;
        _order.status = _status;
        _order.location = _location;
        allOrder.push(_id); 
        // add tracking data
        // trackShipmentOrder memory t;
        // t.shipmentID = _id;
        // t.ownership = "seller";
        // t.timestamp = _timestamp;
        // t.traceDataVarifiedByManager = false;
        // t.traceDataVarifiedByBiller = false;
        // tracks[_id].push(t);

    }
    //  function to add new cergo
    // function addCergo(
    //     uint _id, string memory _name, 
    //     string memory _origin,string memory _destination,
    //     string memory _timestamp, uint[] memory _shipments,uint managerID
    // ) public _managerOnly(managerID){
    //     // get the refrence of the cergo that has the passed _id as its key of the mapping table
    //     CergoClass storage  _cergo = Cergo[_id]; 
    //     _cergo.id = _id;
    //     _cergo.name = _name;
    //     _cergo.origin = _origin;
    //     _cergo.destination = _destination;
    //     _cergo.timestamp = _timestamp;
    //     _cergo.shipments = _shipments;
    //     cergos.push(_id); 

    // }
    
    // // function for ownership transfer 
    // function approveOwnershipTransfer(uint _userID, uint s_id, string memory _approval) public{
    //     User storage _user = user[_userID];
    //     ShipmentOrder storage  _order = Order[s_id];


    //     if(keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("manager")))){
    //         if(keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("yes")))|| 
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("Yes"))) ||
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("y"))) ||
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("Y")))){

    //             _order.approvedByManager = true;
    //         }
    //     }

    //     if(keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("customs")))){
    //         if(keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("yes")))|| 
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("Yes"))) ||
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("y"))) ||
    //             keccak256(abi.encodePacked((_approval))) == keccak256(abi.encodePacked(("Y")))){

    //             _order.approvedByCustoms = true;
    //         }
    //     }
            
        
    // }

    // function transferOwnership(uint from_userID, uint to_userID, uint s_id, string memory _timestamp) public returns (bool x){

    //     User storage u1 = user[from_userID];
    //     User storage u2 = user[to_userID];


    //     ShipmentOrder storage  _order = Order[s_id];
    //     // if owner id mathces and approved by manager and customs change ownership
    //     if(_order.ownerID ==  from_userID && _order.approvedByManager && _order.approvedByCustoms){
    //         _order.ownerID = to_userID;
    //         if((keccak256(abi.encodePacked((u1.role))) == keccak256(abi.encodePacked(("seller")))) && (keccak256(abi.encodePacked((u2.role))) == keccak256(abi.encodePacked(("distributor"))))){
    //             _order.ownership = u2.role;
    //             // add tracking data
    //             trackShipmentOrder memory t;
    //             t.shipmentID = s_id;
    //             t.ownership = "shipper";
    //             t.timestamp = _timestamp;
    //             tracks[s_id].push(t);
    //             return true;
    //         }
    //         else if((keccak256(abi.encodePacked((u1.role))) == keccak256(abi.encodePacked(("shipper")))) && (keccak256(abi.encodePacked((u2.role))) == keccak256(abi.encodePacked(("distributor"))))){
    //             _order.ownership = u2.role;
    //             trackShipmentOrder memory t;
    //             t.shipmentID = s_id;
    //             t.ownership = "distributor";
    //             t.timestamp = _timestamp;
    //             tracks[s_id].push(t);
    //             return true;
    //         }
    //         else if((keccak256(abi.encodePacked((u1.role))) == keccak256(abi.encodePacked(("distributor")))) && (keccak256(abi.encodePacked((u2.role))) == keccak256(abi.encodePacked(("buyer"))))){
    //             _order.ownership = u2.role;
    //             trackShipmentOrder memory t;
    //             t.shipmentID = s_id;
    //             t.ownership = "buyer";
    //             t.timestamp = _timestamp;
    //             tracks[s_id].push(t);
    //             return true;
    //         }
    //     }
    //     else{
    //         return false;
    //     }
            
        
        
    // }
    // modifier _distributorOnly(uint userID){
    //     User memory _user = user[userID];
    //     require(
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("distributor"))),
    //         "Only Distributor can perform this action."
    //     );
    //     _;
    // }
    // function IoT_SencorData(uint _parcelID, uint _location, uint userID) public _distributorOnly(userID){
    //     ProductOrder memory percel = productOrder[_parcelID];
    //     if(uint(percel.location) == _location){
    //         percel.sencorConfirmation = true;
    //     }
    // }
    // modifier _buyerOnly(uint userID){
    //     User memory _user = user[userID];
    //     require(
    //         keccak256(abi.encodePacked((_user.role))) == keccak256(abi.encodePacked(("buyer"))),
    //         "Only Distributor can perform this action."
    //     );
    //     _;
    // }
    // function confirmParcelReception(uint _parcelID, uint _userID)public _buyerOnly(_userID){
    //     ProductOrder memory percel = productOrder[_parcelID];
    //     require(percel.sencorConfirmation,"IoT Sencor confirmation required ");
    //     percel.byuerConfirmation = true;
    
    
    // }


    // //  Proof of delivery function will be avialable when deliveryStatus == delivered
    // // check trace
    // // varify trace
    // // initiate payment
    // event paymentProcessInit(string  _message);
    // function initiatePayment(uint _userID, uint trackID, uint s_id)public _managerOnly( _userID){
    //     trackShipmentOrder memory t = tracks[s_id][trackID];
    //     require(t.traceDataVarifiedByManager && t.traceDataVarifiedByBiller,"Manager and Biller varification needed");
    //     emit paymentProcessInit("Payment process has been initiated.");
    // }

    // function get_User(uint _userID) public returns(string[] memory){
    //     //     struct User {
    //     //     uint id;
    //     //     string name;
    //     //     string email;
    //     //     string password;
    //     //     string role;
    //     //     string _address;
    //     // }
    //         // Declaring a dynamic array 
    //     // User storage data; 
    
    //     // Defining a function 
    //     // to demonstrate 'For loop'
        

    //         User storage  _user = user[_userID]; // key of hash(mapping) table

    //         // data.id = _user.id;
    //         // data.name = _user.name;
    //         // data.email = _user.email;
    //         // data.password = _user.password;
    //         // data._address = _user._address;
    //         // data.role = _user.role;
        
        
    //     return ( _user.name, _user.email, _user._address, _user.role);
    // }
    
   
}


$( "#form-2" ).on( "submit", function( event ) {
    event.preventDefault();
    var oldItems = JSON.parse(localStorage.getItem('shipments')) || [];
    x = []
    y = parseInt($("#productID").val())
    x.push(y)
    data = {}
    shipmentID = parseInt($("#shipmentID").val())
    date = $("#date").val()
    ownerID = $("#ownerID").val()
    buyerID =  $("#buyerID").val()
    sellerID =  $("#sellerID").val()
    cargoID = $("#cargoID").val()
    productID =  x
    userID = $("#userID").val()

    data.id = shipmentID
    data.date = date
    data.ownerID = ownerID
    data.buyerID = buyerID
    data.sellerID = sellerID
    data.cargoID = cargoID
    data.productID = productID
    data.userID = userID
    console.log('====================================');
    console.log(data);
    console.log('====================================');
    oldItems.push(data)
    // localStorage.setItem('shipments', JSON.stringify(oldItems));
    var supplyChainInstance;
    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];

      App.contracts.SmartSupplyChain.deployed().then(function(instance) {
        supplyChainInstance = instance;

        // Execute createShipmentOrder as a transaction by sending account
        return supplyChainInstance.createShipmentOrder(
          shipmentID,
          date,
          ownerID,
          buyerID ,
          sellerID,
          cargoID,
          productID ,
          userID,
          {from: account});
      }).then(function(result) {
        localStorage.setItem('shipments', JSON.stringify(oldItems));
        console.log(result);
      }).catch(function(err) {
        console.log(err.message);
      });
  });
})
$( "#form-5" ).on( "submit", function( event ) {
    event.preventDefault();
    let x =  $( this ).serializeArray() ;
    console.log(x);
    let  _userID = x[0].value
    let  _s_id = x[1].value
    let _approval = x[2].value
    var supplyChainInstance;
    web3.eth.getAccounts(function(error, accounts) {
    if (error) {
        console.log(error);
    }

    var account = accounts[0];

    App.contracts.SmartSupplyChain.deployed().then(function(instance) {
        supplyChainInstance = instance;

        // Execute createShipmentOrder as a transaction by sending account
        return supplyChainInstance.approveOwnershipTransfer(
            _userID, _s_id,   _approval,
            {from: account});
        }).then(function(result) {
            console.log(result);
        }).catch(function(err) {
            console.log(err.message);
        });
    });

});
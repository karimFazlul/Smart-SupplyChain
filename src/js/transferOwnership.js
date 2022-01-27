
$( "#form-6" ).on( "submit", function( event ) {
    event.preventDefault();
    let x =  $( this ).serializeArray() ;
    console.log(x);
    let  from_userID = x[0].value
    let  to_userID = x[1].value
    let  s_id = x[2].value
    let _timestamp = x[3].value
    console.log(_timestamp);
    var supplyChainInstance;
    // supplyChainInstance = new web3.eth.Contract("SmartSupplyChain.json")
    web3.eth.getAccounts(function(error, accounts) {
        if (error) {
            console.log(error);
        }

        var account = accounts[0];
        // supplyChainInstance.methods.transferOwnership(from_userID,  to_userID, s_id, _timestamp,).send({from: accounts})
        //     .then(function(receipt){
        //         console.log(result);
        //     });

        App.contracts.SmartSupplyChain.deployed().then(function(instance) {
            supplyChainInstance = instance;

            // Execute transferOwnership as a transaction by sending account
            return supplyChainInstance.transferOwnership(
                from_userID,  
                to_userID,  
                s_id,  
                _timestamp,
                {from: account});
        })
        .then(function(result) {
            console.log(result);
        }).catch(function(err) {
            console.log(err.message);
        });
    });

});
   
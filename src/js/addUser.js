
//   $( "#form-1" ).on( "submit", function( event ) {
//     event.preventDefault();
//     const person = { }
//     let allUsers =[]
//     window.localStorage.setItem('user', JSON.stringify(person));
//     let x =  $( this ).serializeArray() ;
//     console.log(x);
//     let  useName  = x[0].value
//     let  email = x[1].value
//     let  password = x[2].value
//     let role = x[3].value
//     let address = x[4].value

//     person.useName = useName;
//     person.email = email;
//     person.password = password;
//     person.role = role;
//     person.address = address;
//     allUsers.push(person)
//     if (localStorage.getItem("users") === null) {
//         localStorage.setItem("users", JSON.stringify(allUsers));
//     }else{
//         let storedUsers = localStorage.getItem("users");
//         parsedUsers = JSON.parse(storedUsers);
//         parsedUsers.push(person)

//     }
//     console.log(_timestamp);
//     var supplyChainInstance;
//     // supplyChainInstance = new web3.eth.Contract("SmartSupplyChain.json")
//     web3.eth.getAccounts(function(error, accounts) {
//         if (error) {
//             console.log(error);
//         }

//         var account = accounts[0];
//         // supplyChainInstance.methods.transferOwnership(from_userID,  to_userID, s_id, _timestamp,).send({from: accounts})
//         //     .then(function(receipt){
//         //         console.log(result);
//         //     });

//         return supplyChainInstance.addMember(userID, useName, email, password, role, address, {from: account});
//     }).then(function(result) {
       
//         console.log(result);
//     }).catch(function(err) {
//         console.log(err.message);
//     });
    
// });


$( "#form-1" ).on( "submit", function( event )  {
    event.preventDefault();
    var oldItems = JSON.parse(localStorage.getItem('users')) || [];
    data = []
    let person = { }
    let allUsers =[]

    userID = parseInt($("#ID").val())
    useName = $("#Name").val()
    email = $("#Email").val()
    password =  $("#Password").val()
    role =  $("#Role").val()
    address = $("#Address").val()

    person.userID = userID;
    person.useName = useName;
    person.email = email;
    person.password = password;
    person.role = role;
    person.address = address;

    oldItems.push(person);
    data.push(person)
    
    console.log(person);
    

    // data.id = userID
    // data.name = useName
    // data.email = email
    // data.password = password
    // data.role = role
    // data.address = address
    // console.log('====================================');
    // console.log(data);
    // console.log('====================================');

    var supplyChainInstance;
    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];
      localStorage.setItem('users', JSON.stringify(oldItems));
        var usersRow = $('#usersRow');
        var usertemplate = $('#userTemplate');

        for (i = 0; i < data.length; i ++) {
            usertemplate.find('.panel-title').text(data[i].useName);
            usertemplate.find('img').attr('src', "images/avatar.png");
            usertemplate.find('.pet-breed').text(data[i].email);
            usertemplate.find('.pet-age').text(data[i].role);
            usertemplate.find('.pet-location').text(data[i].address);
            usertemplate.find('.btn-adopt').attr('data-id', data[i].userID);

            usersRow.append(usertemplate.html());
        }

      App.contracts.SmartSupplyChain.deployed().then(function(instance) {
        supplyChainInstance = instance;

        // Execute addMember as a transaction by sending account
        return supplyChainInstance.addMember(userID, useName, email, password, role, address, {from: account});
      }).then(function(result) {
       
        localStorage.setItem('users', JSON.stringify(oldItems));
        var usersRow = $('#usersRow');
        var usertemplate = $('#userTemplate');

        for (i = 0; i < oldItems.length; i ++) {
            usertemplate.find('.panel-title').text(data[i].name);
            usertemplate.find('img').attr('src', data[i].picture);
            usertemplate.find('.pet-breed').text(data[i].email);
            usertemplate.find('.pet-age').text(data[i].role);
            usertemplate.find('.pet-location').text(data[i].address);
            usertemplate.find('.btn-adopt').attr('data-id', data[i].id);

            usersRow.append(usertemplate.html());
        }
        console.log(result);
      }).catch(function(err) {
        console.log(err.message);
      });
    });
})
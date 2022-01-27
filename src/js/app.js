App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    
    $.getJSON('../users.json', function(data) {
      var usersRow = $('#usersRow');
      var usertemplate = $('#userTemplate');

      for (i = 0; i < data.length; i ++) {
        usertemplate.find('.panel-title').text(data[i].name);
        usertemplate.find('img').attr('src', data[i].picture);
        usertemplate.find('.email').text(data[i].email);
        usertemplate.find('.role').text(data[i].role);
        usertemplate.find('.address').text(data[i].address);
        usertemplate.find('.btn-adopt').attr('data-id', data[i].id);

        usersRow.append(usertemplate.html());
      }
    });

    return await App.initWeb3();
  },

  initWeb3: async function() {
    // Modern dapp browsers...
    if (window.ethereum) {
      App.web3Provider = window.ethereum;
      try {
        // Request account access
        await window.ethereum.request({ method: "eth_requestAccounts" });;
      } catch (error) {
        // User denied account access...
        console.error("User denied account access")
      }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
      App.web3Provider = window.web3.currentProvider;
    }
    // If no injected web3 instance is detected, fall back to Ganache
    else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);
   // ======================================
    return App.initContract();
  },

  initContract: function() {
    $.getJSON('SmartSupplyChain.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with @truffle/contract
      var SmartSupplyChainArtifact = data;
      App.contracts.SmartSupplyChain = TruffleContract(SmartSupplyChainArtifact);
    
      // Set the provider for our contract
      App.contracts.SmartSupplyChain.setProvider(App.web3Provider);
    
      // Use our contract to retrieve and mark the adopted pets
      return App.markAdopted();
    });
    
    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },

  markAdopted: function() {
    /*
     * Replace me...
     */
  },

  

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});

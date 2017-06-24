(function()) {
// Initialize Firebase
  var config = {
    apiKey: "AIzaSyBsLjhMNhxYj-zeaph_U4H6g16rNJyLDlA",
    authDomain: "teste2-30191.firebaseapp.com",
    databaseURL: "https://teste2-30191.firebaseio.com",
    projectId: "teste2-30191",
    storageBucket: "teste2-30191.appspot.com",
    messagingSenderId: "800366622429"
  };
  firebase.initializeApp(config);

//Get element

  const txtNomeSecretaria = document.getElementById('txtNomeSecretaria');

  btnSalvar.addEventListener('click', e => {
    const nomeSecretaria = txtNomeSecretaria.value;
  })



 
  });
}

}());
  



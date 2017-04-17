var formatado = numberParaReal(9.9);
var numero = realParaNumber("R$ 120,53");

if (formatado === "R$ 9,90") {
  console.log("currency formatting working. I am AROUSED!!!");
} else {
  console.log("currency formatting not working purfectly. Zis makes za doctor sad.");
}

if (numero === 120.53) {
  console.log("number formatting working. GUT!");
} else {
  console.log("number formatting zis not working. Ze doctor is dissapointed.");
}

// function sleep(milliseconds) {
//   var start = new Date().getTime();
//   for (var i = 0; i < 1e7; i++) {
//     if ((new Date().getTime() - start) > milliseconds){
//       break;
//     }
//   }
// }
//
// var min;  var seg;
// for (min = 3; min > 0; min--){
//   for (seg = 59; seg > 0; seg--) {
//     console.log("o"+min+":"+seg);
//     sleep(1000);
//   }
// }

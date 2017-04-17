function numberParaReal(numero){
  return "R$ "+ numero.toFixed(2).replace(".", ",");
}

function realParaNumber(texto){
  return parseFloat(texto.replace("R$ ", "").replace(",","."));
}

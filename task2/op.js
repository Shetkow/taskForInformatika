function sum(a,b){
    return a + b;
}
function minus(a,b){
    return a-b;
}
function multiply(a,b){
    return a * b;
}
function division(a,b){
    return a/b;
}
function pow(a,b){
    return a**b;
}
function factorial(a,b=0) {
    return (a != 1) ? a * factorial(a - 1) : 1;
  }
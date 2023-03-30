const OPERATIONS = {
    sum:'+',
    minus:'-',
    multiply:'*',
    division:'/',
    pow:'**',
    factorial:'!'
}

function calculate({a,b,op}){
    let result = null;
  
    switch(op){
        case OPERATIONS.sum:
            result = sum(a,b);
            break;
        
        case OPERATIONS.minus:
            result = minus(a,b);
            break;
        
        case OPERATIONS.multiply:
            result = multiply(a,b);
            break;
        
        case OPERATIONS.division:
            result = division(a,b);
            break;

        case OPERATIONS.pow:
            result = pow(a,b);
            break;

        case OPERATIONS.factorial:
            result = factorial(a,b);
            break;
         
            default:
            break;   
    }
    return result;

};
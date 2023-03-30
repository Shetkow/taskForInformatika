const inputA = document.querySelector('.js-input-a');
const inputB = document.querySelector('.js-input-b');
const selectOP = document.querySelector('.js-select-op');
const btnResult = document.querySelector('.js-btn-result');
const outputResult = document.querySelector('.js-output');
const btnHistory = document.querySelector('.js-btn-history');
const outputHistory = document.querySelector('.js-output-h');

 btnResult.addEventListener('click',function(){
const a = Number(inputA.value);
const op = selectOP.value;
const b = Number(inputB.value);
const result = calculate({a,b,op});
outputResult.innerHTML = result;
let para = document.createElement('p');
para.innerText = `${a}  ${op}  ${b} = ${result}`;
outputHistory.appendChild(para);

});




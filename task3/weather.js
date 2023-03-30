let key = 'b4e73090a616acf2bace551b712e758b';
let town = prompt("Введите город");
let url = `http://api.openweathermap.org/data/2.5/weather?q=${town}&lang=ru&units=metric&appid=${key}`;


axios.get(url).then(res=>{
    console.log(res.data);
})
axios.get(url).then(res => {
    document.querySelector('.city').innerHTML = res.data.name
    document.querySelector('.temp').innerHTML = res.data.main.temp
    document.querySelector('.humidity').innerHTML = res.data.main.humidity
    document.querySelector('.wind').innerHTML = res.data.wind.speed
 })


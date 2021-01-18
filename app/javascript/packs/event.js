
let width = window.outerWidth;
window_load();
window.onresize = window_load;

function window_load() {
    let width = window.outerWidth
    return width;
}
let w = window_load();
console.log(w);



window.addEventListener('scroll', () => {
	let fadein = document.querySelectorAll(".fadein");
	fadein.forEach(el => {
		let point = el.getBoundingClientRect().top;
		if(550 > point){
			el.classList.add('scrollin');
		}
	});  
});



let ani = document.querySelectorAll(".ani");
let rand1X;
let rand2X;
let rand1Y;
let rand2Y;
let orand1;
let orand2;

ani.forEach(iii=>{
    iii.animate
setInterval(() => {
    rand1X = Math.floor(Math.random() * 1000);
    rand2X = Math.floor(Math.random() * 1000)+500;
    rand1Y = Math.floor(Math.random() * 100)+1000;
    rand2Y = Math.floor(Math.random() * 1000)+500;
    orand1 = Math.random();
    orand2 = Math.random();
    iii.animate({
        transform:[
            `translateX(${rand1X}px) translateY(${rand2X}px) `,
             `translateX(${rand2Y}px) translateY(${rand1Y}px) `
        ],
        opacity:[
            `${orand1}`, `${orand2}`
        ],
        top:[
            `${rand1X}px`, `${rand2X}px`
        ],
        left:[
            `${rand1X}px`, `${rand2X}px`
        ]
      }, {
        direction: 'reverse',
        duration: 3000,
        iterations: Infinity
      })
}, 2000)});
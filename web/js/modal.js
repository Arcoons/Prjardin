/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let btnmodal = document.getElementById("abrirModal");
let venmodal = document.getElementById("ventanaModal");
let cermodal = document.querySelector(".cerrarModal");


btnmodal.addEventListener('click', () => {
    venmodal.style.display = "block";
});
cermodal.addEventListener("click", () => {
    venmodal.style.display = "none";
});
window.addEventListener("click", (e) => {
    if (e.target === venmodal) {
        venmodal.style.display = "none";
    }
});


let btnmodal2 = document.getElementById("abrirModal2");
let venmodal2 = document.getElementById("ventanaModal2");
let cermodal2 = document.querySelector(".cerrarModal2");


btnmodal2.addEventListener('click', () => {
    venmodal2.style.display = "block";
});
cermodal2.addEventListener("click", () => {
    venmodal2.style.display = "none";
});
window.addEventListener("click", (e) => {
    if (e.target === venmodal2) {
        venmodal2.style.display = "none";
    }
});




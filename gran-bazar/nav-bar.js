const btnMenuMobile = document.querySelector(".btn-mobile-menu");
const menuActive = document.querySelector(`.nav-menu`);


btnMenuMobile.addEventListener('click', () => 
    {
        menuActive.classList.toggle("nav-menu__active");
    });

window.addEventListener("click", e => 
    {
        if(menuActive.classList.contains("nav-menu__active") && e.target != menuActive && e.target != btnMenuMobile)
        // si menu tiene la clase spread y aparte el elemento al que le estoy dando click o sea e.target es diferente al menu and e.target no sea el icono hamburger     
            {
                menuActive.classList.toggle("nav-menu__active");
            }
    })
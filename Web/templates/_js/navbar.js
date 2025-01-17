document.addEventListener("DOMContentLoaded", () => {
  const navbar_menu = document.querySelector(".navbar__body");
  document.querySelector(".navbar__header__burger").children[0].onclick = e => {
    if (navbar_menu.style.display !== "flex") {
      navbar_menu.style.display = "flex";
      e.target.classList.add("bx-x");
      e.target.classList.remove("bx-menu");
    } else {
      navbar_menu.style.display = "none";
      e.target.classList.add("bx-menu");
      e.target.classList.remove("bx-x");
    }
  };

  document.querySelectorAll(".navbar__menu__item:has(.navbar__submenu)").forEach(obj => {
    obj.children[0].onclick = () => {
      const submenu = obj.children[1];
      if (submenu.style.display !== "block") {
        submenu.style.display = "block";
        submenu.classList.add("navbar__submenu--open");
      } else {
        submenu.style.display = "none";
        submenu.classList.remove("navbar__submenu--open");
      }
    };
  });

  const user_submenu = document.querySelector(".user-submenu");
  document.querySelector(".user-menu").children[0].onclick = () => {
    if (user_submenu.style.display !== "flex")
      user_submenu.style.display = "flex";
    else
      user_submenu.style.display = "none";
  };
});

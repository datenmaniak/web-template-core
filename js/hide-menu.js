// document.querySelector(".menuToggle")?.addEventListener("click", () => {
//   const nav = document.querySelector(".nav__options");
//   const isVisible = !nav.hasAttribute("hidden");

//   nav.toggleAttribute("hidden");
//   console.log(
//     `[Violet Pulse] Menu ${isVisible ? "cerrado" : "abierto"} correctamente.`
//   );
// });

// function toggleMenu() {
//   const menuToggle = document.querySelector(".menuToggle");
//   const navbar = document.querySelector(".nav__options");
//   menuToggle.classList.toggle("active");
//   navbar.classList.toggle("active");
// }

document.addEventListener("DOMContentLoaded", () => {
  const menuToggle = document.querySelector(".menuToggle");
  const navbar = document.querySelector(".nav__options");
  const overlay = document.querySelector(".overlay");

  if (!menuToggle || !navbar) return;

  const toggleMenu = () => {
    const isActive = navbar.classList.toggle("active");
    menuToggle.classList.toggle("active");
    overlay?.classList.toggle("active");

    menuToggle.setAttribute("aria-expanded", isActive);
    navbar.setAttribute("aria-hidden", !isActive);

    console.log(
      `[Violet Pulse] Menú ${isActive ? "abierto" : "cerrado"} correctamente.`
    );
  };

  menuToggle.addEventListener("click", toggleMenu);
  overlay?.addEventListener("click", toggleMenu);
});

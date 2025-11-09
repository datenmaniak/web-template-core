(function () {
  'use strict';

  document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menuToggle');
    const navbar = document.querySelector('.nav__options');
    const overlay = document.querySelector('.overlay');

    if (!menuToggle || !navbar) return;

    const toggleMenu = () => {
      const isOpen = navbar.classList.toggle('is-open');
      menuToggle.classList.toggle('active');
      overlay?.classList.toggle('active');

      menuToggle.setAttribute('aria-expanded', isOpen);
      navbar.setAttribute('aria-hidden', !isOpen);

      console.log(
        `[Violet Pulse] Menú ${isOpen ? 'abierto' : 'cerrado'} correctamente.`
      );
    };

    menuToggle.addEventListener('click', toggleMenu);
    overlay?.addEventListener('click', toggleMenu);
  });
})();

# Sistema de Contenedores y Header Responsivo en Sass

Este proyecto documenta la configuración y uso de **contenedores responsivos en Sass**, aplicados inicialmente al **header**, pero extensibles a cualquier sección del sitio web.

---

## 📌 Lo aprendido

- **Mixin `container($widths)`**  
  Permite generar automáticamente los `max-width` en cada breakpoint definido en el mapa `$container-widths`.

- **Mixin `respond($device)` con `@content`**  
  Facilita la inyección de estilos específicos dentro de un breakpoint sin repetir la estructura `@media`.

- **Clases `.container` y `.container-fluid`**  
  - `.container`: limita y centra el contenido según los breakpoints.  
  - `.container-fluid`: ocupa siempre el 100% del ancho, ideal para banners, sliders o cabeceras full width.

- **Header responsivo**  
  - Separación entre `.header` (barra fija de ancho completo) y `.header__container` (contenido centrado).  
  - Corrección de márgenes por defecto del navegador (`margin: 0;`) para evitar desplazamientos.  
  - Ajustes con `position: fixed` y `width: 100%` para mantener el header pegado al tope y expandido.

---

## 📄 Ejemplo de uso en el Header

```scss
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background: #333;
  color: #fff;
  z-index: 1000;

  &__container {
    @include container($container-widths);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    min-height: 80px;
  }
}
```

```html
<header class="header">
  <div class="header__container">
    <h1>Mi Sitio Web</h1>
    <nav>
      <ul>
        <li><a href="#">Inicio</a></li>
        <li><a href="#">Productos</a></li>
        <li><a href="#">Contacto</a></li>
      </ul>
    </nav>
  </div>
</header>
```


## 🌍 Extensión del aprendizaje

Además del **header**, lo aprendido hoy en cuanto a **responsividad y modularidad de contenedores en Sass** aplica directamente a:

- **Secciones generales**: para centrar y limitar contenido en bloques de texto o información.  
- **Galería de imágenes**: para que las imágenes se adapten a distintos breakpoints manteniendo márgenes y proporciones.  
- **Catálogo de productos**: para mostrar tarjetas responsivas con un ancho máximo definido, evitando que se desborden en pantallas grandes o se compriman demasiado en pantallas pequeñas.  

---

## ✅ Conclusión

Con este sistema modular en Sass:

- El **header** se mantiene fijo, responsivo y centrado.  
- Los contenedores `.container` y `.container-fluid` ofrecen flexibilidad para distintos escenarios.  
- La misma lógica se puede aplicar a **secciones, galerías y catálogos**, garantizando un diseño escalable y mantenible.  

Este enfoque asegura una arquitectura clara, reutilizable y preparada para crecer junto con el proyecto.

## ✒️ Autor

Documentación y ejemplos elaborados por **Datenmaniak**, IT Freelancer y Web Developer especializado en proyectos modulares, responsivos y escalables.
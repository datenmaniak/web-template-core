# web-template-core

**web-template-core** es un repositorio base diseñado como **framework modular y responsivo** para futuros proyectos web.  
Incluye un sistema de compilación con Gulp, un conjunto de mixins SCSS altamente personalizables y una arquitectura pensada para escalabilidad, branding y optimización de recursos.

---

## 🚀 Características principales

- **Diseño totalmente responsivo**  
  - Tipografía adaptativa para `h1`, `h2`, `span`, `span.branding`, `p` y `li`.  
  - Breakpoints documentados y consistentes para múltiples dispositivos.  

- **Compilación y bundling con Gulp**  
  - Generación automática de un archivo principal de estilos (`styles.css`).  
  - Bundling de JavaScript en un único `bundle.js`.  
  - Optimización de imágenes en **tres tamaños** + conversión a **WebP**.  

- **Mixins SCSS avanzados**  
  - Soporte para **tres tipos de contenedores**: `dynamic`, `narrow`, `fluid`.  
  - Implementación de **tres sistemas de Grid** para layouts flexibles.  
  - Tipografía responsiva mediante `clamp()` y mapas Sass documentados.  

- **Arquitectura modular y escalable**  
  - Separación clara de bloques: header, hero, cards, navegación.  
  - Documentación de comportamiento en distintos tamaños de pantalla.  
  - Pensado para servir como **template base** en proyectos futuros.  

---

## 📂 Estructura del proyecto

He registrado la estructura aquí, intencionalmente para mi propia documentación.

```zsh
tree --gitignore -L 5
.
├── assets
│   ├── hero
│   ├── icons
│   └── logos
├── backup-header.html
├── backup-setting.json
├── build
│   ├── css
│   │   ├── main.css
│   │   └── main.min.css
│   ├── img
│   └── js
│       ├── bundle.js
│       ├── bundle.min.js
│       └── bundle.min.js.map
├── footer.html
├── gulpfile.mjs
├── index.html
├── login.html
├── package.json
├── package-lock.json
├── README2.MD
├── README.md
├── src
│   ├── img
│   ├── js
│   │   ├── hide-menu.js
│   │   └── scrolled-header.js
│   └── scss
│       ├── base
│       │   ├── _global.scss
│       │   ├── _index.scss
│       │   ├── _normalize.scss
│       │   └── _user-choice.scss
│       ├── config
│       │   ├── _index.scss
│       │   └── _mixins.scss
│       ├── core
│       │   ├── _index.scss
│       │   ├── _typografia.scss
│       │   └── _variables.scss
│       ├── layout
│       │   ├── _about-us copy.scss
│       │   ├── _about-us.scss
│       │   ├── _ads.scss
│       │   ├── _catalog.scss
│       │   ├── _footer.scss
│       │   ├── header
│       │   │   ├── _dropdown.scss
│       │   │   ├── _header.scss
│       │   │   ├── _hero.scss
│       │   │   ├── _index.scss
│       │   │   ├── _logo.scss
│       │   │   ├── _nav-login.scss
│       │   │   ├── _nav.scss
│       │   │   └── _toggle.scss
│       │   ├── _index.scss
│       │   ├── _products.scss
│       │   └── _site-footer.scss
│       ├── main.scss
│       └── ui
│           ├── _button.scss
│           ├── _index.scss
│           └── _modal.scss
└── style.css

19 directories, 47 files


```

## Exclusión de directorios/archivos

Especificación de exclusiones  en el **.gitignore**  para generar la estructura.

```
node_modules
wp
assets/img
fuera-de-servicio
src/img/*
build/img/*     
assets/hero/*
assets/icons/*
assets/logos/*
assets/obsolete

```
**Se incluyen directorios necesarios por la aplicación, solo para generar la estructura**

### Aclaratoria

En este directorio   residen las imágenes optimizadas que utiliza la aplicación. 

    build/img/*     

En este otro, las imágenes que serán procesadas y optimizadas.

    src/img



## ✨ Autor
Creado por Datenmaniak — IT Freelancer y Web Developer autodidacta. Enfocado en proyectos modulares, branding técnico y optimización de flujos de trabajo.

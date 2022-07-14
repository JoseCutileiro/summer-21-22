# WebGL - Programming guide

### O meu processo evolutivo em WebGL (Parte 1)

- Autor: José Cutileiro
- Bibliografia: WebGL Programming guide - Kouichi Matsuda & Rodger Lea
- Todos os usados estão neste mesmo repositório
  
# Cap.2 - Primeiro passo

```
Em html:
A tag <img> não permite desenhar imagens dinâmicamente
para resolver esse problema surgiu em primeiro lugar o flash player. 
Mas para facilitar a nossa vida o html evoluio para html5. Com este
podemos usar a tag <canvas> que resolve os nossos problemas
```

## Primeiro exemplo: Retângulo

Ficheiros:
1. DrawRectangle.html
2. DrawRectangle.js

##  Notas acerca destes ficheiros:

html:
```html
<canvas id="example" width="400" height="400">
```
- Defenir id do canvas para 'example'
- Definir as dimensões do canvas (400x400)

js:
```js
// Canvas num ambiente 2d
var ctx = canvas.getContext('2d');

// Parte da cor
ctx.fillStyle = 'rgba(0,255,0,1.0)';

// Coordenadas do retangulo
ctx.fillRect(120,10,150,150);
// (120,10)
// O-----------------------
// |                       |
// |                       |
// |                       |
// |                       |
// |                       |
// |                       |
// |                       |
// |-----------------------O
//                         (120+150,10+150)
```

```js
// Podes fazer vários retangulos no mesmo canvas
var ctx = canvas.getContext('2d');
ctx.fillStyle = 'rgba(0,255,0,1.0)';
ctx.fillRect(120,10,10,100);

ctx.fillStyle = 'rgba(0,255,0,1.0)';
ctx.fillRect(200,10,100,1000);
```

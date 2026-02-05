# Solución: Los Cambios del PDF No Se Aplican

## Problema
Los cambios en el PDF no se están aplicando porque el navegador o el servidor están usando una versión en caché.

## Solución Rápida

### Paso 1: Detener el Servidor
1. En la terminal donde está corriendo `npm run dev`, presiona `Ctrl + C` para detenerlo.

### Paso 2: Limpiar Caché del Navegador
1. **Chrome/Edge**: Presiona `Ctrl + Shift + Delete` y selecciona "Caché" o "Cached images and files"
2. **O más rápido**: Presiona `Ctrl + Shift + R` (o `Ctrl + F5`) para recargar forzando la caché
3. **O en DevTools**: Abre DevTools (F12) → Click derecho en el botón de recargar → "Vaciar caché y volver a cargar de forma forzada"

### Paso 3: Reiniciar el Servidor
```bash
cd sistema-gestion-orden
npm run dev
```

### Paso 4: Generar Nuevo PDF
1. Abre la aplicación en el navegador
2. Ve a una orden existente
3. Haz clic en "Ver PDF" o "Reenviar PDF"
4. Verifica que los cambios se hayan aplicado

## Verificación de Cambios

Los cambios aplicados deberían mostrar:

### Panel de Sucursal:
```
Sucursal:
[Nombre de la sucursal]

Dirección:
[Dirección de la sucursal]

Teléfono:
[Teléfono de la sucursal]

Correo:
[Email de la sucursal]
```

### Panel de Cliente:
```
Nombre:
[Nombre del cliente]

Teléfono:
[Teléfono del cliente]

Correo:
[Email del cliente]

Dirección:
[Dirección del cliente]
```

**Cada campo debe estar en líneas separadas, sin solapamiento.**

## Si Aún No Funciona

1. **Verifica que el archivo se haya guardado**:
   - Abre `src/lib/generate-pdf-blob.ts`
   - Busca las líneas con `panelY += 4; // Avanzar a la siguiente línea para el valor`
   - Debe aparecer después de cada `doc.text("Correo:", ...)` y `doc.text("Dirección:", ...)`

2. **Limpia la caché de Node.js**:
   ```bash
   cd sistema-gestion-orden
   rm -rf .astro
   rm -rf node_modules/.cache
   npm run dev
   ```

3. **Verifica que no haya errores en la consola del navegador**:
   - Abre DevTools (F12)
   - Ve a la pestaña "Console"
   - Busca errores en rojo

4. **Prueba en modo incógnito**:
   - Abre una ventana de incógnito
   - Accede a la aplicación
   - Genera el PDF

## Cambios Aplicados

✅ **Nombre de sucursal**: Usa `name` o `razon_social`
✅ **Etiquetas y valores en líneas separadas**: Cada campo tiene su etiqueta en una línea y su valor en la siguiente
✅ **Sin solapamiento**: El valor siempre se dibuja debajo de la etiqueta, nunca al lado

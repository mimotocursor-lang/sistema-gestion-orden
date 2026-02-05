# Actualización de Paleta de Colores

## Cambios Realizados

### Nueva Paleta de Colores Sofisticada

**Antes:**
- Negros muy oscuros (#0a0a0a, #1a1a1a) - genéricos
- Bordes simples (#333333)
- Sin profundidad ni sombras

**Ahora:**
- Negros suaves con profundidad (#121212, #1e1e1e, #2a2a2a, #363636)
- Bordes sofisticados con toque dorado (#3a3a3a, #4a4a4a, #5a4a2a)
- Sombras suaves para dar profundidad
- Gradientes sutiles en fondos

### Colores Disponibles

```javascript
brand-dark: {
  DEFAULT: "#121212",      // Fondo principal (no 100% negro)
  light: "#1e1e1e",        // Fondos secundarios
  lighter: "#2a2a2a",      // Elementos elevados
  lightest: "#363636",     // Elementos más elevados
  border: "#3a3a3a",       // Bordes sutiles
  "border-light": "#4a4a4a", // Bordes más visibles
  "border-gold": "#5a4a2a",  // Bordes con toque dorado
  text: "#e8e8e8",         // Texto principal
  "text-light": "#f5f5f5", // Texto destacado
  "text-muted": "#a0a0a0", // Texto secundario
}
```

### Sombras Disponibles

```javascript
shadow-soft: '0 2px 8px rgba(0, 0, 0, 0.3)'
shadow-medium: '0 4px 12px rgba(0, 0, 0, 0.4)'
shadow-large: '0 8px 24px rgba(0, 0, 0, 0.5)'
shadow-gold: '0 4px 12px rgba(212, 175, 55, 0.2)'
shadow-gold-lg: '0 8px 24px rgba(212, 175, 55, 0.3)'
```

## Componentes Actualizados

✅ `tailwind.config.cjs` - Nueva paleta de colores
✅ `global.css` - Estilos globales mejorados
✅ `Dashboard.tsx` - Header y contenedores
✅ `Login.tsx` - Formulario de login
✅ `Sidebar.tsx` - Navegación lateral

## Componentes Pendientes de Actualizar

Los siguientes componentes aún usan los colores antiguos y deben actualizarse:

- `POS.tsx` - Punto de venta
- `ProductosStock.tsx` - Gestión de productos
- `VentasMetricas.tsx` - Métricas de ventas
- `OrdersTable.tsx` - Tabla de órdenes
- `OrderForm.tsx` - Formulario de órdenes
- `OrderDetail.tsx` - Detalle de orden
- `OrderEditModal.tsx` - Modal de edición
- `CustomerEditModal.tsx` - Modal de cliente
- `PatternDrawer.tsx` - Dibujo de patrones
- `PDFPreview.tsx` - Vista previa de PDF

## Guía de Reemplazo

Para actualizar los componentes, reemplaza:

```css
/* Antes */
bg-brand-black → bg-brand-dark
bg-brand-black-light → bg-brand-dark-light
bg-brand-black-lighter → bg-brand-dark-lighter
bg-brand-secondary_black → bg-brand-dark-light
bg-brand-tertiary_black → bg-brand-dark-lighter
border-brand-black-border → border-brand-dark-border
text-brand-black-text → text-brand-dark-text
text-brand-text_light → text-brand-dark-text-light

/* Bordes mejorados */
border-brand-gold-600 → border-brand-dark-border-gold
border-slate- → border-brand-dark-border

/* Sombras */
shadow-md → shadow-medium
shadow-lg → shadow-large
shadow-xl → shadow-large
```

## Ejemplo de Uso

```tsx
// Antes
<div className="bg-brand-black-lighter border border-brand-gold-600 rounded-lg shadow-md">

// Ahora
<div 
  className="bg-brand-dark-lighter border border-brand-dark-border-gold rounded-lg shadow-medium"
  style={{
    boxShadow: '0 4px 12px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.05)'
  }}
>
```

## Características de la Nueva Paleta

1. **Profundidad Visual**: Sombras suaves que dan sensación de capas
2. **Bordes Sofisticados**: Bordes con toque dorado sutil
3. **Gradientes Sutiles**: Fondos con gradientes que dan profundidad
4. **Mejor Contraste**: Texto más legible con mejor contraste
5. **Cohesión**: Todos los colores trabajan juntos armoniosamente

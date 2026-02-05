/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{astro,html,js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        brand: {
          DEFAULT: "#d4af37", // Dorado principal
          light: "#f4d03f", // Dorado claro (hover, highlights)
          dark: "#b8860b", // Dorado oscuro (botones activos)
          gold: {
            50: "#fef9e7",
            100: "#fef3c7",
            200: "#fde68a",
            300: "#fcd34d",
            400: "#f4d03f", // Dorado claro
            500: "#d4af37", // Dorado principal
            600: "#b8860b", // Dorado oscuro
            700: "#9a7209",
            800: "#7c5d07",
            900: "#5e4805",
          },
          // Paleta de negros sofisticados con profundidad
          dark: {
            DEFAULT: "#121212", // Fondo principal (no 100% negro)
            light: "#1e1e1e", // Fondos secundarios
            lighter: "#2a2a2a", // Elementos elevados
            lightest: "#363636", // Elementos más elevados
            border: "#3a3a3a", // Bordes sutiles
            "border-light": "#4a4a4a", // Bordes más visibles
            "border-gold": "#5a4a2a", // Bordes con toque dorado
            text: "#e8e8e8", // Texto principal
            "text-light": "#f5f5f5", // Texto destacado
            "text-muted": "#a0a0a0", // Texto secundario
          },
          white: "#FFFFFF"
        }
      },
      boxShadow: {
        'soft': '0 2px 8px rgba(0, 0, 0, 0.3)',
        'medium': '0 4px 12px rgba(0, 0, 0, 0.4)',
        'large': '0 8px 24px rgba(0, 0, 0, 0.5)',
        'gold': '0 4px 12px rgba(212, 175, 55, 0.2)',
        'gold-lg': '0 8px 24px rgba(212, 175, 55, 0.3)',
        'inner-soft': 'inset 0 2px 4px rgba(0, 0, 0, 0.2)',
      }
    },
  },
  plugins: []
};




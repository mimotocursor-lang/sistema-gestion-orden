-- ============================================
-- Agregar campo customer_id a tabla ventas
-- ============================================
-- Este script agrega el campo customer_id a la tabla ventas
-- para poder asociar ventas con clientes

-- Agregar columna customer_id si no existe
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'ventas' AND column_name = 'customer_id'
  ) THEN
    ALTER TABLE ventas 
    ADD COLUMN customer_id UUID REFERENCES customers(id) ON DELETE SET NULL;
    
    -- Crear índice para mejorar rendimiento
    CREATE INDEX IF NOT EXISTS idx_ventas_customer ON ventas(customer_id);
  END IF;
END $$;

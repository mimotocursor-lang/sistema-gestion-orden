# Instrucciones para Agregar Columna customer_id a ventas

## Problema
El error "Could not find the 'customer_id' column of 'ventas' in the schema cache" indica que la columna `customer_id` no existe en la tabla `ventas`.

## Solución

### Opción 1: Ejecutar el Script de Migración (Recomendado)

1. Abre el **SQL Editor** en Supabase Dashboard
2. Copia y pega el contenido del archivo `add_customer_id_to_ventas.sql`
3. Ejecuta el script
4. Verifica que se ejecutó correctamente

### Opción 2: Ejecutar Manualmente

Ejecuta este SQL en el SQL Editor de Supabase:

```sql
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
```

## Verificación

Después de ejecutar el script, verifica que la columna existe:

```sql
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'ventas' AND column_name = 'customer_id';
```

Deberías ver:
- `column_name`: `customer_id`
- `data_type`: `uuid`
- `is_nullable`: `YES`

## Nota

Si recreas la base de datos usando `schema_completo.sql`, la columna `customer_id` ya estará incluida automáticamente.

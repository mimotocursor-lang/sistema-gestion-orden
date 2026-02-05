-- ============================================
-- Agregar garantías de accesorios a system_settings
-- ============================================
-- Este script agrega las garantías de accesorios al sistema de configuración

INSERT INTO system_settings (setting_key, setting_value) VALUES
  ('accessory_warranty_policies', '{
    "policies": [
      "• Garantía 30 días por defectos de fabricación.",
      "• NO cubre daños por mal uso, golpes o caídas.",
      "• Presentar boleta para hacer efectiva la garantía.",
      "• La garantía no cubre desgaste normal del producto."
    ]
  }')
ON CONFLICT (setting_key) DO UPDATE
SET setting_value = EXCLUDED.setting_value,
    updated_at = NOW();

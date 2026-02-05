# Configurar Resend con Dominio de Vercel

## ⚠️ Limitación Importante

**Los dominios `.vercel.app` NO se pueden usar con Resend** porque:
- Vercel controla completamente los DNS de estos dominios
- No puedes agregar los registros DNS que Resend necesita (SPF, DKIM, DMARC)
- Resend requiere acceso a los DNS para verificar el dominio

## ✅ Soluciones Disponibles

### Opción 1: Usar un Dominio Personalizado (RECOMENDADO)

Si tienes un dominio (aunque sea gratuito de otro proveedor):

#### Paso 1: Agregar Dominio a Vercel

1. Ve a tu proyecto en [Vercel Dashboard](https://vercel.com)
2. Ve a **Settings → Domains**
3. Haz clic en **"Add Domain"**
4. Ingresa tu dominio (ej: `app.tec-solution.cl` o `ordenes.tec-solution.cl`)
5. Sigue las instrucciones de Vercel para agregar los registros DNS

#### Paso 2: Verificar Dominio en Resend

1. Ve a [Resend Dashboard → Domains](https://resend.com/domains)
2. Haz clic en **"Add Domain"**
3. Ingresa el mismo dominio que agregaste a Vercel
4. Resend te mostrará los registros DNS necesarios:
   - **SPF Record** (TXT)
   - **DKIM Records** (CNAME o TXT)
   - **DMARC Record** (TXT) - Opcional pero recomendado

#### Paso 3: Agregar Registros DNS

1. Ve a tu proveedor de dominio (donde compraste/registraste el dominio)
2. Agrega los registros DNS que Resend te proporcionó
3. Espera unos minutos para que se propaguen
4. Vuelve a Resend y haz clic en **"Verify"**

#### Paso 4: Actualizar Código

Una vez verificado el dominio en Resend, actualiza el email de origen:

```typescript
// En src/pages/api/send-order-email.ts línea 108
const fromEmail = "info@tu-dominio.com"; // Usa cualquier email de tu dominio verificado
```

### Opción 2: Usar Dominio Gratuito (Temporal)

Si no tienes un dominio propio, puedes usar servicios gratuitos:

1. **Freenom** (aunque ya no está disponible para nuevos registros)
2. **Cloudflare** - Ofrece dominios gratuitos en algunos casos
3. **GitHub Pages** - Puedes usar un subdominio de GitHub

**Nota**: Estos servicios pueden tener limitaciones.

### Opción 3: Comprar un Dominio Barato

Puedes comprar un dominio por ~$10-15/año:
- **Namecheap**: Dominios desde $8.88/año
- **Google Domains**: Dominios desde $12/año
- **Cloudflare Registrar**: Precios al costo

### Opción 4: Usar Solo para Pruebas (Temporal)

Mientras configuras un dominio, puedes:
- Solo enviar emails a `tecsolution26@gmail.com` (tu email registrado en Resend)
- Usar esto para pruebas internas
- Una vez tengas el dominio, cambiar a la Opción 1

## 📝 Pasos Detallados para Opción 1 (Dominio Personalizado)

### 1. Si ya tienes un dominio configurado en Vercel:

Tu dominio ya debería estar funcionando. Solo necesitas:

1. **Verificarlo en Resend**:
   - Ve a [Resend → Domains](https://resend.com/domains)
   - Agrega tu dominio
   - Agrega los registros DNS que Resend te da
   - Verifica

2. **Actualizar el código**:
   ```typescript
   const fromEmail = "info@tu-dominio-vercel.com";
   ```

### 2. Si NO tienes un dominio configurado:

Necesitas primero agregarlo a Vercel, luego a Resend.

## 🔧 Actualizar Código para Usar Dominio Verificado

Una vez que tengas tu dominio verificado en Resend:

1. Abre `src/pages/api/send-order-email.ts`
2. Busca la línea con `const fromEmail`
3. Cámbiala a usar tu dominio:

```typescript
// Antes (dominio de prueba):
const fromEmail = "tecsolution26@gmail.com";

// Después (dominio verificado):
const fromEmail = "info@tu-dominio.com"; // O cualquier email de tu dominio
```

## ✅ Verificación

Para verificar que funciona:

1. Crea una orden nueva
2. El sistema enviará el email al cliente
3. Verifica en [Resend Dashboard → Emails](https://resend.com/emails) que se envió
4. El cliente debería recibir el email

## 🆘 Si Tienes Problemas

### Error: "Domain not verified"
- Verifica que agregaste todos los registros DNS en tu proveedor de dominio
- Espera unos minutos para que se propaguen los DNS
- Haz clic en "Verify" nuevamente en Resend

### Error: "Email not sent"
- Verifica que el email de origen sea del dominio verificado
- Revisa los logs en Resend Dashboard
- Verifica que la API key esté correcta

## 📚 Recursos

- [Resend Domains Documentation](https://resend.com/docs/dashboard/domains/introduction)
- [Vercel Domains Documentation](https://vercel.com/docs/concepts/projects/domains)
- [Configurar DNS para Resend](https://resend.com/docs/dashboard/domains/verify-domain)

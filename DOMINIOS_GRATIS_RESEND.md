# Dominios Gratis para Usar con Resend

## ⚠️ Importante

Para usar Resend, necesitas un dominio donde puedas agregar registros DNS (SPF, DKIM, DMARC). Esto significa que necesitas control sobre los DNS del dominio.

## ✅ Opciones de Dominios Gratis

### Opción 1: Freenom (.tk, .ml, .ga, .cf) - ⚠️ Limitada

**Pros:**
- Completamente gratis
- Dominios como `.tk`, `.ml`, `.ga`, `.cf`

**Contras:**
- Ya no acepta nuevos registros (desde 2023)
- Si ya tienes uno, puede funcionar
- Algunos proveedores de email bloquean estos dominios

**¿Funciona con Resend?**
- ✅ Sí, si ya tienes uno registrado
- ❌ No puedes registrar nuevos

### Opción 2: Cloudflare Registrar (Casi Gratis)

**Pros:**
- Precios al costo (sin markup)
- Dominios desde ~$8-10/año (muy barato)
- Control total de DNS
- Excelente para Resend

**Contras:**
- No es completamente gratis, pero muy barato

**¿Funciona con Resend?**
- ✅ Sí, perfectamente

**Cómo hacerlo:**
1. Compra un dominio barato (ej: `.xyz` desde $1/año, `.com` desde $8/año)
2. Transfiere a Cloudflare Registrar (o regístralo directamente)
3. Usa Cloudflare DNS (gratis)
4. Agrega los registros DNS de Resend

### Opción 3: Subdominios de Servicios Gratuitos

#### 3.1 GitHub Pages (username.github.io)

**Pros:**
- Gratis
- Fácil de configurar

**Contras:**
- ❌ NO funciona con Resend porque GitHub controla los DNS
- No puedes agregar registros SPF/DKIM

**¿Funciona con Resend?**
- ❌ No

#### 3.2 Vercel Subdomain (tu-proyecto.vercel.app)

**Pros:**
- Gratis
- Ya lo tienes

**Contras:**
- ❌ NO funciona con Resend porque Vercel controla los DNS
- No puedes agregar registros SPF/DKIM

**¿Funciona con Resend?**
- ❌ No

### Opción 4: Dominios Baratos (Recomendado)

Aunque no son gratis, son muy económicos y funcionan perfectamente:

#### Namecheap
- `.xyz`: Desde $0.99/año
- `.online`: Desde $0.99/año
- `.site`: Desde $2.98/año
- `.info`: Desde $2.98/año

#### Google Domains (ahora Squarespace)
- `.com`: Desde $12/año
- `.xyz`: Desde $1/año

#### Cloudflare Registrar
- Precios al costo (sin markup)
- `.xyz`: Desde $1/año
- `.com`: Desde ~$8/año

**¿Funciona con Resend?**
- ✅ Sí, perfectamente

### Opción 5: Servicios de Email Gratuitos con Dominio

Algunos servicios ofrecen dominios gratuitos con sus planes:

#### Zoho Mail (Plan Gratuito)
- Ofrece dominio gratuito con su plan
- Pero necesitas verificar que puedas agregar registros DNS de Resend

#### Microsoft 365 (Plan Personal)
- No es gratis, pero incluye dominio

## 🎯 Recomendación

### Para Pruebas Rápidas:
1. **Usa tu email personal** (`tecsolution26@gmail.com`) temporalmente
2. Solo puedes enviar a tu propio email
3. Funciona para pruebas internas

### Para Producción:
1. **Compra un dominio barato** (ej: `.xyz` por $1/año en Namecheap)
2. **Configúralo en Cloudflare** (DNS gratuito)
3. **Verifícalo en Resend**
4. **Agrega el dominio a Vercel**

**Costo total:** ~$1-2/año (muy económico)

## 📝 Pasos para Usar un Dominio Barato

### Paso 1: Comprar Dominio

1. Ve a [Namecheap](https://www.namecheap.com) o [Cloudflare Registrar](https://www.cloudflare.com/products/registrar/)
2. Busca un dominio barato (ej: `tec-solution.xyz`)
3. Compra el dominio (desde $1/año)

### Paso 2: Configurar DNS en Cloudflare (Gratis)

1. Crea cuenta en [Cloudflare](https://www.cloudflare.com) (gratis)
2. Agrega tu dominio a Cloudflare
3. Cambia los nameservers en tu registrador a los de Cloudflare
4. Cloudflare te dará DNS gratuito

### Paso 3: Agregar Dominio a Vercel

1. Ve a tu proyecto en Vercel
2. Settings → Domains
3. Agrega tu dominio (ej: `app.tec-solution.xyz`)
4. Agrega el registro CNAME que Vercel te da en Cloudflare

### Paso 4: Verificar en Resend

1. Ve a [Resend → Domains](https://resend.com/domains)
2. Agrega tu dominio (ej: `tec-solution.xyz`)
3. Resend te dará registros DNS:
   - SPF (TXT)
   - DKIM (CNAME)
   - DMARC (TXT) - Opcional
4. Agrega estos registros en Cloudflare DNS
5. Espera 5-15 minutos
6. Haz clic en "Verify" en Resend

### Paso 5: Actualizar Código

En `src/pages/api/send-order-email.ts`:

```typescript
// Cambiar de:
const fromEmail = resendTestEmail; // TEMPORAL

// A:
const fromEmail = branchEmail || "info@tec-solution.xyz";
```

## 💡 Alternativa: Usar Solo para Pruebas

Si no quieres comprar un dominio ahora:

1. **Mantén la configuración actual** (solo envía a `tecsolution26@gmail.com`)
2. **Usa esto para pruebas internas**
3. **Cuando necesites enviar a clientes**, compra un dominio barato

## 🔍 Verificar si un Dominio Funciona

Para que un dominio funcione con Resend, necesitas:
- ✅ Control sobre los DNS del dominio
- ✅ Poder agregar registros TXT y CNAME
- ✅ El dominio no debe estar bloqueado por proveedores de email

**NO funcionan:**
- ❌ Subdominios de servicios gratuitos (GitHub, Vercel, etc.)
- ❌ Dominios donde no controlas los DNS

**SÍ funcionan:**
- ✅ Dominios propios (comprados)
- ✅ Dominios de Freenom (si ya los tienes)
- ✅ Cualquier dominio donde controles los DNS

## 📚 Recursos

- [Namecheap - Dominios Baratos](https://www.namecheap.com)
- [Cloudflare Registrar](https://www.cloudflare.com/products/registrar/)
- [Resend Domains Documentation](https://resend.com/docs/dashboard/domains/introduction)

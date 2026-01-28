# Script para corregir el remoto de Git
# Ejecuta este script desde la carpeta sistema-gestion-orden

Write-Host "=== CORRECCIÓN DE REMOTO GIT ===" -ForegroundColor Cyan
Write-Host ""

# Verificar que estamos en el directorio correcto
if (-not (Test-Path ".git")) {
    Write-Host "❌ ERROR: No se encontró .git" -ForegroundColor Red
    Write-Host "   Asegúrate de ejecutar este script desde la carpeta sistema-gestion-orden" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Git encontrado" -ForegroundColor Green
Write-Host ""

# Mostrar remoto actual
Write-Host "📋 Remoto actual:" -ForegroundColor Cyan
git remote -v
Write-Host ""

# Actualizar remoto
$nuevoRemoto = "https://github.com/mimotocursor-lang/sistema-gestion-orden.git"

Write-Host "🔄 Actualizando remoto a: $nuevoRemoto" -ForegroundColor Yellow
git remote set-url origin $nuevoRemoto

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Remoto actualizado correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ Error al actualizar remoto" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 Nuevo remoto:" -ForegroundColor Cyan
git remote -v
Write-Host ""

Write-Host "=== SIGUIENTE PASO ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Asegúrate de que el repositorio existe en GitHub:" -ForegroundColor Yellow
Write-Host "   https://github.com/mimotocursor-lang/sistema-gestion-orden" -ForegroundColor White
Write-Host ""
Write-Host "2. Si NO existe, créalo en GitHub primero" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Luego ejecuta:" -ForegroundColor Yellow
Write-Host "   git branch -M main" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "4. Reinicia GitHub Desktop para que detecte el cambio" -ForegroundColor Yellow
Write-Host ""

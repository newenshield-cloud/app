# NewenShield Cloud API

## Semana 5: Docker Multi-Stage
Se implementó un Dockerfile multi-stage para optimizar el empaquetado del backend Spring Boot.

**Optimización de Tamaño (Before/After):**
* Imagen de Build (maven:3.9.4-eclipse-temurin-17): ~800 MB
* Imagen de Run (eclipse-temurin:17-jre-alpine): 87.4 MB

## Semana 6: Escaneo de Seguridad (Trivy)
Se integró Trivy para auditar la imagen final en busca de vulnerabilidades (CVEs).
* **Resultado app/myapp.jar (Código):** 0 vulnerabilidades detectadas.
* **Resultado OS (Alpine base):** 2 vulnerabilidades HIGH (gnutls, libpng) detectadas en la imagen base. Pendiente de parche mediante actualización de paquete o imagen upstream.

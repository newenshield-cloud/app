# NewenShield Cloud API

## Semana 5: Docker Multi-Stage
Se implementó un Dockerfile multi-stage para optimizar el empaquetado del backend Spring Boot.

**Optimización de Tamaño (Before/After):**
* Imagen de Build (maven:3.9.4-eclipse-temurin-17): ~800 MB
* Imagen de Run (eclipse-temurin:17-jre-alpine): 87.4 MB

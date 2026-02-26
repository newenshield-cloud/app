# NewenShield Cloud API ☁️

![Java Support](https://img.shields.io/badge/Java-17-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-brightgreen)
![Docker Optimized](https://img.shields.io/badge/Docker-Multi--Stage-blue)
![Security Scan](https://img.shields.io/badge/Trivy-Audited-success)

Backend Cloud-Native para el ecosistema NewenShield. Diseñado para ofrecer sincronización segura, gestión de bóvedas y servicios API RESTful bajo contenedores Docker optimizados.

---

## 🏗️ Container Architecture

El servicio está empaquetado utilizando un **Dockerfile Multi-Stage**, separando el entorno de compilación (Maven) del entorno de ejecución (Alpine JRE) para minimizar la superficie de ataque y los costos de transferencia.

- **Build Image:** `maven:3.9.4-eclipse-temurin-17` (~800 MB)  
- **Production Image:** `eclipse-temurin:17-jre-alpine` (**87.4 MB**)

---

## ⚙️ Environment Variables

Para ejecutar este contenedor de forma segura, se requieren las siguientes variables de entorno:

| Variable | Descripción | Default |
|----------|------------|----------|
| `SPRING_DATASOURCE_URL` | URL de conexión a la base de datos | `jdbc:postgresql://db:5432/newenshield_db` |
| `SPRING_DATASOURCE_USERNAME` | Usuario de PostgreSQL | `postgres` |
| `SPRING_DATASOURCE_PASSWORD` | Contraseña de PostgreSQL | *Requerido* |
| `SPRING_JPA_HIBERNATE_DDL_AUTO` | Estrategia de inicialización de BD | `update` |

---

## 🚀 Quick Start (Local Deployment)

La forma recomendada de levantar la API junto con su base de datos PostgreSQL es utilizando **Docker Compose**.

1. Clona este repositorio.
2. Asegúrate de tener Docker y Docker Compose instalados.
3. Ejecuta el siguiente comando en la raíz del proyecto:

```bash
docker compose up -d
```

El servicio estará disponible en:

- API → http://localhost:8080  
- Adminer (administrador visual de BD) → http://localhost:8081  

---

## 🩺 Health Check Endpoint

Para monitorear el estado del contenedor en entornos de orquestación, el servicio expone un endpoint de salud:

```bash
curl -X GET http://localhost:8080/actuator/health
```

---

## 🛡️ Security Considerations

La seguridad es un pilar fundamental en NewenShield. Esta imagen de contenedor es auditada continuamente utilizando **Trivy de Aqua Security**.

- **Application Code (`app/myapp.jar`)**: 0 vulnerabilidades detectadas.
- **Base OS (Alpine)**: Monitoreo activo de CVEs (gnutls, libpng). Se aplicará parche en la imagen upstream.

---

## ☁️ Production Considerations (Next Steps)

El estado actual del proyecto está preparado para el despliegue local. El roadmap de infraestructura hacia la nube contempla:

- **CI/CD Pipeline**: Implementación de GitHub Actions para build, test y push a un Container Registry.
- **Target Cloud Architecture**: Despliegue en AWS ECS Fargate con un Application Load Balancer y RDS PostgreSQL en subredes privadas.

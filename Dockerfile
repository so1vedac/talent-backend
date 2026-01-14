# 1단계: 빌드 (Gradle 공식 이미지를 사용해 권한 문제 해결)
FROM gradle:8.5-jdk17 AS builder
WORKDIR /project
COPY --chown=gradle:gradle . .
RUN gradle clean build -x test --no-daemon

# 2단계: 실행 (안정적인 Eclipse Temurin JDK 사용)
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /project/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

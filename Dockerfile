# 1단계: 최신 Gradle 이미지 사용 (버전 오류 해결: 8.5 -> jdk17 태그로 최신버전 자동 선택)
FROM gradle:jdk17 AS builder
WORKDIR /project
COPY --chown=gradle:gradle . .
RUN gradle clean build -x test --no-daemon

# 2단계: 실행 환경 (안정적인 Eclipse Temurin JDK 사용)
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /project/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

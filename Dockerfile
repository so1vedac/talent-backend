# 1단계: Gradle이 미리 설치된 환경에서 빌드 (gradlew 파일 안 씀!)
FROM gradle:8.5-jdk17 AS builder

# 작업 폴더 설정
WORKDIR /project

# 모든 파일 복사 (권한 문제 무시)
COPY --chown=gradle:gradle . .

# 빌드 실행 (gradle 명령어로 직접 빌드)
RUN gradle clean build -x test --no-daemon

# 2단계: 실행 환경
FROM openjdk:17-jdk-slim
WORKDIR /app

# 1단계에서 만든 jar 파일만 쏙 가져오기
# (파일 이름 상관없이 잡히도록 설정함)
COPY --from=builder /project/build/libs/*.jar app.jar

# 실행
ENTRYPOINT ["java", "-jar", "app.jar"]

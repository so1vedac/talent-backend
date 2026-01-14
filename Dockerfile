FROM openjdk:17-jdk-slim

# 작업 폴더 설정
WORKDIR /app

# 모든 파일 복사
COPY . .

# ★가장 중요★: gradlew 파일에 실행 권한 강제로 주기
RUN chmod +x gradlew

# 빌드 실행
RUN ./gradlew clean build -x test

# 실행 (파일명은 아까 말씀하신 demo...로 맞췄습니다)
ENTRYPOINT ["java", "-jar", "build/libs/demo-0.0.1-SNAPSHOT.jar"]

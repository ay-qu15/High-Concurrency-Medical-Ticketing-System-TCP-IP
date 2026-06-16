# ── Stage 1: Compile ──────────────────────────────────────────────
FROM eclipse-temurin:17-jdk AS builder

WORKDIR /app

# Copy all Java source files
COPY *.java .

# Compile everything
RUN javac *.java

# ── Stage 2: Runtime ──────────────────────────────────────────────
FROM eclipse-temurin:17-jre AS runtime

WORKDIR /app

# Copy only the compiled .class files from builder
COPY --from=builder /app/*.class .

# The server is the entry point
CMD ["java", "Server"]
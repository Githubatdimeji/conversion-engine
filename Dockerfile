# Production Container for Document Conversion Engine
FROM python:3.12-slim

WORKDIR /app

# Install essential system build utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    libxml2-dev \
    libxslt-dev \
    ghostscript \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies with pip upgrade to avoid resolution conflicts
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY . .

# Ensure working directories exist
RUN mkdir -p uploads outputs

# Expose microservice port
ENV PORT=8000
EXPOSE 8000

CMD ["python", "main.py"]

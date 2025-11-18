FROM python:3.11-slim

WORKDIR /app
COPY . /app/

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    ffmpeg \
    aria2 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start your bot
CMD ["python", "main.py"]

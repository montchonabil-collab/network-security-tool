FROM python:3.12-slim

WORKDIR /app

COPY requirements-dev.txt .

RUN pip install --no-cache-dir -r requirements-dev.txt

COPY . .

RUN useradd -m appuser

USER appuser

CMD ["python", "network_check.py"]
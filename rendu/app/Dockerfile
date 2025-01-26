FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY ./src .
COPY ./static .

EXPOSE 8000

CMD ["fastapi", "dev", "src/main.py", "--host", "0.0.0.0"]

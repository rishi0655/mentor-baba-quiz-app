# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Expose port Flask will run on
EXPOSE 8080

# Run the app
CMD ["python", "app.py"]

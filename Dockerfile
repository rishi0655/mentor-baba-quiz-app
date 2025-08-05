FROM python:3.10-slim

WORKDIR /app

# Copy requirements first
COPY requirements.txt /app/

# Install dependencies (cached if requirements.txt is unchanged)
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the code
COPY . /app

EXPOSE 5000
CMD ["python", "app.py"]

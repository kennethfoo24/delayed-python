# Use the official Python image
FROM python:3.8-slim

# Create and change to the app directory
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Run the web service on container startup
CMD [ "python", "app.py" ]

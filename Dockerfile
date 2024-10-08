# Use the official Python image
FROM python:3.8

# Create and change to the app directory
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install ddtrace


# Set environment variables
ARG DD_GIT_COMMIT_SHA
ENV DD_TAGS="git.repository_url:github.com/kennethfoo24/delayed-python,git.commit.sha:${DD_GIT_COMMIT_SHA}"
ENV FLASK_APP=app.py
ENV DD_SERVICE=avengers-delayed-python
ENV DD_ENV=avengers-app
ENV DD_APPSEC_ENABLED=1
ENV DD_VERSION="phase5"
ENV DD_TRACE_SAMPLE_RATE=1
ENV DD_TRACE_RATE_LIMIT=1000
ENV DD_REMOTE_CONFIGURATION_ENABLED=true
ENV DD_TRACE_ENABLED=true
ENV DD_APPSEC_RULES=/home/asm/appsec-rules.json
ENV DD_TRACE_DEBUG=true
ENV DD_LOG_LEVEL=debug
ENV DD_LOGS_INJECTION=true
ENV DD_PROFILING_ENABLED=true
ENV DD_APPSEC_SCA_ENABLED=true
ENV DD_IAST_ENABLED=true
ENV DD_RUNTIME_METRICS_ENABLED=true
ENV DD_TRACE_STARTUP_LOGS=true

# Copy application code
COPY . .

# Expose the application port
EXPOSE 5000

# Run the web service on container startup
CMD ["ddtrace-run", "python", "app.py"]

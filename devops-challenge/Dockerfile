FROM python:3.11-slim
WORKDIR /app
# Install dependencies
RUN pip install flask
# Copy application source
COPY app/ /app/
# Create non-root user
RUN useradd -m appuser
USER appuser
EXPOSE 80
CMD ["python", "main.py"]

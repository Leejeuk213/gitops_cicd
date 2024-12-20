# Use the official Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the local code to the container
COPY . .

# Install FastAPI and Uvicorn
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 2000

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "2000"]
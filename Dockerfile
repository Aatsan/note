# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter Notebook
RUN pip install --no-cache-dir jupyter

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# Set the environment variable for Jupyter
ENV JUPYTER_NOTEBOOK_DIR=/app

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

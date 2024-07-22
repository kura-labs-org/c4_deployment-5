FROM python:3.7

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install gunicorn

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the application code
COPY . .

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/sites-available/default

# Run database and load data scripts
RUN python database.py && python load_data.py

# Expose the port Nginx will use
EXPOSE 5000

# Command to run both Nginx and Gunicorn
CMD service nginx start && python -m gunicorn app:app -b 0.0.0.0 -D

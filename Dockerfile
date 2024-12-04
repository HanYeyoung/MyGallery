FROM python:3.9.0

# Set the working directory
WORKDIR /home/

# Clone the repository from GitHub
RUN git clone https://github.com/HanYeyoung/mygallery.git

# Change to the repository's directory
WORKDIR /home/mygallery/

# Install the dependencies from requirements.txt
RUN pip install -r requirements.txt

# Set up the secret key in .env
RUN echo "SECRET_KEY=django-insecure--av!5gpbdbvy$ryh%sf_-xutr97(ku#b@zh59_1dghn6cpldi_s" > .env

# Run Django migrations
RUN python manage.py migrate

# Expose the port for the Django development server
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

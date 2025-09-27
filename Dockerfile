# Use an official Python runtime as a parent image
FROM python:3.12
	
# Set the working directory in the container
WORKDIR /usr/src/mywebapp

# Copy the requirements file into the container
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=MyWebApp

# Run app.py when the container launches
#CMD ["python", "./MyFirstApp.py"]

# Command to run the application with Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "MyFirstApp:MyFirstApp"]
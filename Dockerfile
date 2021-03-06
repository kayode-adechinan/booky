# Dockerfile

# Pull base image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV POSTGRES_USER postgres
ENV POSTGRES_PASS postgres

# Set work directory
WORKDIR /code


# Install dependencies
RUN pip install pipenv
COPY Pipfile Pipfile.lock /code/
RUN pipenv install --system

RUN apt-get update -y
RUN apt-get -y install apt-utils binutils libproj-dev gdal-bin


# Copy project
COPY . /code/

# Base image
FROM python:3.11

# Set work directory
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy Poetry files
COPY pyproject.toml poetry.lock /app/

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy project files
COPY . /app/

# Expose port 8000
EXPOSE 8000

# Set entrypoint
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.8

RUN pip install pipenv

ENV PROJECT_DIR /usr/local/bin/src/webapp

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN pipenv install --system --deploy

# Copy the application code
COPY . ${PROJECT_DIR}

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
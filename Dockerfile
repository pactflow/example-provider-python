FROM python:3.14@sha256:855caf820856a90fa94a8064cb247a72fcec4f67ebd3ec7c84cc3970da8a6526

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

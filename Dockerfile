FROM python:3.13@sha256:ab70aee8e1bc6ffe4f95953ee2a98ca545123195a2b56d4338c7ea8ff5744a20

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

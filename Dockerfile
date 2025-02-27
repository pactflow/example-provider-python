FROM python:3.13@sha256:aeab3b605cd19f4c6ded578d76ad5faebcb78d21aed529c51ee97c5bb7f71778

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

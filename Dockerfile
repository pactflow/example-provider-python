FROM python:3.13@sha256:c474431dca07367d5c7e818954d481e16652c9097fe8aacfd6d1e8d3d89376a5

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

FROM python:3.13@sha256:74ac94c0d40f2c112e443252864a1e40a6db06e77bb6e805b638204233ffc56e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

FROM python:3.13@sha256:f3210a082bd093de885875de43a3338f4089860806d78a74de7ed4e58d12630c

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

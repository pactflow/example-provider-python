FROM python:3.14@sha256:8e4682604caec0827cb7831d1dd1987a04a992764c084fafcf3a7857afe2d6fc

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

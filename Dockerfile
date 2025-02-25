FROM python:3.13@sha256:21f561b42ab3d1e10002a9fdd9cbf9ce27f257650cf31547531d1bb728aedc9e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

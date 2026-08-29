FROM python:3.14@sha256:b0aed0e0059e9b1527ef57689a7206f32526627b0713e2228a916df62880188a

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

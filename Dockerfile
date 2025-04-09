FROM python:3.13@sha256:1f7ef1e8f35bc8629b05f4df943175f2851ba05f4a509f72304ebffde78178ee

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

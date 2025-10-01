FROM python:3.13@sha256:081e7d0f7e520a653648602d10dcf11a832c8480b98698795d5fe8f456bbba4d

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

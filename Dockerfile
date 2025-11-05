FROM python:3.14@sha256:1ad1a43b5e2478e62056bbc28028afd858185d73bf4d6a439cbb058b6800a96d

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

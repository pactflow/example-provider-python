FROM python:3.14@sha256:92b51c6fa86611bbf2000abf360a206837cee8071b382119990eb48ee3953827

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

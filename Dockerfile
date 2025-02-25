FROM python:3.13@sha256:34306fdf795b9c55c0d258a00e822399cf20572501f92613755ef036283a1814

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

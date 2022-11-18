FROM python:3.8-slim

WORKDIR /app
COPY requirements.txt requirements.txt

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip &&  \
    /opt/venv/bin/pip install -r requirements.txt

COPY . .

CMD ["/opt/venv/bin/gunicorn", "django_docker_project.wsgi:application", "-w", "2", "-b", ":8000"]

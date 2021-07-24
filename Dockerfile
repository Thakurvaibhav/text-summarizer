FROM python:3.7

WORKDIR /summarizer

ADD . .

RUN pip install -r requirements.txt

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=1
ENV FLASK_ENV=development

ENTRYPOINT [ "flask" , "run", "--host=0.0.0.0" ]

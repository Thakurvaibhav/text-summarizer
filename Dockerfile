FROM python:3.7

WORKDIR /summarizer

ENV FLASK_APP=app.py

ENV FLASK_DEBUG=1

ENV FLASK_ENV=development

ADD . .

RUN pip install -r requirements.txt

RUN pip install --upgrade numpy scipy pandas

ENTRYPOINT [ "flask" , "run", "--host=0.0.0.0" ]

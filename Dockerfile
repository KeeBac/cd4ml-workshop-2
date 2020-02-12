FROM continuumio/miniconda3:4.7.12-alpine

USER root

# Always use the local requirements.txt to override the cloned one
COPY requirements.txt /requirements.txt

ENV PATH=$PATH:/opt/conda/bin

RUN mkdir -p /app/continuous-intelligence/{src,data} \
  && apk --no-cache add git nano bash \
  && mv /requirements.txt /app/continuous-intelligence/requirements.txt

#install dependencies
RUN pip install --no-cache-dir --no-compile -r /app/continuous-intelligence/requirements.txt \
  && conda list && conda clean -tipy

COPY start.sh /app/continuous-intelligence
COPY src /app/continuous-intelligence/src
COPY data/decision_tree /app/continuous-intelligence/data/decision_tree

RUN chmod +x /app/continuous-intelligence/start.sh

EXPOSE 5005

CMD ["/app/continuous-intelligence/start.sh"]

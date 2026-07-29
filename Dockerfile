FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /home/jovyan/work
USER root
RUN chmod -R a-w /home/jovyan/work

EXPOSE 8888
USER jovyan
CMD ["start-notebook.sh", "--NotebookApp.token=''","--NotebookApp.allow_origin='*'"]
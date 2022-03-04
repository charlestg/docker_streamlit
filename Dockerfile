FROM python:3.9

LABEL maintainer "Charles Chen  <charlestge@yahoo.com>"

ENV APP_HOME /app

WORKDIR $APP_HOME
COPY . ./

# --------------- Install python packages using `pip` ---------------

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt \
	&& rm -rf requirements.txt

# --------------- Configure Streamlit ---------------
RUN mkdir -p /root/.streamlit

RUN bash -c 'echo -e "\
	[server]\n\
	enableCORS = false\n\
	" > /root/.streamlit/config.toml'

EXPOSE 8501
EXPOSE 8080

# --------------- Export envirennement variable ---------------
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD ["streamlit", "run", "--server.port", "8080", "streamlit_app.py"]
FROM debian:latest
ENV FLASK_APP=app.py
COPY app.py /app.py
COPY requirements.txt /requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN apt update
RUN apt install -y make git gcc-arm-none-eabi python3 python3-pip
RUN pip3 install -r /requirements.txt
RUN git clone http://github.com/wasted-audio/hvcc
WORKDIR /hvcc
RUN pip3 install .
WORKDIR /
RUN git clone http://github.com/rhaleblian/terrarium-puredaisy
WORKDIR /terrarium-puredaisy
RUN make bootstrap
WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]


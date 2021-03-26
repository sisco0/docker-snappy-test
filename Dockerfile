FROM gcc:10.2.0

# Get build deps
RUN apt update
RUN apt install cmake time -y

# Clone snappy
RUN git clone --recursive https://github.com/abebeos/snappy.git

# Copy bash script
COPY ./loop.sh /
RUN ./loop.sh


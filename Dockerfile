FROM ubuntu:focal

RUN apt-get update && \
    apt-get install -y curl python3-fontforge

RUN mkdir -p /inputs
RUN curl -fsSL https://github.com/haya3218/storage/releases/download/lmao/HackFC.tar.xz | \
    xz -d - | tar xv -C /inputs
RUN curl -fsSL https://osdn.net/projects/mplus-fonts/downloads/62344/mplus-TESTFLIGHT-063a.tar.xz | \
    xz -d - | tar xv -C /inputs && \
    mv inputs/mplus-TESTFLIGHT-063a/mplus-1m-regular.ttf /inputs && \
    mv inputs/mplus-TESTFLIGHT-063a/mplus-1m-bold.ttf /inputs
COPY LICENSE .
COPY build.py .

CMD python3 build.py -i /inputs -o outputs

# To run spidy in a container and write all files back to the host filesystem:
#   docker run --rm -it -v $PWD:/data spidy

FROM python:3.6
LABEL maintainer "Peter Benjamin <petermbenjamin@gmail.com>"

# Install Python and apt dependencies
RUN apt-get update \
    && apt-get install -y \
    --no-install-recommends \
    python3 \
    python3-lxml \
    python3-requests \
    && rm -rf /var/cache/apt/*

# Copy in Spidy
WORKDIR /src/app/
COPY . .

# Install pip dependencies
RUN pip install -r requirements.txt

VOLUME [ "/data" ]

ENTRYPOINT [ "python", "spidy/crawler.py" ]

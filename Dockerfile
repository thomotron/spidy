# To run spidy in a container and write all files back to the host filesystem:
#   docker run --rm -it -v $PWD:/data spidy

FROM alpine:latest
LABEL maintainer "Peter Benjamin <petermbenjamin@gmail.com>"

# Install Python and package manager dependencies
RUN apk add git python3 py3-pip py3-lxml py3-requests py3-wheel

# Copy in Spidy
WORKDIR /src/app/
COPY . .

# Install pip dependencies
RUN pip install -r requirements.txt

VOLUME [ "/data" ]

ENTRYPOINT [ "python", "spidy/crawler.py" ]

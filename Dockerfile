FROM python:3.8.5-slim-buster

ARG ADDITIONAL_PIP_OPTIONS=""

RUN \
    # Update pip
    python -m pip -v install --upgrade pip && \
    # Install package
    python -m pip -v install \
    # Setup any additional pip options
    ${ADDITIONAL_PIP_OPTIONS} \
    # Install the package
    requests && \
    python -m pip list


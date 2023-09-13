FROM python:3.8.5-slim-buster

ARG IS_RELEASE_BRANCH=false

SHELL ["/bin/bash", "-c"]
RUN \
    echo "IS_RELEASE_BRANCH=${IS_RELEASE_BRANCH}" && \
    # Setup initial flags for Python install
    PRE_FLAG=`if [[ "${IS_RELEASE_BRANCH}" == "true" ]]; then echo ""; else echo "--pre"; fi` && \
    echo "PRE_FLAG=${PRE_FLAG}" && \
    #
    # Update pip
    python -m pip install --upgrade pip && \
    # Install package
    python -m pip install \
    # Setup the explicit index-url
    -i https://mirrors.aliyun.com/pypi/simple/ \
    # If we're building on a release branch, install the pre-release version of the package
    ${PRE_FLAG} \
    # Install the package
    requests 


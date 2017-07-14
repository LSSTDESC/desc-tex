FROM ubuntu:xenial
MAINTAINER LSST DESC <bvan@slac.stanford.edu>

ENV LANG C.UTF-8

# Matches installation in early Travis PDF installations
# h/t https://github.com/thomasWeise/docker-texlive/blob/master/image/Dockerfile
# h/t https://github.com/harshjv/docker-texlive-2015/blob/master/Dockerfile
RUN apt-get update && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        make \
        git \
        texlive-fonts-recommended \
        texlive-latex-extra \
        texlive-fonts-extra \
        dvipng \
        texlive-latex-recommended \
        latexmk \
        poppler-utils \
        latex-xcolor \
        lmodern \
        texlive-xetex \
        texlive-generic-recommended \
        texlive-full \
        python-dev \
	python-setuptools \
        build-essential && \
    # Purge documentation
    apt-get purge -f -y \
        make-doc \
        texlive-fonts-extra-doc \
        texlive-fonts-recommended-doc \
        texlive-humanities-doc \
        texlive-latex-base-doc \
        texlive-latex-extra-doc \
        texlive-latex-recommended-doc \
        texlive-metapost-doc \
        texlive-pictures-doc \
        texlive-pstricks-doc \
        texlive-science-doc && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    easy_install numpy


CMD ["/bin/echo", "See https://github.com/LSSTDESC/desctex for usage."]

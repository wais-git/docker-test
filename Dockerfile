# Call version of r you want from rstudio repo (builds on rstudio base image)
FROM rocker/tidyverse:4.0.3
# FROM rocker/r-ver:4.0.3

RUN apt-get update

RUN apt-get install -y \
    git

# System dependices for R packages
RUN apt-get install -y \
    make \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    pandoc \
    libxml2-dev \
    unixodbc \
    libsodium-dev \
    tzdata

# ODBC system dependencies

RUN apt-get install -y gnupg apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install msodbcsql17 -y

# Set directories
# Make directory for exports
RUN mkdir /Scripts
RUN mkdir /Data
RUN mkdir /neon

# Install renv (package management)
ENV RENV_VERSION 0.13.2
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install WAISR
RUN R -e "remotes::install_github('wais-git/WAISR', auth_token = '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')"

# Install neon
## Copy neon
ARG neon_tar="neon/neon_0.1.20.tar.gz"
COPY ${neon_tar} neon/neon_0.1.20.tar.gz

## Execute neon install & dependencies
COPY "/Scripts/install_neon.R" "/Scripts/install_neon.R"
RUN R -e "source('/Scripts/install_neon.R')"

# Restore system library
COPY renv.lock /renv.lock 
RUN R -e 'renv::restore()'

# Copy script into container "COPY localfile pathinthecontainer"
COPY /Scripts/test_script.R /Scripts/test_script.R

# Execute script
CMD Rscript /Scripts/test_script.R



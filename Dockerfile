# Call version of r you want from rocker repo (builds on rocker base image)
# Use precompiled tidyverse image as the basic rversion take forever to compile....
FROM rocker/tidyverse:4.0.3

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

# Install renv (package management)
ENV RENV_VERSION 0.13.2
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install neon
## Copy neon
ARG neon_tar="neon/neon_0.1.20.tar.gz"
COPY ${neon_tar} neon/neon_0.1.20.tar.gz

## Execute neon & WAISR install & dependencies
ARG WAISR_auth_token_pwd
ENV WAISR_auth_token=$WAISR_auth_token_pwd

COPY "/Scripts/install_custom_packages.R" "/Scripts/install_custom_packages.R"
RUN R -e "source('/Scripts/install_custom_packages.R')"

# Restore system library
COPY renv.lock /renv.lock
RUN R -e 'renv::restore()'

# Copy script into container "COPY localfile pathinthecontainer"
COPY /Scripts/test_script.R /Scripts/test_script.R
COPY /Scripts/volumes_test.R /Scripts/volumes_test.R
COPY /Scripts/sharepoint_mount_test.R /Scripts/sharepoint_mount_test.R

# Set time zone
# rocker doesn't allow you to set tz through -e, has to be specified in the .Renviron file that R access, so need to provide this to the image
COPY .Renviron .Renviron

# Execute script (multiple scripts use & and keep on the same line otherwise will only execute one.
CMD Rscript /Scripts/sharepoint_mount_test.R & Rscript /Scripts/volumes_test.R & Rscript /Scripts/test_script.R

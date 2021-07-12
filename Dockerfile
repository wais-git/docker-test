# Call version of r you want from rstudio repo (builds on rstudio base image)
FROM rstudio/r-base:4.0.3-bionic

# Install git
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
	git

# System dependices for R packages
RUN apt-get install -y \
    make \
    libcurl4-openssl-dev \
    libssl-dev \
    pandoc \
    libxml2-dev \
    unixodbc \
    unixodbc-dev \
    libsodium-dev \
    tzdata

# ODBC system dependencies

RUN apt-get install -y gnupg apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install msodbcsql17 -y
RUN apt-get install -y unixodbc-dev freetds-dev locales
RUN locale-gen en_US.UTF-8

# RUN R -e "install.packages('odbc', repos = c(CRAN = 'https://cloud.r-project.org'))"

# Repo key (currently a public repo, want to clone a private repo)
# RUN git clone https://github.com/wais-git/docker-test.git


# Install renv (package management)
ENV RENV_VERSION 0.13.2
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install WAISR
RUN R -e "remotes::install_github('wais-git/WAISR', auth_token = 'ba908c52f40a15fb894b0d78efad15d6cf71f202')"

#RUN mkdir /Local-Packages
#COPY /renv/local/neon_0.1.20.zip /Local-Packages/neon_0.1.20.zip
#RUN R -e "install.packages('/Local-Packages/neon_0.1.20.zip', repos = NULL, type = 'win.binary')"

#RUN R -e "Sys.setenv(RENV_PATHS_LOCAL = '/Local-Packages')"

# Copy renv folder
#RUN mkdir -p /renv/local
# COPY /renv/local/neon_0.1.20.zip /renv/local/neon_0.1.20.zip

# Install neon
#COPY neon_0.1.20.zip /neon_0.1.20.zip
#RUN R -e "install.packages('/neon_0.1.20.zip', repos = NULL)"

# 
COPY renv.lock /renv.lock 
RUN R -e 'renv::restore()'

#RUN R -e 'renv::restore(project = "docker-test")'

# Set directories
# Make directory for exports
RUN mkdir /Scripts
RUN mkdir /Data

# Copy script into container "COPY localfile pathinthecontainer"
COPY /Scripts/test_script.R /Scripts/test_script.R

# Execute script
#RUN R -e "source('/Scripts/test_script.R')"
CMD Rscript /Scripts/test_script.R

#RUN R -e "getwd()"

#CMD Rscript /Scripts/test_script.R

#CMD R -e "source('/Scripts/test_script.R')"

#CMD  Rscript /Scripts/test_script.R \
# && mv /Data /Data

# Within test_script.R there is a need to access the web, access azure or athena databases, access private credentials etc.





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
    unixodbc-dev

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
#CMD Rscript /Scripts/test_script.R

RUN R -e 'getwd()'

CMD R -e "source('/Scripts/test_script.R')"

#CMD  Rscript /Scripts/test_script.R \
 # && mv /Data /Data

# Within test_script.R there is a need to access the web, access azure or athena databases, access private credentials etc.





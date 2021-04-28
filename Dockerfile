# Call version of r you want from rstudio repo
FROM rstudio/r-base:4.0.3-bionic

# Install git
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  git

# Clone repo of interest
RUN git clone https://github.com/wais-git/docker-test.git

# Install renv
##RUN R -e 'install.packages("renv", repos = "https://r-pkgs.example.com")'

# Initiate packages
##COPY renv.lock ./
##RUN R -e 'renv::restore()'

# Add scripts to run
##COPY test_script.r
##CMD R -e "source('test_script.r')"


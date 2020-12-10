FROM cyversevice/rstudio-geospatial:3.6.3

RUN install2.r --error \
    tidymodels \
    tidypredict \
    ranger \
    vip \
    doParallel \
    kernlab

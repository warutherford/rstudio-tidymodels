FROM cyversevice/rstudio-geospatial:latest

# Install tidymodels and tidypredict with plotting
RUN install2.r --error \
    tidymodels \
    tidypredict \
    vip 

# ggplot2 add ons
RUN install2.r -s --error \
GGally \
ggridges \
RColorBrewer \
scales \
viridis

# Possibly needed packages for support
RUN install2.r -s --error \
aws.s3 \
beepr \
config \
doParallel \
DT \
foreach \
formattable \
glue \
here \
Hmisc \
httr \
jsonlite \
kableExtra \
logging \
MASS \
microbenchmark \
openxlsx \
pkgdown \
rlang \
RPushbullet \
roxygen2 \
stringr \
styler \
testthat \
usethis 

# Instal tenserflow and keras
RUN install2.r -s --error \
tensorflow \
keras \
tfestimators

# Install pip and virtualenv
RUN wget https://bootstrap.pypa.io/get-pip.py  \
&& python get-pip.py \
&& python3 get-pip.py \
&& pip install virtualenv

# Install latest keras with tensorflow 
RUN r -e "library(keras) ; install_keras(method='virtualenv', version='default', tensorflow='default')"

# ML Packages
RUN install2.r -s --error \
# ML framework
caret \
car \
ensembleR \
# metrics
MLmetrics \
pROC \
# Models
arm \
C50 \
e1071 \
elasticnet \ 
fitdistrplus \
gam \
gamlss \
glmnet \
kernlab \
lme4 \
ltm \
mboost \
randomForest \ 
ranger \
rpart \
survival \
# graph analysis
igraph
# rstudio-tidymodels

Commands and workflow for running a Docker container either pulling from CyVerse VICE and/or building a new Docker container based of a previous container called "rstudio-geospatial:3.6.3" to have R tidymodels already installed ("rstudio-tidymodels:3.6.3")

Text below provided by Tyson Swetnam on 2020-12-08 for specific use at University of Arizona and CyVerse:

Connect to the BIO5 VPN, then to connect to the machine over linux terminal you need to use the command:

`ssh -p 1657 <your_cyverse_username>@gpu06.cyverse.org`

You then enter your CyVerse password. Once you've logged in successfully, you should be ready to start the Docker container,

`docker run -d -it --rm -v $HOME:/app --workdir /app -p 8799:80 -e REDIRECT_URL=http://gpu06.cyverse.org:8799 cyversevice/rstudio-geospatial:3.6.3`

To mount your home directory as a folder called /app inside the container, so you can put your data there and it won't disappear when the container stops, remove the `--rm` tag:

`docker run -d -it -v $HOME:/app --workdir /app -p 8799:80 -e REDIRECT_URL=http://gpu06.cyverse.org:8799 cyversevice/rstudio-geospatial:3.6.3`

The -d flag will run the container as a detached background process, so you won't see anything after you execute it. You need to set it to an open port -p, suggested here as 8799 but it can be any four digit number that is not currently in use.

# Build a new docker container with tidymodels

add a tag of 3.6.3

`docker build -t warutherford/rstudio-tidymodels:3.6.3`

docker builds then push to docker hub

`docker push warutherford/rstudio-tidymodels:3.6.3`

To use this docker container in the future, sign back onto machine, and then run:

`docker run -d -it --rm -v $HOME:/app --workdir /app -p 8799:80 -e REDIRECT_URL=http://gpu06.cyverse.org:8799 warutherford/rstudio-tidymodels:3.6.3` or remove the `--rm` flag to not remove container once stopped

Can give container a unique name for easier reference with `--name` flag, for example:
`docker run -d --name Rtidymodels_only -it -v $HOME:/app --workdir /app -p 8799:80 -e REDIRECT_URL=http://gpu06.cyverse.org:8799 warutherford/rstudio-tidymodels:3.6.3`

# Finish and stop container

Check docker container ID
`docker ps`

Stop the container by giving unique sequence of ID
`docker stop ####`

The container is now stopped.

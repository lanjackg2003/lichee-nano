lichee-nano
This docker image is for build the lichee-nano.
Follow few steps to run the container.

 # 1、Pull the image

docker pull jacklan/licheepi_nano


 # 2、Run the container

 ## Mapping USB device into the container 

-v /dev/bus/usb:/dev/bus/usb

 ## Mapping source code into the container 

 -v code:/opt/lichee 

At the end it will look like this:

`docker run -it -v code:/opt/lichee --name jacklan/licheepi_nano`

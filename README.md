lichee-nano  
This docker image contains a system that is ready to build the lichee-nano firmware.  

## Getting started

 ### Pull the image
     docker pull jacklan/licheepi_nano
     
 ### Get the source code
    cd && mkdir lichee-code && cd lichee-code
    git clone --single-branch --branch nano-v2018.01 https://github.com/Lichee-Pi/u-boot.git
    git clone --single-branch --branch f1c100s-480272lcd-test https://github.com/Icenowy/linux.git    
        
## Running the container
Mount the source code directories and run interactive:
  
   `docker run -it -v ~/lichee-code:/opt/lichee jacklan/licheepi_nano /bin/bash`

You can give the container access to the device like this:

   `docker run -it -v ~/lichee-code:/opt/lichee --privileged -v /dev/bus/usb:/dev/bus/usb jacklan/licheepi_nano /bin/bash`
   
Make sure the name of the device matches your system.

## Building

### U-Boot

First configure:

    cd /opt/lichee/u-boot
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- licheepi_nano_spiflash_defconfig
    make ARCH=arm menuconfig
    
Then build it:

    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j8
    
### Linux

    make ARCH=arm menuconfig
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -j4 
    
    

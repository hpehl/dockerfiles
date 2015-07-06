# JBoss EAP 6.4.0.GA Domain (5x2)

Contains a Dockerfile to start 
 
- a stock EAP 6.4 domain controller, with five server groups `server-group-0` .. `server-group-4` using profile `default` and no servers attached to it.
- a host controller with two running servers in each group: 
    - `server-group-0`: `server-0-0`, `server-0-1`.
    - `server-group-1`: `server-1-0`, `server-1-1`.
    - `server-group-2`: `server-2-0`, `server-2-1`.
    - `server-group-3`: `server-3-0`, `server-3-1`.
    - `server-group-4`: `server-4-0`, `server-4-1`.

## Build

You need a JBoss EAP 6.4 zip in order to build the image. Please make sure you have a file called `jboss-eap-6.4.0.zip` in the local directory before building the images using
 
    docker build -t eap-64-5x2 .

## Run

To start the domain controller use 

    docker run --rm -it -p 9990:9990 --name=dc eap-64-5x2 --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    
Use `admin`:`passw0rd_` to connect to the management console on the domain controller. 
    
To start a host controller use

    docker run --rm -it --link dc:domain-controller eap-64-5x2 --host-config host-slave.xml

Start as many host controller as you like or until you run out of memory ;-)

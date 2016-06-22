# WildFly 10 Domain (5x2)

Contains a Dockerfile to start 
 
- a stock WildFly 10 domain controller with three server groups `server-group-0` .. `server-group-2` using profile `default` and no servers attached to it.
- a host controller with two running servers in each group: 
    - `server-group-0`: `server-0-0`, `server-0-1`.
    - `server-group-1`: `server-1-0`, `server-1-1`.
    - `server-group-2`: `server-2-0`, `server-2-1`.

## Build

The image is not published to the public docker registry. To build the image use
 
    docker build -t wildfly-10-5x2 .

## Run

To start the domain controller use 

    docker run --rm -it -p 9990:9990 --name=dc wildfly-10-5x2 --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    
Use `admin`:`admin` to connect to the management console on the domain controller. 
    
To start a host controller use

    docker run --rm -it --link dc:domain-controller wildfly-10-5x2 --host-config host-slave.xml

Start as many host controller as you like or until you run out of memory ;-)

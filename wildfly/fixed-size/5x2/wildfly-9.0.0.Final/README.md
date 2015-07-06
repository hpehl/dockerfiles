# WildFly 9 Domain (5x2)

Contains a Dockerfile to start 
 
- a stock WildFly 9 domain controller, with five server groups `server-group-0`..`server-group-4` using profile `default` and no servers attached to it.
- a host controller with two running servers in each group `server-0`..`server-9`.

## Build

The image is not published to the public docker registry. To build the image use
 
    docker build -t wildfly-9-5x2 .

## Run

To start the domain controller use 

    docker run --rm -it -p 9990:9990 --name=dc wildfly-9-5x2 --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    
to start a host controller use

    docker run --rm -it --link dc:domain-controller wildfly-9-5x2 --host-config host-slave.xml

Start as many host controller as you like or until you run out of memory ;-)

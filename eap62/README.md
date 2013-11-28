The dockerfiles in these folders require an EAP 6.2 zip to be present. This zip is _not_ included in this repository. If you want to use the Dockerfiles you have to provide the zip on your own!

Follow these steps to build EAP images:

1. Clone the repository

        git clone https://github.com/hpehl/dockerfiles.git
        cd dockerfiles

2. Copy an EAP zip file to `eap62/core/jboss-eap-6.2.zip`

        copy <EAP 6.2>.zip eap62/core/jboss-eap-6.2.zip

3. Create an image called `hpehl/eap62`

        docker build -t "hpehl/eap62"

4. You can now use the other Dockerfiles in `domain` and `standalone` which are based on `hpehl/eap62`.

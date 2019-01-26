# dpline

Delivery Pipeline


## Prerequesites

* vagrant
* virtualbox

For OS-X only:
* Xcode

## Usage

Spawn dpline environment:

    ./env.sh <up|destroy> dev

Or using dpline CLI:

    pipenv install . && pipenv shell
    dpline deploy

To deploy directly on your host, without a VM:

    dpline deploy --directly


## Access

A summary of how to access the different services deployed by dpline

Service | Address | User | Password
:------ |:------|:------:|:--------:
Jenkins | [http://localhost:8080](http://localhost:8080) | jenkins | jenkins |
Prometheus | [http://localhost:9090](http://localhost:9090) | None | None |

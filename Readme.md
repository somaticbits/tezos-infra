<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/somaticbits/tezos-infra">
    <img src="images/tzlogo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Tezos Infrastructure for the serialCore project</h3>

  <p align="center">
    This repository outlines the necessary steps to setup a Tezos Node, a TzKT blockchain indexer aswell as the necessary monitoring framework with Grafana and Prometheus.
    <br />
    <br />
    <a href="https://github.com/somaticbits/tezos-infra/issues">Report Bug</a>
    ·
    <a href="https://github.com/somaticbits/tezos-infra/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The infrastructure is part of a bigger project of generative art called serialCore.
The scripts in this repository are regrouping the knowledge that has been acquired through experimentation and learning. It allows to setup a whole Tezos blockchain stack comprised of a non-baking node (RPC), with a blockchain indexer called TzKT and a monitoring stack to keep watch over the Docker instances.

The goal of having one's own Tezos stack is to be able to interact more freely with the blockchain, without having the limitations of the publicly accessible services. When a high load is requested, it's not rare of having slow downs or freezes on the public instances.

All credits have been added where they were due.


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Tezos](https://tezos.com/)
* [CentOS](https://www.centos.org/)
* [Docker](https://www.docker.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [NGINX](https://www.nginx.com/)
* [Grafana](https://grafana.com/)
* [Prometheus](https://prometheus.io/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

First and foremost step is to get either a VPS, or a dedicated server to host the Tezos Node, the TzKT blockchain indexer and the monitoring stack. Current preferred provider is [Servdiscount](www.servdiscount.com). Recommended specifications: 8(v)Cores / 16GB RAM / 500GB+ (SSD is recommended)

*Note: these steps are valid on a CentOS 7 distribution but can be reproduced with some changes on any other distro (Ubuntu, Debian...).*

### Prerequisites

A general knowledge of *nix system is a prerequisite.

This script will add a few necessary things to your CentOS installation (Development tools, Docker Community Edition and Docker Compose, NTP Syncing)
* [post-install script for CentOS 7](https://raw.githubusercontent.com/somaticbits/tezos-infra/main/CentOS-post-install.sh?token=GHSAT0AAAAAABUJMUQH77COOYNXH5XPFHWIYT6EJ4A)

Downloading and running the script (run as root/sudo):  
```sh
cd ~
curl -L https://raw.githubusercontent.com/somaticbits/tezos-infra/main/CentOS-post-install.sh?token=GHSAT0AAAAAABUJMUQH77COOYNXH5XPFHWIYT6EJ4A -o post-install.sh
chmod +x post-install.sh
./post-install.sh
```

If this error occurs: `Failed to set locale, defaulting to C`, refer to this post: [unixstackexchange](https://unix.stackexchange.com/a/648866)

Once everything installed, create a new account (here `tezos`), add a password and grant root permissions:
```sh
adduser tezos
passwd tezos
usermod -aG wheel tezos
```

### Installation

1. Clone this repository  
`git clone https://github.com/somaticbits/tezos-infra`
2. Switch to the `tezos-infra` folder
3. Add execution permission to scripts  
`chmod +x install-*`
4. Install the RPC (node)  
`./install-node.sh`
5. Install TzKT  
`./install-tzkt.sh`
6. Install NGINX  
`./install-nginx.sh`
7. (optional) Install monitoring stack  
`./install-monitoring.sh`


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

* Node: once installed, you need to exchange the RPC Url in your wallet of choice. In [Temple](https://templewallet.com/), open the settings and under `Network`, you can set your freshly installed node. Forget about overcrowded public nodes.  
If the container crashes, fire it back up with `TEZOS_VERSION=TEZOS_VERSION sudo docker-compose up -d` in the repo folder. `TEZOS_VERSION` in this case is the one defined in the `config.sh` file (example v12.0-rc1). It relies on the `docker-compose.yml` to restart the container, and will at this point restart automatically if it crashes again.

* TzKT: this part of the infrastructure allows you to use the TzKT api under your own address of choice. For more documentation, please relate to the official documentation: [TzKT API Docs](https://api.tzkt.io/)
* Monitoring stack: This part can be accessed via the `MONITOR_URL` variable you set in the `config.sh` file (an example would be: https://monitor.somaticbits.xyz).  
Password is set in the `config.monitoring` file which can be found in the `monitoring` folder. Current default password: `TezosIsTheBest`. Login: `admin`  
The RPC node is monitored via the `Tezos` dashboard, generic container metrics can be found under `Docker Prometheus Monitoring` dashboard. An additional datasource has been added and can be used to access directly the PostgreSQL Database from TzKT.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

David Pettersson - [@somaticbits](https://twitter.com/somaticbits) - david@somaticbits.com

Project Link: [https://github.com/somaticbits/tezos-infra](https://github.com/somaticbits/tezos-infra)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [br0kenlink](https://github.com/br0kenlink/c7-post) for the post-install script
* [BakingBad](https://github.com/baking-bad/tzkt) for their blockchain indexer

<p align="right">(<a href="#top">back to top</a>)</p>

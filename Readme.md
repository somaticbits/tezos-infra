<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/somaticbits/tezos-infra">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Tezos Infrastructure for the serialCore project</h3>

  <p align="center">
    This repository outlines the necessary steps to setup a Tezos Node, a TzKT blockchain indexer aswell as the necessary monitoring framework with Grafana and Prometheus.
    <br />
    <a href="https://github.com/somaticbits/tezos-infra"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/somaticbits/tezos-infra">View Demo</a>
    ·
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

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here's a blank template to get started: To avoid retyping too much info. Do a search and replace with your text editor for the following: `somaticbits`, `tezos-infra`, `somaticbits`, `linkedin_username`, `david`, `somaticbits`, `project_title`, `project_description`

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [CentOS](https://www.centos.org/)
* [Docker](https://www.docker.com/)
* [PostgreSQL](https://www.postgresql.org/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

First and foremost step is to get either a VPS, or a dedicated server to host the Tezos Node, the TzKT blockchain indexer and the monitoring stack. Note: these steps are valid on a CentOS 7 distribution but can be reproduced with some changes on any other distro (Ubuntu, Debian...).

### Prerequisites

This script will add a few necessary things to your CentOS installation (Development tools, Docker Community Edition and Docker Compose, NTP Syncing)
* [post-install script for CentOS 7](https://raw.githubusercontent.com/somaticbits/tezos-infra/main/CentOS-post-install.sh?token=GHSAT0AAAAAABPOZLUVA64JW7N56BIF4TCUYO5NEKQ)

### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/somaticbits/tezos-infra.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [] Feature 1
- [] Feature 2
- [] Feature 3
    - [] Nested Feature

See the [open issues](https://github.com/somaticbits/tezos-infra/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@somaticbits](https://twitter.com/somaticbits) - david@somaticbits.com

Project Link: [https://github.com/somaticbits/tezos-infra](https://github.com/somaticbits/tezos-infra)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/somaticbits/tezos-infra.svg?style=for-the-badge
[contributors-url]: https://github.com/somaticbits/tezos-infra/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/somaticbits/tezos-infra.svg?style=for-the-badge
[forks-url]: https://github.com/somaticbits/tezos-infra/network/members
[stars-shield]: https://img.shields.io/github/stars/somaticbits/tezos-infra.svg?style=for-the-badge
[stars-url]: https://github.com/somaticbits/tezos-infra/stargazers
[issues-shield]: https://img.shields.io/github/issues/somaticbits/tezos-infra.svg?style=for-the-badge
[issues-url]: https://github.com/somaticbits/tezos-infra/issues
[license-shield]: https://img.shields.io/github/license/somaticbits/tezos-infra.svg?style=for-the-badge
[license-url]: https://github.com/somaticbits/tezos-infra/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png

<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
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
[![project_license][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">UAV control using cascade Proportional control</h3>

  <p align="center">
    A matlab simulink simulation analyzing proportional cascade control scheme
    <br />
    <a href="https://github.com/AlterraFa/UAV-Control"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="media/Flight.gif">View Demo</a>
    &middot;
    <a href="https://github.com/AlterraFa/UAV-Control/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/AlterraFa/UAV-Control/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#demonstration">Demonstration</a></li>
        <li><a href="#key-components">Key Components</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repository implements a lightweight, modular framework for simulating and analyzing a quadcopter using a dual-loop pure-proportional (“double-P”) control architecture. The core idea is a cascade of two P-controllers—an outer loop regulating attitude (or altitude) and an inner loop commanding motor thrust (or angular rate)—to achieve fast disturbance rejection and precise set-point tracking without the complexity of full PID tuning.

### Demonstration
| [![Control block diagram][Flight-gif]][Flight-gif] | [![3D flight path][Architecture]][Architecture] |
|:------------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|
| *Figure 1: 3D flight path*. Click to enlarge.                           | *Figure 2: Control block diagram*. Click to enlarge.                              |

### Key components:

  * [quadcopter.slx](./main/quadcopter.slx) – Simulink model of the quadcopter plant and cascade-P controller, ready for “play” simulation and parameter sweeps.

  * `data/` – MATLAB scripts and .mat files defining vehicle parameters (mass, inertia, arm length) and P-gain values. Simply edit these scripts to retune your system.

  * `visualizer/` – MATLAB routines to load simulation logs and generate time-series plots of position, attitude, and control commands—ideal for performance analysis and controller comparison.

  * `media/` – Screenshots and figures illustrating block diagrams, response curves, and sample flight trajectories.

  * [QuadcopterDocumentation.docx](./QuadcopterDocumentation.docx) – A detailed design document covering control objectives, gain selection methodology, and recommended simulation settings.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<a href="https://www.mathworks.com" style="display:inline-flex; align-items:center; text-decoration:none;">
  <img src="./media/Matlab_Logo.png" alt="MATLAB Logo" height="40px" />
  <span style="margin-left:8px; font-size:1rem; font-weight:600; color:inherit;">MATLAB</span>
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Installation

To get started, it is required to have Matlab version [R2023b]() with simulink installed.

Refer to this installation link: https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Simply open [quadcopter.slx](./main/quadcopter.slx) and run simulation. If you haven't install matlab, refer to [Instalation](#installation) section

<p align="right">(<a href="#readme-top">back to top</a>)</p>




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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/AlterraFa/UAV-Control/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=AlterraFa/UAV-Control" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
## License

Distributed under the project_license. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - ntony8124@gmail.com@email_client.com

Project Link: [https://github.com/AlterraFa/UAV-Control](https://github.com/AlterraFa/UAV-Control)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
I would like to thank my mentor for making this project possible 

* [Ha Le Nhu Ngoc Thanh][mentor-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AlterraFa/UAV-Control.svg?style=for-the-badge
[contributors-url]: https://github.com/AlterraFa/UAV-Control/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AlterraFa/UAV-Control.svg?style=for-the-badge
[forks-url]: https://github.com/AlterraFa/UAV-Control/network/members
[stars-shield]: https://img.shields.io/github/stars/AlterraFa/UAV-Control.svg?style=for-the-badge
[stars-url]: https://github.com/AlterraFa/UAV-Control/stargazers
[issues-shield]: https://img.shields.io/github/issues/AlterraFa/UAV-Control.svg?style=for-the-badge
[issues-url]: https://github.com/AlterraFa/UAV-Control/issues
[license-shield]: https://img.shields.io/github/license/AlterraFa/UAV-Control.svg?style=for-the-badge
[license-url]: https://github.com/AlterraFa/UAV-Control/blob/master/LICENSE.txt
[Flight-gif]: media/Flight.gif
[Architecture]: media/Architeture.png
[mentor-url]: https://sites.google.com/view/halenhungocthanh/homepage
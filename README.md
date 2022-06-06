<!-- ABOUT THE PROJECT -->
## About The Project

Docker image to execute ansible on a ECS on Huaei Cloud. Includes python script to extract list of ECS. 

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

## Prerequisites

* [Docker](https://www.docker.com/get-started/)
* [Consul KV Store](https://www.consul.io/) 


### environment variables

**CONSUL_HTTP_ADDR**: Endpoint of consul server
**CONSUL_HTTP_TOKEN**: Consul token to access kv path of host IP
**IP_BASTION**: If not using CONSUL, use IP_BASTION as the host IP
**ANSIBLE_HWC_ACCESS_KEY**: Huaweicloud credentials
**ANSIBLE_HWC_SECRET_KEY**: Huaweicloud credentials
**ANSIBLE_HWC_PROJECT_ID**: Huaweicloud project ID
**ANSIBLE_HWC_REGION**: Huaweicloud Region
**ANSIBLE_HWC_IDENTITY_ENDPOINT**: Huaweicloud Identity Endpoint
**ANSIBLE_HWC_CLOUD**: Huaweicloud authentication
**SSH_KEY**: ECS SSH privatey key

<!-- USAGE EXAMPLES -->
## Usage

Docker build and run

<!-- CONTACT -->
## Contact

Polimatas team


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Huaweicloud team

# SDX API

## Purpose

* Along with Python, Mininet and Kytos, we'll use Multipass to quickly set up our local development environment and simplify deployment. 
* We'll use pytest instead of unittest for writing unit and integration tests to test the API. 
* We'll store the code on a GitHub repository and utilize GitHub Actions to run tests before deploying to AWS.
* GitHub Actions is a continuous integration and delivery (CI/CD) solution, fully integrated with GitHub. 
* MONGODB

** 

### Get Code From GitHub

```python 
```

## Requirements

Python 3.9

### GitHub Setup
## GitHub Repository

```
“https://github.com/atlanticwave-sdx/sdx-continuous-development”
The repository contains submodules for integrating the Kytos-ng and OES OXPOs, kytos-sdx-topology napp, SDX-LC, SDX Controller, and Meican. 
Set up the environment and run the integrated SDX infrastructure. Make sure to refer to the repository documentation for any additional instructions or configuration details. 
```

### Submodules

## The following submodels are included in the repository:
```
SDX Controller: Responsible for centralized control and management of the SDX infrastructure.
Meican: Provides network service provisioning and resource allocation capabilities.
Kytos-ng: Acts as the OXPO for one part of the infrastructure.
OESS: Acts as the OXPO for another part of the infrastructure.
SDX-LC: Acts as a bridge between the SDX Controller and the OXPOs.
```

### Clone Repository 

## To clone the repository and its submodules, use the following bash commands:

```
git clone --branch luisdev --recurse-submodules https://github.com/atlanticwave-sdx/sdx-continuous-development

cd sdx-continuous-development/
```

### Creating Submodules

```
git submodule add -b main https://github.com/atlanticwave-sdx/sdx-controller data-plane/container-sdx-controller/sdx-controller/

git submodule add -b main https://github.com/atlanticwave-sdx/sdx-lc data-plane/container-sdx-lc/sdx-lc/

git submodule add -b main https://github.com/atlanticwave-sdx/sdx-meican data-plane/container-sdx-meican/sdx-meican/

git submodule update --init --recursive --remote

git config --file=.gitmodules -l
```

### Environment Setup

## The sdx-continuous-development repository provides a setup script for configuring an Ubuntu environment to run the integration:

```
https://github.com/atlanticwave-sdx/sdx-continuous-development/blob/main/ubuntu_local_setup.sh

The script configures the host machine with Python, Docker, and Docker Compose.
```

### Building the Environment

## After the environment setup, navigate to the cloned repository directory. Run the following commands to build the required components:

./1_build_kytos.sh

./2_build_oxpos.sh

./3_build_mongo.sh

```
These commands update the submodules and build the Kytos-ng components, the OXPOs, and the MongoDB container.
Applying Patches
The repository may require patches for specific configurations or bug fixes.
Apply the necessary patches as described in the repository documentation.
```

### Running the Integration

## Once the environment is set up and all the components are built, execute the following command to run the integration:

```
docker compose up

cd script

./5_run_all.sh
```

### Docker Compose Environment
```
The system is orchestrated using Docker Compose. The environment includes containers for Kytos-ng, SDX-LC, MongoDB, Mininet, and RabbitMQ. Environment variables are defined in the .env file, allowing system configuration and customization. Docker compose runs all the necessary containers and orchestrates the integration of the SDX Controller, Meican, Kytos-ng, OESS, and SDX-LC.
```

### Network
## Docker Compose kytos network:
```
Subnet

192.168.0.0./24

Gateway

192.168.0.1

```

### Docker Compose use the following global constants from the .env file:

```
JWT_SECRET_KEY='t1NP63m4wnBg6nyHYKfmc2TpCOGI4nss'
MONGODB_CONNSTRING='mongodb://mongo1t:27027,mongo2t:27028,mongo3t:27029/?authSource=admin'
MONGO_HOST_SEEDS='mongo1t:27027,mongo2t:27028,mongo3t:27029'
ROOT_MONGO_USER='admin_user'
ROOT_MONGO_PASS='admin_pwd'
ROOT_MONGO_DB='admin'
CONTROLLER_MONGO_USER='sdx_controller_user'
CONTROLLER_MONGO_PASS='sdx_controller_pwd'
CONTROLLER_MONGO_DB='sdx_controller'
LC_MONGO_USER='sdx_lc_user'
LC_MONGO_PASS='sdx_lc_pwd'
LC_MONGO_DB='sdx_lc'
LC_MONGO_USER_COLLECTION='user'
SDX_VERSION='2.0.0'
SDXLC_HOST='0.0.0.0'
SDXLC_PORT='8080'
SDX_MQ_IP='192.168.0.12'
PUB_TOPIC='topo'
PUB_QUEUE='sdx_q1'
SUB_QUEUE='connection'
SUB_EXCHANGE='connection'
SUB_TOPIC='lc1_q1'
MQ_NAME='hello'
MQ_HOST='192.168.0.12'
MQ_PORT='5672'
RABBITMQ_DEFAULT_USER='mq_user'
RABBITMQ_DEFAULT_PASS='mq_pwd'
KYTOS_URL='http://0.0.0.0:8181/SDX-LC/1.0.0/provision'
FLASK_APP='swagger_server/__main__:main'
```


### Containers
## Kytos and SDX-LC containers
## The amlight, sax, and tenet, Kytos and SDX-LC containers are built as follows:
```
SDX-LC has a pipenv environment to handle dependencies isolated from kytos dependencies.
Kytos OXPO and SDX-LC share the same docker container.
 	The content of the "kytos-sdx-topology" NApp (event listener NApp) is copied to a directory within the container. 
Similarly, the content of the SDX-LC is copied to another directory within the container, which will serve as the "sdx-lc api server."
Previously Kytos is installed within the container. 
Kytos OXPO refers to the Kytos OpenFlow extension (OXPO) module. This module allows for OpenFlow interactions with network devices.
The "kytos-sdx-topology" NApp. This NApp serves as an event listener and API endpoint for the SDX (Software-Defined Exchange) topology updates.
The "SDX-LC API server" represents the local SDX controller client. This component interacts with the SDX controller and facilitates communication with the SDX infrastructure.
The same process applies to the remaining OXPO’s: SAX and Tenet.
MongoDB containers
A MongoDB 5.0 cluster for kytos and “sdx-lc api server” databases
Mininet container
A Mininet container based on italovalcy/mininet:2.3.0d6
Rabbit mq containers (SDX-controller)
A rabbitmq:3.8-management-alpine
A python:3.9.7-slim worker container 
Message Queue process
```

### API testing
```
API testing ensures functional accuracy, security, performance, contract compliance, and system reliability in system design and development. Swagger and Openapi-core help to build, organize, and run OpenAPI Spec-based API tests. Evaluate the API implementation against the requirements, find errors early, and deliver high-quality APIs to users.
```
### Test Requirements
## Test Framework
```
pytest: Version 7.2.1
pytest-cov: Version 4.0.0
Code Quality and Style
black: Version 23.3.0
isort: Version 5.12.0
pylint: Version 2.15.0
pycodestyle: Version 2.10.0
yala: Version 3.2.0
Test Coverage and Reporting
pytest-cov: Version 3.0.0
Test Environment and Execution
tox: Version 3.28.0
```
### Test Types
## Unit Test
```
Test individual code units, such as functions or methods, in isolation.
Focus on verifying the behavior and correctness of specific units.
```
## Functional Test
```
API testing ensures API endpoints work as expected. 
Create OpenAPI Spec-based tests to verify API contract compliance. Verify the functionality of specific features or components of the system. 
Checking the endpoints' input, output, and error handling is part of this. Functional testing finds API issues, logic mistakes, and inconsistencies.
Verify the functionality of specific features or components.
Test the system's behavior based on the requirements and restrictions specified in the AW-SDX 2 - Topology Data Model Specification 2.0.0.
Write functional tests to validate the behavior of the sdx topology endpoint and the created SDX topology, focusing on:
Checking that the SDX-LC correctly constructs and validates the topology based on the provided OXP's topology.
It verifies that all the required attributes are present and not empty.
Testing the restrictions and formats of specific attributes, such as "name," "id," "version," "timestamp," and "model_version."
We ensure the presence and non-emptiness of the "nodes" and "links" attributes.
```
## Integration Test
```
Test the interaction and integration between the different components of the system.
Focus on validating the interoperability and communication between SDX Controller, Local Controller and OXP’s.
Write integration tests to ensure that the SDX-LC endpoint integrates correctly with other components, such as the OXP's topology data source, the other SDX functions such as Validator and Topology, and SDX Controller.
Verify that the data flow and interactions between components are functioning as expected.
For the OXPO’s and SDX-LC topology endpoint, write integration tests to validate the following restrictions and requirements:
Ensure that the SDX-LC correctly receives the OXP's topology.
Validates the construction and validation of the SDX topology on the SDX-LC topology endpoint.
Verify that all required attributes are provided when creating the topology data, including name, id, version, model_version, timestamp, nodes, and links.
Ensure that none of the required attributes are empty.
Validate the length and format of the "name" attribute.
Verify that the "id" attribute follows the specified format.
Validate the "version" attribute as an unsigned integer with the appropriate range and increments.
Verify the format and value of the "timestamp" attribute, including the UTC requirement.
Validate the "model_version" attribute.
Ensure that the "nodes" attribute is a non-empty list of Node objects.
Ensure the "links" attribute is a non-empty list of Link objects.
Verify that there are no private attributes in the Topology Object.
```
## End-to-End Test 
```
End to End API testing is crucial to the CI/CD pipeline. Test the entire system to ensure its functionality and behavior meet the desired requirements. 
Every code change may validate API validity and stability by automating 
API tests in the CI/CD pipeline provide rapid feedback on API quality, discover errors early, and prevent regressions, ensuring system reliability and stability during development.
Test the entire system to validate its behavior and performance in a real-world scenario.
Cover various use cases and user workflows to ensure the system functions correctly from end to end.
Write end-to-end tests that simulate user interactions or system workflows involving the OXPO’s, SDX-LC endpoint and the SDX topology.
Validate the entire system's overall behavior, data flow, and functionality.
```

### Test Requirements Summary
## Install the required test framework and code quality tools:
```
pytest
pytest-cov
black
isort
pylint
pycodestyle
yala
Tox

Enforce code style and formatting using black, isort, pylint, pycodestyle, and yala.
Run black –check swagger_server
Run isort –check swagger_server
Lint sdx-lc Dockerfile
Use tox to manage the test environment and execute tests across different configurations or environments.

```

# Operationalize a Machine Learning Microservice API
## Cirleci Status
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Bernado6/Udacity-Project4-DevOps/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Bernado6/Udacity-Project4-DevOps/tree/master)
* Circleci Image Showing `successful` build Udacity project 4 pipeline
![Circleci](https://github.com/Bernado6/Udacity-Project4-DevOps/blob/master/Screenshots/Circleci-passed.png)

## Project Overview

This project exposed me to practice and apply the skills I acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* I used AWS EC2 instance as my Host to accomplish the project requirements. with the following properties
 - t.3 small
 - 20GiB 
 - Ubuntu 

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

## Do the following to get started

### Create and Activate an Environment

#### Git and version control
These instructions also assume you have git installed for working with Github from a terminal window, but if you do not, you can download that first from this Github installation page.

#### 1. clone the project repository, and navigate to the project folder.

```bash
git clone https://github.com/udacity/DevOps_Microservices.git
cd DevOps_Microservices/project-ml-microservice-kubernetes
```

#### 2. Create (and activate) a new environment, named `.devops` with Python 3. If prompted to proceed with the install (`Proceed [y]/n`) type `y`.

```bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```

#### 3. Installing dependencies via project `Makefile`. Many of the project dependencies are listed in the file `requirements.txt`; these can be installed using `pip` commands in the provided `Makefile`. While in your project directory, type the following command to install these dependencies.

```bash
make install
```

#### 4. Installing Docker
You will need to use Docker to build and upload a containerized application. If you already have this installed and created a docker account, you may skip this step.

1. You’ll need to [create a free docker account](https://hub.docker.com/), where you’ll choose a unique username and link your email to a docker account. Your username is your unique docker ID.

2. To install the latest version of docker, choose the Community Edition (CE) for your operating system, [on docker’s installation site](https://docs.docker.com/get-docker/). It is also recommended that you install the latest, stable release:
 If you're working with EC2 Instance then you can install following this [steps](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04).
3. After installation, you can verify that you’ve successfully installed docker by printing its version in your terminal: `docker --version`

#### 5. Installing hadolint
This project also must pass two lint checks; `hadolint` checks the Dockerfile for errors and `pylint` checks the `app.py` source code for errors.

1. Install hadolint following the instructions, on hadolint's page:

```bash
# Install hadolint
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
chmod +x /bin/hadolint
```
2. In your terminal, type: `make lint` to run lint checks on the project code. If you haven’t changed any code, all requirements should be satisfied, and you should see a printed statement that rates your code (and prints out any additional comments):


```bash
------------------------------------
Your code has been rated at 10.00/10
```

#### 6. Installing Minikube on Ubuntu

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```


## Tasks to be completed Explained in detailed

### Task 1: Complete the Dockerfile
* Docker can build images automatically by reading the instructions from a `Dockerfile`. The Dockerfile contains all the commands a user could call on the command line to assemble an image.     

* To view the contents of the `Dockerfile` type: `cat Dockerfile`. You can edit any file by opening it in a text editor and saving it.

#### Dockerfile
You can see that you have been given a couple of lines of code in the `Dockerfile` and some instructions.

FROM is provided for you; the FROM instruction initializes a new build stage and sets the base image for subsequent instructions. In this case, it specifies Python3 as the base image for this application. The rest of the Dockerfile instructions are left for you to complete. You should have instructions that:

 * Specify a working directory.
 * Copy the `app.py` source code to that directory
 * Install any dependencies in `requirements.txt` (do not delete the commented   `# hadolint ignore` statement).
 * Expose a port when the container is created; port 80 is standard.
 * Specify that the app runs at container launch.

After you complete this file and save it, it is recommended that you go back to your terminal and run `make lint` again to see if `hadolint` catches any errors in your Dockerfile. **You are required to pass these lint checks to pass the project.**


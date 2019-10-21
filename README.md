<img src="https://i.imgur.com/eXRi5Am.png" width="450" height="100">

#

Backend infrastructure application run in a [kubernetes](https://kubernetes.io/) cluster. The project components are as follows:

- [API Gateway](#API-Gateway)
- [Services](#Services)
- [Databases](#Databases)

The project is structured in accordance to this model:

![alt-text](https://imgur.com/ygfAFk1.png)

## Installation of the cluster

For the creation of the cluster, we will use [linux containers](https://linuxcontainers.org/). In order to be able to run the cluster, both [lxc](https://linuxcontainers.org/lxc/introduction/) and [lxd](https://linuxcontainers.org/lxd/introduction/) need to be installed.

The cluster that will be used to host kubernetes, follows this structure:

![alt-text](https://imgur.com/XIWimGL.png)

In order to achieve this, we must follow these simple steps.

### 1. Create a k8s profile

As it can be seen in the diagram above, each node of the cluster requires at least 2 cores of processing power and 2Gb or RAM. By default, our linux containers won't adhere to these specifications, so we must configure a new profile.

```bash
lxd init # Initialize the lxd instances on the host machine
lxc profile copy default k8s # Copy the default profile into a new profile called k8s
lxc profile edit k8s # Open editor to modify the k8s profile
```

Then, we must add the following lines under the`config` definition for our profile.

```bash
  limits.cpu: "2" # Allow for the use of two cores
  limits.memory: 2GB # Assign 2Gb of memory
  limits.memory.swap: "false" # Turn off swap (required by kubelet)
  linux.kernel_modules: ip_tables,ip6_tables,netlink_diag,nf_nat,overlay # Enable required libraries
  raw.lxc: "lxc.apparmor.profile=unconfined\nlxc.cap.drop= \nlxc.cgroup.devices.allow=a\nlxc.mount.auto=proc:rw sys:rw"
  security.privileged: "true" # Allow container to perform privileged operations
  security.nesting: "true" # Allow for containers to be created within the containers
```

### 2. Create the Machines

The cluster will consist of three machines, a master node, and two worker nodes.

```bash
lxc launch images:centos/7 kmaster --profile k8s # Create master node under k8s profile
lxc launch images:centos/7 kworker1 --profile k8s # Create worker node under k8s profile
lxc launch images:centos/7 kworker2 --profile k8s # Create worker node under k8s profile
```

### 3. Configure the cluster

For the creation of the cluster, a script has been provided. All that needs to be done in order to install all the required packages, and set up the cluster, is run the script on each node.

```bash
cat bootstrap-kube.sh |lxc exec kmaster bash
cat bootstrap-kube.sh |lxc exec kworker1 bash
cat bootstrap-kube.sh |lxc exec kworker2 bash
```

> **Important:** The script has been configured with specific tasks that will only run on the masker node, and a separate set of tasks that will enable the worker nodes to join the cluster. This is done via the hostname of the servers, so the master node must contain 'master' somewhere in the hostname. Similarly, the worker nodes must contain 'worker' as part of the hostname.

## API Gateway

![alt-text](https://img.shields.io/badge/Nginx-1.17.4-green?logo=nginx)

Simple [Nginx Server](https://nginx.org/) that works as an Ingress into the cluster. All of the requests will be mapped from the API Gateway's path into the corresponding service that can handle them. For the implementation of this service, it was decided to deploy a fourth machine that will act as a load balancer for the cluster.

### 1. Creating the load balancer

For the creation of the load balancer, we will use another lxc container, and the haproxy load balancing services.

```bash
lxc launch images:centos/7 haproxy # Create the lxc container
lxc exec haproxy bash # deploy the container's terminal client
yum install haproxy -y # Install haproxy
yum install nano -y # Install nano
nano /etc/haproxy/haproxy.cfg # Launch editor for haproxy configuration file
```

Once within the editor, we can replace the contents of `haproxy.cfg` with the contents of the configuration file provided in this repository, replacing the worker IP values to match those of the cluster we're running.

### 2. Installing the Nginx service

The API Gateway solution we'll use, will be [this one](https://github.com/nginxinc/kubernetes-ingress).

```bash
lxc exec kmaster bash # Deploy the master node's terminal client
git clone https://github.com/nginxinc/kubernetes-ingress.git # Clone the repository
cd kubernetes-ingress/deployments
kubectl apply -f common/ns-and-sa.yaml # Create namespace and service account
kubectl apply -f common/default-server-secret.yaml # Create a secret for the Ingress
kubectl apply -f common/nginx-config.yaml # Create a ConfigMap for NGINX  customization
kubectl apply -f rbac/rbac.yaml # Create role binding rules for the service account
kubectl apply -f daemon-set/nginx-ingress.yaml # Deploy a Demon Set to create the Ingress Pods
kubectl expose deploy nginx-deploy-main --port 80 # Create a service for the pods that listens on port 80
```

### 3. Creating an Ingress resource file

Once the services are running and the pods have been created, we need to define an Ingress resource file to handle all incoming requests. For this, we will use two hostnames.

- admin.tecstaurant.com: For cluster visualization.
- tecstaurant.com: For access to all services from the client.

The ingress resource file can be found under the yamls directory within the repository.

### 4. Handling hostnames

The easiest solution for making sure that the requests are reaching the cluster from the desired hostname, is to edit the `etc/hosts` file within the computer that will handle the client.

```bash
lxc list haproxy # Print overview of the haproxy machine
```

From the overview, copy the IP address of the load balancer, and then add the following at the end of your `etc/hosts` file.

```bash
<load balancer IP>    admin.tecstaurant.com
<load balancer IP>    tecstaurant.com
```

## Databases

There are two database solutions that work together to store and manage the data of this solution:

- [Neo4j](#Neo4j)
- [MySQl](#MySQL)

### Neo4j

Simple graph database using [Neo4j](https://neo4j.com/). This database is tasked with storing all the locations of the TECstaurant,
as well as the products they sell, and the services they offer. Furthermore, the database also offers suggestions on what products to buy,
based on recent purchases and what other people who purchased the same product, have also acquired.

![alt-text](https://imgur.com/Y7YYe2g.png)

### MySQL

Simple SQL database using [MySQL](https://www.mysql.com/).

![alt-text](https://i.imgur.com/vyTFZyj.png)

## Services

Collection of micro-services that compose the backend logic and functionality.

- [catalog-service](#catalog-service)
- [dashboard-service](#dashboard-service)
- [order-service](#order-service)
- [report-service](#report-service)
- [user-service](#user-service)

### catalog-service

![alt-text](https://img.shields.io/badge/Node.js-10.16.3-green?logo=node.js)

It is a micro-service written in [Node.js](https://nodejs.org/en/). This micro-service manages the cataloging aspects of TECstaurant. It works in conjunction with the [Neo4j Database](#Neo4j) to provide the CRUD functions for all the different data types that compose the catalog.

The docker image for this service is available [here](https://hub.docker.com/r/tecstaurant/catalog-service).

- [Locations](#Location)
- [Products](#Product)
- [Services](#Service)

#### Location

##### Add a new Location

Route: `/locations`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "address": "address"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Locations

Route: `/locations`
Request Type: `GET`

Response:

```json
{
  "locations": [
    {
      "id": "id",
      "name": "name",
      "address": "address"
    }
  ]
}
```

##### Get Location by id

Route: `/locations/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "address": "address"
}
```

Status:

- Success: Data retrieved successfully.
- Failed: Data doesn't exist.

##### Get Location's menu

Route: `/locations/:id/menu`
Request Type: `GET`

Response:

```json
{
  "menu": [
    {
      "id": "id",
      "name": "name",
      "price": "price",
      "description": "description"
    }
  ]
}
```

##### Get Location's services

Route: `/locations/:id/services`
Request Type: `GET`

Response:

```json
{
  "services": [
    {
      "id": "id",
      "name": "name",
      "hourly_fee": "hourly_fee",
      "description": "description"
    }
  ]
}
```

##### Update a Location

Route: `/locations/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "address": "address"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a location

Route: `/locations/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

#### Product

##### Add a new Product

Route: `/products`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Products

Route: `/products`
Request Type: `GET`

Response:

```json
{
  "products": [
    {
      "id": "id",
      "name": "name",
      "price": "price",
      "description": "description"
    }
  ]
}
```

##### Get Product by id

Route: `/products/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Status:

- Success: Data retrieved successfully.
- Failed: Data doesn't exist.

##### Update a Product

Route: `/products/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "price": "price",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a Product

Route: `/products/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

#### Service

##### Add a new Service

Route: `/services`
Request Type: `POST`

Request Body:

```json
{
  "id": "id",
  "name": "name",
  "hourly_fee": "hourly_fee"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully added.
- Failed: There was a problem while adding the data.

##### Get all Services

Route: `/services`
Request Type: `GET`

Response:

```json
{
  "services": [
    {
      "id": "id",
      "name": "name",
      "hourly_fee": "hourly_fee"
    }
  ]
}
```

##### Get Service by id

Route: `/services/:id`
Request Type: `GET`

Response:

```json
{
  "id": "id",
  "name": "name",
  "hourly_fee": "hourly_fee"
}
```

##### Update a Service

Route: `/services/:id`
Request Type: `PUT`

Request Body:

```json
{
  "name": "name",
  "hourly_fee": "hourly_fee",
  "description": "description"
}
```

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: The data has been successfully modified.
- Failed: There was a problem while modifying the data.

##### Remove a Service

Route: `/services/:id`
Request Type: `DELETE`

Response:

```json
{
  "status": "status",
  "message": "message"
}
```

Status:

- Success: Data deleted successfully.
- Failed: Couldn't delete data.

### dashboard-service

The dashboard is a simple tool that provides a live visualization solution for the processes, resources, etc, that run within the cluster. We will use [Weave Scope](https://weave.works/oos/scope).

#### 1. Installing Weave Scope

```bash
kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```

This one command, will take care of creating all the pods, namespaces, service accounts, etc.

#### 2. Exposing Weave Scope to the Ingress

For security reasons, the ingress controllers only have access to services running on the same namespace in which they were deployed, however, Weave Scope creates and runs withing its own namespace. In order to surpass this limit, we will need to create a service within the default namespace that links directly to Weave Scope's service's IP. The yaml file to accomplish this has been provided within the `yamls` directory.

```bash
kubectl apply -f weave-svc.yaml
```

### order-service

![alt-text](https://img.shields.io/badge/Go-1.12.7-lightblue?logo=Go) ![alt-text](https://img.shields.io/badge/GqlGen-0.10.1-ff69b4?logo=graphql)

### report-service

![alt-text](https://img.shields.io/badge/Python-3.7.4-yellow?logo=python)

### user-service

![alt-text](https://img.shields.io/badge/Ruby-2.6.4-red?logo=ruby) ![alt-text](https://img.shields.io/badge/GraphQL-14.5.8-ff69b4?logo=graphql)

# WordPress Project - Docker and Kubernetes Setup

This project demonstrates how to deploy a WordPress application using Docker and Kubernetes. It includes configurations for Docker containers and Kubernetes resources to manage WordPress and its MySQL database.

## Prerequisites

- Docker installed on your machine
- Kubernetes cluster (e.g., Minikube, Docker Desktop, or a cloud provider)
- `kubectl` command-line tool installed
- `docker-compose` installed

## Getting Started with Docker

### Building the Docker Image

1. **Dockerfile**: The project includes a `Dockerfile` that defines the environment for the WordPress application.

    ```bash
    docker build -t my-wordpress .
    ```

2. **Environment Configuration**: The `wp-config.php` file includes the necessary configuration to connect WordPress to the MySQL database.

3. **Running Containers**: Use the `docker-compose.yml` file to manage and run the WordPress and MySQL containers.

    ```bash
    docker-compose up -d
    ```

    This will start both the WordPress and MySQL containers in detached mode.

4. **Accessing WordPress**: Once the containers are up and running, you can access your WordPress site by navigating to `http://localhost:8000` in your web browser.

5. **Stopping Containers**: To stop and remove the containers, use the following command:

    ```bash
    docker-compose down
    ```

## Kubernetes Deployment

### MySQL Deployment

1. **Deploy MySQL Pod**: The `mysql-pod.yml` file defines the MySQL pod. Deploy it using the following command:

    ```bash
    kubectl apply -f mysql-pod.yml
    ```

2. **Deploy MySQL Service**: The `mysql-pod-svc.yml` file defines a service to expose the MySQL pod. Deploy it using:

    ```bash
    kubectl apply -f mysql-pod-svc.yml
    ```

### WordPress Deployment

1. **Deploy WordPress Pod**: The `wp-pod.yml` file defines the WordPress pod. Deploy it using the following command:

    ```bash
    kubectl apply -f wp-pod.yml
    ```

2. **Deploy WordPress Service**: The `wp-pod-svc.yml` file defines a service to expose the WordPress pod. Deploy it using:

    ```bash
    kubectl apply -f wp-pod-svc.yml
    ```

3. **Accessing WordPress**: After deploying both pods and services, you can access your WordPress site by forwarding the WordPress service to your local machine.

    ```bash
    kubectl port-forward service/wp-service 8080:80
    ```

    Then, navigate to `http://localhost:8080` to view your WordPress site.

### Cleanup

To remove the deployed resources from your Kubernetes cluster, use the following commands:

```bash
kubectl delete -f wp-pod-svc.yml
kubectl delete -f wp-pod.yml
kubectl delete -f mysql-pod-svc.yml
kubectl delete -f mysql-pod.yml


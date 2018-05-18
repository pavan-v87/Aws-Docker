# Aws-Docker
This docker image can be used to do dev-work on aws cloud. Image is build with kops, kubectl binaries along with aws keys which are passed as environment variable. So, once container is running we can start using aws/kops/kubectl cli commands for working on our cluster.
The image is run using docker-compose command


## Instructions
* Create `aws-access-keys.env` with following environment variables
  ```java
  AWS_ACCESS_KEY_ID=xxxxxx
  AWS_SECRET_ACCESS_KEY=yyyyyy
  ```

* Download `kops` and `kubectl` binaries
  ```sh
  wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64

  wget -O kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  ```

* Run the image
  ```sh
  docker-compose up --build
  docker ps
  docker exec -it <image-id> bash
  ```
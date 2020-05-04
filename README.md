# vagrantAnsiblek8
Repositorio dedicado a creacion de maquinas virtuales por medio de Vagrant y aprovisionamiento de Kubernetes usando Ansible

Post instalacion:

Despues de llevar acabo la instalacion del Cluster de Kubernetes es necesario ejecutar los siguinetes comandos desde nuestro
portatil, estos comandos ayudaran a ejecutar kubectl desde nuestro portatil hacia el Cluster de Kubertenes.

```
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

```

Una vez realizado este proceso es necesario obtener el directorio .kube del Master Node de Kubernetes:
1. Dentro de nuestro home directory crear el directorio .kube
```
mkdir .kube
```
2. Realizar el copiado de la carpeta .kube del Master Node hacia nuestro home directory
```
scp -P 2222 vagrant@127.0.0.1:/home/vagrant/.kube/config ~/.kube/config
```
3. Pedira el password del usuario vagrant... por defecto es vagrant
```
vagrant@127.0.0.1's password: vagrant
```
4. Comprobar los nodos existendes del Cluster de Kubernetes
```
kubectl get nodes
```

Compleatados estos pasos es necesario ejecutar el script **gcpContainerRegistryConfig.sh** el cual inyecta el Service Account 
dedicado para que el Cluster de Kubernetes local pueda realizar pull de las imagenes Docker existentes dentro nuestro
Google Cloud Platform Conteiner Registry. **la llave .json debera ser provista por el responsable de la cuanta de GCP**

Ejecutar el script como se muestra:
```
$ ./gcpContainerRegistryConfig.sh
```


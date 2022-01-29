Memo code

[Amazon\.co\.jp: Deploying Rails with Docker, Kubernetes and ECS \(English Edition\) eBook : Acuña, Pablo: Foreign Language Books](https://www.amazon.co.jp/dp/B01N0SS6NF/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1)

run on local environment
```shell
$ minikube start
$ kubectl create -f kube/deployments/postgres-deployment.yaml
$ kubectl create -f kube/jobs/setup-job.yaml
$ kubectl create -f kube/deployments/webapp-deployment.yaml
$ minikube service webapp

$ minikube stop
```

check pods
```shell
$ kubectl describe service webapp
$ minikube dashboard
$ minikube ip
```

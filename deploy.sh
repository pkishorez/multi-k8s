docker build -t kishoreiiitn/multi-client:latest -t kishoreiiitn/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t kishoreiiitn/multi-server:latest -t kishoreiiitn/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t kishoreiiitn/multi-worker:latest -t kishoreiiitn/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push kishoreiiitn/multi-client:latest
docker push kishoreiiitn/multi-client:$GIT_SHA
docker push kishoreiiitn/multi-server:latest
docker push kishoreiiitn/multi-server:$GIT_SHA
docker push kishoreiiitn/multi-worker:latest
docker push kishoreiiitn/multi-worker:$GIT_SHA
kubectl apply -Rf k8s
kubectl set image deployments/server-deployment server=kishoreiiitn/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=kishoreiiitn/multi-worker:$GIT_SHA
kubectl set image deployments/client-deployment client=kishoreiiitn/multi-client:$GIT_SHA
docker build -t sunilkrajulapati/multi-client:latest -t sunilkrajulapati/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sunilkrajulapati/multi-server:latest -t sunilkrajulapati/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sunilkrajulapati/multi-worker:latest -t sunilkrajulapati/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sunilkrajulapati/multi-client:latest
docker push sunilkrajulapati/multi-server:latest
docker push sunilkrajulapati/multi-worker:latest
docker push sunilkrajulapati/multi-client:$SHA
docker push sunilkrajulapati/multi-server:$SHA
docker push sunilkrajulapati/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=sunilkrajulapati/multi-client:$SHA
kubectl set image deployments/server-deployment server=sunilkrajulapati/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=sunilkrajulapati/multi-worker:$SHA

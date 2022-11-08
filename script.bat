echo "Criando as imagens..."

docker build -t geowurth/projeto-backend:1.0 backend/.
docker build -t geowurth/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push geowurth/projeto-backend:1.0 backend/.
docker push geowurth/projeto-database:1.0 database/.

echo "Criando os serviços no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

imageName="vue-nest_build-client"
containerName="VueNestBuildClient"

git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:MuratovBektur/vue-nest-docker-template.git
git push -u origin main

# build new container for build vue app
docker build  -f Dockerfile -t $imageName .  || true;
# run container
docker run --name $containerName -itd $imageName;
# copy from container's dist folder to local dist foler
docker cp $containerName:/app/dist .
# remove container after using;
docker container rm -f $containerName;
# remove image after using;
docker rmi -f $imageName;
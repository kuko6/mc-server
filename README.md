Docker setup on linux:
```sh
sudo usermod -aG docker $USER

sudo systemctl enable docker

sudo systemctl start docker
```

Start the server:
```sh
docker-compose up
```

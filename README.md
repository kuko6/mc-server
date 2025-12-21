Docker setup on linux:
```sh
# let docker run without sudo
sudo usermod -aG docker $USER

# enable daemon
sudo systemctl enable docker
sudo systemctl start docker
```

Start the server:
```sh
docker-compose up
```

Quick world restart:
```sh
./restart_world.sh
```

View logs:
```sh
docker-compose logs -f mc
```

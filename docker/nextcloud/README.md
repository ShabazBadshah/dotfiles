# Nextcloud Setup

# My Setup
- Ubuntu 18.04 LTS
- 16GB of DDR3 RAM
- Intel Core 2 Quad @ 2.66 Ghz
- 1TB HDD, 128GB SSD

1. Edit the .env file with your own username, password, and DB name
2. Run ```docker-compose up -d``` to run the Nextcloud file
3. Copy config.php into the config.php file in the Nextcloud container. ```docker exec -it <CONTAINER_ID> /bin/bash``` will give you access to the container

# Other Notes:
- Run ```sudo docker exec --user www-data <CONTAINER_ID> php occ files:scan --all``` if you add files from the host into the Nextcloud data directory when bulk-moving data. The command will re-read the data directory and update your Nextcloud instance so your new files will be displayed in your instance. This way you won't have to manually upload a bunch of files to your server and can just copy them over into the server's data directory

# TODO
1. Automatically copy config.php file into Nextcloud instance instead of having to manually modify it
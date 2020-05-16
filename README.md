# Docker Standalone Samba Server

Can be used to quick setup a simple Samba container in bridge network mode. It will run as if on host, so it can be accessed from other computers on the same network.

It also mounts a host directory as the Samba shared point.

## Warning

Note the simple `smb.conf` file.

It will start a **writable Guests allowed server**.

## Pro tip

If you ever want a Samba network setup to be reliable, make sure that the server software is running on a Windows machine, never a Unix-based one. All Unix-based Samba server implementations are unstable and that's probably the reason you think Samba sucks.

## Configuration

Edit the `docker-compose.yml` file, change the `volumes:` section to map the directory you want.

Eg.: I'm sharing the `/mnt/hdd_repo/Shared/` Docker host directory as the Samba path. You can change it to anything you have on the host:

```yml
volumes:
  - /home/someone/my_folder/:/Shared
```

If you want to perform Samba related configurations, just edit the `smb.conf` file to fit your wishes.

## Running

Clone the repository:
```
$ git clone git@github.com:fschuindt/docker-smb.git
```

Get into the folder:
```
$ cd docker-smb
```

Build the image:
```
$ docker-compose build
```

Start the container:
```
$ docker-compose up -d
```

## License

The repository is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


# Ubuntu rkt-demo

I created this Vagrant box to demo rkt at a meetup, you could also use the CoreOS provided Vagrant box for start using and testing rkt. Created this repo for reference.

The Vagrant box are bootstrapped with the provided script, if you change anything in that file you'll need to run `vagrant up --provision` to re-provision the box.

## How-to
1. Download Vagrant
2. Run `vagrant up` within the cloned directory containing the `Vagrantfile`
3. Compile the go-web-app locally or within the Vagrant box (you'll need the golang packages). See the rkt-directory, to cross-compile for Linux if you're on Mac run: `CGO_ENABLED=0 GOOS=linux go build -o go-web-app .`

## Testing rkt

1. Create an ACI-image file with the `build-go-web-app.sh` script, it's located in the rkt-directory of this repo. You'll need a tool called acbuild to successfully build the ACI-image. This tool are installed automatically via the provisioning step when starting the Vagrant-box.
2. Run the container with the `rkt` tool:
   `rkt run --inseucre-options=image go-web-app-0.0.1-linux-amd64.aci`
3. Run the container wrapped with systemd (daemonize it):
   `sudo systemd-run --slice=machine rkt --net=host --insecure-options=image run go-web-app-0.0.1-linux-amd64.aci`
4. You can run systemd specific tools to start/stop/check the container:
   `systemctl status run-r3f4a126798274e63ac779b1b2e46883f.service`, change the service name to whatever was outputted in the command above in step 3.
5. Check running containers with `machinectl` and `rkt` tools:
   `sudo rkt list`
   `sudo machinectl list`
6. To stop a container:
   `sudo rkt stop <ID>`
   `systemctl stop <SERVICE>`
7. rkt can convert Docker images on the fly and if you prefix an image location with `docker://` it will default to the Docker registry for fetching images:
   `sudo systemd-run --slice=machine rkt --net=host --insecure-options=image run docker://mikejoh/go-web-app`
   In this case we run the compiled Go web-app within a container.

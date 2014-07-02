# Tsuru Now

Yet another script to install tsuru and its dependencies.

These are some goals for this project:

* It should run without interaction and deliver a working environment;
* It shouldn't be a problem to run the script multiple times on the same machine;
* It should work on existing machines that might already have some components installed;
* It should allow parameters to install a single role:
    * API node
    * Docker node
    * Load balancer node
* A web UI to automatically run it on EC2 instances

## Running

Running the command below should already create a working tsuru environment:

```
bash <(curl -sL https://raw.githubusercontent.com/audioandpixels/now/master/run.bash)
```

```
tsuru-admin platform-add ruby --dockerfile https://raw.githubusercontent.com/tsuru/basebuilder/master/ruby20/Dockerfile
tsuru-admin platform-add nodejs --dockerfile https://raw.githubusercontent.com/tsuru/basebuilder/master/nodejs/Dockerfile
```


Notes on external db server to serve deployed apps:
TODO: Any advantage using tsuru services?
```
docker run --name tsuru-db01 -e LC_ALL=C.UTF-8 -d postgres
```
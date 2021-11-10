# Useful and Example Controllers developed for general starling usage

This folder contains a number of general controllers for general usage of the starling system.

## Building and Installation

### Through Docker-Compose

#### Building

The examples can be built and run via `docker-compose`. 

First, start up one of the docker-compose simulator stacks in ProjectStarling (i.e. [docker-compose.yml](https://github.com/StarlingUAS/ProjectStarling/blob/master/docker-compose.yml)), [Murmuration](https://github.com/StarlingUAS/Murmuration) or [FenswoodScenario](https://github.com/StarlingUAS/FenswoodScenario). 
```bash
docker-compose -f <simulator/sitl/mavros compose file> up
```

Then, run the `docker-compose.<firmware>.yaml` file in this repository to use the examples
```bash
# For PX4:
docker-compose -f docker-compose.px4.yaml up
# For Ardupilot:
docker-compose -f docker-compose.ap.yaml up
```

This command will both build and run the local files (the compose file uses the 'build' entry to specify the location of building). If you make any local changes to the controller, the controller can be rebuilt by using the `--build` flag, e.g. 

```bash
docker-compose -f docker-compose.px4.yaml up --build
```
#### Running and Networking

Instructions for networking differs on Windows and Linux, as well as which simulator/sitl/mavros scenario you have run. 

1. **Linux** - No modifications are required to run the docker-compose files, the default settings in the compose files will do the job. Run as above! (This is because linux compose files have been set to use host networking).
2. **Windows** - A number of environment variables will need to be set before running the command:

**Using WSL2** (all one command):
```bash
STARLING_NETWORK='<Name of compose network>';STARLING_NETWORK_MODE='bridge'; docker-compose -f docker-compose.ap.yaml up
```

**Using Powershell**:
```ps1
$env:STARLING_NETWORK = '<Name of compose network>'; $env:STARLING_NETWORK_MODE = 'bridge'; 
docker-compose -f docker-compose.ap.yaml up

# Then when you are finished using these environment variables
Remove-Item Env:\STARLING_NETWORK
Remove-Item Env:\STARLING_NETWORK_MODE
```

Where `<Name of compose network>` is replaced by the network name created by the simulator compose file. Unless specifically changed, this will default to: `<folder_which_contains_compose_file>_default`, i.e:

- Projectstarling: `projectstarling_default`
- FenswoodScenario: `fenswoodscenario_default`
- Mumuration: `px4_default` or `ap_default`

### Through Makefile

This folder can be built locally by running `make all` from this folder. Each element can also be built separately by invoking `make <controller-name>`.

## Example Python Controller

This is an example of a controller for the system written in Python with ROS2. It has been packaged up with a Dockerfile and an example kubernetes deployment file. The controller itself directly talks to mavros and tells the drone to lift off, trace a semi circle and land.

## Starling Simple Offboard

This is an example of an onboard or offboard controller which can be used to control a single drone. It is based on the original Clover simple offboard, but also includes a trajectory follower module. This controller can be run to provide a higher level control of a real or simulated drone.

> **Note** If running in the flight arena, this controller is already running on the Coex Clover drones

## Starling Allocator

This is an example of a trajectory allocator node which attempt to smartly allocate trajectories to drones which can run them.
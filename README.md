# micro-manage

## What is it / why does it exist?

Multiple teams I have worked with have had a some-what similar need. Occasionally engineers need to do work with `kubernetes` (or `k8s`) but may lack experience with it. Compound that with some teams need which occasionally need to work with `k8s` as part of an OnCall rotation.

This project is a first _POC_ project to try to solve for both of those needs in one place:

- Have all the dependencies necessary to talk to a `k8s cluster` baked into a docker image.
- Have helper documentation baked into the same image - for those who are just starting out.
- Have helper scripts backed into the image, useful for solving common problems. 

Additionally - for teams who need `OnCall runbooks` I have been prototyping this as a solution where the `runbook` documentation AND solutions can be packaged up into a single toolset. 

## Getting started

1. Pull the `docker container`: 

    ```
    docker pull jsco2t/micro-manage:latest
    ```

2. Run the image using one of the following options

    If you don't know where to get started - run the image interactively:
    ```
    docker run -it --name micro-manage jsco2t/micro-manage:latest
    ```

    Then run the following (from within the running container) for information on setup:
    ```
    k8s setup
    ```

    The biggest _"setup"_ task is configuring the `kubectl config file` so that `kubectl` can function from within `micro-manage`. If you happen to have one of these on your local machine - you can mount it into the container image to ease in the setup. Something like the following can be used:

    ```
    docker run -v c:\users\username\.kube\:/root/.kube -it --name micro-manage jsco2t/micro-manage:latest

    -- or --
    
    docker run -v /home/username/.kube/:/root/.kube -it --name micro-manage jsco2t/micro-manage:latest

    For example - for a user named `Sue` on `macOS` that might look like this:
    docker run -v /Users/sue/.kube/:/root/.kube -it --name jsco2t/micro-manage:latest
    ```

## Document index

The various documentation baked into this image can be found by starting with the _"index"_ page:

[index](index.md)

## Dev Notes:

This project uses `markdown <--> terminal` processors. In practice I have found that none of these do a great job of converting `markdown` to a terminal output. For adding documents I suggest looking at the examples in `/documents/templates` for examples of the current formatting in use. The formatting used is a subset of all of `markdown` and its just an unfortunate limitation of these markdown processors.

## Credits

Please see the (credits)[credits.md] document for information used by the `micro-manage` project.

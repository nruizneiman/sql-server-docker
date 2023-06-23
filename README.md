# sql-server-docker
[![Build and publish a Docker image](https://github.com/nruizneiman/sql-server-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/nruizneiman/sql-server-docker/actions/workflows/docker-image.yml)

## Overview
This repo is a demo of how to create a database with objects and seed data into a SQL Server database by using Docker.

It also shows with some pipelines/workflow/action files how to integrate it with CI/CD so the process can be automated to either a public or private container registry.

## Contributing
The `Dockerfile` file is the entrypoint here, where using Microsoft's SQL Server Docker image as base, it then copies the SQL scripts and executes them by using `sqlcmd` against the server.

If you are adding a new SQL script, it needs to be included into the Dockerfile, otherwise, it will not run and no changes will be effective in the database.

The script is prepared to run SQL scripts in a certain order:
1. `./scripts/Init/00-Create-Database.sql`: Script to create the database
2. `./scripts/Init/01-Apply-Basic-Schema.sql`: Creates Tables, Views, Stored Procedures, Functions, etc.
3. `./scripts/Init/02-Pre-Data.sql`: Whatever you need to run _before_ seeding the database. By default, it disables constraint checks for all tables in the database.
4. `./scripts/Tables-With-Inserts/dbo.Categories.Table.sql`: Adds dummy data to a table. Categories in this case.
5. `./scripts/Tables-With-Inserts/dbo.Products.Table.sql`: Adds dummy data to a table. Products in this case.
6. `./scripts/00-Additional-Data.sql`: Any additional data or script you want to execute at the end of the seeding process.
7. `./scripts/Init/03-Post-Data.sql`: Whatever you need to run _after_ seeding the database. By default, it enables constraint checks for all tables in the database.

## How to build and run
The following commands are useful to build the image and run a new container locally by using Docker, they can be adapted as needed to satisfy your needs.
### Build
```shell
docker build -t sql-server-local .
```

### Run
```shell
docker run -d --name sql-server-local -p 1434:1433 sql-server-local
```

## CI/CD
As part of a CI/CD process, it is important to automate the process of buidling and pushing a new image each time a new change is sent to the `main` branch. As an example, you will find some useful definitions that might be helpful when implementing this.

### Azure DevOps
This Azure Pipeline definition has been built thinking on pushing a new image against a private Azure Container Registry, if you want to use it, please make sure your project has a Service Connection to allow access to the pipeline to read/write against the container registry, and then, replace the dummy values with the real ones so it can start working as expected.

You can find the pipeline definition in the [.azurepipelines/build.yml](./.azurepipelines/build.yml) file.

### GitHub
This GitHub action definition has been built thinking on pushing a new image against a private or public Docker Container Registry.

You can find the workflow definition in the [.github/workflows/docker-image.yml](./.github/workflows/docker-image.yml) file.

_NOTE: This CI/CD workflow has not been tested yet._
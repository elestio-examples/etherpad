<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Etherpad, verified and packaged by Elestio

[Espocrm](https://github.com/espocrm/espocrm-docker) is a web application that allows users to see, enter and evaluate all your company relationships regardless of the type. People, companies, projects or opportunities — all in an easy and intuitive interface.

<img src="https://github.com/elestio-examples/etherpad/raw/main/etherpad.png" alt="etherpad" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/espocrm">fully managed etherpad</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

[![deploy](https://github.com/elestio-examples/esetherpadpocrm/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/etherpad)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/etherpad.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8686`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3.5"
    services:
    etherpad:
        image: elestio4test/etherpad:${SOFTWARE_VERSION_TAG}
        environment:
        - TITLE=${TITLE}
        - DEFAULT_PAD_TEXT=${DEFAULT_PAD_TEXT}
        - DB_TYPE=${DB_TYPE}
        - DB_HOST=${DB_HOST}
        - DB_PORT=${DB_PORT}
        - DB_NAME=${DB_NAME}
        - DB_USER=${DB_USER}
        - DB_PASS=${DB_PASS}
        - DB_CHARSET=${DB_CHARSET}
        ports:
        - "172.17.0.1:9001:9001"
        depends_on:
        - postgres

    postgres:
        image: postgres:${SOFTWARE_VERSION_TAG}
        environment:
        - POSTGRES_DB=${POSTGRES_DB}
        - POSTGRES_USER=${POSTGRES_USER}
        - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
        volumes:
        - ".postgresql/data/pgdata:/var/lib/pgdata"

### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |
|    ADMIN_PASSWORD    |    password     |
|     ADMIN_EMAIL      | test@email.com  |
|        TITLE         |    etherpad     |
|   DEFAULT_PAD_TEXT   |      text       |
|       DB_TYPE        |    postgres     |
|       DB_HOST        |    postgres     |
|       DB_PORT        |      5432       |
|       DB_NAME        |     db-name     |
|       DB_USER        |     db-user     |
|       DB_PASS        |   db-password   |
|      DB_CHARSET      |     utf8mb4     |
|     POSTGRES_DB      |     db-name     |
|    POSTGRES_USER     |     db-user     |
|  POSTGRES_PASSWORD   |   db-password   |

# Maintenance

## Logging

The Elestio Etherpad Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/ether/etherpad-lite">Etherpad Github repository</a>

- <a target="_blank" href="https://etherpad.org/doc/v1.9.1/">Etherpad documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/etherpad">Elestio/espocrm Github repository</a>

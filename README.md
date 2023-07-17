# Redis Enterprise Docker Extension

Run Redis Enterprise Databases in Docker Desktop.

Redis Enterprise Docker Extension allows you to create Redis Enterprise Databases without having to install Redis Enterprise locally or manually create a Redis Enterprise Docker container.

## Installation

To install the extension, use `make install-extension` **or**:

```shell
  docker extension install virag/redis-enterprise-docker-extension:latest
```

> If you want to automate this command, use the `-f` or `--force` flag to accept the warning message.

To preview the extension in Docker Desktop, open Docker Dashboard once the installation is complete. The left-hand menu displays a new tab with the name of your extension. You can also use `docker extension ls` to see that the extension has been installed successfully.

## Usage

To connect to Redis Enterprise Cluster via Admin UI, you can use the `Basic` authentication method by providing a Email/Username as `demo@redis.com` and Password as `redislabs`
please, refer to [the official Redis Enterprise documentation][8] for creating Redis Enterprise Databases.

## Screenshots

![Redis Enterprise Docker Extension][1]

![Login Page][2]

![Create Database - 1][3]

![Create Database - 2][4]

![Databases][5]

![rladmin Status][6]

![redis-cli Command][7]

[1]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/redis-enterprise-docker-extension.png
[2]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/01-admin-ui-login-page.png
[3]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/02-create-database-1.png
[4]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/02-create-database-2.png
[5]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/03-databases.png
[6]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/04-rladmin-status.png
[7]: https://raw.githubusercontent.com/redis-field-engineering/redis-enterprise-docker-extension/main/docs/screenshots/05-redis-cli.png
[8]: https://docs.redis.com/latest/rs/installing-upgrading/quickstarts/docker-quickstart/#create-a-database

## Clean up

To remove the extension:

```shell
docker extension rm virag/redis-enterprise-docker-extension:latest
```

## License

Redis Enterprise Docker Extension is licensed under the MIT License. Copyright © 2023 Redis, Inc.

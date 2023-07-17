# Redis Enterprise Docker Extension

Run Redis Enterprise Databases in Docker Desktop.

Redis Enterprise Docker Extension allows you to create Redis Enterprise Databases without having to install Redis Enterprise locally or manually create a Redis Enterprise Docker container.


To install the extension, use `make install-extension` **or**:

```shell
  docker extension install virag/redis-enterprise-docker-extension:latest
```

> If you want to automate this command, use the `-f` or `--force` flag to accept the warning message.

To preview the extension in Docker Desktop, open Docker Dashboard once the installation is complete. The left-hand menu displays a new tab with the name of your extension. You can also use `docker extension ls` to see that the extension has been installed successfully.

### Clean up

To remove the extension:

```shell
docker extension rm virag/redis-enterprise-docker-extension:latest
```
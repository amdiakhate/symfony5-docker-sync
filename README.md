# Basic Symfony 5 setup with docker-sync

Example of using `docker-sync` for developing a symfony application on OSX.

Running the example
---

Create a symfony project under the symfony dir

https://symfony.com/doc/current/best_practices.html#use-the-symfony-binary-to-create-symfony-applications

```
$ cd .docker
$ docker-sync-stack start
```

If everything went okay, then the app should be listening on `http://localhost:8500`

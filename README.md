# Signomix Publication Service

The service is a component of [signomix](https://github.com/signomix/signomix) and serves publicly accessible pages of the Signomix website:

* Home page
* Blog

The pages are web applications built using [Svelte](https://svelte.dev).

## Requirements

* Java 11
* Quarkus
* Maven
* npm
* Docker Engine (optionally)

## Getting started

### Building and publishing the service image

Starting from the project folder:
```shell
$ cd src/main/webapp/home
$ npm install
$ npm run build
$ cd -
$ cd src/main/webapp/blog
$ npm install
$ npm run build
$ cd -
$ ./update-webapps.sh
$ export SIGNOMIX_IMAGE_GROUP=image_repository_user_name
$ export SIGNOMIX_GA_TRACKING_ID=my_google_analytics_tracking_id
$ export SIGNOMIX_STATUSPAGE_URL=https://status.signomix.com
$ ./mvnw clean package -Dquarkus.container-image.build=true
$ ./mvnw clean package -Dquarkus.container-image.push=true
```
### Building and locally

Starting from the project folder:
```shell
$ cd src/main/webapp/home
$ npm install
$ npm run build
$ cd -
$ cd src/main/webapp/blog
$ npm install
$ npm run build
$ cd -
$ ./update-webapps.sh
$ export SIGNOMIX_IMAGE_GROUP=image_repository_user_name
$ export SIGNOMIX_GA_TRACKING_ID=my_google_analytics_tracking_id
$ export SIGNOMIX_STATUSPAGE_URL=https://status.signomix.com
$ ./mvnw clean quarkus:dev
``````
## Configuration and branding

### Page title

File location: `src/main/webapp/app-name/public/text_language.json`,<br> 
e.g. `src/main/webapp/home/public/text_en.json`

### Logo & icon

Default files location:
- `src/main/webapp/home/public/resources/logo.png`
- `src/main/webapp/home/public/resources/favicon.png`

The individual webapplication logo is declared in the navigation.json file,<br>
e.g. `src/main/webapp/blog/public/navigation.json`

```json
{
    "logo": "/resources/logo.png",
 ...
}
```

### Status page

Link to the status page in Signomix menu is generated during the build process based on the SIGNOMIX_STATUSPAGE_URL environment variable.
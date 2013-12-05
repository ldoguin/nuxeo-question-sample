# nuxeo-question-sample

## How to build

Build is based on [Yeoman](http://yeoman.io/) tooling that encapsulates grunt and bower to build the applicaiton.

In order to build, you have to :

 * install [Yeoman](http://yeoman.io/) (which involves installing npm, bower and grunt).

 * Download and Run a recent Nuxeo distribution (>= 5.8)
 
 * clone this repository
 
 * launch `mvn clean install`

 * copy the target/nuxeo-question-sample*.jar in the `$NUXEO_HOME/nxserver/bundles` folder
 
 * Launch Nuxeo
 
 * The application should be available at [http://localhost:8080/nuxeo/question/]()
 
 
## How to hack
 * The application is made of two parts :
 	* a nuxeo server running on port 8080
 	* a frontend JS app that can be serve by Nuxeo or by Node JS. 


If you want to hack the frontend app, you can launch the JS app with all the web tooling that Yeoman provides.

 * go to `src/main/yo`
 * launch `grunt server`


It should open a browser on the app on port 9000. All calls to the `/nuxeo/` context will be proxied to http://localhost:8080/nuxeo/. See `Gruntfile.js` for configuration 


## How it works

Grunt serves the HTML app by using NodeJS. In order to avoid CORS issues, a proxy is setup in `Gruntfile.js` to proxy all calls to `/nuxeo` to the backend Nuxeo server on port 8080 

    +---------+       +----------------------+  proxy    +--------------------+
    | Browser | --->  | NodeJS on port 9000  |---------> | Nuxeo on port 8080 |
    +---------+       |   call to /nuxeo are |           +--------------------+
                      |   proxied            |
                      +----------------------+

This means that in the code, all API calls will be done on `/nuxeo` without specifying a special http host. 


var express = require("express");
var http = require("http");
var httpProxy = require('http-proxy');
var path = require('path');
var webpack = require("webpack");
var webpackConfig = require("./webpack-development.config.js");
var webpackDevMiddleware = require("webpack-dev-middleware");
var WebpackDevServer = require("webpack-dev-server");
var loadConfig = require("./config");

if (webpackConfig.entry === undefined) {
  console.error("!!! No build targets found. Check you have `target.js` files for each one.");
  return;
}

/**
 * General configuration
 */
var config           = loadConfig(path.join(__dirname, "config.yml"));
var BUILD            = path.join(__dirname, "build");
var DEVELOPMENT_PORT = config.DEVELOPMENT_SERVER_PORT || 1234;
var WEBPACK_PORT     = config.WEBPACK_PORT || 8080;
var PROXY_URL        = config.PROXY_URL;


/**
 * Webpack dev middleware
 * Set up the webpack dev middleware with our development configuration file.
 */
var webpackMiddlewareOptions = {
  // Disable all output, we’ll configure it further down instead.
  quiet: true,
  noInfo: true,
  publicPath: "/assets/"
};
var webpackMiddleware = webpackDevMiddleware(webpack(webpackConfig), webpackMiddlewareOptions);


/**
 * Rails proxy
 *
 * Creates a proxy server that will proxy any requests that result in an error
 * through to the rails assets stack. This allows us to use the asset-pipeline
 * in partnership with webpack if we need to.
 */
var proxy, proxyTarget;
if(PROXY_URL !== undefined) {
  proxy = httpProxy.createProxyServer();
  proxyTarget = PROXY_URL;
  // Listen for the `error` event on `proxy`.
  proxy.on('error', function (err, req, res) {
    res.writeHead(500, {
      'Content-Type': 'text/plain'
    });
    res.end('Oh noes, we tried to proxy through to '+proxyTarget+req.url+" and failed.");
  });
}

/**
 * Express server
 *
 * Set up an express server to coordinate the proxy server  and webpack-
 * middleware instances.
 */
var app = express();

// Tell Express to use the webpackMiddleware
app.use(webpackMiddleware);

// Set CORS headers
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// Handle un-manifested asset requests from Rails
// If we haven't yet precompiled, Rails tries to find assets in its default
// directories — images, stylesheets, javascripts — we redirect those all
// to /assets/ in development
app.get("/images/*", function(req, res) {
  res.redirect(req.url.replace(/^\/images\//, "/assets/"));
});
app.get("/stylesheets/*", function(req, res) {
  res.redirect(req.url.replace(/^\/stylesheets\//, "/assets/"));
});
app.get("/javascripts/*", function(req, res) {
  res.redirect(req.url.replace(/^\/javascripts\//, "/assets/"));
});

// Check each request and proxies misses through to Rails
app.get("*", function(req, res, next) {
  try {
    // Check if a file exists in the webpack bundle's virtual filesystem.
    // This throws an error if path doesn't exist.
    webpackMiddleware.fileSystem.readFileSync(__dirname + '/build'+req.url);
  } catch (e) {
    if (proxy) {
      console.log("Proxying to "+proxyTarget+req.url);
      // Proxy through to Rails if doesn't exist.
      proxy.web(req, res, {
        target: proxyTarget
      });
      return;
    }
    else {
      throw e;
    }
  }
});

// Boot the express server
var port = DEVELOPMENT_PORT;
var server = http.Server(app);
server.listen(port, function() {
  console.log("Listening at http://localhost:" + DEVELOPMENT_PORT + "/");
});


/**
 * Development server
 *
 * Spin up a webpack dev server instance as well, so we can use it for
 * hot-loading changes.
 *
 * Should be on 8080 as the websocket expects that and it can't be configured
 * though we leave it configurable just in case :)
 */
var compiler = webpack(webpackConfig);
var devServerOptions = {
  contentBase: BUILD,
  hot: true,
  quiet: false,
  noInfo: true,
  publicPath: "/assets/",
  historyApiFallback: true,
  stats: {
    assets:       false,
    assetsSort:   false,
    cached:       false,
    chunkModules: false,
    chunkOrigins: false,
    chunks:       false,
    chunksSort:   false,
    colors:       true,
    errorDetails: false,
    hash:         false,
    modules:      false,
    modulesSort:  false,
    reasons:      false,
    source:       true,
    timings:      false,
    version:      false
  }
};
var devServer = new WebpackDevServer(compiler, devServerOptions);
devServer.listen(WEBPACK_PORT, "localhost", function() {});

var path = require('path');
var webpack = require("webpack");
var webpackConfig = require("./webpack-development.config.js");
var WebpackDevServer = require("webpack-dev-server");
var loadConfig = require("./config");

if (webpackConfig.entry === undefined) {
  console.error("!!! No build targets found. Check you have `target.js` files for each one.");
  return;
}

/**
 * General configuration
 */
var config            = loadConfig(path.join(__dirname, "config.yml"));
var DEVELOPMENT_HOST  = config.ASSETS_DEVELOPMENT_SERVER_HOST || "localhost";
var DEVELOPMENT_PORT  = config.ASSETS_DEVELOPMENT_SERVER_PORT || 8080;

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
  hot: true,
  quiet: false,
  noInfo: false,
  publicPath: "/assets/",
  historyApiFallback: true,
  stats: {
    assets:       false,
    assetsSort:   false,
    cached:       false,
    chunkModules: false,
    children:     false,
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
devServer.listen(DEVELOPMENT_PORT, DEVELOPMENT_HOST, function() {});

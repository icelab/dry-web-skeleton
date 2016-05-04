var path = require("path");
var webpack = require("webpack");
var merge = require("webpack-merge");
var WebpackNotifierPlugin = require("webpack-notifier");
var baseConfig = require('./webpack-base.config.js');
var applicationConfig = require('./webpack-application.config.js');
var loadConfig = require("./config");

/**
 * Configuration
 */
var config  = loadConfig(path.join(__dirname, "config.yml"));
var DEVELOPMENT_HOST = config.ASSETS_DEVELOPMENT_SERVER_HOST || "localhost";
var DEVELOPMENT_PORT = config.ASSETS_DEVELOPMENT_SERVER_PORT || 8080;

/**
 * Plugins
 * @type {Array}
 */
var plugins = [
  new webpack.NoErrorsPlugin(),
  new webpack.HotModuleReplacementPlugin(),
  new webpack.DefinePlugin({
    DEVELOPMENT: true
  })
];

// Enable the webpack notifier plugin unless explicitly disabled in the
// ENV setup.
if (config.DISABLE_ASSETS_NOTIFIER === undefined) {
  plugins.push(
    new WebpackNotifierPlugin({title: "Webpack assets"})
  );
}

/**
 * Set up options for baseConfig
 * @type {Object}
 */
var baseOptions = {
  entryBase: [
    "webpack-dev-server/client?http://localhost:8080",
    "webpack/hot/dev-server"
  ]
};

/**
 * Merged config
 * @type {WebpackConfig}
 */
module.exports = merge(
  baseConfig(baseOptions),
  applicationConfig,
  {
    output: {
      // Ensure the publicPath matches the expected location in development
      publicPath: "http://" + DEVELOPMENT_HOST + ":"+ DEVELOPMENT_PORT + "/assets/"
    },
    // Development plugins
    plugins: plugins
  }
);

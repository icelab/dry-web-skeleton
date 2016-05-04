var path = require("path");
var webpack = require("webpack");
var merge = require("webpack-merge");
var baseConfig = require('./webpack-base.config.js');
var applicationConfig = require('./webpack-application.config.js');

/**
 * Webpack configuration
 */
 module.exports = merge(
  baseConfig({
    quiet: true
  }),
  applicationConfig,
  {
    // Plugin/loader specific-configuration
    plugins: [
      new webpack.DefinePlugin({
        DEVELOPMENT: false,
        'process.env.NODE_ENV': '"production"'
      }),
      new webpack.optimize.UglifyJsPlugin({
        compress: {
          warnings: false
        }
      })
    ],
  }
);

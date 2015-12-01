var fs = require("fs");
var path = require("path");
var yaml = require("js-yaml");

module.exports = function loadConfig(filename, env) {
  env = env || process.env.NODE_ENV || "development";

  var ymlData   = fs.readFileSync(path.resolve(filename), {encoding: "utf8"});
  var ymlConfig = yaml.safeLoad(ymlData)[env];

  var config = {};
  for (var key in ymlConfig) {
    config[key] = process.env[key] !== undefined ? process.env[key] : ymlConfig[key];
  }
  return config;
}

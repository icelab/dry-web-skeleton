var del = require("del");
var gulp = require("gulp");
var gulpJsoncombine = require("gulp-jsoncombine");
var gulpManifest = require("gulp-rev-rails-manifest");
var gulpMd5 = require("gulp-md5");
var gulpRevAll = require("gulp-rev-all");
var gulpTap = require("gulp-tap");
var path = require("path");
var runSequence = require("run-sequence");


/**
 * General configuration
 */
var BUILD = path.join(__dirname, "build")
var DEST  = path.join(__dirname, "..", "public", "assets")


/**
 * Create digested versions of files using gulp-rev-all using the already built
 * files in the `BUILD` directory
 */
gulp.task("manifest:digest", function(cb) {
  console.log("Starting manifest:digest task");
  var stream = gulp.src(BUILD+"/**/*")
    .pipe(gulpRevAll({
      quiet: true,
      silent: true,
      transformFilename: function (file, hash) {
        var ext = path.extname(file.path);
        return path.basename(file.path, ext) + "-" + hash + ext;
      }
    }))
    .pipe(gulp.dest(DEST))
    .pipe(gulpManifest())
    .pipe(gulp.dest(DEST));
  stream.on("end", function() {
    console.log("Completed manifest:digest task");
    cb();
  });
});


/**
 * Combine our manifest.json with any Rails-generated ones so we have a single
 * combined manifest.json at the end. Output them into the `DEST` directory,
 * which should be the standard rails `public/assets` directory
 */
var finalManifest;

gulp.task("manifest:combine", ["manifest:digest"], function(cb) {
  console.log("Started manifest:combine task");
  var stream = gulp.src(DEST+"/manifest*")
    .pipe(gulpJsoncombine("manifest.json", function(data) {

      // Merge the various manifest.json properties together
      // jsoncombine gives us an object with the filenames as
      // the top-level keys
      var merged = {
        files: {},
        assets: {}
      };
      for(var manifest in data) {
        for(var file in data[manifest].files) {
          merged.files[file] = data[manifest].files[file];
        }
        for(var asset in data[manifest].assets) {
          merged.assets[asset] = data[manifest].assets[asset];
        }
      }
      return new Buffer(JSON.stringify(merged));
    }))
    .pipe(gulpMd5())
    .pipe(gulpTap(function(file, t) {
      // Get the generated filename
      var splitPath = file.path.split("/");
      finalManifest = splitPath[splitPath.length - 1];
    }))
    .pipe(gulp.dest(DEST));
  stream.on("end", function() {
    console.log("Completed manifest:combine task");
    cb();
  });
});


/**
 * Delete the original manifest files
 */
gulp.task("manifest:clean", ["manifest:combine", "manifest:digest"], function(cb) {
  console.log("Started manifest:clean");
  del([
    DEST+"/manifest*",
    "!"+DEST+"/"+finalManifest
    ], {force: true}, cb);
});


/**
 * Run our gulp tasks in order
 */
runSequence([
  "manifest:digest",
  "manifest:combine",
  "manifest:clean"
]);

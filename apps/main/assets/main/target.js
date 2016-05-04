// Set a rails-compatible public path
__webpack_public_path__ = '/assets/' // eslint-disable-line

// Require the base CSS, basically our entry point for CSS
// If your target doesn't require CSS, you can comment this out
import './index.css'

// Require the base JS, basically our entry point for JS
// If your target doesn't require JavaScript you can comment this out
import './index.js'

// Require all images and CSS by default
// This will inspect all subdirectories from the context (first param) and
// require files matching the regex.
require.context('.', true, /^\.\/.*\.(jpe?g|png|gif|svg)$/)

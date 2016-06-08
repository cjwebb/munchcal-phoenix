var CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
  entry: {
    "app": [
      "./web/static/js/app.js",
      "./web/elm/App.elm",
    ]
  },
  output: {
    path: "./priv/static/",
    filename: "js/app.js"
  },
  resolve: {
    modulesDirectories: [
      __dirname + "/web/static/js"
    ],
    extensions: ['', '.js', '.elm'],
    alias: {
      phoenix: __dirname + "/deps/phoenix/web/static/js/phoenix.js"
    }
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: [/node_modules/],
        loader: "babel-loader"
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/,/node_modules/],
        loader: "elm-webpack?cwd=web/elm&pathToMake=../../node_modules/.bin/elm-make"
      }
    ],
    noParse: /\.elm$/
  },
  plugins: [
     new CopyWebpackPlugin([
      { from: './web/static/assets'},
      { from: './deps/phoenix_html/web/static/js/phoenix_html.js',
        to: 'js/phoenix_html.js'
      }
    ])
  ]
};


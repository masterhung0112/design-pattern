const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const path = require("path");
// const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const dependencies = require("./package.json").dependencies;
const { FederatedTypesPlugin } = require('@module-federation/typescript');

const moduleFederationPlugin = {
    name: "topNavigation",
    filename: "remoteEntry.js",
    remotes: {},
    exposes: {
        "./TopNav": "./src/App.jsx"
    },
    shared: {
        ...dependencies,
        "@emotion/cache": {
            requiredVersion: ">=11.11.0"
        },
        "react": {
            singleton: true,
            requiredVersion: dependencies.react
        },
        "react-dom": {
            singleton: true,
            requiredVersion: dependencies["react-dom"]
        },
        "@mui/material": {
            singleton: true,
            requiredVersion: dependencies["@mui/material"]
          },
        "@mui/icons-material": {
            singleton: true,
            requiredVersion: dependencies["@mui/icons-material"] 
        }
    }
};

module.exports = {
    entry: "./src/index.js",
    mode: "development",
    output: {
        path: path.resolve(__dirname, "dist"),
        filename: "main.js"
    },
    devServer: {
        port: 3002,
        liveReload: true,
        historyApiFallback: true
    },
    name: "top-nav",
    module: {
        rules: [
          {
            test: /\.(js|jsx)$/,
            exclude: /node_modules/,
            use: {
              loader: "babel-loader",
            },
          },
          {
            test: /\.scss$/,
            use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
          },
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: "./public/index.html",
            filename: "index.html"
        }),
        new MiniCssExtractPlugin(),
        new FederatedTypesPlugin({
            federationConfig: moduleFederationPlugin
        })
    ]
}
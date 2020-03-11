const { environment } = require('@rails/webpacker')

// Adicionando as dependecias do Bootstrap 4 (jquery, popper) ao Webpacker
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
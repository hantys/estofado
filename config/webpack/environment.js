const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jMask: 'jquery-mask-plugin/src/jquery.mask',
    $j: 'jquery-mask-plugin/src/jquery.mask'
  })
)
module.exports = environment

return function ()
  require("rest-nvim").setup({
    skip_ssl_verification = false,
    env_file = '.env',
    custom_dynamic_variables = {}
  })
end

return{
{
    'goolord/alpha-nvim',
    config = function ()
      local dashboard=require'alpha.themes.theta'
      local alpha= require('alpha')
      alpha.setup(dashboard.config)
    end
},
}

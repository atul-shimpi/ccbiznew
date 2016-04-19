# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

["base","main", "helper"].each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
  Rails.application.config.assets.precompile += ["#{controller}.css"]
  Rails.application.config.assets.precompile += %w( bootstrap.min.css)#, bootstrap-theme.min.css, common.css )
  Rails.application.config.assets.precompile += %w( bootstrap-theme.css)#, ,  )
  Rails.application.config.assets.precompile += %w( font-awesome.min.css)#, ,  )
  Rails.application.config.assets.precompile += %w( template_2.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( sports_1.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( sports_2.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( education_1.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( education_2.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( education_3.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( health_1.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( entertainment_1.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( entertainment_2.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( entertainment_3.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( template_1.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( template_3.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( template_4.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( lightbox.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( mandir.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( events.css)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( bootstrap.min.js)#, bootstrap-theme.min.css,  )
  Rails.application.config.assets.precompile += %w( tinymce/plugins/uploadimage/plugin.js tinymce/plugins/uploadimage/langs/en.js )
end
# Rails.application.config.assets.precompile += %w( application.scss )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w( pages/*.css )

Rails.application.config.assets.precompile += %w( pages/time-tracking.js )

Rails.application.config.assets.precompile += %w( pages/vendors/index.js )
Rails.application.config.assets.precompile += %w( pages/vendors/stellar.js )
Rails.application.config.assets.precompile += %w( pages/vendors/jquery.magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/jquery.ajaxchimp.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/mail-script.js )
Rails.application.config.assets.precompile += %w( pages/vendors/theme.js )
Rails.application.config.assets.precompile += %w( pages/vendors/nice-select/js/jquery.nice-select.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/isotope/imagesloaded.pkgd.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/isotope/isotope-min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/owl-carousel/owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/counter-up/jquery.waypoints.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/counter-up/jquery.counterup.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( pages/vendors/popper.js )
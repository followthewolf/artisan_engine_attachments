images_app = Dragonfly[ :images ]
images_app.define_macro( ActiveRecord::Base, :image_accessor )

images_app.configure_with :imagemagick
images_app.configure_with :rails
images_app.configure_with :heroku, ArtisanEngine::Attachments.s3_bucket if Rails.env.production?
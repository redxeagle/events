# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")
Events2::Application.initialize!

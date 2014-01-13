# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
WeiboApp::Application.initialize!
require 'will_paginate'
require 'bootstrap-will_paginate'
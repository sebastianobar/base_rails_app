# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Ensure routes are loaded even on jobs handler (needed for Devise in some cases)
Rails.application.reload_routes_unless_loaded
ActiveJob::Base.include RailsPerformanceActiveJob

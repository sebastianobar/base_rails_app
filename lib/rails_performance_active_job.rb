module RailsPerformanceActiveJob
  extend ActiveSupport::Concern

  included do
    around_perform do |job, block|
      RailsPerformance.measure(job.class.name, "Jobs") do
        block.call
      end
    end
  end
end

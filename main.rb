require 'wercker_api'

client      =  WerckerAPI::Client.new(ENV['WERCKER_TRIGGER_PIPELINE_API_TOKEN'])
max_attemps = Integer(ENV.fetch('WERCKER_TRIGGER_PIPELINE_MAX_ATTEMPTS')) rescue nil
delay       = Integer(ENV.fetch('WERCKER_TRIGGER_PIPELINE_DELAY'))        rescue nil
pipeline_id = ENV['WERCKER_TRIGGER_PIPELINE_PIPELINE_ID']

runner = WerckerAPI::PipelineRunner.new(
  client, max_attempts: max_attemps || 180, delay: delay || 5
)

runner.run(pipeline_id)

unless run.status == 'passed'
  STDOUT.puts "Pipeline #{pipeline_id} failed. Aborting build."
  exit 1
end

exit 0

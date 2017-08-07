require 'wercker_api'

client      =  WerckerAPI::Client.new(ENV['WERCKER_TRIGGER_PIPELINE_API_TOKEN'])
max_attemps = Integer(ENV.fetch('WERCKER_TRIGGER_PIPELINE_MAX_ATTEMPTS')) rescue nil
delay       = Integer(ENV.fetch('WERCKER_TRIGGER_PIPELINE_DELAY'))        rescue nil
pipeline_id = ENV['WERCKER_TRIGGER_PIPELINE_PIPELINE_ID']

runner = WerckerAPI::PipelineRunner.new(
  client, max_attempts: max_attemps || 180, delay: delay || 5
)
message = <<-EOM
application: #{ENV.fetch('WERCKER_APPLICATION_NAME')}
git:  #{ENV.fetch('WERCKER_GIT_BRANCH')}:#{ENV.fetch('WERCKER_GIT_COMMIT')}
EOM

options = {
  branch: ENV.fetch('WERCKER_TRIGGER_PIPELINE_BRANCH', 'master'),
  message: message
}
run = runner.run(pipeline_id, options)

unless run.status == 'passed'
  STDOUT.puts "Pipeline #{pipeline_id} failed. Aborting build."
  exit 1
end

exit 0

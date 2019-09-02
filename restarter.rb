require 'aws-sdk-ecs'

unless (ENV.key?("AWS_ACCESS_KEY_ID") && ENV.key?("AWS_SECRET_ACCESS_KEY"))
  raise ArgumentError.new("Please set the aws credentials in env variables.")
end

unless ENV.key?("ECS_CLUSTER")
  raise ArgumentError.new("Please set an ecs cluster.")
end

unless ENV.key?("ECS_SERVICE")
  raise ArgumentError.new("Please set an ecs service.")
end

client = Aws::ECS::Client.new
response = client.update_service({
  cluster: ENV.fetch("ECS_CLUSTER"),
  service: ENV.fetch("ECS_SERVICE"),
  force_new_deployment: true
})
puts response.inspect

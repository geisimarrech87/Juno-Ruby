module Juno
    class Webhook

        attr_reader :token

        def initialize(token)
            @token = token
        end
        

        def base_path
            Juno.environment + "/api-integration/notifications/webhooks"
        end

        def list
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }

            @response = RestClient.get base_path, header
                
        end        
    end
end
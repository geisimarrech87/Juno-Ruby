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
        
        def create_webhook(data)
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }
    
            begin
                @response = RestClient.post base_path, data.to_json, header

            rescue RestClient::ExceptionWithResponse => err
                puts "erro create webhook----#{err.response}"
                err.response
            end  
        end


        def delete_webhook(id)
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }

            begin
                @response = RestClient.delete base_path + "/#{id}", header
            rescue RestClient::ExceptionWithResponse => err
                puts "erro create webhook----#{err.response}"
                err.response
            end  
        end


        def show_webhook(id)
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }
    
            begin
                @response = RestClient.get base_path + "/#{id}", header
            rescue RestClient::ExceptionWithResponse => err
                puts "erro create webhook----#{err.response}"
                err.response
            end  
        end

    end
end
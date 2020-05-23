module Juno
    class Charge
        attr_reader :token

        def initialize(token)
            @token = token
        end
        

        def base_path
            Juno.environment + "/api-integration"
        end

        def payment(data)
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }
          
            begin
                @response = RestClient.post base_path + "/payments", data.to_json, header
                return { :error => false, :response => JSON.parse(@response) }
            rescue RestClient::ExceptionWithResponse => err
                return { :error => true, :detail => JSON.parse(err.response) }
            end        
    
        end

        def create_charge(data)
            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }
            begin
                @response = RestClient.post base_path + "/charges", data.to_json, header 
                return { :error => false, :response => JSON.parse(@response) }
            rescue RestClient::ExceptionWithResponse => err
                return { :error => true, :detail => JSON.parse(err.response) }                
            end                       
        end

        def token_card(card_hash)   
            data = {
                creditCardHash: card_hash
            }

            header = {
                content_type: :json,
                "Authorization" =>  "Bearer #{token}",
                "X-Api-Version" => Juno.api_version,
                "X-Resource-Token" => Juno.resource_token
            }
            begin
                @response = RestClient.post base_path + "/credit-cards/tokenization", data.to_json, header     
                return { :error => false, :response => JSON.parse(@response) }
            rescue RestClient::ExceptionWithResponse => err 
                return { :error => true, :detail => JSON.parse(err.response) }                
            end  
        end
    end    
end
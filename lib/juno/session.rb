module Juno
    class Session

        def initialize
        end
   
        def base_path
            Juno.environment + "/authorization-server/oauth/token"
        end

        def fetch_token
            params = {
                :grant_type => 'client_credentials'
            }
            auth = Authentication.new

            header = {
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": auth.header
            }
            @response = RestClient.post base_path, params, header
            JSON.parse(@response)['access_token']            
        end
        
    end
    
end
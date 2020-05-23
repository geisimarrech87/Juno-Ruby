module Juno
    class Authentication
        def initialize
            @token, @secret = Juno.client_id, Juno.secret_key
        end

        def header
            %(Basic #{Base64.strict_encode64("#{@token}:#{@secret}")})
        end
    end
end
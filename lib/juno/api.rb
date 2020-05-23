module Juno
    class Api
        attr_reader :session

        def initialize
            @session = Session.new
        end

        def webhook
            Juno::Webhook.new(session.fetch_token)
        end

        def charge
            Juno::Charge.new(session.fetch_token)
        end
    end
    
end
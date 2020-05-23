require "rest-client"
require "base64"

require "juno/version"
require "juno/authentication"
require "juno/session"
require "juno/api"
require "juno/webhook"
require "juno/charge"


module Juno

  mattr_accessor :client_id
  mattr_accessor :secret_key
  mattr_accessor :resource_token
  mattr_accessor :api_version
  mattr_accessor :environment

  def self.configure(&block)
    instance_eval(&block)
  end


  private
    def uris
      @uris ||= {
        production: "https://boletobancario.com",
        sandbox: "https://sandbox.boletobancario.com"
      }
    end

  class Error < StandardError; end
  # Your code goes here...
end

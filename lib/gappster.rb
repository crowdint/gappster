require 'gapps_openid'
module Gappster
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def gappster_authentication(domain, more_options={})
      options = {
        :openid_url => "https://www.google.com/accounts/o8/site-xrds?hd=#{domain}",
        :session_var => 'gapps_email',
        :success_path => :root,
        :failure_path => :fail
      }
      options.merge(more_options)

      define_method("authenticate_with_gapps") do
        open_id_authentication(options[:openid_url], options[:success_path], options[:failure_path], options[:session_var])
      end
    end
  end

  module InstanceMethods
    def open_id_authentication(openid_url, gapps_success_path, gapps_failure_path, session_var)
      authenticate_with_open_id(openid_url, :required => ['http://axschema.org/contact/email']) do |result, identity_url, sreg, ax|
        if result.successful?
          session[session_var] = ax['http://axschema.org/contact/email']
          redirect_to gapps_success_path
        else
          redirect_to gapps_failure_path
        end
      end
    end
  end
end

class ActionController::Base
  include Gappster
  include Gappster::InstanceMethods
end
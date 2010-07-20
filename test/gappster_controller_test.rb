require 'test/unit'

require 'rubygems'
# config.gem 'rails', '>=2.3.5'
# 
# require "active_support"
# require "active_record"
require 'rubygems'
require 'active_support'
require 'action_controller'
require 'action_controller/test_case'
require 'action_view'
require 'active_record'
# require "rails"
# require "rails/railtie"

# ENV["RAILS_ENV"] = "test"
# RAILS_ROOT = "anywhere"
# 
require "#{File.dirname(__FILE__)}/../init"
# 
class ApplicationController < ActionController::Base; end
# 
# ActionController::Base.view_paths = File.join(File.dirname(__FILE__), 'views')
# 
# Autocomplete::Routes = ActionDispatch::Routing::RouteSet.new
ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action'
  map.root :controller => :welcome
  map.fail 'fail', :controller => :welcome
end
# 
# ActionController::Base.send :include, Autocomplete::Routes.url_helpers

# class ActiveSupport::TestCase
#   setup do
#     @routes = Autocomplete::Routes
#   end
# end
class WelcomeController < ApplicationController
  def index
    render :text => "Welcome"
  end
end

class GappsterController < ApplicationController
  def index
    render :text => "Welcome"
  end
end

class GappsterControllerTest < ActionController::TestCase
  def setup
    @controller = GappsterController.new
  end

  def teardown
    @controller = nil
  end

  def test_authentication_success
    GappsterController.send(:gappster_authentication, 'crowdint.com')
    GappsterController.send(:before_filter, :authenticate_with_gapps)

    result = mock()
    result.expects(:successful?).returns(true)
    @controller.expects(:authenticate_with_open_id).multiple_yields([result, '', '', {'http://axschema.org/contact/email' => 'some@email.com'}])
    get :index
    assert_equal(session['gapps_email'], 'some@email.com')
    assert_redirected_to :root
  end

  def test_authentication_failure
    GappsterController.send(:gappster_authentication, 'crowdint.com')
    GappsterController.send(:before_filter, :authenticate_with_gapps)

    result = mock()
    result.expects(:successful?).returns(false)
    @controller.expects(:authenticate_with_open_id).multiple_yields([result, '', '', {'http://axschema.org/contact/email' => 'some@email.com'}])
    get :index
    assert_equal(session['gapps_email'], nil)
    assert_redirected_to :fail
  end
end
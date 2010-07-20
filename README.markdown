# Gappster

Quick solution for Rails to authenticate your users with Google Apps' Open Id

## Install the gem

Just install it as a gem

    gem install gappster

### Rails 2.3.8

Include it on your environment.rb

    config.gem 'gappster'

## Install the open_id_authentication plugin

Install crudson's open_id_authentication plugin:

### Rails 2.3.8

    script/install plugin git://github.com/crudson/open_id_authentication.git

## Usage

Just add the following line at the top of the controller where you want to use it, ApplicationController if you want to protect the whole app:

    gappster_authentication 'crowdint.com'

Make sure you replace *crowdint.com* with your own Google Apps domain

Now, you will have a filter available to protect the actions you want behind Google Apps authentication:

    before_filter :authenticate_with_gapps

Like all filters, you can specify specific actions using :only or :except

### Full example

    class ApplicationController < ActionController::Base
      gappster_authentication 'crowdint.com'

      before_filter :authenticate_with_gapps
    end

## TODO

* Tests
* Generators to auto install the required plugin
* Make it work with Rails 3, at this point it might, but I haven't tested it yet
* Include documentation on the needed Google Apps configuration to make it work


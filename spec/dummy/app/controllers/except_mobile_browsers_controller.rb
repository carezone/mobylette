class ExceptMobileBrowsersController < ApplicationController
  respond_to_mobile_requests :except => :ipad
end

require 'spec_helper'

describe ExceptMobileBrowsersController do
  # This controller calls respond_to_mobile_requests with {:except => :ipad}
  # Index action has views for html, and mobile

  render_views

  it "renders an html view for the iPad" do
    force_mobile_request_agent "iPad"
    get :index
    response.body.should contain("HTML VIEW")
  end

  it "renders a mobile view for other mobile devices" do
    force_mobile_request_agent
    get :index
    response.body.should contain("MOBILE VIEW")
  end

end

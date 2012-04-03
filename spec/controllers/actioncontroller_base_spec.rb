require 'spec_helper'

describe ActionController::Base do

  it "ActionController::Base class should respond to the respond_to_mobile_requests" do
    ActionController::Base.respond_to?(:respond_to_mobile_requests).should be_true
  end

  it "should have the add_mobylette_user_agent method" do
    ActionController::Base.should respond_to(:add_mobile_user_agent)
  end

  it "should have the remove_mobylette_user_agent method" do
    ActionController::Base.should respond_to(:remove_mobile_user_agent)
  end

  it "should have the :is_mobile_request? method" do
    ActionController::Base.new.respond_to?(:is_mobile_request?, true).should be_true
  end

  it "should have the :is_mobile_view? method" do
    ActionController::Base.new.respond_to?(:is_mobile_view?, true).should be_true
  end
end

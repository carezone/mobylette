require 'spec_helper'

describe Mobylette::Controllers::RespondToMobileRequests do
  def new_controller(user_agent = 'iPad')
    Class.new(ActionController::Base) do
      include Mobylette::Controllers::RespondToMobileRequests

      define_method :request do
        OpenStruct.new(:user_agent => user_agent, :xhr? => false)
      end

      def params
        {}
      end

      def session
        {}
      end
    end
  end

  let(:controller) { new_controller }

  it "supports a single exception" do
    controller.respond_to_mobile_requests :except => :ipad
    controller.mobylette_options[:except].should == ['ipad']
  end

  it "supports multiple exceptions" do
    controller.respond_to_mobile_requests :except => [:ipad, :android]
    controller.mobylette_options[:except].should == ['ipad', 'android']
  end

  describe "when iPad is excepted" do

    it "remains a mobile request" do
      controller.respond_to_mobile_requests :except => :ipad
      controller.new.send(:is_mobile_request?).should be_true
    end

    it "does not respond as mobile" do
      controller.respond_to_mobile_requests :except => :ipad
      controller.new.send(:respond_as_mobile?).should be_false
    end

  end

  describe "when iPad and Android are excepted" do
    let(:controller) { new_controller('android') }

    context "request is Android" do
      it "remains a mobile request" do
        controller.respond_to_mobile_requests :except => [:ipad, :android]
        controller.new.send(:is_mobile_request?).should be_true
      end

      it "does not respond as mobile" do
        controller.respond_to_mobile_requests :except => [:ipad, :android]
        controller.new.send(:respond_as_mobile?).should be_false
      end
    end
  end
end

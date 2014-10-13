require_relative '../test_helper'

class ExperimentsControllerTest < ActionController::TestCase


  include Devise::TestHelpers

  test "should authenticate admin" do
  	sign_in_admin
  end

end
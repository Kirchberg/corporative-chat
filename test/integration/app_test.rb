require 'test_helper'

class AppTest < ActionDispatch::IntegrationTest
  test 'Before Authorization, no access to calc' do
    get '/chatrooms'
    assert_redirected_to 'users/sign_in'
  end
end

# frozen_string_literal: true

require 'test_helper'

# rtfc.
class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get home_index_url, params: {}
    assert_response :success
  end
end

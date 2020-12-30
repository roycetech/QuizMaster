# frozen_string_literal: true

require 'test_helper'

# Test
class QuizModeControllerTest < ActionDispatch::IntegrationTest
  test 'should get start_quiz' do
    get quiz_mode_start_quiz_url, params: {}
    assert_response :success
  end
end

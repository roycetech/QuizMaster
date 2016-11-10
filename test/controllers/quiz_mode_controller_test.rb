require 'test_helper'

class QuizModeControllerTest < ActionDispatch::IntegrationTest
  test "should get start_quiz" do
    get quiz_mode_start_quiz_url
    assert_response :success
  end

end

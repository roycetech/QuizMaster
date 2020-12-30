# frozen_string_literal: true

require 'test_helper'

# rtfc
class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test 'should get index' do
    get questions_url, params: {}
    assert_response :success
  end

  test 'should get new' do
    get new_question_url, params: {}
    assert_response :success
  end

  test 'should create question' do
    assert_difference('Question.count') do
      post questions_url, params: {
        question: { answer: @question.answer, content: @question.content }
      }
    end

    assert_redirected_to questions_url
  end

  test 'should show question' do
    get question_url(@question), params: {}
    assert_response :success
  end

  test 'should get edit' do
    get edit_question_url(@question), params: {}
    assert_response :success
  end

  test 'should update question' do
    patch question_url(@question), params: {
      question: { answer: @question.answer, content: @question.content }
    }
    assert_redirected_to questions_url
  end

  test 'should destroy question' do
    assert_difference('Question.count', -1) do
      delete question_url(@question), params: {}
    end

    assert_redirected_to questions_url
  end
end

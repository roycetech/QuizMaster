# frozen_string_literal: true

FactoryGirl.define do
  factory :question do |f|
    f.content 'How are you?'
    f.answer 'Great'
  end
end

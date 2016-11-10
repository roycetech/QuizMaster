# QuizMaster
Master of the Quizzes!


# Overview:
This is a simple demo app written in Ruby using Rails, Twitter Bootstrap.


# Requirements

1. CRUD for Questions
2. Formatting for questions
3. Allow numeric answer to question can be word or numeric.
4. Quiz mode.
5. RSpec testing


# Design Considerations

- Allowing users to enter HTML is nice but it can be tricky to secure the page against malicious HTML codes.  Because of that, I will only allow `<br>` html tag, and I will implement a subset of markdown to allow some basic formatting like bold, italic, and code.


# Models

1. Question.
    - ID(system)
    - contents: string
    - answer: string

2. Pages
    Maintenance - Add or Edit questions

    Quiz Mode - Randomly present the questions

        - Present the score in the end.
        - Ability to restart the question


# Build Steps

1. Clone project form github
2. Run `brew install libxml2`.  (This is to solve issue when generating a new rails app.)
3. Optionally run `bundle install` inside the project in case of error.
4. generate rails using CLI
5. Configure live-reload see changes in view as you edit.


# References:
[http://guides.rubyonrails.org/getting_started.html](rails guide)


# Issues:
Nokogiri throwing an error on `$ rails new`.


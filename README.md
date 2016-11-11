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
- Scrap this markdown feature for future enhancements.  Time constraint.


# Models

1. Question.
    - ID(system)
    - contents: string
    - answer: string

2. Pages
    Maintenance - Add or Edit questions

    Quiz Mode - Present the questions to be answered by the user.

        - Present the score in the end.
        - Ability to restart the question


# Build Steps

1. Clone project form github
2. Run `brew install libxml2`.  (This is to solve issue when generating a new rails app.)
3. Optionally run `bundle install` inside the project in case of error.
4. generate rails using CLI
5. Configure live-reload see changes in view as you edit.
6. Set the root to `home/view`
7. Scaffold the question
8. Customize the views
9. Run `rails generate rspec:install`
10. Develop the non-model quiz mode


# References:
[http://guides.rubyonrails.org/getting_started.html](rails guide)


# Issues:

Nokogiri throwing an error on `$ rails new`.
Scaffolding causes some unwanted styles, comment them out.
rails command hangs, issue `stop spring` to resolve.


# How to Test:

1. Run db migrations.
2. Run `rspec` at the root of the project.


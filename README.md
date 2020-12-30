# QuizMaster

Master of the Quizzes!

# Overview

This is a simple demo app written in Ruby using Rails, Twitter Bootstrap.

# Starting Up

Run `rails s`, then visit `http://localhost:3000/home/index`

# Development

## Requirements

1. CRUD for Questions
2. Formatting for questions
3. Allow numeric answer to question can be word or numeric.
4. Quiz mode.
5. RSpec testing

## Design Considerations

- Allowing users to enter HTML is nice but it can be tricky to secure the page 
 against malicious HTML codes.  Because of that, I will only allow `<br>` html tag, and I will implement a subset of markdown to allow some basic formatting like bold, italic, and code.
- Scrap this markdown feature for future enhancements.  Time constraint.

## Models?

1. Question.
    - ID(system)
    - contents: text
    - answer: string

2. Pages

  1. Maintenance - Add, Edit, View, Delete questions.

  2. Quiz Mode - Present the questions to be answered by the user.

    - Present the score in the end.
    - Ability to restart the question


## Build Steps

1. Clone project form github
2. Run `brew install libxml2`.  (This is to solve issue when generating a new rails app.)
3. Run `bundle install` inside the project each time the `Gemfile` is modified to fetch new dependencies
4. Generate rails using CLI
5. Configure live-reload to see changes in the view as you edit.
6. Set the root to `home/index`
7. Scaffold the question
8. Develop the app
9. Run `rails generate rspec:install`
10. Develop the non-model quiz mode

## Issues:

Nokogiri throwing an error on `$ rails new`.
Scaffolding causes some unwanted styles, comment them out.
rails command hangs, issue `stop spring` to resolve.
Deprecation warnings on testing.


## Testing Notes:

CRUD used the generated template with minor tweaks.  These include removing the show functionality for individual records. Changed redirect destination to the list page.  These changes are also reflected in the unit tests (not rspec).

## How to Test:

1. Run `rspec`

1. Run db migrations with: `TODO:`
2. Run `rspec` at the root of the project.
3. `$ rake test` to run unittest.

## Take aways

FactoryGirl gem should be attached early so it will be considered in the code generation.


## References

[http://guides.rubyonrails.org/getting_started.html](rails guide)

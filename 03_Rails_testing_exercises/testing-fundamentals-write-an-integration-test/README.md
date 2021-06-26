# Rails Testing Exercises / Testing Fundamentals Write An Integration Test

Hey there! We're [thoughtbot](https://thoughtbot.com), a design and
development consultancy that brings your digital product ideas to life.
We also love to share what we learn.

This coding exercise comes from [Upcase](https://thoughtbot.com/upcase),
the online learning platform we run. It's part of the
[Rails Testing Exercises](https://thoughtbot.com/upcase/rails-testing-exercises) course and is just one small sample of all
the great material available on Upcase, so be sure to visit and check out the rest.

## Exercise Intro

Writing tests for classes and models is useful, but eventually you'll want to make sure that all of your classes, views, and configuration are working together correctly. To do this, you'll write an integration test, which focuses on objects working together. These tests are very useful for catching bugs.

In this example, we'll be using Capybara to write an integration test. Capybara allows you to simulate user actions on your site, such as visiting URLs and clicking on links, so that you can go through features the way a user would and verify that the outcome is correct.

This exercise contains a model, controllers, and views which allow users to add and view people. You'll use Capybara to write an integration test which verifies that a user can add a person using the form.

Here are some examples of methods which you may want to use:

``` ruby
# Visit a page
visit root_url

# Fill in a text field
fill_in "Email", with: "user@example.com"

# Click on a link
click_link "About"

# Click on a button
click_button "Save"

# Check for text on the page
expect(page).to have_content("Thank you")
```

You can find more examples of using Capybara in the [documentation](http://rubydoc.info/github/jnicklas/capybara).

## Instructions

To start, you'll want to clone and run the setup script for the repo

    git clone git@github.com:thoughtbot-upcase-exercises/testing-fundamentals-write-an-integration-test.git
    cd testing-fundamentals-write-an-integration-test
    bin/setup

1. Edit `spec/features/user_creates_person_spec.rb`.
2. Use Capybara to create a new person.
3. Make sure your tests are passing by running `rake`.

## Featured Solution

Check out the [featured solution branch](https://github.com/thoughtbot-upcase-exercises/testing-fundamentals-write-an-integration-test/compare/featured-solution#toc) to
see the approach we recommend for this exercise.

## Forum Discussion

If you find yourself stuck, be sure to check out the associated
[Upcase Forum discussion](https://forum.upcase.com/t/testing-fundamentals-write-an-integration-test/4568)
for this exercise to see what other folks have said.

## Next Steps

When you've finished the exercise, head on back to the
[Rails Testing Exercises](https://thoughtbot.com/upcase/rails-testing-exercises) course to find the next exercise,
or explore any of the other great content on
[Upcase](https://thoughtbot.com/upcase).

## License

testing-fundamentals-write-an-integration-test is Copyright © 2015-2018 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[LICENSE](/LICENSE.md) file.

## Credits

![thoughtbot](https://presskit.thoughtbot.com/assets/images/logo.svg)

This exercise is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for Upcase and thoughtbot are registered trademarks of
thoughtbot, inc.

# Coding Test

## Introduction

Use you favorite web browser to navigate to the localhost link printed in the terminal.

This Rails App parses the assigned PDFs into the given xlsx spreadsheet. 
It utilizes the [pdf-reader](https://rubygems.org/gems/pdf-reader/versions/1.4.0) Gem to pull the text data from the PDF. 
The [RubyXL](https://rubygems.org/gems/rubyXL/versions/3.3.21) Gem is used to populate the datafields on the blank xlsx file 
with the required data. 

There is one route for the app. The '/'. I have taken two similiar approaches 
to converting the PDF files. 

1. The first is to upload and convert without saving the PDFs. This mimicks converter 
tools that you will find online, and is the most reusable approach. 

2. The second way is to download the PDFs into the database. A user will then be able to 
download all of the info from the PDF on to the xlsx spreadsheet. This feature would be for 
a company's proprietry use, as it could be expanded to being able to search the saved plans
straight from the app. You would be able to select which plans/PDFs to parse into an xlsx 
spreadsheet. 

## Prerequisites

You must be running `Ruby 2.6.1` and `Rails 6.0.3.2` . One way to accomplish this is to use [Ruby Version Manger(rvm)](https://rvm.io/rvm/install).

    rvm install "ruby-2.6.1"
    rvm use 2.6.1
    gem install rails -v 6.0.3.2


## Installation 

Fork and clone the repository using your preferred method. 

Then load all of the dependencies...

    $ bundle install 

Create a development database 

    $ rake db:create 

    $ rake db:migrate 

Start local server 

    $ rails server





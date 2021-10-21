# dictionary_app

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

### Description

This exercise is going to process the dictionary (dictionary.txt). The goal is to find all six-letter words that are built of two concatenated smaller words. For example:

 ```sh
 con + vex => convex
 tail + or => tailor
 we + aver => weaver
```
Write the program twice:
The first time, make the code as readable as possible.
The second time, make the program run as fast as possible.

Write a single test suite that will test both algorithms. You can have additional tests for each algorithm if you deem it necessary.

You can ask questions or make assumptions on how the program should work. If you make assumptions, be sure to tell us what they are.

### Tech

Dillinger uses a number of open source projects to work properly:

* [Ruby 3.0.2]
* [RSpec] - Rspec tests
* [Rubocop] - Ruby static code analyzer

### Installation

```sh
$ cd dictionary_app
$ bundle install
```

### Tests

```sh
$ cd dictionary_app
$ rspec spec
```

### Running first script
```sh
$ ruby monads_runner.rb
```

### Running second script
```sh
$ ruby lib/script_matcher.rb
```

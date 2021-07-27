# Game of Life

A Game of Life implementation in Ruby. It consists of the following classes:

* `Game` — Represents a game that evolves at a given interval.
* `World` — Represents an evolving world with retrieval of beings.
* `Being` — Represents a sentient being with state.
* `Life` — Represents life at a given coordinate within a world.
* `Renderer` — Represents the rendering of a grid using ascii.

## Install

The application uses Ruby 3.0, and dependencies can be install by running:

```shell
bundle install
```

## Tests

100% test coverage, measured with SimpleCov:

```shell
rake test
```

Note that coverage output will be available in a `coverage` folder after running the tests.

## Usage

There is a sample shell script which can be run with:

```shell
./script/run
```

## Quality

Code meets RuboCop's default recommendations, including all new cops.

```shell
rubocop
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

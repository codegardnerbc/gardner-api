# Code Gardner

[![Build Status](https://travis-ci.org/codegardnerbc/gardner-api.svg?branch=master)](https://travis-ci.org/codegardnerbc/gardner-api)
[![codecov](https://codecov.io/gh/codegardnerbc/gardner-api/branch/master/graph/badge.svg)](https://codecov.io/gh/codegardnerbc/gardner-api)
[![lines of code](https://tokei.rs/b1/github/codegardnerbc/gardner-api)](https://github.com/codegardnerbc/gardner-api)
[![license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/codegardnerbc/gardner-api/blob/master/LICENSE)

## Overview

The rust-based API behind the Code Gardner teaching/training platform in-use for the Code Gardner Bootcamp.

## Features

- Video/Audio Conferencing via WebRTC
- Dynamic Chat Integration
- Video/Audio Recording to S3
- Coding Room Breakouts
- Coding Exercise Delivery Platform
- Teacher Commenting and Gallery View

## Require

- [Rust Stable](https://rustup.rs)
- [Postgres](https://www.postgresql.org/)

Or using [Docker](https://www.docker.com/)

## Development Setup

Install a few external dependencies and make sure `~/.cargo/bin` is in your `$PATH`:

    cargo install diesel_cli
    cargo install cargo-watch

Optionally if you want line coverage from your tests, install cargo-tarpaulin:

    cargo-tarpaulin

Copy `.env.example` to `.env` and update your application environment in this file.

Make sure you have a working local postgres setup. Your current user should be
admin in your development postgres installation and it should use the "peer" or
"trust" auth methods (see `pg_hba.conf`).

Now you can launch the `watch.sh` script which helps you quickly iterate. It
will remove and recreate the DB and run the migrations and then the tests on
all code changes.

    ./watch.sh

To get line coverage, do

    cargo tarpaulin --ignore-tests

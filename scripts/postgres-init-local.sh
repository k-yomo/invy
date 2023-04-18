#!/bin/bash -eu

psql -U postgres -c 'CREATE DATABASE invy_test'
psql -U postgres -d invy_test -c  'CREATE EXTENSION postgis'
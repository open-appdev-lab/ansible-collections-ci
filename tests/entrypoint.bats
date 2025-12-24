#!/usr/bin/env bats

@test "script fails if no arguments provided" {
  run ./entrypoint.sh
  [ "$status" -eq 1 ]
}

@test "script returns hello world" {
  run ./entrypoint.sh "World"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Hello, World!"* ]]
}
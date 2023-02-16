#!/usr/bin/env bats

# Load the calculator script
load calculator.bash

# Optional setup function to prepare the test environment
setup() {
  # Create a temporary file to store the output
  OUTPUT_FILE=$(mktemp)
}

# Optional teardown function to clean up the test environment
teardown() {
  # Remove the temporary file
  rm "$OUTPUT_FILE"
}

# Test case 1: add two numbers
@test "addition using bc" {
  # Run the calculator script with the add command and two arguments
  run bash calculator.bash add 1 2
  # Assert that the exit status is 0 (success)
  [ "$status" -eq 0 ]
  # Assert that the output is 3
  [ "$output" = "3" ]
}

# Test case 2: subtract two numbers
@test "subtraction using bc" {
  # Run the calculator script with the subtract command and two arguments
  run bash calculator.bash subtract 4 1
  # Assert that the exit status is 0 (success)
  [ "$status" -eq 0 ]
  # Assert that the output is 3
  [ "$output" = "3" ]
}

# Test case 3: multiply two numbers
@test "multiplication using bc" {
  # Run the calculator script with the multiply command and two arguments
  run bash calculator.bash multiply 2 3
  # Assert that the exit status is 0 (success)
  [ "$status" -eq 0 ]
  # Assert that the output is 6
  [ "$output" = "6" ]
}

# Test case 4: divide two numbers
@test "division using bc" {
  # Run the calculator script with the divide command and two arguments
  run bash calculator.bash divide 6 2
  # Assert that the exit status is 0 (success)
  [ "$status" -eq 0 ]
  # Assert that the output is 3
  [ "$output" = "3" ]
}

# Test case 5: divide by zero
@test "division by zero" {
  # Run the calculator script with the divide command and zero as the second argument
  run bash calculator.bash divide 6 0
  # Assert that the exit status is 1 (failure)
  [ "$status" -eq 1 ]
  # Assert that the output contains an error message
  [[ "$output" == *"Division by zero"* ]]
}

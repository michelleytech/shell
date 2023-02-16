#!/bin/bash

# Read the first number
echo -n "Enter the first number: "
read num1

# Read the second number
echo -n "Enter the second number: "
read num2

# Read the choice of operation
echo "Enter Choice: "
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read choice

# Perform the calculation using bc and store the result
case $choice in
  1) result=$(echo "$num1 + $num2" | bc) ;;
  2) result=$(echo "$num1 - $num2" | bc) ;;
  3) result=$(echo "$num1 * $num2" | bc) ;;
  4) result=$(echo "scale=2; $num1 / $num2" | bc) ;;
  *) echo "Invalid choice" ;;
esac

# Print the result
echo "The result is: $result"
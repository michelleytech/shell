#!/bin/env bash

# multi-line comment
: '
Shell Best Practices
Use functions to organize your code and avoid repetition.
Document your functions with comments and usage examples.
Use shift to read function arguments and avoid hard-coding them.
Declare your variables with local, readonly, or export keywords depending on their scope and purpose.
Quote all parameter expansions to prevent word splitting and globbing.
Use arrays where appropriate to store multiple values and iterate over them.
Use “$@” to refer to all arguments passed to a script or a function.
Use uppercase variable names for environment variables only and lowercase or mixed case for other variables.
Use set -e, set -u, and set -o pipefail to make your script exit on error, undefined variable, or failed pipeline, respectively.
Use [[ ]] instead of [ ] for conditional expressions, as it is more robust and supports more features.
Use (( )) instead of [ ] for arithmetic expressions, as it is more intuitive and supports more operators.
Use shellcheck to check your script for syntax errors and common pitfalls.
Use version control to track your script changes and collaborate with others.
Use a shebang line at the beginning of your script to indicate the interpreter to use, such as #!/bin/bash.
Use indentation and whitespace to make your code more readable and consistent.
Use meaningful and descriptive variable and function names.
Use echo or printf to print messages to the standard output or standard error streams.
Use read to get user input from the standard input stream.
Use test or [ ] to check file attributes, such as existence, size, or permissions.
Use case or if to handle different options or conditions in your script.
Use for, while, or until to create loops in your script.
Use exit to terminate your script with a status code indicating success or failure.
Use trap to execute some code before the script exits, such as cleaning up temporary files or sending a notification.
'



# import utils.sh
. ./utils.sh

# enable logging
enable_logging

# build the project
build_project

# run the tests
run_tests

# deploy the project
deploy_project

# disable logging
disable_logging

# print "Done!"
print_done

# A function that prints a greeting message
# Usage: greet name
greet() {
  local name="$1" # Declare a local variable and assign the first argument
  echo "Hello, $name!" # Quote the parameter expansion
}

# A function that parses flags and options using getopts
# Usage: parse_args [-a] [-b value] [-c value] args
parse_args() {
  local aflag bflag cflag
  local bvalue cvalue
  while getopts "ab:c:" opt; do # Loop over the options
    case "$opt" in
      a) aflag=1 ;; # Set a flag if -a is present
      b) bflag=1; bvalue="$OPTARG" ;; # Set a flag and a value if -b is present
      c) cflag=1; cvalue="$OPTARG" ;; # Set a flag and a value if -c is present
      ?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;; # Handle invalid options
    esac
  done
  shift "$((OPTIND-1))" # Shift the arguments to the left
  echo "aflag: $aflag, bflag: $bflag, cflag: $cflag"
  echo "bvalue: $bvalue, cvalue: $cvalue"
  echo "Remaining arguments: $@" # Print the remaining arguments
}

# A function that reads input into an array and prints it
# Usage: read_input
read_input() {
  local input # Declare a local variable
  readarray -t input # Read input into an array
  printf "%s\n" "${input[@]}" # Print the array elements
}

# A function that prints the version and help messages
# Usage: print_info [-v] [-h]
print_info() {
  local version="1.0" # Declare a local variable
  local usage="Usage: print_info [-v] [-h]" # Declare a local variable
  local help="Options:
  -v  Print the version
  -h  Print this help message" # Declare a local variable
  case "$1" in
    -v) echo "Version: $version" ;; # Print the version if -v is present
    -h) echo "$usage"; echo "$help" ;; # Print the usage and help if -h is present
    *) echo "$usage" >&2; exit 1 ;; # Print the usage and exit if no option is present
  esac
}

# main
greet "World"

parse_args -a -b foo -c bar baz

read_input

print_info -v
print_info -h
print_info

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
} 

# send a notification
# send a message to the syslog
logger "Hello, World!"

# send a message to the syslog with a custom tag
logger -t "mytag" "Hello, World!"

# send a message to the syslog with a custom tag and priority
logger -t "mytag" -p local0.info "Hello, World!"

# send a message to the syslog with a custom tag, priority, and facility
logger -t "mytag" -p local0.info -f /var/log/mylog "Hello, World!"

# send a message to the syslog with a custom tag, priority, facility, and timestamp
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" "Hello, World!"

# send a message to the syslog with a custom tag, priority, facility, timestamp, and hostname
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, and process ID
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, process ID, and user ID
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i -u 1000

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, process ID, user ID, and session ID
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i -u 1000 -s

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, process ID, user ID, session ID, and message ID
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i -u 1000 -s -i 1000

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, process ID, user ID, session ID, message ID, and structured data
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i -u 1000 -s -i 1000 -d "example@0;example=1"

# send a message to the syslog with a custom tag, priority, facility, timestamp, hostname, process ID, user ID, session ID, message ID, structured data, and message
logger -t "mytag" -p local0.info -f /var/log/mylog -T "2018-01-01 00:00:00" -n -i -u 1000 -s -i 1000 -d "example@0;example=1" "Hello, World!"

exit 0

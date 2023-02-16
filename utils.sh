enable_logging() {
    # enable logging
    set -x
}

disable_logging() {
    # disable logging
    set +x
}

print_done() {
    # print "Done!"
    echo "Done!"
}

build_project() {
    # build the project
    echo "Building the project..."
}

run_tests() {
    # run the tests
    echo "Running the tests..."
}

deploy_project() {
    # deploy the project
    echo "Deploying the project..."
}


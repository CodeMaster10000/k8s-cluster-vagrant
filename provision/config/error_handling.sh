#!/bin/bash
source /vagrant/environment.properties

handle_error() {

    echo -e "${RED}${COMPONENT} provisioning failed${NC}"

}

trap 'handle_error' ERR
set +e
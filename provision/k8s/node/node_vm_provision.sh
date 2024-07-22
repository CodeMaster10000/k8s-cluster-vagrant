#!/bin/bash
source /vagrant/environment.properties

echo -e "${BLUE}K8S Node ${NODE_INDEX} VM provisioning ${YELLOW}START${BLUE}${NC}"

K8S_COMMON_COMPONENT="K8S Common Configuration"
K8S_NODE_COMPONENT="K8S Worker Node $NODE_INDEX"

sudo bash /vagrant/provision/k8s/common/common.sh "${DNS_SERVERS}" "${KUBERNETES_VERSION}" "${CRIO_VERSION}" "${OS}" "${ENVIRONMENT}" "${K8S_COMMON_COMPONENT}"
sudo bash /vagrant/provision/k8s/node/node.sh "K8S Worker Node $K8S_NODE_COMPONENT"

echo -e "${BLUE}K8S Node ${NODE_INDEX} VM provisioning ${GREEN}DONE${BLUE}${NC}"
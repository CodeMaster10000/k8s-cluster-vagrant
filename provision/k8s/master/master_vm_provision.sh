#!/bin/bash
source /vagrant/environment.properties

echo -e "${BLUE}K8S Master VM provisioning ${YELLOW}START${BLUE}${NC}"

K8S_COMMON_COMPONENT="K8S Common Configuration"
K8S_MASTER_COMPONENT="K8S Master Node"

sudo bash /vagrant/provision/k8s/common/common.sh "${DNS_SERVERS}" "${KUBERNETES_VERSION}" "${CRIO_VERSION}" "${OS}" "${ENVIRONMENT}" "${K8S_COMMON_COMPONENT}"
sudo bash /vagrant/provision/k8s/master/master.sh "${CONTROL_IP}" "${POD_CIDR}" "${SERVICE_CIDR}" "${K8S_MASTER_COMPONENT}"

echo -e "${BLUE}K8S Master VM provisioning ${GREEN}DONE${BLUE}${NC}"
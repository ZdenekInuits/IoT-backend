## Basic example of kickstarting data and monitoring backend for IoT projects

  1. Terraform with DigitalOcean provider  
    - Note: Missing var-file: api_token = "xxx"  
    - terraform init (just once per project)  
    - terraform apply -var-file="digitalocean.tfvars"  
    - terraform destroy -var-file="digitalocean.tfvars"  

  2. Ansible swarm bootstrap  
    - ansible.cfg  
    - ansible.inventory  
    - ansible-playbook setup-swarm-cluster.yaml  

  3. Ansible monitoring stack deploy  
    - ansible-playbook ansible-configure-swarm-stacks.yaml  

  4. import dashboard 7587 from https://grafana.com/grafana/dashboards/  
    - check other grafana functionality  

  5. insert dummy data with script and [curl](https://github.com/prometheus/pushgateway/blob/master/README.md)  
    - basic bash script to input sensor like data  
    - ` echo "mymetric $(( $RANDOM % 35 + 10 ))" | curl --data-binary @- http://164.90.165.207:8084/metrics/job/my-temperature `

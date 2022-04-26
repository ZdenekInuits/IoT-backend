## Basic example of kickstarting data and monitoring backend for IoT projects

  1. Terraform with DigitalOcean provider
    terraform init
    terraform apply -var-file="digitalocean.tfvars"
  2. Ansible swarm bootstrap
    ansible-playbook -i docker.inventory setup-swarm-cluster.yaml
  3. Ansible monitoring bootstrap
  4. import dashboard 7587 from https://grafana.com/grafana/dashboards/
  5. create push data graph
  6. insert dummy data with script and [curl](https://github.com/prometheus/pushgateway/blob/master/README.md)
    

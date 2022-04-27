## Basic example of kickstarting data and monitoring backend for IoT projects

  1. Terraform with DigitalOcean provider  
    **serving as orchestrator for infrastructure part via API**  
    - Config files:  
        digitalocean.tf : main configuration file with infrastructure specifications  
        outputs.tf : serves as template for output information about results  
        digitalocean.tfvars : contain api_key  
            Note: Missing from repo: `api_token = "xxx"`  
        terraform-droplet.yaml : cloud init script for postinstall tasks  
    - workflow with terraform  
        terraform init (just once per project)  
        terraform apply -var-file="digitalocean.tfvars"  
        terraform destroy -var-file="digitalocean.tfvars"  
    - [link to digital ocean provider docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/droplet)

  2. Ansible swarm bootstrap  
    **serving as configuration management automation**  
    - Config files:  
        ansible.cfg : main configuration file with run defaults  
        ansible-droplet.inventory : inventory file with VM IPs and host variables  
        ansible-setup-swarm-cluster.yaml : simple playbook to kickstart Docker Swarm cluster  
        ansible-configure-swarm-stacks.yaml : playbook to deploy desired service containers  
    - workflow with ansible  
        ansible-playbook ansible-setup-swarm-cluster.yaml  

  3. Ansible monitoring stack deploy  
    - ansible-playbook ansible-configure-swarm-stacks.yaml  

  4. import dashboard 7587 from https://grafana.com/grafana/dashboards/  
    - check other grafana functionality  

  5. insert dummy data with script and [curl](https://github.com/prometheus/pushgateway/blob/master/README.md)  
    - basic bash script to input sensor like data  
    - ` echo "mymetric $(( $RANDOM % 35 + 10 ))" | curl --data-binary @- http://164.90.165.207:8084/metrics/job/my-temperature `

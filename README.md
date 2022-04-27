## Basic example of kickstarting data and monitoring backend for IoT projects

  1. Terraform with DigitalOcean provider  
    **serving as orchestrator for infrastructure part via API**  
    - config files:  
        ```
        digitalocean.tf : main configuration file with infrastructure specifications  
        outputs.tf : serves as template for output information about results  
        digitalocean.tfvars : contain api_key  
            Note: Missing from repo: `api_token = "xxx"`  
        terraform-droplet.yaml : cloud init script for postinstall tasks  
        ```
    - workflow with terraform  
        ```
        terraform init (just once per project)  
        terraform apply -var-file="digitalocean.tfvars"  
        terraform destroy -var-file="digitalocean.tfvars"  
        ```
    - [link to digital ocean provider docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/droplet)

  2. Ansible swarm bootstrap  
    **serving as configuration management automation**  
    - config files:  
        ```
        ansible.cfg : main configuration file with run defaults  
        ansible-droplet.inventory : inventory file with VM IPs and host variables  
        ansible-setup-swarm-cluster.yaml : simple playbook to kickstart Docker Swarm cluster  
        ansible-configure-swarm-stacks.yaml : playbook to deploy desired service containers  
        ```
    - workflow with ansible  
        ```
        ansible-playbook ansible-setup-swarm-cluster.yaml  
        ```

  3. Ansible monitoring stack deploy  
    - ansible-playbook ansible-configure-swarm-stacks.yaml  
    - takes care of following service containers deploy  
        ```
        prometheus : time series DB  
        alertmanager : router for prometheus alerts  
        pushgateway : push allowing gateway for pull prometheus ecosystem  
        node-exporter : gathering metrics about underlying linux system  
        balckbox-exporter : gathering information about provided http / https targets  
        grafana : multi-data-source vizualization tool  
        example-app : simple go app allowing to open http://<IP>:8080 and http://<IP>:8080/err  
        ```

  4. [import dashboard 7587](https://grafana.com/grafana/dashboards/)  
    - check other grafana functionality  
    - graphs creation or import  

  5. insert dummy data with script and [curl](https://github.com/prometheus/pushgateway/blob/master/README.md)  
    - basic bash script to input sensor like data  `create_data_samples.sh`
    - `echo "mymetric $(( $RANDOM % 35 + 10 ))" | curl --data-binary @- http://164.90.165.207:8084/metrics/job/my-temperature`  

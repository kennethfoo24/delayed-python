# delayed-python

- After deploying the avengers-delayed-python deployment, expose it as a load balancer.

kubectl expose deployment avengers-delayed-python --name avengers-delayed-python-lb  --type LoadBalancer --port 80 --target-port 5500

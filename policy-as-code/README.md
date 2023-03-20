Policy as Code example:

Dependencies:
```
pip install -r requirements.txt
```

Some rules:
- The resource should have the namespace argument, and its value should be anything except default to avoid running the resource in the default namespace.
- The resource should have the app.kubernetes.io/env label, and its value should be development or production to pass this policy rule.
- The resource should have at least 2 replicas. Due to the use of the ignore_errors argument, it's an optional rule and can be ignored by the engine.
- The resource should have the image argument with a specific Nginx version and cannot use the latest tag of the docker image


Run test:
```
./test.sh
```

[![wercker status](https://app.wercker.com/status/d7e68964e2ff75fc3d36a0ffcc2b9fd4/m "wercker status")](https://app.wercker.com/project/bykey/d7e68964e2ff75fc3d36a0ffcc2b9fd4)

```yaml
build:
    steps:
      - stupidcodefactory/trigger-pipeline:
          - pipeline-id: 595a6b1b24ac030100da5307
          - api-token: $MY_API_TOKEN
          - max-attemps: 2
          - delay: 1
          - branch: staging
```

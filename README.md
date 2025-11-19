# Example Provider

![Build](https://github.com/pactflow/example-provider-python/workflows/Build/badge.svg)

[![Can I deploy Status](https://test.pactflow.io/pacticipants/pactflow-example-provider-python/branches/master/latest-version/can-i-deploy/to-environment/production/badge.svg)](https://test.pactflow.io/overview/provider/pactflow-example-consumer-python/consumer/pactflow-example-consumer-python)

[![Pact Status](https://test.pactflow.io/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest/badge.svg)](https://test.pactflow.io/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest) (latest pact)

[![Pact Status](https://test.pactflow.io/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest/master/badge.svg)](https://test.pactflow.io/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest/master) (master/master pact) 

This is an example of a Python FastAPI provider that uses Pact, [PactFlow](https://pactflow.io) and GitHub Actions to ensure that it is compatible with the expectations its consumers have of it.

The project uses a Makefile to simulate a very simple build pipeline with two stages - test and deploy.

It is using a public tenant on PactFlow, which you can access [here](https://test.pactflow.io) using the credentials `dXfltyFMgNOFZAxr8io9wJ37iUpY42M`/`O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1`. The latest version of the Example Consumer/Example Provider pact is published [here](https://test.pactflow.io/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest).

## Pact verifications

When using Pact in a CI/CD pipeline, there are two reasons for a pact verification task to take place:

   * When the provider changes (to make sure it does not break any existing consumer expectations)
   * When a pact changes (to see if the provider is compatible with the new expectations)

When the provider changes, the pact verification task runs as part the provider's normal build pipeline, generally after the unit tests, and before any deployment takes place. This pact verification task is configured to dynamically fetch all the relevant pacts for the specified provider from PactFlow, verify them, and publish the results back to PactFlow.

To ensure that a verification is also run whenever a pact changes, we create a webhook in PactFlow that triggers a provider build, and passes in the URL of the changed pact. Ideally, this would be a completely separate build from your normal provider pipeline, and it should just verify the changed pact.

Because GitHub Actions only allows us to have one build configuration per repository, we switch between the main pipeline mode and the webhook-triggered mode based on the presence of an environment variable that is only set via the webhook. Keep in mind that this is just a constraint of the tools we're using for this example, and is not necessarily the way you would implement Pact your own pipeline.

## Usage

See the [PactFlow CI/CD Workshop](https://github.com/pactflow/ci-cd-workshop) for background.

To run the tests locally, run:

```
make test
```

To run the "fake ci" task:
```
export PACT_BROKER_BASE_URL="https://test.pactflow.io"
export PACT_BROKER_TOKEN="129cCdfCWhMzcC9pFwb4bw"
make fake_ci
```
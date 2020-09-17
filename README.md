# Example Provider

[![Build Status](https://travis-ci.com/pactflow/example-provider-python.svg?branch=master)](https://travis-ci.com/pactflow/example-provider-python)

[![Pact Status](https://test.pact.dius.com.au/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python-python/latest/badge.svg?label=provider)](https://test.pact.dius.com.au/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python-python/latest) (latest pact)

[![Pact Status](https://test.pact.dius.com.au/matrix/provider/pactflow-example-provider-python/latest/prod/consumer/consumer-python-example-provider-python/latest/prod/badge.svg?label=provider)](https://test.pact.dius.com.au/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python-python/latest/prod) (prod/prod pact)

This is an example of a Python FastAPI provider that uses Pact, [Pactflow](https://pactflow.io) and Travis CI to ensure that it is compatible with the expectations its consumers have of it.

The project uses a Makefile to simulate a very simple build pipeline with two stages - test and deploy.

It is using a public tenant on Pactflow, which you can access [here](https://test.pact.dius.com.au) using the credentials `dXfltyFMgNOFZAxr8io9wJ37iUpY42M`/`O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1`. The latest version of the Example Consumer/Example Provider pact is published [here](https://test.pact.dius.com.au/pacts/provider/pactflow-example-provider-python/consumer/pactflow-example-consumer-python/latest).

## Pact verifications

When using Pact in a CI/CD pipeline, there are two reasons for a pact verification task to take place:

   * When the provider changes (to make sure it does not break any existing consumer expectations)
   * When a pact changes (to see if the provider is compatible with the new expectations)

When the provider changes, the pact verification task runs as part the provider's normal build pipeline, generally after the unit tests, and before any deployment takes place. This pact verification task is configured to dynamically fetch all the relevant pacts for the specified provider from Pactflow, verify them, and publish the results back to Pactflow.

To ensure that a verification is also run whenever a pact changes, we create a webhook in Pactflow that triggers a provider build, and passes in the URL of the changed pact. Ideally, this would be a completely separate build from your normal provider pipeline, and it should just verify the changed pact.

Because Travis CI only allows us to have one build configuration per repository, we switch between the main pipeline mode and the webhook-triggered mode based on the presence of an environment variable that is only set via the webhook. Keep in mind that this is just a constraint of the tools we're using for this example, and is not necessarily the way you would implement Pact your own pipeline.

## Usage

See the [Pactflow CI/CD Workshop](https://github.com/pactflow/ci-cd-workshop) for background.

To run the tests locally, run:

```
make test
```

To run the "fake ci" task:
```
export PACT_BROKER_BASE_URL=https://test.pactflow.io
export PACT_BROKER_USERNAME=dXfltyFMgNOFZAxr8io9wJ37iUpY42M
export PACT_BROKER_PASSWORD=O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1
make fake_ci
```
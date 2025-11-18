import os
from pact import Verifier
import pact_ffi

def test_provider():
    """Test the provider against the consumer contract."""
    pact_ffi.log_to_stderr("DEBUG")
    verifier = (
        Verifier("pactflow-example-provider-python")  # Provider name
        .add_transport(url="http://localhost:8000")
        .broker_source(
            os.environ.get("PACT_BROKER_BASE_URL", "https://broker.pactflow.io/"),
            token=os.environ.get("PACT_BROKER_TOKEN", "broker-token"),  # or use token="bearer-token"
        )
    )

    verifier.verify()

if __name__ == "__main__":
    test_provider()
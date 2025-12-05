import os
from pact import Verifier
import pact_ffi

from typing import Literal, Any

def provider_state_handler(
    state: str,
    action: Literal["setup", "teardown"],
    parameters: dict[str, Any] | None,
) -> None:
    """Handle all provider state changes."""
    parameters = parameters or {}
    if state == "a product with ID 10 exists":
        if action == "setup":
            return
        if action == "teardown":
            return
    msg = f"Unknown state/action: {state}/{action}"
    raise ValueError(msg)


def test_provider():
    """Test the provider against the consumer contract."""
    pact_ffi.log_to_stderr("DEBUG")
    verifier = (
        Verifier("pactflow-example-provider-python")  # Provider name
        .add_transport(url="http://localhost:8000")
        .state_handler(provider_state_handler, teardown=False)
        .broker_source(
            url=os.environ.get("PACT_BROKER_BASE_URL", "https://broker.pactflow.io/"),
            token=os.environ.get("PACT_BROKER_TOKEN", "broker-token"),
            selector=True
        )
        .consumer_versions('{"mainBranch": true}', '{"deployedOrReleased": true}')
        .include_pending()
        .include_wip_since("2025-11-10")
        .build()
    )
    # verifier.set_publish_options(
    # version="123",
    # branch="foo",
    # )
    verifier.verify()

if __name__ == "__main__":
    test_provider()
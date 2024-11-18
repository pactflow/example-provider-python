from fastapi import FastAPI, Response

app = FastAPI()

catalog = [
  { "id": "10", "type": "CREDIT_CARD", "name": "Buy stuff without actually having money" },
  { "id": "1", "type": "LOAD", "name": "no interest forever loan (via parents fund)" }
]

@app.get("/products")
async def products():
  return catalog

@app.get("/products/{id}")
@app.get("/product/{id}")
async def product(id: str, response: Response):
  for product in catalog:
    if product["id"] == id:
      return product

  response.status_code = 404
  return {}

@app.delete("/product/{id}")
async def delete_product(id: str, response: Response):
  global catalog
  catalog = [product for product in catalog if product["id"] != id]
  response.status_code = 204
  return catalog


@app.post("/_pact/state")
async def change_state(request: dict, response: Response):
  state = request.get("state")
  print(state)
  if state == "a product with ID 10 exists":
    catalog.append({ "id": "10", "type": "CREDIT_CARD", "name": "Buy stuff without actually having money" })
    response.status_code = 200
    return {"result": "Product with ID 10 added"}
  else:
    response.status_code = 400
    return {"error": "Unknown state"}
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
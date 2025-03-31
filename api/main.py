from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
df = pd.read_csv("operadoras.csv", sep=";", dtype=str).fillna("")

@app.get("/api/buscar-operadoras")
def buscar_operadoras(query: str = Query(..., min_length=1)):
    query_lower = query.lower()
    resultados = df[df["Nome_Fantasia"].str.lower().str.contains(query_lower)]
    return resultados[[
        "Registro_ANS", "Nome_Fantasia", "Razao_Social", "UF", "Modalidade"
    ]].to_dict(orient="records")
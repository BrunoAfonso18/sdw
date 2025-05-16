import pandas as pd
import random

def random_ponderado(x, min_val=0, max_val=10, desvio=2):
    while True:
        valor = random.gauss(x, desvio)
        if min_val <= valor <= max_val:
            return round(valor, 1)

# especificar caminhos corretos dos csvs
df_reviews = pd.read_csv("reviews/Airline_review.csv")
df_flights = pd.read_csv("viagens/flights_sample_3m.csv")

df_reviews["Overall_Rating"] = pd.to_numeric(df_reviews["Overall_Rating"], errors="coerce")

df_reviews_clean = df_reviews.dropna(subset=["Airline Name", "Overall_Rating"])

avg_by_airline = df_reviews_clean.groupby("Airline Name")["Overall_Rating"].mean().to_dict()
overall_avg = df_reviews_clean["Overall_Rating"].mean()

def gerar_rating(airline):
    media = avg_by_airline.get(airline, overall_avg)
    return random_ponderado(media)

df_flights["Rating"] = df_flights["AIRLINE"].apply(gerar_rating)

# mudar o nome para o csv de destino
df_flights.to_csv("viagens/flights_sample_3m_ratings.csv", index=False)

print("Rating gerado e guardado no ficheiro 'flights_sample_3m_ratings.csv'")

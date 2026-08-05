import streamlit as st
import plotly.graph_objects as go
from db_helper import DB
import plotly.express as px
import pandas as pd

db=DB()
st.sidebar.title("Flight Dashboard")

user_option=st.sidebar.selectbox("menu",["Select One","Check Flights","Analytics"])

if user_option=="Check Flights":
    st.title("Check Flights")
    col1,col2=st.columns(2)

    with col1:
        city=db.fetch_city_names()
        source=st.selectbox("Source",sorted(city))
    with col2:
        city=db.fetch_city_names()
        destination=st.selectbox("Destination",sorted(city))

    if st.button("search"):
        results=db.fetch_all_flights(source,destination)
        if len(results)==0:
            st.text("No Flights Available")
        else:
            st.dataframe(results)

elif user_option=="Analytics":
    airline,frequency=db.fetch_airline_frequency()

    fig=go.Figure(go.Pie(
        labels=airline,
        values=frequency,
        hoverinfo="label+percent",
        textinfo="value"
    ))
    st.header("Pie Chart")
    st.plotly_chart(fig)

    city, frequency = db.busy_airport()

    df = pd.DataFrame({
        "City": city,
        "Flights": frequency
    })

    fig2 = px.bar(
        df,
        x="City",
        y="Flights",
        title="Busy Airports"
    )

    st.plotly_chart(fig2, use_container_width=True)

    date,frequency3=db.daily_flight_frequency()
    df = pd.DataFrame({
        "Date": date,
        "Flights": frequency3
    })

    fig3 = px.line(
        df,
        x="Date",
        y="Flights",
        title="Daily Flight Frequency",
        markers=True
    )

    fig3.update_layout(
        xaxis_title="Date",
        yaxis_title="Number of Flights"
    )

    st.plotly_chart(fig3, use_container_width=True)


else:
    pass

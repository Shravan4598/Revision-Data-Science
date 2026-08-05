import streamlit as st

st.sidebar.title("Flight Analytics")

user_option=st.sidebar.selectbox("menu",["Select One","Check Flights","Analytics"])

if user_option=="Check Flights":
    st.title("Check Flights")


elif user_option=="Analytics":
    st.title("Flight Analytics")

else:
    pass

import streamlit as st, pandas as pd
st.set_page_config(page_title="Telework & Job Quality — MVP", layout="wide")
st.title("Telework & Job Quality — MVP (Andalucía vs EU)")
df = pd.read_csv("data/processed/panel_sample.csv")
regions = st.multiselect("Select region(s)", sorted(df['region'].unique()), default=["Andalucía","EU-27"])
metric = st.selectbox("Metric", ["telework_share","temp_share","broadband"], index=0)
st.line_chart(df[df['region'].isin(regions)].pivot(index="year", columns="region", values=metric))
st.caption("Synthetic sample for demo. Replace with Eurostat pulls later.")

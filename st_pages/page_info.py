import streamlit as st
import pandas as pd
import datetime
from st_pages.modules.map_names import mapping_names, list_names
import requests
import json


@st.cache()
def get_data(option, unix_date_start, unix_date_end):
    url = f"http://api.coincap.io/v2/assets/{option}/history?interval=d1&start={unix_date_start}&end={unix_date_end}"
    payload = {}
    headers = {}
    response = requests.request("GET", url, headers=headers, data=payload)
    return response


def func_page_info():
    with st.sidebar:
        option = st.selectbox(
            'Выберите монету:',
            (list_names))

        st.write('Выберите период:')
        start_date = st.date_input(
            "Начало",
            datetime.date(2022, 1, 1))

        end_date = st.date_input(
            "Конец",
            datetime.date(2022, 1, 31))


    _, col1, _ = st.columns([1.9, 1, 1])
    with col1:
        st.write(f'{mapping_names[option]}')
    _, col2, _ = st.columns([0.74, 1, 0.45])
    with col2:
        st.write(f'График изменения стоимости монеты с {start_date}  по {end_date}')

        unix_date_start = datetime.datetime(int(str(start_date)[:4]),
                                      int(str(start_date)[5:7]),
                                      int(str(start_date)[8:])).timestamp()

        unix_date_end = datetime.datetime(int(str(end_date)[:4]),
                                            int(str(end_date)[5:7]),
                                            int(str(end_date)[8:])).timestamp()
        unix_date_start = int(str(int(unix_date_start)) + '000')
        unix_date_end = int(str(int(unix_date_end)) + '000')

    resp = get_data(option, unix_date_start, unix_date_end)
    data = json.loads(resp.text.encode('utf-8'))
    time_dict = {}
    for ii in data['data']:
        time_dict[ii['date'][:10]] = ii['priceUsd']
    df = pd.DataFrame([time_dict]).T.rename(columns={0:'монета'})
    df['монета'] = round(df['монета'].astype('float'), 5)

    st.bar_chart(df)
    st.line_chart(df)


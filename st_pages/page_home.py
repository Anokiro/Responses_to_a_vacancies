import streamlit as st
from PIL import Image


def func_page_home(selected):
    col1_, col2_ = st.columns([1, 1])
    with col1_:
        st.write('----')
        st.markdown("<h5 style='text-align: left; color: red;'>Создайте интерактивное приложение с помощью "
                    "одного из веб фреймворков(streamlit / dash / panel), по следующему макету:</h5>",
                    unsafe_allow_html=True)
        st.write('----')
        st.markdown("<h5 style='text-align: left; color: red;'>Исторические данные "
                    "и список активов необходимо получить с помощью апи:  https://docs.coincap.io/ </h5>",
                    unsafe_allow_html=True)
    with col2_:
        st.image(Image.open('images/streamlit_images/info_1.jpg'))


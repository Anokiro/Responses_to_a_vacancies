import requests
import os
import pandas as pd
from PIL import Image
import time
import streamlit as st
from streamlit_option_menu import option_menu
from st_on_hover_tabs import on_hover_tabs
from st_pages.page_home import func_page_home
from st_pages.page_info import func_page_info


# -- HEADER ------------------------------------------------------------------------------------------------------------
st.set_page_config(page_title="saber_project", page_icon="", layout="wide",)

st.image(Image.open('images/streamlit_images/image_menu.jpg'))

selected = option_menu(
    menu_title=None,
    options=["Описание задания", "Coin info"],
    icons=["house", "file-richtext-fill"],
    default_index=0,
    orientation="horizontal",
    styles={
        "container": {"padding": "0!important", "background-color": "black", "clip-path":
            "polygon(0% 0%, 0% 0%, 100% 0%, 100% 0%, 100% 75%, 98% 100%, 0% 100%, 0 100%)"},
        "icon": {"padding": "0!important", "color": "black", "font-size": "20px", "text-align": "center"},
        # "nav": {"background-color": "green", },
        "nav-item": {"padding": "2px", "clip-path":
            "polygon(0% 0%, 0% 0%, 100% 0%, 100% 0%, 100% 70%, 70% 100%, 0% 100%, 0 100%)"},
        "nav-link": {"color": "red", "font-size": "13px", "text-align": "center", "margin": "0px",
                     "--hover-color": "rgb(255, 255, 255)", "white-space": "nowrap"},
        "nav-link-selected": {
            "background-color": "rgb(229, 229, 229)",
            "font-size": "13px", "border-radius-left": "30px", "clip-path":
                "polygon(0% 30%, 30% 0%, 100% 0%, 100% 0%, 100% 70%, 70% 100%, 0% 100%, 0 100%)"},
    })

# -- PAGE_1_HOME -------------------------------------------------------------------------------------------------------
if selected == "Описание задания":
    func_page_home(selected)

# -- PAGE_2_INFO -------------------------------------------------------------------------------------------------------
if selected == "Coin info":
    func_page_info()


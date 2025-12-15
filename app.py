import dash
import dash_bootstrap_components as dbc
from dash import html, page_container

external_stylesheets = [
    dbc.themes.DARKLY,
    "https://cdn.jsdelivr.net/npm/aos@2.3.1/dist/aos.css"
]
external_scripts = [
    "https://cdn.jsdelivr.net/npm/aos@2.3.1/dist/aos.js"
]

app = dash.Dash(
    __name__,
    use_pages=True,
    external_stylesheets=external_stylesheets,
    external_scripts=external_scripts
)

app.layout = html.Div([
    page_container  
])

if __name__ == '__main__':
    app.run(debug=False)  

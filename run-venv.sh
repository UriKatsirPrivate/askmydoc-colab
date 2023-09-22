python3 -m venv myenv
source myenv/bin/activate
python3 -m pip install --upgrade pip
export SYSTEM_VERSION_COMPAT=1
pip3 install -r requirements.txt
streamlit run app.py "landing-zone-demo-341118"  \
                                                "us-central1"  \
                                                "text-bison"  \
                                                1024 \
                                                0.1 \
                                                0.8 \
                                                40 \


# streamlit run app.py --server.port 8081 --browser.serverAddress 0.0.0.0 --server.enableCORS False
# python3 back_sql.py
# deactivate
# rm -rf myenv





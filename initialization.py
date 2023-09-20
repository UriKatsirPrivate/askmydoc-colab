import os
import json
import vertexai
from langchain.llms import VertexAI
# from google.cloud import secretmanager


def initialize_llm():
    vertexai.init(project="landing-zone-demo-341118", location="us-central1")
    return VertexAI(
        model_name="text-bison",
        max_output_tokens=1024,
        temperature=0.1,
        top_p=0.8,
        top_k=40,
        verbose=True,
    )
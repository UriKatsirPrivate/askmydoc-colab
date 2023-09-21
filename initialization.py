import os
import json
import vertexai
from langchain.llms import VertexAI
import sys
# from google.cloud import secretmanager


def initialize_llm():
    # vertexai.init(project="landing-zone-demo-341118", location="us-central1")
    vertexai.init(project=sys.argv[1], location=sys.argv[2])
    return VertexAI(
        model_name=sys.argv[3],
        max_output_tokens=sys.argv[4],
        temperature=sys.argv[5],
        top_p=sys.argv[6],
        top_k=sys.argv[7],
        verbose=True,
    )
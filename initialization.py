import vertexai
from langchain.llms import VertexAI
import sys

# print ("Number of arguments:", len(sys.argv), "arguments")
# print ("Argument List:", str(sys.argv))

def initialize_llm():

    if len(sys.argv)<=1: # No external passed
        vertexai.init(project="landing-zone-demo-341118", location="us-central1")
        return VertexAI(
            model_name="text-bison@001",
            max_output_tokens=1024,
            temperature=0.1,
            top_p=0.8,
            top_k=40,
            verbose=True,
        )
    else:     
        vertexai.init(project=sys.argv[1], location=sys.argv[2])
        return VertexAI(
            model_name=sys.argv[3],
            max_output_tokens=sys.argv[4],
            temperature=sys.argv[5],
            top_p=sys.argv[6],
            top_k=sys.argv[7],
            verbose=True,
        )    
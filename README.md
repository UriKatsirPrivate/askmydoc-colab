# AskMyDoc colab

## A Q&A Service Powered by AI (Vertex AI Palm2 model, Vector Store DB, Embeddings API, LangChain & Streamlit.) Hosted on Cloud Run.

### See the code in action [here](https://askmydoc.xyz/). You can find sample documents and questions in the "sample-documents" folder.


### Setup

* Create a GCP project.
* [Enable](https://cloud.google.com/apis/docs/getting-started#enabling_apis) the Vertex AI, Artifact Registry and Cloud Run APIs
* Create [Artifact Registry](https://cloud.google.com/artifact-registry/docs/repositories/create-repos#create-console) Docker repo (Standard) in a region
* Create an [IAM service account](https://cloud.google.com/iam/docs/service-accounts-create#creating) with _Cloud Run Invoker_ and _Vertex AI User_ permissions.

### Usage

<a href="https://github.com/UriKatsirPrivate/askmydoc-colab/blob/main/askmydoc_colab.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Run In Colab"/>
</a>

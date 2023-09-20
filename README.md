# AskMyDoc colab

## A Q&A Service Powered by AI (Vertex AI Palm2 model, Vector Store DB, Embeddings API, LangChain & Streamlit.) Hosted on Cloud Run.

### See the code in action [here](https://askmydoc.app/). You can find sample documents and questions in the "sample-documents" folder.

<a href="https://colab.sandbox.google.com/drive/1Sw9Hr-x9P8gy505TQ8gV2WND2fs8PD_4?resourcekey=0-xk7yw3YuoU02NhvJhXxClw">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>


### Usage

* Modify constants.json:
    * replace the PROJECT_ID value with your own
* Modify deploy.sh:
    * Replace SERVICE_ACCOUNT_EMAIL with your own service account. 
      * The service account should have _Cloud Run Invoker_ and _Vertex AI User_ permissions.
    * Replace ARTIFACT_REGISTRY_NAME with your own.
    * Replace GOOGLE_CLOUD_PROJECT with your own.
* Execute run-venv.sh to run the code locally.
* Execute deploy.sh to deploy the code to Cloud Run.

#### To-Do
1. Separate the UI and the backend into separate services. 
2. Replace ChromaDB with a production grade vector DB.

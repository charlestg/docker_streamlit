# Run the docker container
Run docker container to start streamlit app, default "hello world"
```
docker run -ti --rm charlestg/docker_streamlit:latest
docker run -ti --rm -p 8080:8080 charlestg/docker_streamlit:latest
```

**Local development**
 - Mount your working folder in the container, main app streamlit_app.py
  ```
  docker run -ti --rm -p 8501:8501 -v $(pwd):/app charlestg/docker_streamlit:latest
  ```

 - Use different entry file, not `streamlit_app.py` (e.g. `app.py`)
 ```
 docker run -ti --rm -p 8501:8501 -v $(pwd):/app charlestg/docker_streamlit:latest streamlit run app.py
 ```

- To access the docker container in the bash mode
```
docker run -ti --rm -p 8501:8501 charlestg/docker_streamlit:latest bash

# ex: need to install additional requirements.txt
pip install --no-cache-dir -r requirements.txt
```

# Build docker image
You can build this docker image from a dockerfile using this command
```
docker build -t charlestg/docker_streamlit:latest .
```



# tehdas-hacklab-experiment-1
Experiment by Pori Hacklab and Tehdas Ry

This repository tooling used for Tehdas Ry and Pori Hacklab joint demo based on alternated history to celebrate Tehdas Ry 20th anniversary and co-operation with Pori Hacklab (Satky).

To create data extracting and finnish voice generator tool based on docker
```
docker build . -t tehdashacklabexperiment1
docker run --rm -it -v $(pwd)/input:/home/app-user/input:rw -v $(pwd)/output:/home/app-user/output:rw tehdashacklabexperiment1 process_input_files.sh
```

TODO:

* More tooling: OpenAI API call examples
* directory restructuring??

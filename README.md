# tehdas-hacklab-experiment-1
Experiment by Pori Hacklab and Tehdas Ry

This repository tooling used for Tehdas Ry and Pori Hacklab joint demo based on alternated history to celebrate Tehdas Ry 20th anniversary and co-operation with Pori Hacklab (Satky).

To create data extracting and finnish voice generator tool based on docker
```
docker build . -t tehdashacklabexperiment1
docker run --rm -it -v $(pwd)/input:/home/app-user/input:rw -v $(pwd)/output:/home/app-user/output:rw tehdashacklabexperiment1
```

Features:

* Create from input .txt files wav and flac files to output folder using Finnish synthetized language generator ( Suopuhe )
 * if there is also a file ending _changed.txt it will make a stereo file (ogg-format) to output folder joining with shared name wav files
* Fetch pdf from from a url and extract pictures from it to output folder



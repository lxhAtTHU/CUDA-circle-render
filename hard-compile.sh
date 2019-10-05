nvcc cudaRenderer.cu -O3 -m64 --gpu-architecture compute_35 -c -o objs/cudaRenderer.o
g++ -m64 -O3 -Wall -g -o render objs/main.o objs/display.o objs/benchmark.o objs/refRenderer.o objs/cudaRenderer.o objs/noise.o objs/ppm.o objs/sceneLoader.o -L/usr/local/cuda-8.0/lib64/ -lcudart -lGL -lglut -lcudart


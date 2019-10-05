# CUDA-circle-render
Assignment 2 of CMU 15418

## description

This is an assignment of CMU's 15418 course [Parallel Computer Architecture and Programming](http://www.cs.cmu.edu/~418/).

## Optimization

Main modification lies in `cudaRenderer.cu`.

`naiveKernelRenderCircles` is a naive version where each thread renders one pixel and iterates through all circles. This method is simple and effictive when the number of circles is small.

However, when there are too many circles, it can be unacceptable for a thread to check every circle. So, `kernelRenderCircles` proposes a new machanism. In this function, each thread is also responsible for one pixel and thus a block of threads is corresponding to a box area in the picture. Before rendering, threads in the same block work together to figure out circles who may contribute to this area and record them in shared memory. Then they traverse those circles and calcute values for this pixel.

## Examples

![rand10k](./rand10k.jpg)
![snow](./snow.jpg)

## Score

```
------------
Score table:
------------
-------------------------------------------------------------------------
| Scene Name      | Fast Time (Tf)  | Your Time (T)   | Score           |
-------------------------------------------------------------------------
| rgb             | 0.2114          | 0.2507          | 12              |
| rand10k         | 2.6672          | 2.5965          | 12              |
| rand100k        | 22.6882         | 22.8687         | 12              |
| pattern         | 0.3708          | 0.2466          | 12              |
| snowsingle      | 13.9282         | 10.4618         | 12              |
| biglittle       | 15.5070         | 16.4180         | 12              |
-------------------------------------------------------------------------
|                                   | Total score:    | 72/72           |
-------------------------------------------------------------------------

```

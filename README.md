

# Caffe-TCNN. Using filter banks in convolutional neural networks for texture classification
This is a basic example of the Texture CNN (T-CNN) network developed in "andrearczyk2016using". 
We provide an implementation of the T-CNN-3 (3 convolution layers) fine-tuned or from scratch on the kth-tips-2b database.

## Getting started
Install caffe ([caffe-installation](http://caffe.berkeleyvision.org/installation.html)) and go to the caffe directory. (Alternatively, you can copy the folowing folders to your already existing caffe folder: ./data/kth-tips-2b/ ./examples/kth-tips/2b and do the same following tasks).
    
Create a folder into which you will import the T-CNN-3 model pretrained on ImageNet:

    mkdir ./models/tcnn
    
Download and untar the caffemodel from this link: [tcnn3.caffemodel](https://drive.google.com/open?id=0B2KB9JO6F3xCNGtoeS1lNHZCUnM)
and place it in the created folder (./models/tcnn).

Prepare the data (download the kth-tips-2b database, untar and convert to jpg images):

    cd ./data/kth-tips-2b
    . ./prepare_data.sh
    
Create the lmdbs and mean files:

    cd ../../
    . ./examples/kth-tips-2b/create_kth.sh
    . ./examples/kth-tips-2b/make_kth_mean.sh
    
Now 4 sets of lmdbs (in caffe-TCNN/examples/kth-tips-2b) and means (in caffe-TCNN/data/kth-tips-2b) should be created. The first fold (kth_test1_lmdb, kth_train1_lmdb and kth_mean1.binaryproto) is linked to be trained on and tested.
It’s now ready to train.

## Evaluation

You can fine-tune from T-CNN-3 pre-trained on ImageNet:

    ./build/tools/caffe train -solver ./examples/kth-tips-2b/solver_tcnn3.prototxt -weights ./models/tcnn/tcnn3.caffemodel -gpu 0
    
or

Train from scratch:

    ./build/tools/caffe train -solver ./examples/kth-tips-2b/solver_tcnn3_scratch.prototxt -gpu 0

To test another fold, link another set of lmdbs and mean and run the same training.

## Citation

If you use the provided code in your research, please cite


    @article{andrearczyk2016using,
      title={Using Filter Banks in Convolutional Neural Networks for Texture Classification},
      author={Andrearczyk, Vincent and Whelan, Paul F},
      journal={arXiv preprint arXiv:1601.02919},
      year={2016}
    }



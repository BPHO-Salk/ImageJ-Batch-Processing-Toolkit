# Batch-processing-toolkit
This repository includes hands-on FIJI macros mainly for image batch processing.

## Table of contents:
1. Downsampling and upsampling
2. Split RGB channels

## 1. Downsampling and upsampling

ImageJ/FIJI Macro - This script is used for batch downsampling and upsampling.

### Specification:   
Input - 2D .tif or .tiff 8-bit raw hr images saved in one folder.   
Output - Five folders:
* Folder 1 - hr: your input 8-bit images
* Folder 2 - hr_RGB: result of converting input 8-bit images into RGB format
* Folder 3 - lr: Downsampled RGB images (Downsampling method: None; Scale: 4X)
* Folder 4 - bicubic_upsampling: upsampled RGB images (Upsampling method: bicubic; Scale: 4X) 
* Folder 5 - bilinear_upsampling: upsampled RGB images (Upsampling method: bilinear; Scale: 4X)   

Note: All the upsampled images use None downsampled images (i.e. images in Folder 3) as input.

## 2. Split RGB channels

ImageJ/FIJI Macro - Batch splitting 2D RGB .tif/.tiff images into single channels and save them in 3 different folders

### Specification:  
Input - 2D RGB .tif or .tiff images saved in one folder.   
Output - Splitted single channel images saved in three folders, each of which contains images of one single channel.  

### How to use:
* Put all your images in one folder.
* Simply drag and drop the .ijm file into ImageJ/FIJI.
* Click "Run".
* When the dilog window pops up, select the folder where you put all your images as the target directory.
* Then you are done! Check the spliited single channel images in different folders that are just automatically created!

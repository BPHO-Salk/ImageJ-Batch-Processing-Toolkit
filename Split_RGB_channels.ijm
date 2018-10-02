//Batch split RGB channels and save different channel into different folders 

//Specification:
//Input - 2D RGB .tif or .tiff images saved in one folder
//Output - Splitted single channel images saved in three folders, each of which contains images of one single channel

//written by Linjing Fang on 1/16/2018
//Email: lfang@salk.edu
//**********************************************************************************//

// when this is true, the script runs faster but images are hidden
setBatchMode(true);

// load array of all RGB images in the input directory
path = getDirectory("Select the folder of your input tif/tiff RGB images"); 
filelist = getFileList(path);

//Create folders for each splitted channel
File.makeDirectory(path + "Splitted channel - Blue");   
File.makeDirectory(path + "Splitted channel - Green");
File.makeDirectory(path + "Splitted channel - Red"); 


for (i=0; i< filelist.length; i++) {
	// process tiff files only
	if (endsWith(filelist[i], ".tif") || endsWith(filelist[i], ".tiff"))  {
    	open(filelist[i]);
    	print("Splitting: "+ filelist[i]);
		run("Split Channels");
		
		// Save blue channel
		selectWindow(filelist[i] + " (blue)");
		NewName_blue = replace(replace(filelist[i],".tiff","_blue.tiff"),".tif","_blue.tif");
		print("Saving:  " + NewName_blue);
		path_blue = path + "/Splitted channel - Blue/";
		save(path_blue + NewName_blue); 

		// Save green channel
		selectWindow(filelist[i] + " (blue)");
		NewName_green = replace(replace(filelist[i],".tiff","_green.tiff"),".tif","_green.tif");
		print("Saving:  " + NewName_green);
		path_green = path + "/Splitted channel - Green/";
		save(path_green + NewName_green); 

		// Save red channel
		selectWindow(filelist[i] + " (blue)");
		NewName_red = replace(replace(filelist[i],".tiff","_red.tiff"),".tif","_red.tif");
		print("Saving:  " + NewName_red);
		path_red = path + "/Splitted channel - Red/";		
		save(path_red + NewName_red); 
	}
}

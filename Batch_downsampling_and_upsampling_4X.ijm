//ImageJ/FIJI Macro - This scripts is used for batch downsampling and upsampling.
//Specification:

//Input - 2D .tif or .tiff 8-bit raw hr images saved in one folder.
//Output - Five folders
// 		   Folder 1 - hr: your input 8-bit images
//		   Folder 2 - hr_RGB: result of converting input 8-bit images into RGB format
//		   Folder 3 - lr: Downsampled RGB images (Downsampling method: None; Scale: 4X)
//		   Folder 4 - bicubic_upsampling: upsampled RGB images (Upsampling method: bicubic; Scale: 4X) 
//		   Folder 5 - bilinear_upsampling: upsampled RGB images (Upsampling method: bilinear; Scale: 4X)
//Note: All the upsampled images use None downsampled images (i.e. images in Folder 3) as input.

//written by Linjing Fang on 2/6/2018
//Email: lfang@salk.edu
//**********************************************************************************//

// when this is true, the script runs faster but images are hidden.
setBatchMode(true);

path = getDirectory("Select folder of input tiff files"); 
File.makeDirectory(path + "/hr"); 
File.makeDirectory(path + "/hr_RGB"); 
File.makeDirectory(path + "/lr"); 
File.makeDirectory(path + "/bicubic_upsampling"); 
File.makeDirectory(path + "/bilinear_upsampling");
path_hr = path + "/hr/";
path_hr_RGB = path + "/hr_RGB/";
path_none = path + "/lr/";
path_bicubic = path + "/bicubic_upsampling/";
path_bilinear = path + "/bilinear_upsampling/";

filelist = getFileList(path);

for (i=0; i<filelist.length; i++) {
	print("Downsampling: "+ filelist[i]);
	// process tiff files only
	if (endsWith(filelist[i], ".tif") || endsWith(filelist[i], ".tiff"))  {
    	open(filelist[i]);
    	File.rename(path + filelist[i], path_hr + filelist[i]); 
    	run("RGB Color");
    	save(path_hr_RGB + filelist[i]); 
		run("Scale...", "x=0.25 y=0.25 width=75 height=50 interpolation=None average create");
		analyzedName_down = replace(replace(filelist[i],".tiff","_downsampled.tiff"),".tif","_downsampled.tif");
		print("Saving:  " + analyzedName_down);
		save(path_none + analyzedName_down); 
		run("Scale...", "x=4 y=4 width=300 height=200 interpolation=Bicubic average create");
		analyzedName_up_bicubic = replace(replace(filelist[i],".tiff","_bicubic.tiff"),".tif","_bicubic.tif");
		print("Saving:  " + analyzedName_up_bicubic);
		save(path_bicubic + analyzedName_up_bicubic); 
		close();
		run("Scale...", "x=4 y=4 width=300 height=200 interpolation=Bilinear average create");
		analyzedName_up_bilinear = replace(replace(filelist[i],".tiff","_bilinear.tiff"),".tif","_bilinear.tif");
		print("Saving:  " + analyzedName_up_bilinear);
		save(path_bilinear + analyzedName_up_bilinear); 
		run("Close All");
	}
}

print("All done.");

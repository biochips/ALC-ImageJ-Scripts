// Alexandra L. Crampton -- 28Aug2017

////////////////////////////////////////////////////////

//open an image
open(picDir_bf + imList_bf[imCount]); // look at directories script
id_bf = getImageID(); 
bfName = getTitle();

//first select the bf image and duplicate
selectImage(bfName);
run("Enhance Contrast...", "saturated=0.3");
run("Duplicate...", " ");

//blur and threshold
wait(50); //this is helpful if there are lots of images being opened at the same time (50ms wait)
	
run("Gaussian Blur...","Sigma=2.0");
setAutoThreshold("Default");
run("Convert to Mask");
run("Fill Holes");

//count number of objects with Analyze Particles
run("Analyze Particles...", "size=20000-100000 circularity=0.00-1.00 show=[Overlay Outlines] display exclude clear in_situ");

//organize all open images
run("Tile");
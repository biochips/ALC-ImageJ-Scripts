
//have user find directory with all images of all colors
dirORIG = getDirectory("all images for study directory");
dirSAVE = getDirectory("save dir");
imList = getFileList(dirORIG); // all color channels and all positions

//open images with the right scene number and tile number
//naming of scene numbers.  This creates a list that does not have a 01,02,03.. format and is instead 1,2,3

//make array with strings to search for -- scenes
numScenes = 60; // this will change/can read in as part of file list
scenes = newArray(numScenes);
for (num=1; num <= numScenes; num ++){
	if(num<10){
		first = "s0";
		second = toString(num);
		numString = first+second; //will result in 's01' for num =1
	}
	else{
		first = "s";
		second = toString(num);
		numString = first+second;  //will result in 's10' for num =10
	}
	scenes[num-1] = numString; //correct to indexing at 0 for array
}

//now do similar thing for number of tiles

//make array with strings to search for -- scenes
numTiles = 20; // this will change/can read in as part of file list
tiles = newArray(numTiles);
for (num=1; num <= numTiles; num ++){
	if(num<10){
		first = "m0";
		second = toString(num);
		numString = first+second; //will result in 'm01' for num =1
	}
	else{
		first = "m";
		second = toString(num);
		numString = first+second;  //will result in 'm10' for num =10
	}
	tiles[num-1] = numString; //correct to indexing at 0 for array
}

//now sort through the entire directory and see if it's a match.  probably a better way to do this, but this works as a start...
for(z=0; z<scenes.length; z++){
	tempScene = scenes[z];
	for(k=0; k<tiles.length; k++){
		tempTile = tiles[k];

		//now open all images that have the same scene and tile number (all color channels)

		for (i=0; i<imList.length; i++){//now iterate through each image in the folder
			tempImageString = imList[i];

			//open image if it is the correct color channel and scene number
			if(indexOf(tempImageString,tempScene)>0 && indexOf(tempImageString,tempColor)>0){
				//open the image
				open( dirORIG+imList[i]);

			}
		} 
	
	//stack images
	run("Images to Stack", "name=Stack title=[] use");

	//save image
	saveAs("Tiff", dirSAVE+File.separator+tempScene+"_"+tempTile);
	run("Close All");
	}
}



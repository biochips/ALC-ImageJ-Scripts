//Alexandra L. Crampton -- 28Aug2017

////////////////////////////////////////////
//allow user to select existing directories with images

picDir_bf = getDirectory("choose the bf images");

picDir = getDirectory("save directory");

/////////////////////////////////////////////
//make a new directory
saveDir = picDir +"processed_centerOut" + File.separator;
File.makeDirectory(saveDir);

/////////////////////////////////////////////
//make a list of the files in the directory and sort
imList_bf = getFileList(picDir_bf);
Array.sort(imList_bf);
// Alexandra L. Crampton -- 28Aug2017

majorArray = newArray(nResults); //make space to store the major axis length vals
majorArrayPlus10 = newArray(nResults); //make space to store modified vals

//populate the array.  nResults is a built-in val that is the number of entries in the results table
for(k = 0; k<nResults; k++){
	majorArray[k] = getResult("Major",k);
	majorArrayPlus10 = getResult("Major",k) + 10;
}

//now add the majorArrayPlus10 vals to the results table

for (m=0; m<majorArrayPlus10.length; m++){
    setResult("MajorPlus10", m, profile[m]);
}
updateResults;

//save results table
saveAs("Results",  saveDir + "_majorPlus10.csv");
// Define input and output folders as well as image type
#@ File (label = "CSV file", style = "file") input
#@ File (label = "Image", style = "file") image
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".csv") suffix

open(image);
titleOfCurrentImage = getTitle();

//processFolder(input);
processFile(input);


function processFile(input) {

	Table.open(input);
	xpoints = Table.getColumn("x"); 
	ypoints = Table.getColumn("y");
	makeSelection("point small red circle", xpoints, ypoints);
	
shortTitle = replace(titleOfCurrentImage, ".tif" , "_")
		
run("ROI Manager...");
roiManager("Add");	

saveAs(output + File.separator  + shortTitle +  "overlay.tif");		
			
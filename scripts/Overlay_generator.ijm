// Define input and output folders as well as image type
#@ File (label = "CSV file", style = "file") input
#@ File (label = "Image", style = "file") image
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".csv") suffix

open(image);
processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {

	Table.open(input + File.separator + file);
	xpoints = Table.getColumn("x"); 
	ypoints = Table.getColumn("y");
	makeSelection("point small red circle", xpoints, ypoints);

saveAs(output + File.separator + file + ".tif");		
			
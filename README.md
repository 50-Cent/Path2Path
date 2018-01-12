# Path2Path
Basu, Saurav, Barry Condron, and Scott T. Acton. "Path2Path: Hierarchical path-based analysis for neuron matching." Biomedical Imaging: From Nano to Macro, 2011 IEEE International Symposium on. IEEE, 2011.
The script is written in Matlab 2017a. The python version will be uploaded shortly.
There are several function files. To execute the code, the user is requested to use the mainUser.m file.

The mainUser.m takes a filepath as input, where the .swc files of neurons from Neuromorpho.org are stored inside 
different folders under a directory named neuron_nmo. A sample input as the filepath is 
"C:\Users\..\..\..\..\Path2Path_Basu\sampleData\neuron_nmo". The number of .swc files are prompted in the Matlab Command Window.
>> Total number of neurons in the file :->17

Next the numerals of two swc files will be requested to execute the algorithm. 
>> Enter two neurons to find distance
first neuron? 1
>> second neuron? 14

So, the algorithm will compare the first with the 14th neuron. The overall distance, the cross-distance matrix between 
all the paths of first neuron and that of the second neuron, and a suboptimal pairing of the paths based on the cross-distance matrix
appear at the output. 

The code for visualization will be uploaded shortly. 

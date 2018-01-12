clc
clear all

disp('sample path:')
disp('~\sampleData\neuron_nmo')
prompt = 'Please enter the file path :-> ';
str = input(prompt,'s');
neuronData = readInput(str);
len = length(neuronData);
disp(strcat('Total number of neurons in the file :->',num2str(len)))

prompt = 'Enter two neurons to find distance';
disp(prompt)

prompt = 'first neuron?';
str1 = input(prompt,'s');

prompt = 'second neuron?';
str2 = input(prompt,'s');

neuron1 = cell2mat(neuronData{str2num(str1)});
neuron2 = cell2mat(neuronData{str2num(str2)});

dstMat = distanceMat(neuron1,neuron2);
[dst, pairList] = distanceNeuron(dstMat);

clear  len neuron1 neuron2 neuronData prompt str str1 str2


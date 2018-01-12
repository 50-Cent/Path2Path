function [A,B] = findBifur(neuron1,pvt)

A = [];
B = [];
listChild = [];
for k = 1:length(pvt)
   listChild = [listChild; find(neuron1(:,7)==pvt(k))];   
end
A = [A;listChild];

for k = 1:length(listChild)
    tmp = listChild(k);
    while length(find(neuron1(:,7)== tmp))==1
        loc = find(neuron1(:,7)==tmp);
        A = [A;loc];
        tmp = loc;
        %tmp
    end
    B = [B;tmp];
end

end


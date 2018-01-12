function dstMat = distanceMat(neuron1,neuron2)

[pathDescriptor1, noPath1] = path2pathBasu(neuron1);
[pathDescriptor2, noPath2] = path2pathBasu(neuron2);

dstMat = zeros(noPath1,noPath2);
for k = 1:noPath1
    path1 = pathDescriptor1{k};    
    loc1 = path1(:,1);
    coord1 = neuron1(loc1,3:5);    
    for m = 1:noPath2        
        path2 = pathDescriptor2{m};
        loc2 = path2(:,1);
        coord2 = neuron2(loc2,3:5); 
        [cpndList, TR, TT] = getCorrespondence(coord1,coord2);
        sum = 0;
        for s = 1:size(cpndList,1)
           aa = abs(path1(cpndList(s,1),2)-path2(cpndList(s,2),2));
           bb = sqrt(abs(path1(cpndList(s,1),3)*path2(cpndList(s,2),3)));
           cc = norm(TR*coord1(cpndList(s,1),:)'+TT-coord2(cpndList(s,2),:)',2);
           sum = sum+(aa*cc)/(0.1+bb);
        end 
        dstMat(k,m) = sum/size(cpndList,1);
        sum = 0;
    end    
end


end


function concurList = pathConcurrence(neuron1,bifurList,concurList,pvt)

if pvt == 1
    return
else    
    pvt = neuron1(pvt,7);
    %if ~isempty(find(bifurList == pvt))    
        concurList(pvt) = concurList(pvt)+1;
    %end
    concurList = pathConcurrence(neuron1,bifurList,concurList,pvt);
end    

end


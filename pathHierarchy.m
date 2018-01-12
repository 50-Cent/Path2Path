function [hList] = pathHierarchy(neuron1,wCount,hList,dendriteEnd,pvt)

if isempty(dendriteEnd)
    return
else 
    listNode = [];
    listPvt = [];
    for k = 1:length(pvt)
        loc = find(dendriteEnd == pvt(k));
        if ~isempty(loc)
            dendriteEnd(loc) = [];
        else 
            [A,B] = findBifur(neuron1,pvt(k));
            listNode = [listNode; A];
            listPvt = [listPvt; B];
        end
    end
    if ~isempty(listNode)
        hList(listNode) = wCount;
        wCount = wCount+1;
        pvt = listPvt;
        hList =  pathHierarchy(neuron1,wCount,hList,dendriteEnd,pvt); 
    else
        return
    end
end


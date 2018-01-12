function [cList,TR,TT] = getCorrespondence(coord1,coord2)

[N1,~] = size(coord1);
[N2,~] = size(coord2);
[TR,TT,~] = icp(coord1',coord2');

%% transform coord1 by TR*coord1' + TT
coord1 = (TR*coord1'+TT)';

cList = [];
tmpCoord1 = coord1;
tmpCoord2 = coord2;
if N1 >= N2
    for k =1:N2
        tmp = repmat(coord2(k,:),[size(tmpCoord1,1) 1]);
        tmp = tmpCoord1 - tmp;
        tmp = diag(tmp*tmp');
        [~,ix] = min(tmp);
        tmp = tmpCoord1(ix,:);
        cList = [cList; find(coord1==tmp,1) k];
        tmpCoord1(ix,:)=[];
    end    
else
    for k = 1:N1
        tmp = repmat(coord1(k,:),[size(tmpCoord2,1) 1]);
        tmp = tmpCoord2 - tmp;
        tmp = diag(tmp*tmp');
        [~,ix] = min(tmp);
        tmp = tmpCoord2(ix,:);
        cList = [cList; k find(coord2==tmp,1)];
        tmpCoord2(ix,:)=[];
    end
end



end


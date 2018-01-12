function [dst,pairList] = distanceNeuron(dstMat)

[M,N] = size(dstMat);
if M<N
    dstMat = dstMat';
    tmp = N;
    N = M;
    M = tmp;
end


%% greedy algorithm  :: suboptimal pairing

[v,ix] = sort(dstMat,1);
ratioList = v(2,:)./(v(1,:)+0.01);
[~, indx] = sort(ratioList,'descend');

pairList = [ix(1,indx(1)) indx(1)];
sum = v(1,indx(1));
for k = 2:N
    
    loc = find(pairList(:,1)==ix(1,indx(k)));
    if isempty(loc)
        pairList = [pairList; ix(1,indx(k)) indx(k)];
        sum = sum+v(1,indx(k));
    else
        count = 1;
        while ~isempty(loc)
            count = count+1;
            loc = find(pairList(:,1)==ix(count,indx(k)));
        end
        pairList = [pairList; ix(count,indx(k)) indx(k)];
        sum = sum+v(count,indx(k));
    end
end

dst = sum/N;

end


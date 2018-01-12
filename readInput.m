function inputData = readInput(dirPath)

listing = dir(dirPath);
pp = 1;
for k = 3:length(listing)
    folder_name = listing(k).name;
    nxtPath = strcat(dirPath,'\',folder_name,'\','CNG version');    
    filesI = dir(nxtPath);
    
    for kk = 1:length(filesI)        
        if (filesI(kk).bytes~=0)            
            %filesI(kk).name
            fID = fopen(strcat(nxtPath,'\',filesI(kk).name));
            C = textscan(fID,'%f %f %f %f %f %f %f','CommentStyle','#');            
            inputData{pp} = C;            
            pp = pp+1;            
            fclose(fID);
            clear C CC fID
        end
    end
end

clear pp listing nxtPath filesI ans dirPath k kk folder_name

end


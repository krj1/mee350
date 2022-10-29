clc; close all; clear all;

t = 0.01;
h = 20;

dx = 0.1;
dy = 0.1;
T_inf = 20;

rec = ones(5,7);
tri = [1,1,1,1;1,1,1,0;1,1,0,0;1,0,0,0];

map = zeros(7,13);
map(2:end - 1,2:8) = rec;
map(2:5,9:12) = tri


template = [5,11];
mat = zeros(45,45);

pos = 0;
rowl = 11;
for j = 2:1:height(map) - 1
    
    for i = 2:1:length(map) - 1
        
        if (map(j,i) == 1)
            pos = pos + 1;
            
            %key = j * length(rec) - ( length(rec) - i );
            if(map(j-1,i) == 1) % adds ones for upper node
                mat(pos,pos - rowl - 1) = 1;
            end
            
            if(map(j-1,i) == 1)
                mat(pos,pos - rowl - 1) = 1;
            end
            
        end
    end
    rowl = rowl - 1;
end




%{

for j = 2:1:template(1)-1
    
    for i = 2:1:template(2)-1
        
        
        %mat(j,i) = 
        
        
        position = j * length(rec) - ( length(rec) - i );
    end
    
    template(2) = template(2) - 1;
end

pos

%bc_left = h * dy * (T - T_inf);
%bc_top = h * dx * (T - T_inf);

%}







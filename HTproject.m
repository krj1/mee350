clc; close all; clear all;

t = 0.01;
h = 20;
k = 0.12;

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

T = zeros(45,1);
c = zeros(45,1);


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
            
            if(map(j+1,i) == 1)
                mat(pos,pos + rowl) = 1;
            end
            
            if(map(j,i - 1) == 1)
                mat(pos,pos - 1) = 1;
            end
            
            if(map(j,i + 1) == 1)
                mat(pos,pos + 1) = 1;
            end
            
            if (map(j-1,i) == 0)
                mat(pos,pos) = (h * dx / k) + 2;
                c(pos) = (2*h*dx/k)*T_inf;
            end
            
            if (map(j,i - 1) == 0)
                mat(pos,pos) = (h * dx / k) + 2;
                c(pos) = (2*h*dx/k)*T_inf;
            end
            
            
            
        end
    end
    rowl = rowl - 1;
end


hold on

p = plot([0 .6 1 0 0],[0 0 .4 .4 0], 'k')
p.LineWidth = 2;
len = 10;
pos = 0;

color = [];
for i = 1:1:45
    color = [color, i];
end

x = [];
y = [];

for i = 0:1:4
    
    for j = 0:1:len
        pos = pos + 1;
        x = [x , j*.1];
        y = [y , .4 - (i*.1)];
    end
    
    len = len -1;
end


scatter(x,y,100,color,'filled')
axis([-.1 1.1 -.1 .5])
pbaspect([1.2 .6 1])
xticks(0:0.1:1)
yticks([0:.1:.4])
grid on; % display axes grid lines
xlabel('x position [m]', 'FontSize', 16)
ylabel('y position [m]', 'FontSize', 20)
title('Nodal Temperatures', 'FontSize', 14)     

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








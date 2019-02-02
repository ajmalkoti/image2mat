function [A]=replacing_layer_value(A,x,y,pval)

% change values layer by layer or
% changes values of a spurious pixel in a layer

fprintf('\n\n LAYER MODULE: This module is helpful if different value is appearing in layer only, not in others \n\n')

figure(1); plotgraph(A,x,y,pval)
uni=unique(A);
replacement=1;
i=0;

while replacement==1
    i=i+1;
    figure(2); clf; plotgraph(A,x,y,pval)
    [a,b]=find(A==uni(i));
    
    plot(b,a,'*');
    title(strcat('Current value in graph is =  ', int2str(uni(i))));
    replace=input('Enter value to replace p:  ');
    
    if ~isempty(replace)
        for j=1:length(a)
            A(a(j),b(j))= replace;
        end
        replacement = 1;
        i=i-1;              % i=0  to start from first unique value
        fprintf('\n---------  Restart -------- \n\n')
    end
    
    uni=unique(A);
    if i==length(uni)
        replacement = 0;
        fprintf('type "dbcont"')
        keyboard
        save('data_layer_replaced.mat','A');
    end
end

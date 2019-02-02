function [A]=replacing_pixel_value(A,x,y,pval)
%-----------------------------------------------------------------
% Changes value of each pixel by traversing through each layer.
%------------------------------------------------------------------
%load A; load x; load y; load pval;

fprintf('\n\n PIXEL MODULE: This module is helpful if a value is appearing in two layers \n\n')
reply_module_select=input('Press ENTER key to continue else type O then hit ENTER key :   ');

if ~isempty(reply_module_select)        % i.e. NO
    fprintf('\n Note:  You chose to skip this module..!\n');
    return
end

fprintf('\n Entering in PIXEL module.....\n');
i=0;
replacement=1;
uni=unique(A);

while replacement==1
    i=i+1;
    
    [a,b] = find(A == uni(i));
    figure(2); clf; plotgraph(A,x,y,pval); hold on;
    plot(b,a,'*')
    
    reply_layer_select = input('Change this LAYER PIXEL value (Yes = ENTER key, No= Any Else Key )');
    
    if isempty(reply_layer_select)  % i.e. YES
        reply_area_select=input('Do you want to select an area(Press 0) or go point by point(Press 1)');
        
        if reply_area_select==0 % search within selected area
            fprintf('\n Select the diagonal coordinates of the search rectangle (left top, right bottom)\n')
            rect = floor(getrect(figure(2)));               % rect = [xmin ymin width height]
            [r, c] = find(A(rect(2):rect(2)+rect(4), rect(1):rect(1)+rect(3))==uni(i));
            coord_r = r + rect(2)-1;
            coord_c = c + rect(1)-1;
            replace = input('Enter value to replace this pixel');
            for k=1:length(coord_r)
                A(coord_r(k),coord_c(k))=replace;
            end
            fprintf('\n-----------RESTART---------\n')
                        
        elseif reply_area_select==1 % search point by point for complete layer
            for j=1:length(a)
                
                figure(2); clf; plotgraph(A,x,y,pval); hold on
                plot(b(j),a(j),'*'); title(strcat('Highlighted pixel value is : ',int2str(uni(i))))
                
                replace_pixel_value=input('Replace this pixel value with');
                if ~isempty(replace_pixel_value)
                    A(a(j),b(j))=replace_pixel_value;
                end
            end
        end
        i=0;        % reset counter.
    end
    
    uni=unique(A);
    if (i==length(uni))
        replacement = 0;
        fprintf('type "dbcont"')
        keyboard
        save('data_pixel_replaced.mat','A');
    end 
end
%end






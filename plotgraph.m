
function plotgraph(A,x,y,pval)
imagesc(A); colormap(gray); hold on
for i=1:length(x)
    text(x(i),y(i),int2str(pval(i)))
end
end
%making pretty graphs
function pretty_graphs (vidName, outDir, mode, Stack, x0, x1, y0, y1)
 
if nargin < 5
      fig=plot(Stack(:,10,10,1));
 title([vidName ' ' mode ' channel 1'])
 saveas(fig, fullfile(outDir,[vidName mode '-1-.fig']));
  fig=plot(Stack(:,10,10,2));
 title([vidName ' ' mode ' channel 2'])
  saveas(fig, fullfile(outDir,[vidName mode '-2-.fig']));
  fig=plot(Stack(:,10,10,3));
 title([vidName ' ' mode ' channel 3'])
  saveas(fig, fullfile(outDir,[vidName mode '-3-.fig']));
  
  end

if nargin > 4
%luminescence
 fig= plot(mean(mean(Stack(:,:,:,1),2),3))
 title([vidName ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 1'])
 saveas(fig, fullfile(outDir,[vidName mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-1-.fig']));
 
 fig= plot(mean(mean(Stack(:,:,:,2),2),3))
 title([vidName ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 2'])
 saveas(fig, fullfile(outDir,[vidName mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-2-.fig']));
 
 fig= plot(mean(mean(Stack(:,:,:,3),2),3))
 title([vidName ' ' mode '-' num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1) '-channel 3'])
 saveas(fig, fullfile(outDir,[vidName mode num2str(x0) '-' num2str(x1) '-' num2str(y0) '-' num2str(y1)  '-3-.fig']));

end

end
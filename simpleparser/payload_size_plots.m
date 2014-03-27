function [ ] = payload_size_plots( BitTorrent, FTP, HTTP, VoIP )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cdfx = 'Payload Size';
cdfy = 'F(Payload Size)';

pdfx = 'Payload Size';
pdfy = 'f(Payload Size)';

fcnt = 0;

% CDF Plots
sortedPayloads = sort(BitTorrent(:,4));
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedPayloads);
title('BitTorrent Payload Size CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'BitTorrent_Payload_Size_CDF.pdf');
close

sortedPayloads = sort(FTP(:,4));
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedPayloads);
title('FTP Payload Size CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'FTP_Payload_Size_CDF.pdf');
close

sortedPayloads = sort(HTTP(:,4));
fcnt = fcnt+1;
fig = figure(fcnt);
cdfplot(sortedPayloads);
title('HTTP Payload Size CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'HTTP_Payload_Size_CDF.pdf');
close

sortedPayloads = sort(VoIP(:,4));
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedPayloads);
title('VoIP Payload Size CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'VoIP_Payload_Size_CDF.pdf');
close


% PDF Plots
sortedPayloads = sort(BitTorrent(:,4));
curMean = mean(sortedPayloads);
curStd = std(sortedPayloads);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedPayloads, curMean, curStd);
plot(sortedPayloads, pdf);
title('BitTorrent Payload Size PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'BitTorrent_Payload_Size_PDF.pdf');
close

sortedPayloads = sort(FTP(:,4));
curMean = mean(sortedPayloads);
curStd = std(sortedPayloads);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedPayloads, curMean, curStd);
plot(sortedPayloads, pdf);
title('FTP Payload Size PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'FTP_Payload_Size_PDF.pdf');
close

sortedPayloads = sort(HTTP(:,4));
curMean = mean(sortedPayloads);
curStd = std(sortedPayloads);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedPayloads, curMean, curStd);
plot(sortedPayloads, pdf);
title('HTTP Payload Size PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'HTTP_Payload_Size_PDF.pdf');
close

sortedPayloads = sort(VoIP(:,4));
curMean = mean(sortedPayloads);
curStd = std(sortedPayloads);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedPayloads, curMean, curStd);
plot(sortedPayloads, pdf);
title('VoIP Payload Size PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'VoIP_Payload_Size_PDF.pdf');
close

end


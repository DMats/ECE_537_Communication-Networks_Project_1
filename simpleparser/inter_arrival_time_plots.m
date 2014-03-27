function [  ] = inter_arrival_time_plots( BitTorrent, FTP, HTTP, VoIP )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

cdfx = 'Inter-arrival Time';
cdfy = 'F(Inter-arrival Time)';

pdfx = 'Inter-arrival Time';
pdfy = 'f(Inter-arrival Time)';

fcnt = 0;



% CDF Plots
capLen = numel(BitTorrent(:,4));
IAT = (BitTorrent(2:capLen,3) - BitTorrent(1:capLen-1, 3));
sortedIAT = sort(IAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedIAT);
title('BitTorrent Inter-arrival Time CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'BitTorrent_IAT_CDF.pdf');
close

capLen = numel(FTP(:,4));
IAT = (FTP(2:capLen,3) - FTP(1:capLen-1, 3));
sortedIAT = sort(IAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedIAT);
title('FTP Inter-arrival Time CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'FTP_IAT_CDF.pdf');
close

capLen = numel(HTTP(:,4));
IAT = (HTTP(2:capLen,3) - HTTP(1:capLen-1, 3));
sortedIAT = sort(IAT);
fcnt = fcnt+1;
fig = figure(fcnt);
cdfplot(sortedIAT);
title('HTTP Inter-arrival Time CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'HTTP_IAT_CDF.pdf');
close

capLen = numel(VoIP(:,4));
IAT = (VoIP(2:capLen,3) - VoIP(1:capLen-1, 3));
sortedIAT = sort(IAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
cdfplot(sortedIAT);
title('VoIP Inter-arrival Time CDF');
xlabel(cdfx);
ylabel(cdfy);
saveas(fig, 'VoIP_IAT_CDF.pdf');
close


% PDF Plots
capLen = numel(BitTorrent(:,4));
IAT = (BitTorrent(2:capLen,3) - BitTorrent(1:capLen-1, 3));
sortedIAT = sort(IAT);
curMean = mean(sortedIAT);
curStd = std(sortedIAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedIAT, curMean, curStd);
plot(sortedIAT, pdf);
title('BitTorrent Inter-arrival Time PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'BitTorrent_IAT_PDF.pdf');
close

capLen = numel(FTP(:,4));
IAT = (FTP(2:capLen,3) - FTP(1:capLen-1, 3));
sortedIAT = sort(IAT);
curMean = mean(sortedIAT);
curStd = std(sortedIAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedIAT, curMean, curStd);
plot(sortedIAT, pdf);
title('FTP Inter-arrival Time PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'FTP_IAT_PDF.pdf');
close

capLen = numel(HTTP(:,4));
IAT = (HTTP(2:capLen,3) - HTTP(1:capLen-1, 3));
sortedIAT = sort(IAT);
curMean = mean(sortedIAT);
curStd = std(sortedIAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedIAT, curMean, curStd);
plot(sortedIAT, pdf);
title('HTTP Inter-arrival Time PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'HTTP_IAT_PDF.pdf');
close

capLen = numel(VoIP(:,4));
IAT = (VoIP(2:capLen,3) - VoIP(1:capLen-1, 3));
sortedIAT = sort(IAT);
curMean = mean(sortedIAT);
curStd = std(sortedIAT);
fcnt = fcnt + 1;
fig = figure(fcnt);
pdf = normpdf(sortedIAT, curMean, curStd);
plot(sortedIAT, pdf);
title('VoIP Inter-arrival Time PDF');
xlabel(pdfx);
ylabel(pdfy);
saveas(fig, 'VoIP_IAT_PDF.pdf');
close

end



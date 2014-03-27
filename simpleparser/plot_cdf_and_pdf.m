clear
clc

formatSpec = '%d %c %*c %*c %ld %d'; 
size = [4 Inf];

filename = 'BitTorrent_Output.txt';
fid = fopen(filename);
BitTorrent = fscanf(fid, formatSpec, size);
fclose(fid);
BitTorrent = BitTorrent';

filename = 'FTP_Output.txt';
fid = fopen(filename);
FTP = fscanf(fid, formatSpec, size);
fclose(fid);
FTP = FTP';

filename = 'HTTP_Facebook_Output.txt';
fid = fopen(filename);
HTTP = fscanf(fid, formatSpec, size);
fclose(fid);
HTTP = HTTP';

filename = 'VoIP_Output.txt';
fid = fopen(filename);
VoIP = fscanf(fid, formatSpec, size);
fclose(fid);
VoIP = VoIP';

payload_size_plots(BitTorrent, FTP, HTTP, VoIP);

inter_arrival_time_plots(BitTorrent, FTP, HTTP, VoIP);
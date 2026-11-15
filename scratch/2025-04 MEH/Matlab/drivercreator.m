clearvars; close all; clc;

% Folder to store driver files:
f		= ['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ... 
	'_Audio\_Aankloot\2025-04 MEH\Drivers'];

% Build driver objects

%% B&C 12NBX100-8
w		= speaker.woofer;
w.brand	= "B&C";
w.model = "12NBX100-8";
w.size	= 12;
w.re	= 5.1;
w.qes	= 0.24;
w.qms	= 3.9;
w.fs	= 41;
w.sd	= 531e-4;
w.vas	= 51e-3;
w.le	= 1.9e-3;
w.xmax	= 10e-3;
w.paes	= 2e3;

bc12nbx100_8	= w;

% Save driver as mat file:
save(fullfile(f,"bc12nbx100_8.mat"),"bc12nbx100_8")

%% B&C 5NSM38-8

w		= speaker.woofer;
w.brand	= "B&C";
w.model = "5NSM38-8";
w.size	= 5;
w.re	= 5.3;
w.qes	= 0.99;
w.qms	= 4.1;
w.fs	= 300;
w.sd	= 92e-4;
w.vas	= .3e-3;
w.le	= .15e-3;
w.xmax	= 3e-3;
w.paes	= 220;

bc5nsm38_8		= w;

% Save driver as mat file:
save(fullfile(f,"bc5nsm38_8.mat"),"bc5nsm38_8")

%% B&C 12NDL88-8

w		= speaker.woofer;
w.brand	= "B&C";
w.model = "12NDL88-8";
w.size	= 12;
w.re	= 5;
w.qes	= 0.29;
w.qms	= 5;
w.fs	= 51;
w.sd	= 522e-4;
w.vas	= 52e-3;
w.le	= 1.3e-3;
w.xmax	= 9.5e-3;
w.paes	= 1400;

bc12ndl88_8		= w;

% Save driver as mat file:
save(fullfile(f,"bc12ndl88_8.mat"),"bc12ndl88_8")

%% EIGHTEENSOUND 12NLW9300-8

w		= speaker.woofer;
w.brand	= "Eighteensound";
w.model = "12NLW9300-8";
w.size	= 12;
w.re	= 4.7;
w.qes	= 0.45;
w.qms	= 5.5;
w.fs	= 47;
w.sd	= 531e-4;
w.vas	= 56e-3;
w.le	= .53e-3;
w.xmax	= 8e-3;
w.paes	= 800;

eighteensound12nlw9300_8		= w;

% Save driver as mat file:
save(fullfile(f,"eighteensound12nlw9300_8.mat"), ...
	"eighteensound12nlw9300_8")

%% EIGHTEENSOUND 12NTLW2500-8

w		= speaker.woofer;
w.brand	= "Eighteensound";
w.model = "12NTLW2500-8";
w.size	= 12;
w.re	= 5;
w.qes	= 0.39;
w.qms	= 8.4;
w.fs	= 60;
w.sd	= 531e-4;
w.vas	= 45e-3;
w.le	= .44e-3;
w.xmax	= 8e-3;
w.paes	= 500;

eighteensound12ntlw2500_8		= w;

% Save driver as mat file:
save(fullfile(f,"eighteensound12ntlw2500_8.mat"), ...
	"eighteensound12ntlw2500_8")

%% EIGHTEENSOUND 12NTLW3500-8

w		= speaker.woofer;
w.brand	= "Eighteensound";
w.model = "12NTLW3500-8";
w.size	= 12;
w.re	= 5.1;
w.qes	= 0.34;
w.qms	= 8;
w.fs	= 53;
w.sd	= 531e-4;
w.vas	= 45e-3;
w.le	= .46e-3;
w.xmax	= 8.3e-3;
w.paes	= 900;

eighteensound12ntlw3500_8		= w;

% Save driver as mat file:
save(fullfile(f,"eighteensound12ntlw3500_8.mat"), ...
	"eighteensound12ntlw3500_8")

%% B&C 21SW152-8

w		= speaker.woofer;
w.brand	= "B&C";
w.model = "21SW152-8";
w.size	= 21;
w.re	= 6;
w.qes	= 0.38;
w.qms	= 6.4;
w.fs	= 32;
w.sd	= 1680e-4;
w.vas	= 200e-3;
w.le	= 2.2e-3;
w.xmax	= 16e-3;
w.paes	= 4000;

bc21sw152_8		= w;

% Save driver as mat file:
save(fullfile(f,"bc21sw152_8.mat"), ...
	"bc21sw152_8")
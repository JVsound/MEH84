function val = mehstages(eglf,egmf)

% Add driver files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ... 
	'_Audio\_Aankloot\2025-04 MEH\Drivers']);

%% LF

% Add ANSYS result files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ...
	'_Audio\_Aankloot\2025-04 MEH\Matlab\mehbuildinstages\resultfiles']);

% Simulation object names:

% Simulation objects:
% sim1		= acoustics.simulation;




% Simulation object:
% lf			= acoustics.simulation;
% lfwt		= acoustics.simulation;
% lfcl		= acoustics.simulation;
% lfbrm		= acoustics.simulation;
% lfbrm2		= acoustics.simulation;
% lfctlf		= acoustics.simulation;
% lfctlf2		= acoustics.simulation;
% lfctlf3		= acoustics.simulation;
% 
% % Assign woofer:
% lf.sp		= ...
% 	load("eighteensound12ntlw3500_8.mat").eighteensound12ntlw3500_8;
% lfwt.sp		= lf.sp;
% lfcl.sp		= lf.sp;
% lfbrm.sp	= lf.sp;
% lfbrm2.sp	= lf.sp;
% lfctlf.sp	= lf.sp;
% lfctlf2.sp	= lf.sp;
% lfctlf3.sp	= lf.sp;
% 
% % Create fea import object:
% feailf						= fea.feaimport;
% feailf.xdot					= 1e-3;
% feailf.sd					= lf.sp.sd;
% feailf.fnamediaphragmf		= "lfpf.txt";
% feailf.fnamediaphragmr		= "lfpr.txt";
% feailf.fnamexdottopres		= "lfp0.txt";
% feailfwt					= feailf;
% feailfwt.fnamediaphragmf	= "lfwtpf.txt";
% feailfwt.fnamediaphragmr	= "lfwtpr.txt";
% feailfwt.fnamexdottopres	= "lfwtp0.txt";
% feailfcl					= feailf;
% feailfcl.fnamediaphragmf	= "lfclpf.txt";
% feailfcl.fnamediaphragmr	= "lfclpr.txt";
% feailfcl.fnamexdottopres	= "lfclp0.txt";
% feailfbrm					= feailf;
% feailfbrm.fnamediaphragmf	= "lfbrmpf.txt";
% feailfbrm.fnamediaphragmr	= "lfbrmpr.txt";
% feailfbrm.fnamexdottopres	= "lfbrmp0.txt";
% feailfbrm2					= feailf;
% feailfbrm2.fnamediaphragmf	= "lfbrm2pf.txt";
% feailfbrm2.fnamediaphragmr	= "lfbrm2pr.txt";
% feailfbrm2.fnamexdottopres	= "lfbrm2p0.txt";
% feailfmlft					= feailf;
% feailfmlft.fnamediaphragmf	= "lfctlfpf.txt";
% feailfmlft.fnamediaphragmr	= "lfctlfpr.txt";
% feailfmlft.fnamexdottopres	= "lfctlfp0.txt";
% feailfmlft2					= feailf;
% feailfmlft2.fnamediaphragmf	= "lfctlf2pf.txt";
% feailfmlft2.fnamediaphragmr	= "lfctlf2pr.txt";
% feailfmlft2.fnamexdottopres	= "lfctlf2p0.txt";
% feailfmlft3					= feailf;
% feailfmlft3.fnamediaphragmf	= "lfctlf3pf.txt";
% feailfmlft3.fnamediaphragmr	= "lfctlf3pr.txt";
% feailfmlft3.fnamexdottopres	= "lfctlf3p0.txt";
% 
% % Assign FEA frequency to simulation object:
% lf.f					= feailf.fans;
% lf.feai					= feailf;
% lfwt.f					= feailfwt.fans;
% lfwt.feai				= feailfwt;
% lfcl.f					= feailfcl.fans;
% lfcl.feai				= feailfcl;
% lfbrm.f					= feailfbrm.fans;
% lfbrm.feai				= feailfbrm;
% lfbrm2.f				= feailfbrm2.fans;
% lfbrm2.feai				= feailfbrm2;
% lfctlf.f				= feailfmlft.fans;
% lfctlf.feai				= feailfmlft;
% lfctlf2.f				= feailfmlft2.fans;
% lfctlf2.feai			= feailfmlft2;
% lfctlf3.f				= feailfmlft3.fans;
% lfctlf3.feai			= feailfmlft3;
% 
% % Change RMS voltage:
% lf.eg					= eglf;
% lfwt.eg					= eglf;
% lfcl.eg					= eglf;
% lfbrm.eg				= eglf;
% lfbrm2.eg				= eglf;
% lfctlf.eg				= eglf;
% lfctlf2.eg				= eglf;
% lfctlf3.eg				= eglf;

%% MF

% Simulation object names:
sname1		= "mf";

% Degrees:
dg			= ["p0","p10","p20","p30","p40","p50","p60"];

% Add ANSYS result files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ...
	'_Audio\_Aankloot\2025-04 MEH\Matlab\mehbuildinstages\resultfiles']);

% Simulation object:
mfp0		= acoustics.simulation;

% Assign woofer:
mfp0.sp		= load("bc5nsm38_8.mat").bc5nsm38_8;

% Rear volume:
encl		= enclosure.closedbox(1e3);
mfp0.encl	= encl;

% Create fea import object:
feaimf						= fea.feaimport;
feaimf.xdot					= 1e-3;
feaimf.sd					= mfp0.sp.sd;
feaimf.fnamediaphragmf		= "mfpf.txt";
feaimf.fnamexdottopres		= "mfp0.txt";


% Assign FEA frequency to simulation object:
mfp0.f					= feaimf.fans;
mfp0.feai					= feaimf;
mfwt.f					= feaimfwt.fans;
mfwt.feai				= feaimfwt;
mfctlf.f				= feaimfmlft.fans;
mfctlf.feai				= feaimfmlft;
mfctlf2.f				= feaimfmlft2.fans;
mfctlf2.feai			= feaimfmlft2;
mfctlf3.f				= feaimfmlft3.fans;
mfctlf3.feai			= feaimfmlft3;
mfctlf3ls.f				= feaimfmlft3ls.fans;
mfctlf3ls.feai			= feaimfmlft3ls;

% Change RMS voltage:
mfp0.eg					= egmf;

%% Outputs
val.lf					= lf;

val.mf					= mfp0;
end
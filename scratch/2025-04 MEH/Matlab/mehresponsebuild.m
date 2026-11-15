function val = mehresponsebuild(eglf,egmf)

% Add driver files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ... 
	'_Audio\_Aankloot\2025-04 MEH\Drivers']);

%% LF

% lf:		complete low frequency sim
% lfwt:		low frequency sim without mf taps
% lfcl:		low frequency sim without br port (including mf taps)
% lfbrm:	low frequency sim with shorter br port
% lfbrm2:	low frequency sim with even shorter br port
% lfctlf:	low frequency sim with circular tap
% lfctlf2:	low frequency sim with circular tap moved
% lfctlf3:	low frequency sim with circular tap moved

% Add ANSYS result files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\_Audio' ...
	'\_Aankloot\2025-04 MEH\Matlab\resultfiles\mehv1\lf']);

% Simulation object:
lf			= acoustics.simulation;
lfwt		= acoustics.simulation;
lfcl		= acoustics.simulation;
lfbrm		= acoustics.simulation;
lfbrm2		= acoustics.simulation;
lfctlf		= acoustics.simulation;
lfctlf2		= acoustics.simulation;
lfctlf3		= acoustics.simulation;

% Assign woofer:
lf.sp		= ...
	load("eighteensound12ntlw3500_8.mat").eighteensound12ntlw3500_8;
lfwt.sp		= lf.sp;
lfcl.sp		= lf.sp;
lfbrm.sp	= lf.sp;
lfbrm2.sp	= lf.sp;
lfctlf.sp	= lf.sp;
lfctlf2.sp	= lf.sp;
lfctlf3.sp	= lf.sp;

% Create fea import object:
feailf						= fea.feaimport;
feailf.xdot					= 1e-3;
feailf.sd					= lf.sp.sd;
feailf.fnamediaphragmf		= "lfpf.txt";
feailf.fnamediaphragmr		= "lfpr.txt";
feailf.fnamexdottopres		= "lfp0.txt";
feailfwt					= feailf;
feailfwt.fnamediaphragmf	= "lfwtpf.txt";
feailfwt.fnamediaphragmr	= "lfwtpr.txt";
feailfwt.fnamexdottopres	= "lfwtp0.txt";
feailfcl					= feailf;
feailfcl.fnamediaphragmf	= "lfclpf.txt";
feailfcl.fnamediaphragmr	= "lfclpr.txt";
feailfcl.fnamexdottopres	= "lfclp0.txt";
feailfbrm					= feailf;
feailfbrm.fnamediaphragmf	= "lfbrmpf.txt";
feailfbrm.fnamediaphragmr	= "lfbrmpr.txt";
feailfbrm.fnamexdottopres	= "lfbrmp0.txt";
feailfbrm2					= feailf;
feailfbrm2.fnamediaphragmf	= "lfbrm2pf.txt";
feailfbrm2.fnamediaphragmr	= "lfbrm2pr.txt";
feailfbrm2.fnamexdottopres	= "lfbrm2p0.txt";
feailfmlft					= feailf;
feailfmlft.fnamediaphragmf	= "lfctlfpf.txt";
feailfmlft.fnamediaphragmr	= "lfctlfpr.txt";
feailfmlft.fnamexdottopres	= "lfctlfp0.txt";
feailfmlft2					= feailf;
feailfmlft2.fnamediaphragmf	= "lfctlf2pf.txt";
feailfmlft2.fnamediaphragmr	= "lfctlf2pr.txt";
feailfmlft2.fnamexdottopres	= "lfctlf2p0.txt";
feailfmlft3					= feailf;
feailfmlft3.fnamediaphragmf	= "lfctlf3pf.txt";
feailfmlft3.fnamediaphragmr	= "lfctlf3pr.txt";
feailfmlft3.fnamexdottopres	= "lfctlf3p0.txt";

% Assign FEA frequency to simulation object:
lf.f					= feailf.fans;
lf.feai					= feailf;
lfwt.f					= feailfwt.fans;
lfwt.feai				= feailfwt;
lfcl.f					= feailfcl.fans;
lfcl.feai				= feailfcl;
lfbrm.f					= feailfbrm.fans;
lfbrm.feai				= feailfbrm;
lfbrm2.f				= feailfbrm2.fans;
lfbrm2.feai				= feailfbrm2;
lfctlf.f				= feailfmlft.fans;
lfctlf.feai				= feailfmlft;
lfctlf2.f				= feailfmlft2.fans;
lfctlf2.feai			= feailfmlft2;
lfctlf3.f				= feailfmlft3.fans;
lfctlf3.feai			= feailfmlft3;

% Change RMS voltage:
lf.eg					= eglf;
lfwt.eg					= eglf;
lfcl.eg					= eglf;
lfbrm.eg				= eglf;
lfbrm2.eg				= eglf;
lfctlf.eg				= eglf;
lfctlf2.eg				= eglf;
lfctlf3.eg				= eglf;

%% MF

% mf:		complete mid frequency sim
% mfwt:		mid frequency sim without mf taps
% mfctlf:	mid frequency sim with circular lf taps
% mfctlf2:	mid frequency sim with circular lf taps, moved taps
% mfctlf3:	mid frequency sim with circular lf taps, moved taps 3
% mfctlf2ls:mid frequency sim with circular lf taps, moved taps 3, larger
% absorption sphere.

% Add ANSYS result files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\_Audio' ...
	'\_Aankloot\2025-04 MEH\Matlab\resultfiles\mehv1\mf']);

% Simulation object:
mf			= acoustics.simulation;
mfwt		= acoustics.simulation;
mfctlf		= acoustics.simulation;
mfctlf2		= acoustics.simulation;
mfctlf3		= acoustics.simulation;
mfctlf3ls	= acoustics.simulation;

% Assign woofer:
mf.sp		= load("bc5nsm38_8.mat").bc5nsm38_8;
mfwt.sp		= mf.sp;
mfctlf.sp	= mf.sp;
mfctlf2.sp	= mf.sp;
mfctlf3.sp	= mf.sp;
mfctlf3ls.sp= mf.sp;

% Rear volume:
encl		= enclosure.closedbox(1e3);
mf.encl		= encl;
mfwt.encl	= encl;
mfctlf.encl	= encl;
mfctlf2.encl= encl;
mfctlf3.encl= encl;
mfctlf3ls.encl=encl;

% Create fea import object:
feaimf						= fea.feaimport;
feaimf.xdot					= 1e-3;
feaimf.sd					= mf.sp.sd;
feaimf.fnamediaphragmf		= "mfpf.txt";
feaimf.fnamexdottopres		= "mfp0.txt";
feaimfwt					= feaimf;
feaimfwt.fnamediaphragmf	= "mfwtpf.txt";
feaimfwt.fnamexdottopres	= "mfwtp0.txt";
feaimfmlft					= feaimf;
feaimfmlft.fnamediaphragmf	= "mfctlfpf.txt";
feaimfmlft.fnamexdottopres	= "mfctlfp0.txt";
feaimfmlft2					= feaimf;
feaimfmlft2.fnamediaphragmf	= "mfctlf2pf.txt";
feaimfmlft2.fnamexdottopres	= "mfctlf2p0.txt";
feaimfmlft3					= feaimf;
feaimfmlft3.fnamediaphragmf	= "mfctlf3pf.txt";
feaimfmlft3.fnamexdottopres	= "mfctlf3p0.txt";
feaimfmlft3ls					= feaimf;
feaimfmlft3ls.fnamediaphragmf	= "mfctlf3lspf.txt";
feaimfmlft3ls.fnamexdottopres	= "mfctlf3lsp0.txt";

% Assign FEA frequency to simulation object:
mf.f					= feaimf.fans;
mf.feai					= feaimf;
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
mf.eg					= egmf;
mfwt.eg					= egmf;
mfctlf.eg				= egmf;
mfctlf2.eg				= egmf;
mfctlf3.eg				= egmf;
mfctlf3ls.eg			= egmf;

%% Outputs
val.lf					= lf;
val.lfwt				= lfwt;
val.lfcl				= lfcl;
val.lfbrm				= lfbrm;
val.lfbrm2				= lfbrm2;
val.lfctlf				= lfctlf;
val.lfctlf2				= lfctlf2;
val.lfctlf3				= lfctlf3;

val.mf					= mf;
val.mfwt				= mfwt;
val.mfctlf				= mfctlf;
val.mfctlf2				= mfctlf2;
val.mfctlf3				= mfctlf3;
val.mfctlf3ls			= mfctlf3ls;
end
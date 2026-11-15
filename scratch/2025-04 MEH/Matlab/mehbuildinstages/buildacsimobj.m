function val = buildacsimobj(str,eg,xdot)
%BUILDACSIMOBJ Build acoustic sim object.

% Add directory for drivers to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ... 
	'_Audio\_Aankloot\2025-04 MEH\Drivers']);

% Add result files directory to path:
addpath(['D:\OneDrive - Spierings Mobile Cranes\Werkmap - Prive\' ...
	'_Audio\_Aankloot\2025-04 MEH\Matlab\mehbuildinstages\resultfiles']);

% Simulation object:
val			= acoustics.simulation;

% LF or MF simulation

% String to char:
strch		= char(str);
pidx		= strfind(strch,'p');
strch2		= strch(1:pidx-1);

if strncmpi(strch,'lf',2)
	% LF simulation
	sp			= ...
		load("eighteensound12ntlw3500_8.mat").eighteensound12ntlw3500_8;

	val.sp		= sp;

	% feai object:
	feai					= fea.feaimport;
	feai.xdot				= xdot;
	feai.sd					= sp.sd;
	feai.fnamediaphragmf	= [strch2 'pf.txt'];
	feai.fnamediaphragmr	= [strch2 'pr.txt'];
	feai.fnamexdottopres	= [strch '.txt'];

	val.feai	= feai;
	val.f		= feai.fans;
else
	% MF simulation:
	sp			= load("bc5nsm38_8.mat").bc5nsm38_8;

	val.sp		= sp;

	% Enclosure:
	val.encl	= enclosure.closedbox(1e5);

	% feai object:
	feai					= fea.feaimport;
	feai.xdot				= xdot;
	feai.sd					= sp.sd;
	feai.fnamediaphragmf	= [strch2 'pf.txt'];
	feai.fnamexdottopres	= [strch '.txt'];

	val.feai	= feai;
	val.f		= feai.fans;
end

val.eg		= eg;

end


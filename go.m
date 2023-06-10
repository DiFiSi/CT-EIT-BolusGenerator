%% Prepare workspace, load models and load EIDORS
cd(fileparts(matlab.desktop.editor.getActiveFilename));
addpath(genpath(".\utils"));
addpath(genpath(".\gammaModels"));
addpath(genpath(".\artifactModels"));

%% Initialize time and measurement system constants
T = 30; % s

kEIT = [70;1]; % Rel. Cond.
kCT = [800;1]; % Hounsfield Units (HU)

fsSource = 1000; % Hz
fsEIT = 50; % Hz
fsCT = 1; % Hz

tSource = linspace(0, T, T * fsSource)';
tEIT = linspace(0, T, T * fsEIT)';
tCT = linspace(0, T, T * fsCT)';

%% Define hemodynamic parameters and plot signals
nPasses = [1; 0];
Tpeak = [5; 10]; % s
MTT = [5; 10]; % s
RD = [0.16; 0.2]; % a.u.
RF = [0.1; 0.15];
[A,B,TTP,TOA] = prepVars(Tpeak,MTT,RD);

ySource = gamRe2Fun(nPasses, [1; 1], A, B, TTP, TOA, RF, tSource);
yEIT = gamRe2Fun(nPasses, kEIT, A, B, TTP, TOA, RF, tEIT);
yCT = gamRe2Fun(nPasses, kCT, A, B, TTP, TOA, RF, tCT);

% Plotting
figure;
subplot(1,3,1);
plot(ySource);
ylabel("Amplitude [n.u.]");
xlabel("Time [s]")
title("Source");

subplot(1,3,2);
plot(yEIT);
ylabel("Amplitude [a.u.]");
xlabel("Time [s]")
title("EIT");

subplot(1,3,3);
plot(yCT);
ylabel("Amplitude [HU]");
xlabel("Time [s]")
title("CT");

sgtitle("Clean signals");

%% Add noise
% EIT
KArtEIT = 0.1 * kEIT(1);
artTp = 'heart';
yArtEIT = mkArtEIT(KArtEIT, artTp);

yEITNoisy = yEIT + yArtEIT;

% CT
HR = 1; % Hz
RR = 0.2; % Hz
KArtCT = 1;
yCTBkg = [zeros(5,1);0.5 * yCT(1:end - 5)];
yArtCT = mkArtCT(KArtCT,[yCT,yCTBkg],[HR;RR],tCT);

yCTNoisy = yCT + yArtCT;

% Plotting
figure;
subplot(2,2,1);
plot(yArtEIT);
ylabel("Amplitude [a.u.]");
xlabel("Time [s]")
title("EIT Noise");

subplot(2,2,3);
plot(yEITNoisy);
ylabel("Amplitude [a.u.]");
xlabel("Time [s]")
title("EIT Noisy");

subplot(2,2,2);
plot(yArtCT);
ylabel("Amplitude [HU]");
xlabel("Time [s]")
title("CT Noise");

subplot(2,2,4);
plot(yCTNoisy);
ylabel("Amplitude [HU]");
xlabel("Time [s]")
title("CT Noisy");

sgtitle("Noisy signals")

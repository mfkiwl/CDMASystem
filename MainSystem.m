% clc;
clear all;

addpath(genpath('Blocks'));

%% System Initialisation
% Random seed set to 100
% rng(100);
% Initialising System Parameters
txParams = txConfig();

%% Generating Data

% Generating random data
txBitStreamMat = randi([0, 1], txParams.dataLength, txParams.numUsers);


%% Data Processing at Tx
% Passing the data for transmissioned.

txOut = Transmitter(txBitStreamMat, txParams);

%% AWGN Channel
% Noise

SNR = 10 ^ (txParams.SNRdb / 10);
noiseMat = (1 / sqrt(2 * SNR)) .* (randn(size(txDataStreamMat)) + (1i) * randn(size(txDataStreamMat)));
rxDataStreamMat = txDataStreamMat + noiseMat;

%% Receiver
% Detecting the information from received signal
rxBitStreamMat = Receiver(rxDataStreamMat, txParams);

% Error in received bitstream
errBits = sum(bitxor(txBitStreamMat, rxBitStreamMat));

if (~errBits)
    disp('Successful Transmission');
else
    disp('Err Bits:');
    disp(errBits);
end
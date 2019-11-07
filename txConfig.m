function txParams = txConfig()
    txParams.QAM = 4;

    % SNR in db
    txParams.SNRdb = 10;
    
    % Trellis Structure for 1/2 code rate convolution coder obtained from
    % a MATLAB tutorial on channel coding. (Constraint length, M = 7)
    txParams.coding.cc.trellis = poly2trellis(7, {'1 + x^3 + x^4 + x^5 + x^6', '1 + x + x^3 + x^4 + x^6'});
    txParams.coding.cc.tbl = 32;
    txParams.coding.codeRate = 1/2;
    
    % Length of each message of every user
    txParams.dataLength = 960;
    
    % User wideband code properties
    txParams.chipLen = 7;
    
    % Number of users
    txParams.numUsers = 2;
        
end
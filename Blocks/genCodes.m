% genCodes: Generate Maximal length PN Sequences or Walsh codes for 
% Multiple Access
% Input: txParams
%        txParams  - A structure containing system parameters like
%                         number of users, code rate, qam alphabet etc.
%
% Output: userCodes - A matrix containing the wideband code assigned for 
%                     each user at every column.
%

function userCodes = genCodes(txParams)
    userCodes = zeros(txParams.chipLen, txParams.numUsers);
    
    pnSeqGen = comm.PNSequence('Polynomial', 'z^7 + z^6 + z^2 + 1', ...
           'SamplesPerFrame', txParams.chipLen, 'InitialConditions', randi([0, 1], 1, txParams.chipLen));
    
    for iter_users = 1:txParams.numUsers
        userCodes(:, iter_users) = pnSeqGen();
    end

end
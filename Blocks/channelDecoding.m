% Channel Decoder: Performs convolution decoding of the multi-user encoded
%                  data matrix
%
% Input: encodedData, txParams
%        encodedData    - A matrix containing convolutionally encoded 
%                         information of multiple user where each user is 
%                         assigned one column.
%        txParams       - A structure containing system parameters like
%                         number of users, code rate, qam alphabet etc.
%
% Output: data   - A matrix containing information of multiple user
%                         where each user is assigned one column.
%

function data = channelDecoding(encodedData, txParams)   
    % Perform convolutional decoding
    data = vitdec(encodedData, txParams.coding.cc.trellis, txParams.coding.cc.tbl, 'trunc', 'hard');
end
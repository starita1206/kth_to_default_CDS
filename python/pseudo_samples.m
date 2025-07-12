%I used online Matlab -> Make sure this is in MATLAB Drive
filePath = 'cds_differences_cleaned.xlsx';

%read the data from Excel
data = readtable(filePath);

%remove the 'Date' column
data = data(:, 2:end);

%extract the 5 names
names = data.Properties.VariableNames;

%define all bandwidths
bandwidths = [0.0005, 0.002875, 0.00525, 0.007625, 0.01];

%loop over each bandwidth
for bw = bandwidths
    CDSPseudo = [];
    
    %for each column in the table, compute the pseudo-samples using ksdensity
    for k = 1:width(data)
        colData = data{:, k};
        
        %estimate the CDF at each data point
        [pseudoSamples, ~] = ksdensity(colData, colData, 'Function', 'cdf', 'Bandwidth', bw);
        
        %save the results as a column in the matrix
        CDSPseudo(1:length(pseudoSamples), k) = pseudoSamples;
    end
    
    %convert the matrix to a table and apply the original column names
    PseudoTable = array2table(CDSPseudo, 'VariableNames', names);
    
    %save each bandwidth’s result as a separate Excel file
    outputFileName = sprintf('CDSPseudo_%.5f.xlsx', bw);
    writetable(PseudoTable, outputFileName);
    
    fprintf('Saved pseudo-samples for bandwidth %.5f to %s\n', bw, outputFileName);
end
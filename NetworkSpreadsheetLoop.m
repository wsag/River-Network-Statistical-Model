% NetworkSpreadsheetLoop.m
% This code loops inputs through the Network Spreadsheet models and saves
% the output from each run to a common matrix, then saves to an output file.

% Set variable options. For example, use runoffs of 250, 500, 10000.
% The variable names that are used here are identical to the spreadsheet model.
AcutalRO = [250,500,1000]; 
Width_a = [4, 8, 12]; 
Width_b = [0.4, 0.5, 0.6];
atasite_b = [0, 0.1, 0.2];
Process_Constant = [35];
Process_Slope = [0];

%Print out the current iteration. This simply lets the user know how quickly
%the loop is running. 
i = 1; display(i);

%Prime matrix for the output. NRows = 56 are what are currently saved in
% the network spreadsheet models as relevant output (column P, rows 3-58)
% The number of columns is depending on the number of iterations, thus is 
% calculated here as NCols.
NRows = 56;
NCols = length(AcutalRO)*length(Width_a)*length(Width_b)*length(atasite_b)*...
    length(Process_Constant)*length(Process_Slope);
Results = nan(56,NCols);

%Run nested "For loops" for each potential combination of variables.
for r = 1:length(AcutalRO)
    Var1 = AcutalRO(r); 

    for x = 1:length(Width_a)
        Var2 = Width_a(x);

        for y = 1:length(Width_b)
            Var3 = Width_b(y);

            for z = 1:length(atasite_b)
                Var4 = atasite_b(z);
                
                for vf = 1:length(Process_Constant)
                        Var5 = Process_Constant(vf);
                    
                    for m = 1:length(Process_Slope)
                        Var6 = Process_Slope(m);
                        
                        %Print iteration
                        disp(i)
                        
                        %Collect input variables into single matrix
                        Vars = [Var1; Var2; Var3; Var4; Var5; Var6];

                        %Input these variables into the speadsheet. Note that I am 
                        %calling a specific shape (Rectangle) 
                        xlswrite("MatlabCompatible-Rectangle-GPPER_CLEAN.xlsx",Vars,"MAIN",['P11'])

                        %Read the spreadsheet out, which has now incorporated the
                        %new inputs.
                        [Rectangle, VariableNames] = xlsread("MatlabCompatible-Rectangle-GPPER_CLEAN",...
                            "MAIN");

                        %Save the results of the new variables to a matrix which 
                        %compiles all of the output.
                        Results(:,i) = Rectangle(1:NRows,16);
                        
                        % Save column names during first iteration
                        if i == 1
                            ColNames = VariableNames(3:NRows+2,15);
                        end

                        %Count up to a new iteration and then print to screen. 
                        i = i + 1; 
                    end
                end      
            end
        end
    end
end


%Write compiled output to a new excel file. Columns correspond to 
xlswrite("NetworkSpreadsheetLoop_Output.xlsx",Results','Output','A2')
xlswrite("NetworkSpreadsheetLoop_Output.xlsx",ColNames','Output','A1')


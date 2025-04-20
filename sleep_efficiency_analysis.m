% Sleep Efficiency Analysis in MATLAB
% ------------------------------------------------------------
% This script performs both Exploratory Data Analysis (EDA)
% and Hypothesis Testing on a sleep dataset from Kaggle.
% ------------------------------------------------------------

%% Load and Clean Dataset
T = readtable('sleep efficiency.xlsx');
T.Properties.VariableNames = matlab.lang.makeValidName(T.Properties.VariableNames);

% Remove ID column if present
if ismember('ID', T.Properties.VariableNames)
    T.ID = [];
end

%% Preview and Summary
disp('First few rows:'); disp(head(T))
disp('Descriptive stats:'); summary(T)

%% -----------------------------
% Exploratory Data Analysis (EDA)
%% -----------------------------

% Histogram of Sleep Efficiency (%)
figure;
histogram(T.SleepEfficiency * 100)
xlabel('Sleep Efficiency (%)')
ylabel('Number of Patients')
title('Distribution of Sleep Efficiency')
xline(mean(T.SleepEfficiency)*100, 'r--', 'Mean')
grid on;

% Histogram of Sleep Duration
figure;
histogram(T.SleepDuration)
xlabel('Sleep Duration (hours)')
ylabel('Number of Patients')
title('Distribution of Sleep Duration')
xline(mean(T.SleepDuration), 'r--', 'Mean')
grid on;

% Scatterplot: Sleep Duration vs Sleep Efficiency
figure;
scatter(T.SleepDuration, T.SleepEfficiency, 'o')
xlabel('Sleep Duration (hours)')
ylabel('Sleep Efficiency (%)')
title('Sleep Duration vs Sleep Efficiency')
grid on;
hold on;
mdl = fitlm(T.SleepDuration, T.SleepEfficiency);
plot(mdl)
legend('Data', 'Linear Fit')

% Scatterplot: Age vs Sleep Efficiency
figure;
scatter(T.Age, T.SleepEfficiency, 'o')
xlabel('Age')
ylabel('Sleep Efficiency (%)')
title('Age vs Sleep Efficiency')
grid on;

% Boxplot of Sleep Duration by Gender
figure;
boxplot(T.SleepDuration, T.Gender)
xlabel('Gender')
ylabel('Sleep Duration (hours)')
title('Sleep Duration by Gender')
grid on;

% Boxplot of Sleep Efficiency by Gender
figure;
boxplot(T.SleepEfficiency, T.Gender)
xlabel('Gender')
ylabel('Sleep Efficiency (%)')
title('Sleep Efficiency by Gender')
grid on;

% Correlation Matrix
numVars = T{:, vartype('numeric')};
varNames = T.Properties.VariableNames(vartype('numeric'));
corrMatrix = corrcoef(numVars, 'Rows','complete');
figure;
heatmap(varNames, varNames, corrMatrix)
title('Correlation Matrix of Numeric Variables')

%% -----------------------------
% Hypothesis Testing
%% -----------------------------

% Hypothesis 1: Gender vs Sleep Efficiency
maleEff = T.SleepEfficiency(strcmp(T.Gender, 'Male'));
femaleEff = T.SleepEfficiency(strcmp(T.Gender, 'Female'));
[h1, p1] = ttest2(maleEff, femaleEff);
fprintf('Hypothesis 1 - Gender vs Sleep Efficiency:\n');
if h1 == 1
    fprintf('→ Reject H0: Significant difference (p = %.4f)\n\n', p1);
else
    fprintf('→ Fail to reject H0: No significant difference (p = %.4f)\n\n', p1);
end

% Hypothesis 2: Age vs Sleep Efficiency (Correlation)
[r2, p2] = corr(T.Age, T.SleepEfficiency, 'Rows','complete');
fprintf('Hypothesis 2 - Age vs Sleep Efficiency:\n');
fprintf('→ Correlation = %.4f, p-value = %.4f\n', r2, p2);
if p2 < 0.05
    fprintf('→ Reject H0: Significant relationship exists\n\n');
else
    fprintf('→ Fail to reject H0: No significant relationship\n\n');
end

% Hypothesis 3: Smoking vs Sleep Efficiency
smokerEff = T.SleepEfficiency(strcmp(T.SmokingStatus, 'Yes'));
nonSmokerEff = T.SleepEfficiency(strcmp(T.SmokingStatus, 'No'));
[h3, p3] = ttest2(smokerEff, nonSmokerEff);
fprintf('Hypothesis 3 - Smoking vs Sleep Efficiency:\n');
if h3 == 1
    fprintf('→ Reject H0: Significant difference (p = %.4f)\n\n', p3);
else
    fprintf('→ Fail to reject H0: No significant difference (p = %.4f)\n\n', p3);
end

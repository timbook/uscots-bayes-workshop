import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

import pystan

heights = pd.read_csv('data/heights.csv')

model_data = {
    'J' : heights.shape[0],
    'x' : heights['Mheight'],
    'y' : heights['Dheight']
}

model = pystan.StanModel(file='model.stan')
model_fit = model.sampling(
    data=model_data,
    n_jobs=4,
    verbose=True
)

print(model_fit.stansummary())

model_fit.traceplot()
plt.show()

params = model_fit.to_dataframe()

# Question 1
print("Question 1:")
print(np.mean(params['b1'] > 0.6))

# Question 2
print("Question 2:")
daughter_sim = params['b0'] + 66*params['b1']
print(np.mean(daughter_sim > 66))

# Question 3
print("Question 3:")
print(np.quantile(params['b1'], [0.025, 0.975]))

# Question 4
print("Question 4:")
daughter_sim = params['b0'] + 68*params['b1']
print(np.quantile(daughter_sim, [0.025, 0.975]))

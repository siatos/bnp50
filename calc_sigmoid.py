import matplotlib.pyplot as plt
from scipy.special import expit
import numpy as np

#define range of x-values
x = np.linspace(-10, 10, 100)

#calculate sigmoid function for each x-value
y = expit(x)
  
#create plot
plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('F(x)')

#display plot
plt.title('(Logistic) Sigmoid function')
plt.legend()
plt.show()

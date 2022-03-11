import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = [12, 8]

# Function defined with default values if none are passed
a=[1.2, 2.2, 2, 1]
#b=[1, 2, 4]
b=[1.2, 2.2, 1, 2]
V0=1
def gompertz_calc(a, b, V0):
    x = np.linspace(0, 8, 100)
    f = lambda x: V0*np.exp(a*(1 - np.exp(x*(-b)))/b) 
    return f(x),x

#for a_n in a:
#    for b_n in b:
    
for a_n, b_n in zip(a,b):
    # Plot all of your lines
    print(a_n, b_n)
    fp,x = gompertz_calc(a_n, b_n, V0)
    plt.plot(x, fp, label=f'a={a_n}, b={b_n}')

# Set Plot Details
plt.ylabel('y')
plt.xlabel('x')
plt.ylim(0, 10)
plt.xlim(0, 8)
plt.legend(loc="upper right")
plt.grid(True)
plt.show()





import numpy as np
import matplotlib.pyplot as plt

n1, n2, n3, n4 = 1, 2, 4, 8

S = np.linspace(0, 2, 1000)
def fraction(S, Ka, n):
    # return fraction of the macromolecule concentration that is bound by the ligand
    # Ka ndicates the concentration of ligand at which half of the binding sites are occupied by ligand
    # n is the Hill constant 
    return pow(S, n)/(pow(Ka,n) + pow(S, n)) 

Ka = 0.8
plt.plot(S, fraction(S, Ka, n1), label='n = 1, Ka = 0.8')
plt.plot(S, fraction(S, Ka, n2), label='n = 2, Ka = 0.8')
plt.plot(S, fraction(S, Ka, n3), label='n = 4, Ka = 0.8')
plt.plot(S, fraction(S, Ka, n4), label='n = 8, Ka = 0.8')
Ka = 1.2 
plt.plot(S, fraction(S, Ka, n1), label='n = 1, Ka = 1.2')
plt.plot(S, fraction(S, Ka, n2), label='n = 2, Ka = 1.2')
plt.plot(S, fraction(S, Ka, n3), label='n = 4, Ka = 1.2')
plt.plot(S, fraction(S, Ka, n4), label='n = 8, Ka = 1.2')
plt.title('Hill-Lagmuir for n =1, 2, 4, 8 and Ka = 0.8, 1.2')
plt.legend()
plt.show()


import numpy as np
import matplotlib.pyplot as plt

# Michaelis-Menten constants (M), maximum rate(M.s-1)
Km1, Km2, Km3, Vmax = 0.04, 0.2, 0.4, 0.01

# Grid of substrate concentration values (M)
S = np.linspace(0, 2, 1000)

def rate(S, Km, Vmax):
    return Vmax * S / (Km + S)

plt.plot(S, rate(S, Km1, Vmax), label='Km1 = 0.04')
plt.plot(S, rate(S, Km2, Vmax), label='Km2 = 0.2')
plt.plot(S, rate(S, Km3, Vmax), label='Km3 = 0.4')
plt.title('Michaelis-Menten for Km = 0.04, 0.2, 0.4 and substrate values 0..2')
plt.legend()
plt.show()


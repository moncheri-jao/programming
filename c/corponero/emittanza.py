import matplotlib.pyplot as mp
import numpy as np
T4, E = np.loadtxt("emittanza.dat", unpack = True)

mp.title('Legge di Stefan-Boltzmann')
mp.xlabel('Temperatura^4 (T^4)')
mp.ylabel('Emittanza')
mp.plot(T4, E, 'x', label='(T^4,E)')
mp.plot(T4, 6.49*T4, '--', label='y = 6.49 x')
mp.legend()
mp.show()

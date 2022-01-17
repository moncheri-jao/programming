import numpy as np
import matplotlib.pyplot as mp

data = np.loadtxt("der.csv", delimiter=",", unpack=True)
x, dfx = data[::]
mp.plot(x,dfx,'ro')
mp.show()

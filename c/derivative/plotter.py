import numpy as np
import matplotlib.pyplot as mp

data = np.loadtxt("der.csv", delimiter=",", unpack=True)
c1, c2 = data[::]
print(c1)
print(c2)
mp.plot(c2,c1,'ro')
mp.show()

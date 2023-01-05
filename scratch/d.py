import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator
import numpy as np

fig, ax = plt.subplots(subplot_kw={"projection": "3d"})

n = 600*(10**3)

# Make data.
W = np.linspace(2.0/n, 1, 50)
X = np.linspace(0, 1.0/n, 50)

W, X = np.meshgrid(W, X)
print(W, X)
#R = np.sqrt(W**2 + X**2)
#Z = np.sin(R)
Z1 = np.square(W)
#Z2 = np.square(W-2*X)/(1-(n+1)*X)
Z2 = np.square(W-2*X)
Z3 = 1-(n+1)*X
Z4 = np.divide(Z2, Z3)
Z = Z4 - Z1

print(np.max(Z))

def zero(x):
    return x if x > 0 else 0


for i in range(50):
    for j in range(50):
        w = W[i][j]
        x = X[i][j]
        if w < 2*x:
            Z[i][j] = 0
        if w > 1 - (n-1)*x:
            Z[i][j] = 0
        if Z[i][j] < 0:
            Z[i][j] = 0


#Z = np.vectorize(zero)(Z) 
print(Z)
print(np.max(Z))

ind = np.unravel_index(np.argmax(Z, axis=None), Z.shape)
print(ind, W[ind], X[ind], Z[ind])

#import pdb; pdb.set_trace()
#print(Z)

# Plot the surface.
surf = ax.plot_surface(W, X, Z, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)

# Customize the z axis.
ax.set_zlim(0, 0.3)
#ax.zaxis.set_major_locator(LinearLocator(10))
# A StrMethodFormatter is used automatically
ax.zaxis.set_major_formatter('{x:.02f}')

# Add a color bar which maps values to colors.
#fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()


'''
ggplot gramma:
    - data
    - aesthetics
    - geometric object 
    - facets
    - statistical transformations
    - coordinates
    - theme

note:
    matplotlib==3.5 

'''


import matplotlib

from plotnine.data import economics
from plotnine import ggplot, aes, geom_line

(
    ggplot(economics)  # What data to use
    + aes(x="date", y="pop")  # What variable to use
    + geom_line()  # Geometric object to use for drawing
)

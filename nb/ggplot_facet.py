from plotnine.data import mpg
from plotnine import ggplot, aes, facet_grid, labs, geom_point, theme_dark

from matplotlib import pyplot as plt

# 2-d facet grid with (year, class) for one plot 

p = (
    ggplot(mpg)
    + facet_grid(facets="year~class")
    + aes(x="displ", y="hwy")
    + labs(
        x="Engine Size",
        y="Miles per Gallon",
        title="Miles per Gallon for Each Year and Vehicle Class",
    )
    + geom_point()
    + theme_dark()
)

# save the plot
p.save('myplot.png', dpi=600)

fig = p.draw()
#print(type(fig))
plt.show()

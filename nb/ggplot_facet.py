import time
#import threading

from plotnine.data import mpg
from plotnine import ggplot, aes, facet_grid, labs, geom_point, theme_dark

from matplotlib import pyplot as plt


def close_all(): 
    print('close in 5 seconds')
    time.sleep(5)
    plt.close('all')
    print('done')


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
#p.save('myplot.png', dpi=600)

# render the plot (when running from the python command line)
(fig, plot) = p.draw(return_ggplot=True, show=True)


# NOT WORKING
# threading.Thread(target=close_all) 

# NOT WORKING EITHER (on mac)
# set the timer interval 5000 milliseconds
# (fig, plot) = p.draw(return_ggplot=True, show=False)
# timer = fig.canvas.new_timer(interval = 3000)
# timer.add_callback(close_all)
# timer.start()
# plt.figure()
# fig.show()
# plt.show()


# matplot way of rendering
# plt.draw()
# fig = plt.figure()
# plt.show()

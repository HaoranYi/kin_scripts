# box plot: show dist. and outliers (dot)
#   - box: 25%, 50%, 75% box
#   - min/max: q1 - 1.5*IQR, q3 + 1.5*IQR
#   - outlier (dot)
# https://plotnine.readthedocs.io/en/stable/api.html

from plotnine.data import huron
from plotnine import ggplot, aes, geom_boxplot

(
  ggplot(huron)
  + aes(x="factor(decade)", y="level")
  + geom_boxplot()
)

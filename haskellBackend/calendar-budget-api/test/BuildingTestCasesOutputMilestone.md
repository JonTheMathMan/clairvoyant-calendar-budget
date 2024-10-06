Output showing first milestone of getting some test cases auto built. TODO: review these to make sure they are accurate to what we actually want.

```haskell
[
("after","daily",(2019,7,15),(2019,7,16),(2019,7,17),True),
("after","weekly - every same day of the week",(2019,7,15),(2019,7,22),(2019,7,29),True),
("after","interval - every N days",(2019,7,15),(2019,7,18),(2019,7,21),True),
("after","interval - every N weeks",(2019,7,15),(2019,8,5),(2019,8,26),True),

("cover","daily",(2019,7,15),(2019,7,14),(2019,7,16),True),
("cover","weekly - every same day of the week",(2019,7,15),(2019,7,8),(2019,7,22),True),
("cover","interval - every N days",(2019,7,15),(2019,7,12),(2019,7,18),True),
("cover","interval - every N weeks",(2019,7,15),(2019,6,24),(2019,8,5),True),

("before","daily",(2019,7,15),(2019,7,13),(2019,7,14),False),
("before","weekly - every same day of the week",(2019,7,15),(2019,7,1),(2019,7,8),False),
("before","interval - every N days",(2019,7,15),(2019,7,9),(2019,7,12),False),
("before","interval - every N weeks",(2019,7,15),(2019,6,3),(2019,6,24),False),

("sameDay","daily",(2019,7,15),(2019,7,15),(2019,7,15),True),
("sameDay","weekly - every same day of the week",(2019,7,15),(2019,7,15),(2019,7,15),True),
("sameDay","interval - every N days",(2019,7,15),(2019,7,15),(2019,7,15),True),
("sameDay","interval - every N weeks",(2019,7,15),(2019,7,15),(2019,7,15),True),

("start","daily",(2019,7,15),(2019,7,15),(2019,7,16),True),
("start","weekly - every same day of the week",(2019,7,15),(2019,7,15),(2019,7,22),True),
("start","interval - every N days",(2019,7,15),(2019,7,15),(2019,7,18),True),
("start","interval - every N weeks",(2019,7,15),(2019,7,15),(2019,8,5),True),

("stop","daily",(2019,7,15),(2019,7,14),(2019,7,15),True),
("stop","weekly - every same day of the week",(2019,7,15),(2019,7,8),(2019,7,15),True),
("stop","interval - every N days",(2019,7,15),(2019,7,12),(2019,7,15),True),
("stop","interval - every N weeks",(2019,7,15),(2019,6,24),(2019,7,15),True),

("startStop","daily",(2019,7,15),(2019,7,15),(2019,7,16),True),
("startStop","weekly - every same day of the week",(2019,7,15),(2019,7,15),(2019,7,22),True),
("startStop","interval - every N days",(2019,7,15),(2019,7,15),(2019,7,18),True),
("startStop","interval - every N weeks",(2019,7,15),(2019,7,15),(2019,8,5),True),

("after","monthly - same day of the month",(2019,7,15),(2019,8,15),(2019,9,15),True),
("after","interval - every N Months on the same day of the month",(2019,7,15),(2019,10,15),(2020,1,15),True),

("cover","monthly - same day of the month",(2019,7,15),(2019,6,15),(2019,8,15),True),
("cover","interval - every N Months on the same day of the month",(2019,7,15),(2019,4,15),(2019,10,15),True),

("before","monthly - same day of the month",(2019,7,15),(2019,5,15),(2019,6,15),False),
("before","interval - every N Months on the same day of the month",(2019,7,15),(2019,1,15),(2019,4,15),False),

("sameDay","monthly - same day of the month",(2019,7,15),(2019,7,15),(2019,7,15),True),
("sameDay","interval - every N Months on the same day of the month",(2019,7,15),(2019,7,15),(2019,7,15),True),

("start","monthly - same day of the month",(2019,7,15),(2019,7,15),(2019,8,15),True),
("start","interval - every N Months on the same day of the month",(2019,7,15),(2019,7,15),(2019,10,15),True),

("stop","monthly - same day of the month",(2019,7,15),(2019,6,15),(2019,7,15),True),
("stop","interval - every N Months on the same day of the month",(2019,7,15),(2019,4,15),(2019,7,15),True),

("startStop","monthly - same day of the month",(2019,7,15),(2019,7,15),(2019,8,15),True),
("startStop","interval - every N Months on the same day of the month",(2019,7,15),(2019,7,15),(2019,10,15),True)]
```
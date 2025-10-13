arr =[ 
[11,22,33],
[44,55,66],
[77,88,0],
['aa',nil,'ff'],
['gg','hh','jj']
]

p arr.first(3).all? {|squares| squares.none?(nil)}
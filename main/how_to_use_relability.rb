require "../tools/relability"

# HOW TO USE
r = Relability::Measure.new(31, 40, 4)
p r.mtbf, r.mttr, r.capacity_rate

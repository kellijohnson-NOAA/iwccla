Testing MSYL and MSYR with density dependent fecundity and natural mortality.
===============================================================================

**Authors**: Kelli Faye Johnson

**Last Edited**: 2015-02-09

### Abstract
Using simulation to verify the yield function for the BALEEN II population
dynamics model when density dependence operates on natural mortality or fecundity.
Plots of yield versus mature population were plotted across a range of
MSYL and MSYR values.

### Methods
The BALEEN II (@punt_1999) population dynamics model, parameterized for the
Norewegian harvest of minke whales, was used as an operating model (OM).
The OM time series included 100 years of data and was simulated for 400 iterations,
with each iteration containing zero process error, but having observation error
in the estimates of abundance.

In all simulations, density dependence acted on the mature population either
through fecundity (*f*) or natural mortality (*m*). All combinations of true
MSYL and MSYR values were simulated for both density dependence scenarios.

### Results
MSYR (MSYR = Catch in the terminal year / Mature biomass in the terminal year)
is always calculated less than MSYR(True) (Figures 1 and 2).
The model experienced some convergence issues for higher values of MSYR when
density dependence acted on *m* (Figure 2).
Bias in MSYL (Catch in the terminal year / carrying capacity of the mature population)
increased the further MSYL(True) was from 0.6 (Figure 3 and 4).

### Figures
![Figure 01][fig01]
Figure 01. Calculated MSYL (top panel) and MSYR (bottom panel) across
combinations of true MSYR (0.005 - 0.04; x axis) and MSYL (0.4 - 0.8; see legend),
when density dependence operates on fecundity.

![Figure 02][fig02]
Figure 02. Calculated MSYL (top panel) and MSYR (bottom panel) across combinations
of true MSYR (0.005 - 0.04; x axis) and MSYL (0.4 - 0.8; see legend), when density
dependence operates on natural mortality. Higher values of MSYR had convergence issues.

![Figure 03][fig11]
Figure 03. Yield curves across a range of true MSYL values (0.4 - 0.8; see legend).
Points represent mean yield versus depletion level in the terminal year across
400 trials, when density dependence operates on fecundity.

![Figure 04][fig12]
Figure 04. Yield curves across a range of true MSYL values (0.4 - 0.8; see legend).
Points represent mean yield versus depletion level in the terminal year across
400 trials, when density dependence operates on natural mortality.

[fig01]: figures/figure01.png "Figure 01"
[fig02]: figures/figure02.png "Figure 02"
[fig11]: figures/figure11.png "Figure 03"
[fig12]: figures/figure12.png "Figure 04"

### References

#include "constants.hpp"

_powerLeft = NAMESPACE getVariable ["smgrPowerLeft",7200];
_powerLeft = "Batt " + str(ceil(_powerLeft/72)) + "%";

_powerLeft;
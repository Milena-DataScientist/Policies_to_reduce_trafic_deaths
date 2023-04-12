
# How do drunk driving laws affect traffic deaths?

## Data Set Description

The data are for the “lower 48” U.S. states (excluding Alaska and Hawaii), annually for 1982 through 1988.  The traffic fatality rate is the number of traffic deaths in a given state in a given year, per 10,000 people living in that state in that year. Traffic fatality data were obtained from the U.S. Department of Transportation Fatal Accident Reporting System.  The beer tax is the tax on a case of beer, which is an available measure of state alcohol taxes more generally.  The drinking age variables are binary variables indicating whether the legal drinking age is 18, 19, or 20.  The two binary punishment variables describe the state’s minimum sentencing requirements for an initial drunk driving conviction:  “Mandatory jail?” equals one if the state requires jail time and equals zero otherwise, and “Mandatory community service?” equals one if the state requires community service and equals zero otherwise.  Total vehicle miles traveled annually by state was obtained from the Department of Transportation.  Personal income was obtained from the U.S. Bureau of Economic Analysis, and the unemployment rate was obtained from the U.S. Bureau of Labor Statistics.

## Variable	Descriptions

| Variable     | Description   |
| ------------- | ------------- |
| state        | State ID (FIPS) Code  |
| year        | year   |
| spircons        | Per Capita Pure Alcohol Consumption (Annual, Gallons)   |
| unrate        | State Unemployment Rate (%)   |
| perinc        | Per Capita Personal Income ($)   |
| beertax        | Tax on Case of Beer ($)   |
| sobapt        | % Southern Baptist   |
| mormon        | % Mormon   |
| mlda        | Minimum Legal Drinking Age (years)   |
| dry        | % Residing in Dry Counties (A dry county is a county whose government forbids the sale of any kind of alcoholic beverages. Some prohibit off-premises sale, some prohibit on-premises sale, and some prohibit both. ) |
| yngdrv        | % of Drivers Aged 15-24   |
| vmiles        | Ave. Mile per Driver   |
| jaild        | Mandatory Jail Sentence   |
| comserd        | Mandatory Community Service   |
| allmort        | # of Vehicle Fatalities (#VF)   |
| mrall        | Vehicle Fatality Rate (VFR)   |
| allnite        | # of Night-time VF (#NVF)   |
| mralln        | Night-time VFR (NFVR)   |
| allsvn        | # of Single VF (#SVN)   |
| a1517        | #VF, 15-17 year olds   |
| mra1517        | VFR, 15-17 year olds   |
| a1517n        | #NVF, 15-17 year olds   |
| mra1517n        | NVFR, 15-17 year olds   |
| a1820        | #VF, 18-20 year olds   |
| a1820n        | #NVF, 18-20 year olds   |
| mra1820        | VFR, 18-20 year olds   |
| mra1820n        | NVFR, 18-20 year olds   |
| a2124        | #VF, 21-24 year olds   |
| mra2124        | VFR, 21-24 year olds   |
| a2124n        | #NVF, 21-24 year olds   |
| mra2124n        | NVFR, 21-24 year olds   |
| aidall        | # of alcohol-involved VF   |
| mraidall        | Alcohol-Involved VFR   |
| pop        | Population   |
| pop1517        | Population, 15-17 year olds   |
| pop1820        | Population, 18-20 year olds   |
| pop2124        | Population, 21-24 year olds   |
| miles        | total vehicle miles (millions)   |
| gspch        | GSP Rate of Change  This is a measure of economic growth |


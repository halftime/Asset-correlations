# Asset correlations
Analysis of asset correlations: stocks indexes, gold, silver, bitcoin

### Assets tested (data from yahoo finance)
**Only assets listed in euro are used to prevent currency differences**
*No suitable broad bond index with >5y of historical data was found, thus bonds are not included*

* BTC-EUR : Bitcoin [€]
* IWDA.AS : iShares Core MSCI World UCITS ETF USD (Acc) [€]
* MVOL.MI : iShares Edge MSCI World Minimum Volatility UCITS ETF USD (Acc) [€]
* PHAG.MI : WisdomTree Physical Silver [€]
* PHAU.MI : WisdomTree Physical Gold [€]

#### Correlation 5y monthly 2015-08-01 <> 2020-07-01
            BTC-EUR.csv IWDA.AS.csv MVOL.MI.csv PHAG.MI.csv PHAU.MI.csv
BTC-EUR.csv        1.00        0.21        0.30        0.10        0.11
IWDA.AS.csv        0.21        1.00        0.88        0.20       -0.05
MVOL.MI.csv        0.30        0.88        1.00        0.27        0.20
PHAG.MI.csv        0.10        0.20        0.27        1.00        0.63
PHAU.MI.csv        0.11       -0.05        0.20        0.63        1.00

#### Beta 5y monthly 2015-08-01 <> 2020-07-01
            BTC-EUR.csv IWDA.AS.csv MVOL.MI.csv PHAG.MI.csv PHAU.MI.csv
BTC-EUR.csv        1.00        1.27        2.27        0.31        0.74
IWDA.AS.csv        0.04        1.00        1.09        0.11       -0.05
MVOL.MI.csv        0.04        0.70        1.00        0.12        0.18
PHAG.MI.csv        0.03        0.38        0.64        1.00        1.31
PHAU.MI.csv        0.02       -0.04        0.23        0.30        1.00

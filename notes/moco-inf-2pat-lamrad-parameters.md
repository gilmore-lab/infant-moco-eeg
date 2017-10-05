# MOCO inf 2pat lamrad parameters
## Stimulus set: inf_2pat_lamrad


Temp Freq (Hz): F1 = 1.2, F2 = 24  
Table below values for F1-F2  


|  Condition | Speed - Displ (Amin)  | Speed (deg/s)| Direction - Dir Mean (Deg)  |  Density (Pct) | Notes|
|---|---|---|---|---|---|
| 1 |5-5 |2-2|0-180 |10-10 | dir-180|
| 2 |20-20 |8-8|0-180 |10-10 | dir-180|
| 3 |5-5 |2-2|0-180   |10-10 | dir-radial |
| 4 |20-20 |8-8|0-180   |10-10 | dir-radial |

F1 = Fundamental Frequency  
F2 = Dot Update Rate  
View Distance: 60.31  
Mean Lum: 40.73  
Contrast %: 90.00  
Pix size (Amin): 7.00  
Duration: 8.3  
Field Diameter = 24 deg  
Coherence = 100%  
cd/m^2 =   
Luminance: .5 - 81.2 on 4/23/15  
number steps: 10  
number bins: 10  
modulation: mot_onoff_sqb  


### Calculate deg/s from amin


dx = 5 amin or 20 amin  
dt = 1/24

(amin / update) x (1 deg/60 amin) x (24 updates/sec) = deg/sec     

### Conditions

- Condition 1: dir-180: Change in motion direction from 0 to 180 deg at 2 deg/s  
- Condition 2: dir-180: Change in motion direction from 0 to 180 deg at 8 deg/s  
- Condition 3: dir-radial: Change in motion direction radially at 2 deg/s  
- Condition 4: dir-radial: Change in motion direction radially at 8 deg/s

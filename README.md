## Harmonic Detection using DFT averaging

In this assignment tasked with extracting the harmonics from a noise corrupted signal. To do this I use DFT averaging to dim out the noise of the signal, thus making the harmonics of the signal become more visible. This technique splits up the time samples of a finite length signal into equal length subsets. The DFT of each of the subsets are calculated separately and then averaged. Plotting this averaged spectrum will in turn reveal the harmonic frequencies of the signal as distinct peaks. 
![averaged DFT](https://github.com/udula27/Harmonic-Detection-with-Matlab/main/avgtrue.png?raw=true)

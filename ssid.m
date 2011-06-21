import edu.stanford.math.plex4.*;

maxV = 10.0;
maxD = 2;

data = dlmread('grouppoints.csv');
ms = api.Plex4.createEuclideanMetricSpace(data);
vr = api.Plex4.createVietorisRipsStream(ms,maxD,maxV,100);
vr.getSize()
p = api.Plex4.getDefaultSimplicialAlgorithm(maxD);
i = p.computeIntervals(vr);
i = vr.transform(i);
api.Plex4.createBarcodePlot(i,'ssid',maxV);
displacement
bubbly(
  float  mult	 = 5,
         Nzscale = 1,
         Kd      = .2,
         bubsize = 1)
{
	normal Nn = normalize(N);
	float a,b,c,bub;
	float dist, shortest=10000;
	point Po = transform("object",P)*mult;

	/*true cell center, surrounding cell centers, noised cell center*/
	point trucell, surrcell, nzcell;
	vector offset;

	setxcomp(trucell,floor(xcomp(Po))+.5);
	setycomp(trucell,floor(ycomp(Po))+.5);
	setzcomp(trucell,floor(zcomp(Po))+.5);
				 
	/*what is the shortest distance to a noised cell center?*/
	for(a = -1; a<= 1; a+=1){
		for(b = -1; b<=1; b += 1){
			for(c = -1; c<=1; c += 1){
				offset = vector(a,b,c);
				surrcell = trucell+offset;
				nzcell = surrcell + ((vector cellnoise(surrcell)-.5)*Nzscale);
				dist = distance(Po,nzcell);
				if(dist<shortest) shortest = dist;
			}
		}
	}
	bub = clamp(shortest,0,bubsize)/bubsize; 
	P+= Nn*(pow(bub,2)-1)*Kd;
	N = calculatenormal(P);
}


































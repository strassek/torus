surface bake_areas(string filename="")
{
	normal 	Nn = faceforward(normalize(N),I);

	float a = area(P,"dicing");
	bake3d(filename,"_area",P,Nn,"interpolate",1,"_area",a);

	// Set Ci and Oi
	Ci = Cs * Os * (-normalize(I).Nn);
	Oi=Os;
} 

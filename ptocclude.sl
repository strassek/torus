surface ptocclude(
	string filename="";
	float maxsolidangle=0.05,
	Ks = 0.4,
	Kd = 0.5,
	Ka = 0.5,
	Roughness = 0.1;
	color SpecularColor = color(1, 1, 1);
	)
{
	normal Ns = faceforward (normalize(N), I);
	vector V = normalize( -I );

	// Compute occlusion
	float occ = 0;
	occ = occlusion(P, Ns, 0, "pointbased", 1, "filename",filename,	
					"maxsolidangle", maxsolidangle);

	// Set Ci and Oi
	Ci = Os * (1 - occ) * Cs * (Ka * ambient() + Kd * diffuse(Ns)) + SpecularColor * Ks * specular(Ns, V, Roughness);
	Oi=Os;
}


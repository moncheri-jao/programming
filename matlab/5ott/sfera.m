function f = sfera()
	M = csvread("sphere.csv");
	s1 = M(:,1);
	s2 = M(:,2);
	s3 = M(:,3);
	figure('Position',[183 70 500 600]);
	[X,Y,Z] = sphere(20);
	X = X;
	Y = Y;
	Z = Z;
	Hs = mesh(X,Y,Z,'facecolor','w','edgecolor',[0.5 0.5 0.5]);
	caxis([1.0 1.01]);
	alpha(0.70);
	axis equal;
	set(gcf,'Renderer','opengl');
	hold on;
	Hx = plot3([-1.5 1.5], [0 0], [0 0],'k-');
	set(Hx,'linewidth',2,'linestyle','-','color','k');
	ht_x = text(1.75,0,0,'+S_1','fontweight','bold','fontsize',12,'fontname','arial');
	Hy = plot3([0 0], [-1.5 1.5], [0 0],'k-');
	set(Hy,'linewidth',2,'linestyle','-','color','k');
	ht_y = text(0.1,1.6,0,'+S_2','fontweight','bold','fontsize',12,'fontname','arial');
	Hz = plot3([0 0], [0 0], [-1.5 1.5],'k-');
	set(Hz,'linewidth',2,'linestyle','-','color','k');
	ht_z = text(-0.05,0,1.35,'+S_3','fontweight','bold','fontsize',12,'fontname','arial');
	ht_lcp = text(-0.05,0.0,1.1,'RCP','fontweight','bold','fontsize',12,'fontname','arial','color','k');
	x_e = (-1:.01:1);
	for i = 1:length(x_e)
		z_e(i) = 0;
		y_e_p(i) = +sqrt(1 - x_e(i)^2);
		y_e_n(i) = -sqrt(1 - x_e(i)^2);
	    hold on
	end
	He = plot3(x_e,y_e_p,z_e,'k-',x_e,y_e_n,z_e,'k-');
	set(He,'linewidth',2,'color','k');
	y_pm = (-1:.01:1);
	for i = 1:length(x_e)
	    x_pm(i) = 0;
		z_pm_p(i) = +sqrt(1 - y_pm(i)^2);
		z_pm_n(i) = -sqrt(1 - y_pm(i)^2);
	    hold on
	end
	Hpm = plot3(x_pm,y_pm,z_pm_p,'k-',x_pm,y_pm,z_pm_n,'k-');
	set(Hpm,'linewidth',2,'color','k');
	hold on
%	mks = [11.5,12,20,12];
	d = ["g.","m.","r.","b."];
	for i = 1:length(s1)
%	    s(i) = plot3(s1(i),s2(i),s3(i),d(i),"markers",mks(i))
	    s(i) = plot3(s1(i),s2(i),s3(i),d(i),"markers",20.5)
	    hold on
	end
	legend(s, "Polarizzazione Ellittica Sinistrorsa","Polarizzazione Ellittica Destrorsa", "Polarizzazione Circolare Destrorsa", "Polarizzazione Verticale");
	hold off
	f = sqrt(s1.^2+s2.^2+s3.^2);
end
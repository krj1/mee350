clc; clear all;
 
R_air = 0.287;
m_dot_in_air = 10;
m_dot_out_air = m_dot_in_air; 
m_dot_air = m_dot_out_air;
 
 
m_dot_in_steam = 25;
m_dot_out_steam = m_dot_in_steam;
m_dot_steam = m_dot_out_steam;
 
T_1 = 295;
h_1 = 295.17; % (table A-22)
s_1 = 1.68515; % (table A-22)
p_1 = 98;
 
T_2 = 620;
h_2 = 628.07; % (table A-22)
h_2s = 573.48 % (from interpelation of table A-22)
s_2 = 2.44356; % (table A-22)
p_2 = 1000;
 
P_3 = 12500;
T_3 = 500;
h_3 = 3343.6; %From Table (from an online resource- compressed water and super heated steam table A-3)
s_3 = 6.4651; %From Table (from the same source as 3343.6, table A-3)
 
P_4 = 10;
x_4 = 0.92;
h_4s = 2048.7;
 
 
hf_2 = 191.81; %From Table (A-3 at 10 bar)
hfg_2 = 2392.1; %From Table (A-3 at 10 bar) 
h_4 = hf_2 + x_4*hfg_2; %quality of enthalpy
sf_2 = 0.6492; %From Table (A-3 at 10 bar) 
sfg_2 = 7.4996; %From Table (A-3 at 10 bar) 
s_4 = sf_2 + x_4*sfg_2; 
 
 
w_comp_in = m_dot_air*(h_2-h_1);
eta_comp = (h_2s-h_1)/(h_2-h_1)*100
 
w_twb_out = m_dot_in_steam*(h_3-h_4);
eta_twb = (w_twb_out/m_dot_steam)/(h_3-h_4s)*100
 
net_w_out = w_twb_out - w_comp_in; % ans for part a
 
s_gen_comp = m_dot_air*(s_2-s_1-R_air*reallog(p_1/p_2));
s_gen_twb = m_dot_steam*(s_4-s_3);
 
s_gen_total = s_gen_comp + s_gen_twb;
 
 
eta_comp_plot = linspace(.6,.8,50);
eta_twb_plot = linspace(.7,.95,50);
 
plot_twb = eta_twb_plot*(h_3-h_4s)*m_dot_steam;
plot_comp = (h_2s-h_1)./eta_comp_plot*m_dot_air;
 
plot_vals = plot_twb - plot_comp
 
plot_twb = [.7,.8,.9];
plot_twb = eta_twb_plot*(h_3-h_4s)*m_dot_steam;
 
plot_vals1 = plot_twb(1) - plot_comp;
plot_vals2 = plot_twb(2) - plot_comp;
plot_vals3 = plot_twb(3) - plot_comp;
 
figure()
 
plot(eta_comp_plot, plot_vals1,'b-s','MarkerFaceColor','b')
hold on
plot(eta_comp_plot, plot_vals2,'r-o','MarkerFaceColor','r')
plot(eta_comp_plot, plot_vals3,'g-o','MarkerFaceColor','g')
xlabel('Compressor \eta','FontSize',18)
ylabel('Net Work [kj/kg]','FontSize',18)
title('Work vs Compressor and Turbine Efficiency','FontSize',14)
legend('turbine \eta = 0.7','turbine \eta = 0.8','turbine \eta = 0.9','FontSize',20,'Location','southeast')
set(gca,'FontSize',16)
 figure()

eta_comp_plot = linspace(.6,.8,50);
eta_twb_plot = linspace(.7,.95,50);

plot_twb = eta_twb_plot*(h_3-h_4s)*m_dot_steam;
plot_comp = (h_2s-h_1)./eta_comp_plot*m_dot_air;

plot_vals = plot_twb - plot_comp


plot_twb = eta_twb_plot*(h_3-h_4s)*m_dot_steam;

plot_vals = [];

for i = 1:width(plot_twb)
    vals =  plot_comp - plot_twb(i);
    plot_vals = [plot_vals; vals]
end




surf( plot_twb, plot_comp, plot_vals)
xlabel('Turbine \eta','FontSize',18)
ylabel('Compressor','FontSize',18)
zlabel('Net Work [kj/kg]','FontSize',18)
title('Work vs Compressor and Turbine Efficiency','FontSize',16)



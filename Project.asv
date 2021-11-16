clc; clear all;

R_air = 0.287;
m_dot_in_air = 10;
m_dot_out_air = m_dot_in_air;
m_dot_air = m_dot_out_air;


m_dot_in_steam = 25;
m_dot_out_steam = m_dot_in_steam;
m_dot_steam = m_dot_out_steam;

T_1 = 295;
h_1 = 295.17; %
s_1 = 1.68515; %
p_1 = 1000;

T_2 = 620;
h_2 = 628.07; %
s_2 = 2.44356; %
p_2 = 98;

P_3 = 12.5;
T_3 = 500;
h_3 = 3343.6; %From Table 
s_3 = 6.4651; %From Table

P_4 = 10;
x_4 = 0.92;

hf_2 = 191.81; %From Table
hfg_2 = 2392.1; %From Table
h_4 = hf_2 + x_4*hfg_2; %quality of enthelpy
sf_2 = 0.6492; %From Table
sfg_2 = 7.4996; %From Table
s_4 = sf_2 + x_4*sfg_2; 


w_comp_in = m_dot_air*(h_2-h_1);
nu_comp = w_comp_in/m_dot_air/(h_3-h_2)*100

w_twb_out = m_dot_in_steam*(h_3-h_4);
nu_twb = w_twb_out/m_dot_steam/(h_3-h_2)*100

net_w_out = w_twb_out - w_comp_in; % ans for part a 

s_gen_comp = m_dot_air*(s_2-s_1-R_air*reallog(p_1/p_2));
s_gen_twb = m_dot_steam*(s_4-s_3);

s_gen_total = s_gen_comp + s_gen_twb;



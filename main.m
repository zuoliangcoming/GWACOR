clear all 
clc
rng('default')
Function_name=['F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13','F14','F15','F16','F17','F18','F19','F20','F21','F22','F23','F24','F25','F26','F27','F28','F29','F30']; 
N = 30; %popultaion size
Flod=30;%Number of independent runs
MaxFEs=300000;

% Load details of the selected benchmark function
for i=1:30
    for j=1:Flod
     [lb,ub,dim,fobj]=Get_Functions_Details(Function_name(i));
     [Best_pos,Best_score,Convergence_curve] = GWACOR(N,MaxFEs,lb,ub,dim,fobj);
    end
end



%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
%Draw objective space
subplot(1,2,2);
plot(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');
axis tight
grid on
box on
legend('GWACOR')
display(['The best solution obtained by ,GWACOR is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ,GWACOR is : ', num2str(Best_score)]);
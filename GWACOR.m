function [Leader_pos,Convergence_curve]=GWACOR(SearchAgents_no,MaxFEs,lb,ub,dim,fobj)

solution=[1 dim];            

FEs=0;               
it=1;                
k=10;               
m=SearchAgents_no;  
q=0.5;               
ibslo=1; 


empty_individual.Position=[];
empty_individual.fitness=[];

WEP_Max=1;
WEP_Min=0.2;
    
  
pop=repmat(empty_individual,k,1);
for i=1:k 
    pop(i).Position=ub.*rand(1,dim)+lb.*rand(1,dim);
  
    Flag4ub=pop(i).Position>ub;       
    Flag4lb=pop(i).Position<lb;         
    pop(i).Position=(pop(i).Position.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb; 
    pop(i).fitness=fobj(pop(i).Position);  
	FEs=FEs+1;    
end


[~, SortOrder]=sort([pop.fitness]);


pop=pop(SortOrder);     
Bestsolution=pop(1);                 

w=1/(sqrt(2*pi)*q*k)*exp(-0.5*(((1:k)-1)/(q*k)).^2);           
p=w/sum(w);                    
pop_r=zeros(1,dim);
Lb=lb.*ones(1,dim);% lower boundary 
Ub=ub.*ones(1,dim);% upper boundary
for i=1:k
    pop_r(i,:)=pop(i).Position;
end


 while FEs<=MaxFEs   
%% GQI
     for i=1:k
            f1=pop(1).fitness;
            f2=pop(randperm(i,1)).fitness;
            f3=pop(i).fitness;
            for j=1:dim 
                  x1=pop(1).Position(j);
                  x2=pop(randperm(i,1)).Position(j);
                  x3=pop(i).Position(j);
                pop_r(i,j)=GQI(x1,x2,x3,f1,f2,f3,Lb(j),Ub(j));
            end
            
            pop_r_fitness=fobj(pop_r(i,:)); 
            FEs=FEs+1; 
            if pop_r_fitness<pop(1).fitness
                pop(1).fitness=pop_r_fitness;
                pop(1).Position=pop_r(i,:);
            end 
     end
     
     
    s=zeros(k,dim);     
    for l=1:k             
        s(l,:)=pop(l).Position(1,:);   
    end  
    
    newpop=repmat(empty_individual,m,1);
    WEP=WEP_Min+FEs*((WEP_Max-WEP_Min)/MaxFEs);
    TDR=1-((FEs)^(1/6)/(MaxFEs)^(1/6));
    for t=1:m  
       
        for j=1:k    
          
            p1=cumsum(p);  
            if p1(j)>=rand 
                  l=j; 
                  break;
            end
        end     
        newpop(t).Position=zeros(solution);   
         for i=1:dim 
            D=0;    
            for r=1:k 
                D=D+abs(s(l,i)-s(r,i)); 
            end
            sigma=ibslo*D/(k-1);   
            newpop(t).Position(i)=s(l,i)+sigma*randn; 
         end
        
        Flag4ub=newpop(t).Position>ub;        
		Flag4lb=newpop(t).Position<lb;
		newpop(t).Position=(newpop(t).Position.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb; 
        % Evaluation
        newpop(t).fitness=fobj(newpop(t).Position); 
        FEs=FEs+1; 
       
        
        
    newpop_s=newpop(t).Position;
  
     for j=1:dim
            r2=rand();
            if r2<WEP
                r3=rand();
                if r3<0.5
                    newpop_s(j)=pop(1).Position(j)+TDR*((ub-lb)*rand+lb);
                end
                if r3>0.5
                    newpop_s(j)=pop(1).Position(j)-TDR*((ub-lb)*rand+lb);
                end
            end
     end
     
     
     
     Flag5ub=newpop_s>ub;
     Flag5lb=newpop_s<lb;
     newpop_s=(newpop_s.*(~(Flag5ub+Flag5lb)))+ub.*Flag5ub+lb.*Flag5lb;
     % Evaluation
     newpop_s_fitness=fobj(newpop_s);
     FEs=FEs+1;
     if newpop_s_fitness<newpop(t).fitness
         newpop(t).fitness=newpop_s_fitness;
         newpop(t).Position=newpop_s;
     end
     
    end
    
    pop=[pop;newpop]; 
    [~, SortOrder]=sort([pop.fitness]);
    pop=pop(SortOrder);  
    pop=pop(1:k);
    Bestsolution=pop(1);

    Convergence_curve(it)=Bestsolution.fitness;
    Leader_pos=Bestsolution.Position;
    it=it+1;
 end
end

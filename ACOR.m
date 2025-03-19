function [Leader_pos,Convergence_curve]=ACOR(SearchAgents_no,MaxFEs,lb,ub,dim,fobj)
solution=[1 dim];          
FEs=0;
it=1;
k=10;                          
m=SearchAgents_no;             
q=0.5;  
ibslo=1;

empty_individual.Position=[];
empty_individual.fitness=[];

pop=repmat(empty_individual,k,1);
for i=1:k
    pop(i).Position=unifrnd(lb,ub,solution);
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

 while FEs<=MaxFEs   
    s=zeros(k,dim);
    for l=1:k
        s(l,:)=pop(l).Position(1,:);
    end  
    newpop=repmat(empty_individual,m,1);
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
		newpop(t).Position=(newpop(t).Position.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb; %%%��������
        % Evaluation
        newpop(t).fitness=fobj(newpop(t).Position); 
        FEs=FEs+1;
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

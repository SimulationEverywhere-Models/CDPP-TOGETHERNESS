[top]
components : together 

[together] 
type : cell 
dim : (10, 10, 2) 
delay : transport 
defaultDelayTime : 100
border : wrapped  

%plane1: positions of cells
neighbors : together(-1,1,0) together(0,1,0) together(1,1,0) 
neighbors : together(-1,0,0) together(0,0,0) together(1,0,0)  
neighbors : together(-1,-1,0) together(0,-1,0) together(1,-1,0)
%plane2: probability associated with cells 
neighbors : together(-1,1,1) together(0,1,1) together(1,1,1) 
neighbors : together(-1,0,1) together(0,0,1) together(1,0,1) 
neighbors : together(-1,-1,1) together(0,-1,1) together(1,-1,1) 

initialvalue : 0 
initialCellsValue : togethernessTest2.val 
localtransition : together-rule 

[together-rule] 

% if (0,0,0)=0 and (-1,0,0)=1, then (0,0,0)=1
rule : 1 100 { cellpos(2)=0 and (0,0,0)=0 and (-1,0,1)=1 }

% if (0,0,0)=0 and (-1,0,0)=2, then (0,0,0)=2
rule : 2 100 { cellpos(2)=0 and (0,0,0)=0 and (-1,0,1)=2 }

% if (0,0,0)=0 and (-1,0,0)=0, then (0,0,0)=0
%rule : 0 100 { cellpos(2)=0 and (0,0,0)=0 and (-1,0,1)=0 }

% if (0,0,0)=1 and prob. of (0,0,0)>= prob. of(1,0,0), then (0,0,0)=1
rule : 1 100 { cellpos(2)=0 and (0,0,0)=1 and ((0,0,1)>=(1,0,1)) }

% if (0,0,0)=1 and prob. of (0,0,0)< prob. of(1,0,0), then (0,0,0)=2
rule : 2 100 { cellpos(2)=0 and (0,0,0)=1 and ((0,0,1)<(1,0,1)) }

% if (0,0,0)=2 and prob. of (0,0,0)>= prob. of(1,0,0), then (0,0,0)=2
rule : 2 100 { cellpos(2)=0 and (0,0,0)=2 and ((0,0,1)>=(1,0,1)) }

% if (0,0,0)=2 and prob. of (0,0,0)< prob. of(1,0,0), then (0,0,0)=1
rule : 1 100 { cellpos(2)=0 and (0,0,0)=2 and ((0,0,1)<(1,0,1)) }

%if cell is empty {(0,0,0)=0}, it remains empty
rule : 0 100 {t}

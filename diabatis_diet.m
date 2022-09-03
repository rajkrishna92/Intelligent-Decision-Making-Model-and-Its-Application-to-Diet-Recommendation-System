function diabatis_diet
clc
%------------------------------Section 1--------------------------------------------------------
    function d=basic_cal(sex,weight,height,age)
        if sex=='M'
            d=66+(13.7*weight)+(5*height)-(6.8*age);
        else
           d=655+(9.6*weight)+(1.8*height)-(4.7*age);
        end
    end


    function d=extra_cal(phy_exr,temp,altitude)
       f1=sigmf(phy_exr,[0.05 80]);
       f2=sigmf(temp,[-0.2 22]);
       f3=sigmf(altitude,[0.0015 3000]);

        %temp=(f1+f2+f3)/3;
        tempt=(0.8*f1)+(0.1*f2)+(0.1*f3);
       d=0.3*tempt+1.2;
    end


sex='M';
weight=78;
height=173;
age=45;

phy_exr=20;
temp=27;
altitude=98;

Basic_cal=basic_cal(sex,weight,height,age)
Extra_cal=extra_cal(phy_exr,temp,altitude)
total_cal=Basic_cal*Extra_cal


%----------------------Nutration Information-------------------------------------------------------
 daily_required_carb=total_cal*0.45;
 daily_required_prot=total_cal*0.30;
 daily_required_fat=total_cal*0.25;
 daily_required_fiber=(8*total_cal)/1000;
% 
 daily_required_nutrient=[(daily_required_carb),(daily_required_prot),(daily_required_fat),daily_required_fiber]
% 
 daily_required_nutrient_gm=daily_required_nutrient./[4,4,9,1]
% 
% 
% 
% %total_cal_mat=(daily_required_carb+daily_required_prot+daily_required_fat);
% %total_cal_mat_per=[total_cal_mat].*(100/total_cal);
% 
 nutrient = xlsread('Experiment1_GuruMann.xlsx',2);
 individual_nutrient=sum(nutrient,'omitnan')
% 
% 
% %individual_nutrient_cal=individual_nutrient(1:3).*[4,4,9];
% %intake_cal=(4*individual_nutrient(1))+(4*individual_nutrient(2))+(9*individual_nutrient(3));
% %intake_fiber=individual_nutrient(4);
% 
 need_nutrient_gm=daily_required_nutrient_gm-individual_nutrient
% %required_cal=2430-intake_cal;
% 
% %need_gm=[daily_required_carb(2)-individual_nutrient(1),daily_required_prot(2)-individual_nutrient(2),daily_required_fat(2)-individual_nutrient(3),daily_required_fiber-individual_nutrient(4)];
% %tot=sum(need_gm(1:3).*[4,4,9]);
knowledge_need_nutrient_gm=need_nutrient_gm./daily_required_nutrient_gm
% %----------------------------------------checking----------------------------------------------------------------------
% nutrients=["carb","prot","fat","fiber"];
% 
% index=find(need_nutrient_gm <= 0);
% 
% disp('You taken extra')
% nutrients(index)
% 
% %knowledge_need_nutrient_gm(:,index)=[];
% 
% 
% %-----------------------Utility matrix genarating----------------------------------------
 [dinner_menu,list,~] = xlsread('Experiment1_GuruMann.xlsx',3);
% %dinner_menu(:,index)=[];
 U1=dinner_menu
 Y=knowledge_need_nutrient_gm
 X=[Y(1),Y(2),Y(3),Y(4)]
% %X=[.31,.31,.37]
% %---------------Desicion Function---------------------------------
 result1=test2(U1,X)
 result=result1/max(result1)
 [B,I] = sort(result','descend');
 q=list(:,1)
 q(1)=[];
 output=[q,num2cell(result')];
 Q=output(I,:)
 Q(:,2);
end
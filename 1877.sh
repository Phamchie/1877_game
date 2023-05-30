rows=$(tput lines)
cols=$(tput cols)
player_row=$((rows/2))
player_col=$((cols/2))
enemy_row=$((RANDOM % rows))
enemy_col=$((RANDOM % cols))
bullet_rơw=$player_row
bullet_col=$player_col
red="\033[33;31m"
green="\033[33;32m"
yellow="\033[33;33m"
white="\033[33;39m"
db_row=$((RANDOM % rows))
db_col=$((RANDOM % cols))
dir_row=5
dir_col=5
kill=0
hp=3
hp_row=$((RANDOM % rows))
hp_col=$((RANDOM % cols))


function last() {
tput civis
clear
tput cup $player_row $player_col
echo -e "$green YOU > /(~_~)-|"
tput cup $enemy_row $enemy_col
echo -e "$yellow ATTACKER > /('_')-|"
  for i in {1..5}
     do
db_row=$((RANDOM % rows))
db_col=$((RANDOM % cols))
		 tput cup $db_row $db_col
         echo -e "$red Quả Bom > (')"
	done
		 while true;do
     read -s -n 1 key
	 case $key in
	 "b") break ;;
	 "w") ((player_row--)) ;;
	 "s") ((player_row++)) ;;
	 "a") ((player_col--)) ;;
	 "d") ((player_col++)) ;;
	 
	 "u")
         if [ $player_row -eq $enemy_row ] && [ $player_col -eq $enemy_col ]
		 then
		 tput cup $enemy_row $enemy_col
		echo "(@_@) > choáng"
		 sleep 0.40
 	 kill=$((kill+1))
			enemy_row=$((RANDOM % rows))
			enemy_col=$((RANDOM % cols))
		fi ;;
		
	 " ") bullet_row=$player_row
	      Bullet_col=$player_col
		  
		  while [ $bullet_row -gt 0 ]
		  do 
		    tput cup $bullet_row $bullet_col
			echo "|"
			sleep 0.01
			tput cup $bullet_row $bullet_col
			echo " "
			
			((bullet_row--))
			if [ $bullet_row -eq $enemy_row ] && [ $bullet_col -eq $enemy_col ]
	   then
	       echo "(@_@) > choáng"
		 sleep 0.40
 	        kill=$((kill+1))
			db_row=$((RANDOM % rows))
            db_col=$((RANDOM % cols))
			enemy_row=$((RANDOM % rows))
			enemy_col=$((RANDOM % cols))
		fi
		   done
	      ;;
		  
	 *) ;;
	 esac
	 
	 if [ $bullet_col -ne $player_col ]
	 then
	     ((bullet_col--))
	 fi
	 
	 tput cup $bullet_row $bullet_col
		 echo "-"
		 
	   if [ $bullet_row -eq $enemy_row ] && [ $bullet_col -eq $enemy_col ]
	   then
	       echo "(@_@) > choáng"
		 sleep 0.40
 	        kill=$((kill+1))
			db_row=$((RANDOM % rows))
            db_col=$((RANDOM % cols))
			enemy_row=$((RANDOM % rows))
			enemy_col=$((RANDOM % cols))
			hp_row=$((RANDOM % rows))
		fi
	   
		 	
			   if [ $player_row -lt $enemy_row ]
			   then
			       ((enemy_row--))
				   elif [ $player_row -gt $enemy_row ]
				   then
				        ((enemy_row++))
						elif [ $player_col -lt $enemy_col ]
						then
						   ((enemy_col--))
						   elif [ $player_col -gt $enemy_col ]
						   then
						      ((enemy_col++))
							  
						   fi
				   
				   if [ $enemy_row -eq 0 ] || [ $enemy_row -eq $dir_row ]
				   then
				      ((dir_row=dir_row))
					  ((dir_col=dir_col))
					  enemy_row=$((RANDOM % rows))
					  enemy_col=$((RANDOM % cols))
					  hp_row=$((RANDOM % rows))
					elif [ $enemy_col -eq 0 ] || [ $enemy_col -eq $dir_col ]
					then
					   ((dir_row=dir_row))
					  ((dir_col=dir_col))
					  enemy_row=$((RANDOM % rows))
					  enemy_col=$((RANDOM % cols))
					  hp_row=$((RANDOM % rows))
					  fi
					
	
	
	sleep 0.01s && if  [ $enemy_row -eq $player_row ] && [ $enemy_col -eq $player_col ]
	then
	hp=$((hp-1))
	tput cup $player_row $player_col
	echo "(@_@) > choáng"
	sleep 0.40
	db_row=$((RANDOM % rows))
            db_col=$((RANDOM % cols))
			hp_row=$((RANDOM % rows))
		player_row=$((RANDOM % rows))
		player_col=$((RANDOM % cols))
fi

   if [ $db_row -eq $player_row ] && [ $db_col -eq $player_col ]
   then
   hp=$((hp-1))
   tput cup $player_row $player_col
       echo "(@_@) > Choáng"
	    db_row=$((RANDOM % rows))
            db_col=$((RANDOM % cols))
		hp_row=$((RANDOM % rows))
		player_row=$((RANDOM % rows))
		player_col=$((RANDOM % cols))
	fi
	
	    if [ $db_row -eq $enemy_row ] && [ $db_col -eq $enemy_col ]
		then
		     echo "(@_@) > choáng"
		 sleep 0.40
 	        kill=$((kill+1))
			db_row=$((RANDOM % rows))
            db_col=$((RANDOM % cols))
			hp_row=$((RANDOM % rows))
			enemy_row=$((RANDOM % rows))
			enemy_col=$((RANDOM % cols))
			fi

		if [ $hp -eq 0 ] 
		then
		   clear
		    echo -e "$red
					                                
# #  #  # #     #    #   ## ### 
# # # # # #     #   # # #    #  
 #  # # # #     #   # #  #   #  
 #  # # # #     #   # #   #  #  
 #   #  ###     ###  #  ##   # "
		   sleep 3
		   break
		 fi
		 
		  
		
			if [ $player_row -eq $hp_row ] 
			then
			    hp=$((hp+1))
				hp_row=$((RANDOM % rows))
				tput cup $hp_row $hp_col
                 echo -e "$green($yellow+$green)"
			elif [ $player_col -eq $hp_col ]
			then
			    hp=$((hp+1))
				hp_row=$((RANDOM % rows))
				tput cup $hp_row $hp_col
                 echo -e "$green($yellow+$green)"
			fi
clear

 if [ $hp -eq 1 ]
		     then
			 tput cup $hp 
			     echo "Bạn Chỉ Còn Lại 1 Máu , Vui LÒNG HÒI MÀU "
			fi
			
for i in {1..5}
     do
db_row=$((RANDOM % rows))
db_col=$((RANDOM % cols))
		 tput cup $db_row $db_col
         echo -e "$red(')"
	done
tput cup $player_row $player_col
echo -e "$green /(~_~)-|"
tput cup $enemy_row $enemy_col
echo -e "$yellow /('_')-|"
tput cup $hp_row $hp_col
 echo -e "$green($yellow+$green)"
tput cup $kill 0
echo -e "$white KILL :$red $kill"
tput cup $hp 0
echo ""
echo -e "$white Máu [$green $hp$white ]"

done
tput cnorm
}

last

rows=$(tput lines)
cols=$(tput cols)
player_row=$((rows/2))
player_col=$((cols/2))
target_row=$((RANDOM % rows))
target_col=$((RANDOM % cols))
attacker_row=$((RANDOM % cols))
attacker_col=$((RANDOM % cols))
dir_row=5
dir_cow=5
score=0
red="\033[33;31m"
green="\033[33;32m"
yellow="\033[33;33m"
white="\033[33;39m"
bullet_row=$player_row
bullet_col=$player_col
kill=0
x=( [0]="7 10" [1]="12 25" [2]="15 35" [3]="18 15" [4]="5 30" )
tput civis
  
function 1877_game() {
clear
tput cup $player_row $player_col
echo -e "$green Bạn > (@) "
tput cup $target_row $target_col
echo -e "$yellow Mục Tiêu > (***)"
tput cup $attacker_row $attacker_col
echo -e "$red Kẻ Bắt Cóc > (o)"

for i in "${!x[@]}"
do
    obstacle=(${x[$i]})
    tput cup ${x[0]} ${x[1]}
    echo "#"
done

  while true; do
  read -s -n 1 move
  
  case $move in
  "b") break ;;
  
  "w") ((player_row--)) ;;
  "s") ((player_row++)) ;;
  "a") ((player_col--)) ;;
  "d") ((player_col++)) ;;
  " ") bullet_row=$player_row
       bullet_col=$player_cow ;;
	   
  *) ;;
  esac

  if [ $player_row -lt $attacker_row ]
  then
     ((attacker_row--))
   elif [ $player_row -gt $attacker_row ]
   then
   ((attacker_row++))
   elif [ $player_col -lt $attacker_col ]
   then
   ((attacker_col--))
   elif [ $player_col -gt $attacker_col ]
   then
   ((attacker_col++))
   fi
   
			if [ $attacker_row -eq 0 ] || [ $attacker_row -eq $dir_row ]
			then
			((dir_row=dir_row))
			((dir_col=dir_col))
			attacker_row=$((RANDOM % rows))
			attacker_col=$((RANDOM % cols))
			elif [ $attacker_col -eq 0 ] || [ $attacker_row -eq $dir_col ]
			then
			((dir_row=dir_row))
			((dir_col=dir_col))
			attacker_row=$((RANDOM % rows))
			attacker_col=$((RANDOM % cols))
			fi
			
	         if [ $player_row -eq $attacker_row ] && [ $player_col -eq $attacker_col ]
			 then
			 tput cup $attacker_row $attacker_col
			 echo -e "$red __(o)__"
			 sleep 1
			         kill=$((kill+1))
					 attacker_row=$((RANDOM % rows))
					 attacker_col=$((RANDOM % cols))
			 fi
			 
			      if [ $bullet_row -ne $player_row ] 
				  then
				      ((bullet_row--))
					 
				   fi
				   
				   tput cup $bullet_row $bullet_col
				   echo "*"
				   
				   if [ $bullet_row -eq $attacker_row ] && [ $bullet_col eq $attacker_col ]
				   then
				   tput cup $attacker_row $attacker_col
				   echo -e "$red __(o)__"
				   sleep 1
				       kill=$((kill+1))
					   attacker_row=$((RANDOM % rows))
					   attacker_col=$((RANDOM % cols))
					  
					   
					fi
					
					if [ $attacker_row -eq $player_row ] && [ $attacker_col -eq $player_col ]
					then
					         clear 
			        echo -e "$red
					                                
# #  #  # #     #    #   ## ### 
# # # # # #     #   # # #    #  
 #  # # # #     #   # #  #   #  
 #  # # # #     #   # #   #  #  
 #   #  ###     ###  #  ##   # 
 
 [ Bạn Đã Bị Bắt Cóc ]
 [ Số Điểm Của Bạn Hiện Tại : $score/50 ] "
 sleep 3
      break
	         fi
					
			
if [ $player_row -eq $target_row ]
then
   socre=$((score+1))
   target_row=$((rANDOM % rows))
   target_col=$((RANDOM % cols))
			
   
   elif [ $player_col -eq $target_col ]
   then
   score=$((score+1))
   target_row=$((RANDOM % rows))
   target_col=$((RANDOM % cols))
   fi
	
	if [ $x -eq $attacker_row ] && [ $x -eq $attacker_col ]
	then
	        kill=$((kill+1))
			 target_row=$((RANDOM % rows))
   target_col=$((RANDOM % cols))
   fi
   
   if [ $x -eq $player_row ] && [ $x -eq $player_col ]
   then
       					         clear 
			        echo -e "$red
					                                
# #  #  # #     #    #   ## ### 
# # # # # #     #   # # #    #  
 #  # # # #     #   # #  #   #  
 #  # # # #     #   # #   #  #  
 #   #  ###     ###  #  ##   # 
 
 [ Bạn Đã Bị Bắt Cóc ]
 [ Số Điểm Của Bạn Hiện Tại : $score/50 ] "
 sleep 3
      break
	  fi
	  
   clear
   for i in "${!x[@]}"
do
    obstacle=(${x[$i]})
    tput cup ${x[0]} ${x[1]}
    echo "#"
done
echo ""
tput cup $player_row $player_col
echo -e "$green Bạn > (@) "
tput cup $target_row $target_col
echo -e "$yellow Mục Tiêu > (***)"
tput cup $attacker_row $attacker_col
echo -e "$red Kẻ Bắt Cóc > (o)"
tput cup $bullet_row $bullet_col
echo "*"
   tput cup $x 
    echo "#"
tput cup $score 0
echo -e "$white Số Mục Tiêu Bạn Đã Lấy Được : $score"
tput cup $kill 0
echo -e "$white KILL :$red $kill$white"

done

tput cnorm

}

   while true; do
   clear
   echo -e "$red
  __  ___ ______ ______    _____          __  __ ______ 
 /_ |/ _ \____  |____  |  / ____|   /\   |  \/  |  ____|
  | | (_) |  / /    / /  | |  __   /  \  | \  / | |__   
  | |> _ <  / /    / /   | | |_ | / /\ \ | |\/| |  __|  
  | | (_) |/ /    / /    | |__| |/ ____ \| |  | | |____ 
  |_|\___//_/    /_/      \_____/_/    \_\_|  |_|______|
                                                        
                                                        
	trò chơi dựa trên một câu chuyện cô bé khăn quàng đỏ
	
	            người xuất bản : Phạm Chiến
				Bản Quyền Thuộc NGười Xuất Bản "
	
   echo -e "$yellow"
   echo "press [ A ] to start new game"
   echo -e "$white"
echo "============================"
echo "nhấn phím W để đi lên"
echo "nhấn phím S để đi lùi"
echo "nhấn phím A để đi sang trái"
echo "nhấn phím D để đi sang phải"
echo "Nhấn phím Cách để bắn "
echo "============================"
   read -s -n 1 menu
   case $menu in
   "a") 1877_game ;;
   "A") 1877_game ;;
   *) ;;
   esac
   done
   

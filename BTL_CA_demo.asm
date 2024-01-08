.data
	chao: .asciiz "\t \t \t \t Welcome to Battleship game, you will have 3 ships, press 1 to play, press 2 to read the rules "
	taulon_input: .asciiz "Input ship: (row-bow, column-bow, row-stern, column-stern (input should be from 0 to 6)), you have 6 ships(3 2x1, 2 3x1, 1 4x1): "
	taulon_input2: .asciiz "Input ship for player2: (row-bow, column-bow, row-stern, column-stern (input should be from 0 to 6)), you have 6 ships(3 2x1, 2 3x1, 1 4x1): "	# 1 ship, 4x1
	xuongdong: .asciiz "\n"
	cach: .asciiz " "
	buffer: .space 1000
	file: .asciiz "test.txt"
	already_hit: .asciiz "This square has been hit by you before, choose another square\n"
	Prompt_shot: .ascii "Choose one square to shoot, Row, Column \n"
	Prompt_Shot_Repeat: .asciiz "INVALID: row and column between 0 and 6 \n"
	Prompt_Redo_Placement: .asciiz " Is already there."
	Turn1: .asciiz "Player 1 turn to shoot, input row - column you want to shoot \n"
	Turn2: .asciiz "Player 2 turn to shoot, input row - column you want to shoot \n"
	startfightz: .asciiz "It's time to shoot their ships\n"
	Player1_Won: .asciiz "All ship destroyed, Player 1 Win."
	Player2_Won: .asciiz "All ship destroyed, Player 2 Win."
	Game_Name: "\t \t \t \t \t \t \t \t \t   BATTLE5HIP GAME"
	# Can set up 3 tau con, 2 tau vua va 1 tau to theo thu tu
	Miss_Prompt: .asciiz "Missed, try again later\n\n"
	Hit_Prompt: .asciiz "Hit, congratulation\n\n"
	Error_Prompt_Small: .asciiz "Small ship must have 2 squares"
	Error_Prompt_Medium: .asciiz "Medium ship must have 3 squares"
	Error_Prompt_Big: .asciiz "Big ship must have 4 squares"
	Error_Line: .asciiz "The ships must be straight in vertical or horizon and must greater than 1 square, smaller than 5 square \n"
	Error_Num: .asciiz "Invalid number, please try again\n"
	Rules_Prompt1: .asciiz"\t1. In a classic game, each player sets up a fleet of battleships on their map(a 7x7 grid)." 
	Rules_Prompt2: .asciiz"\t2. This game have total 6 ships, 1 big ship with 4x1 size, 2 medium ships with 3x1 size and 3 small ships with 2x1 size"
	Rules_Prompt3: .asciiz"\tAfter the ships have been positioned, the game proceeds in a series of rounds"
	Rules_Prompt4: .asciiz "\tIn each round, each player takes a turn to announce a target square in opponent's grid which to be shot at"
	Rules_Prompt5: .asciiz "\tIf it is a hit, the grid will be marked -1" 
	Rules_Prompt6: .asciiz "\tIf all of a player's ships have been sunk, the game is over and their opponent wins\n"
	check_understanding: .asciiz "\t \t \t \t Do you understand all the rules? Wanna play it (1 to start and 2 to quit)?\n"
	temp: .word 0
	taulon: .word 0
	tauvua: .word 0
	taube: .word 0
	taulon2: .word 0
	tauvua2: .word 0
	taube2: .word 0
	First_Player_Grid: .word 16
	Second_Player_Grid: .word 16
	First_Player_Board: .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0
			    .word 0, 0, 0, 0, 0, 0, 0 #Set all 0 
			    
	Second_Player_Board: .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0
			     .word 0, 0, 0, 0, 0, 0, 0 #Set all 0, Duyet theo row-major
			     
	cotauroi: .asciiz " There is another ship in your input\n "
	dadutau: .asciiz "The type of ships you just input is enough\n"
	size: .word 7
	.eqv DATA_SIZE 4
	filename: .asciiz "output.txt"
	file_p1: .asciiz "Player1: "
	file_p2: .asciiz "Player2: "
.text
main:
	li $v0, 4
	la $a0, Game_Name
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, chao
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 5
	syscall
	beq $v0, 1, gameStart
	beq $v0, 2, Introduction
	j main
Introduction:
	li $v0, 4
	la $a0, Rules_Prompt1
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, Rules_Prompt2
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, Rules_Prompt3
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, Rules_Prompt4
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall		     
	li $v0, 4
	la $a0, Rules_Prompt5
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, Rules_Prompt6
	syscall
	li $v0, 4
	la $a0, xuongdong
	syscall
	li $v0, 4
	la $a0, check_understanding
	syscall
	li $v0, 5
	syscall
	beq $v0, 1, gameStart
	beq $v0, 2, sysend
gameStart:
li $t5, 6 #moi player 6 tau

load_adress_player1:
	la $t1, First_Player_Board #dia chi toi 2D array cua player 1
	li $t0, 49 # matrix 7x7 se co 49 o
	li $t2, 0 #bien dem thu tu cua cot, toi 7 se xuong dong
	
Print_Matrix1:
	li $v0, 1
	lw $a0, 0($t1)
	syscall
	li $v0, 4
	la $a0, cach
	syscall
	addi $t0, $t0, -1
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	rem $t3, $t2, 7
	beq $t3, 0, xuonghang
	bnez $t0, Print_Matrix1
xuonghang:
	li $v0, 4
	la $a0, xuongdong
	syscall
	bnez $t0, Print_Matrix1
	
getinput1:
	beqz $t5, getinfo_player2 #### CHECKING 6 TAU SE END
	li $v0, 4
	la $a0, taulon_input
	syscall
	
	li $v0, 5
	syscall
	move $t6, $v0 #row bow
	
	li $v0, 5
	syscall
	move $t7, $v0 #col bo?
	
	li $v0, 5
	syscall
	move $t8, $v0 #row stern
	
	li $v0, 5
	syscall
	move $t9, $v0 #col stern
		check:
			blt $t6, 0, loiso
			bgt $t6, 6, loiso
			blt $t7, 0, loiso
			bgt $t7, 6, loiso
			blt $t8, 0, loiso
			bgt $t8, 6, loiso
			blt $t9, 0, loiso
			bgt $t9, 6, loiso # check cac truong hop <0 va > 6
			blt $t6, $t8, swaprow #swap cho t6 > t8
			blt $t7, $t9, swapcol #swap cho t7 > t9
				beq $t6, $t8, input_col_1 #neu t6 = t8 thi se input theo col, phai check 1 lan nua
				beq $t7, $t9, input_row_1 # t7 = t9 thi input theo row, check 1 lan nua xem col co vi pham gi khong
				beq $t6, $t9, loichieudai
				beq $t7, $t8, loichieudai
				bne $t6, $t8, checkphatnua
					checkphatnua:
						bne $t7, $t9, loichieudai
					input_col_1:
						sub $s0, $t7, $t9 #check xem t7 - t9 lon hon 3 thi loi, bang 0 thi loi
						move $s4, $t9
						ble $s0, $0, loichieudai
						bgt $s0, 3, loichieudai ######### THEM TRUONG HOP CONG VAO SO LUONG TAU
					checklan2:
						la $t1, First_Player_Board
						lw $s1, size
						mul $s2, $t6, $s1
						add $s2, $s2, $s4
						sll $s2, $s2, 2
						add $t1, $t1, $s2
						lw $s3, 0($t1)
						beq $s3, 1, dacotau
						beq $s4, $t7, tiep1
						add $s4, $s4, 1
						j checklan2
							tiep1:
							beq $s0, 1, checknumsmall
							beq $s0, 2, checknummedium
							beq $s0, 3, checknumbig
						
						checknumsmall:
							lw $s0, taube
							blt $s0, 3, themtaube
							beq $s0, 3, dutauroi
							themtaube:
								add $s0, $s0, 1
								sw $s0, taube
								j startinputcol
						checknummedium:
							lw $s0, tauvua
							blt $s0, 2, themtauvua
							beq $s0, 2, dutauroi
							themtauvua:
								add $s0, $s0, 1
								sw $s0, tauvua
								j startinputcol
						checknumbig:
							lw $s0, taulon
							blt $s0, 1, themtaulon
							beq $s0, 1, dutauroi
							themtaulon:
								add $s0, $s0, 1
								sw $s0, taulon
								j startinputcol
									startinputcol:
									sub $t5, $t5, 1
									input_col:
										bgt $t9, $t7, load_adress_player1
										la $t1, First_Player_Board
										lw $s1, size #luu size cua array, o day la 7 do array co kich co 7x7
										mul $s2, $t6, $s1 # row index * column num ( col num = 7)
										add $s2, $s2, $t9 #t9 be hon t7, input bat dau tu t9
										mul $s2, $s2, 4
										add $t1, $t1, $s2
										li $s3, 1
										sw $s3, 0($t1)
										add $t9, $t9, 1
										li $s3, 0
										j input_col
						
					input_row_1:	
						sub $s0, $t6, $t8 #thuc hien y tuong nhu tren
						move $s4, $t8 
						ble $s0,$0, loichieudai
						bgt $s0, 3, loichieudai
					checklan2_2:
						
						la $t1, First_Player_Board
						lw $s1, size
						mul $s2, $s4, $s1
						add $s2, $s2, $t7
						mul $s2, $s2, 4
						add $t1, $t1, $s2
						lw $s3, 0($t1)
						beq $s3, 1, dacotau
						beq $s4, $t6, tiep
						add $s4, $s4, 1
						j checklan2_2
							tiep:
							beq $s0, 1, checknumsmall_2
							beq $s0, 2, checknummedium_2
							beq $s0, 3, checknumbig_2
					
					checknumsmall_2:
						lw $s0, taube
						blt $s0, 3, themtaube_2
						beq $s0 ,3, dutauroi
							themtaube_2:
								add $s0, $s0, 1
								sw $s0, taube
								j startinputrow
					checknummedium_2:
						lw $s0, tauvua
						blt $s0, 2, themtauvua_2
						beq $s0, 2, dutauroi
							themtauvua_2:
								add $s0, $s0, 1
								sw $s0, tauvua
								j startinputrow
					checknumbig_2:
						lw $s0, taulon
						blt $s0, 1, themtaulon_2
						beq $s0, 1, dutauroi
							themtaulon_2:
								add $s0, $s0, 1
								sw $s0, taulon
								j startinputrow
									startinputrow:
									sub $t5, $t5, 1
									input_row:
										bgt $t8, $t6, load_adress_player1
										la $t1, First_Player_Board
										lw $s1, size
										mul $s2, $t8, $s1
										add $s2, $s2, $t7
										mul $s2, $s2, 4
										add $t1, $t1, $s2
										li $s3, 1
										sw $s3, 0($t1)
										add $t8, $t8, 1
										li $s3, 0
										j input_row
									
						
loichieudai:
	li $v0, 4
	la $a0, Error_Line
	syscall
	j getinput1

loiso:
	li $v0, 4
	la $a0, Error_Num
	syscall
	j getinput1

dacotau:
	li $v0, 4
	la $a0, cotauroi
	syscall
	j getinput1

swaprow:
	sw $t6, temp
	move $t6, $t8
	lw $t8, temp
	j check
swapcol:
	sw $t7, temp
	move $t7, $t9
	lw $t9, temp
	j check	
dutauroi:
	li $v0, 4
	la $a0, dadutau
	syscall
	j getinput1
	

############################################ DEN LUC INPUT PLAYER 2 #################################################

getinfo_player2:
li $v0, 4
la $a0, xuongdong
syscall
li $v0, 4
la $a0, xuongdong
syscall
li $t5, 6 #moi player 6 tau

load_adress_player2:
	la $t1, Second_Player_Board #dia chi toi 2D array cua player 1
	li $t0, 49 # matrix 7x7 se co 49 o
	li $t2, 0 #bien dem thu tu cua cot, toi 7 se xuong dong
	
Print_Matrix2:
	li $v0, 1
	lw $a0, 0($t1)
	syscall
	li $v0, 4
	la $a0, cach
	syscall
	addi $t0, $t0, -1
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	rem $t3, $t2, 7
	beq $t3, 0, xuonghang2
	bnez $t0, Print_Matrix2
xuonghang2:
	li $v0, 4
	la $a0, xuongdong
	syscall
	bnez $t0, Print_Matrix2
	
getinput2:
	beqz $t5, StartFight #### CHECKING 6 TAU SE END
	li $v0, 4
	la $a0, taulon_input2
	syscall
	
	li $v0, 5
	syscall
	move $t6, $v0 #row bow
	
	li $v0, 5
	syscall
	move $t7, $v0 #col bo?
	
	li $v0, 5
	syscall
	move $t8, $v0 #row stern
	
	li $v0, 5
	syscall
	move $t9, $v0 #col stern
		check2:
			blt $t6, 0, loiso2
			bgt $t6, 6, loiso2
			blt $t7, 0, loiso2
			bgt $t7, 6, loiso2
			blt $t8, 0, loiso2
			bgt $t8, 6, loiso2
			blt $t9, 0, loiso2
			bgt $t9, 6, loiso2 # check cac truong hop <0 va > 6
			blt $t6, $t8, swaprow2 #swap cho t6 > t8
			blt $t7, $t9, swapcol2 #swap cho t7 > t9
				beq $t6, $t8, input_col_2 #neu t6 = t8 thi se input theo col, phai check 1 lan nua
				beq $t7, $t9, input_row_2 # t7 = t9 thi input theo row, check 1 lan nua xem col co vi pham gi khong
					input_col_2:
						sub $s0, $t7, $t9 #check xem t7 - t9 lon hon 3 thi loi, bang 0 thi loi
						move $s4, $t9
						ble $s0, $0, loichieudai2
						bgt $s0, 3, loichieudai2 ######### THEM TRUONG HOP CONG VAO SO LUONG TAU
					checklan2_player2:
						la $t1, Second_Player_Board
						lw $s1, size
						mul $s2, $t6, $s1
						add $s2, $s2, $s4
						sll $s2, $s2, 2
						add $t1, $t1, $s2
						lw $s3, 0($t1)
						beq $s3, 1, dacotau2
						beq $s4, $t7, tiep3
						add $s4, $s4, 1
						j checklan2_player2
							tiep3:
							beq $s0, 1, checknumsmall_player2
							beq $s0, 2, checknummedium_player2
							beq $s0, 3, checknumbig_player2
						
						checknumsmall_player2:
							lw $s0, taube2
							blt $s0, 3, themtaube2
							beq $s0, 3, dutauroi2
							themtaube2:
								add $s0, $s0, 1
								sw $s0, taube2
								j startinputcol_player2
						checknummedium_player2:
							lw $s0, tauvua2
							blt $s0, 2, themtauvua2
							beq $s0, 2, dutauroi2
							themtauvua2:
								add $s0, $s0, 1
								sw $s0, tauvua2
								j startinputcol_player2
						checknumbig_player2:
							lw $s0, taulon2
							blt $s0, 1, themtaulon2
							beq $s0, 1, dutauroi2
							themtaulon2:
								add $s0, $s0, 1
								sw $s0, taulon2
								j startinputcol_player2
									startinputcol_player2:
									sub $t5, $t5, 1
									input_col_player2:
										bgt $t9, $t7, load_adress_player2
										la $t1, Second_Player_Board
										lw $s1, size #luu size cua array, o day la 7 do array co kich co 7x7
										mul $s2, $t6, $s1 # row index * column num ( col num = 7)
										add $s2, $s2, $t9 #t9 be hon t7, input bat dau tu t9
										mul $s2, $s2, 4
										add $t1, $t1, $s2
										li $s3, 1
										sw $s3, 0($t1)
										add $t9, $t9, 1
										li $s3, 0
										j input_col_player2
						
					input_row_2:	
						sub $s0, $t6, $t8 #thuc hien y tuong nhu tren
						move $s4, $t8 
						ble $s0,$0, loichieudai2
						bgt $s0, 3, loichieudai2
					checklan2_player2_2:
						la $t1, Second_Player_Board
						lw $s1, size
						mul $s2, $s4, $s1
						add $s2, $s2, $t7
						mul $s2, $s2, 4
						add $t1, $t1, $s2
						lw $s3, 0($t1)
						beq $s3, 1, dacotau2
						beq $s4, $t6, tiep4
						add $s4, $s4, 1
						j checklan2_player2_2
							tiep4:
							beq $s0, 1, checknumsmall_player2_2
							beq $s0, 2, checknummedium_player2_2
							beq $s0, 3, checknumbig_player2_2
					
					checknumsmall_player2_2:
						lw $s0, taube2
						blt $s0, 3, themtaube_player2_2
						beq $s0 ,3, dutauroi2
							themtaube_player2_2:
								add $s0, $s0, 1
								sw $s0, taube2
								j startinputrow_player2
					checknummedium_player2_2:
						lw $s0, tauvua2
						blt $s0, 2, themtauvua_player2_2
						beq $s0, 2, dutauroi2
							themtauvua_player2_2:
								add $s0, $s0, 1
								sw $s0, tauvua2
								j startinputrow_player2
					checknumbig_player2_2:
						lw $s0, taulon2
						blt $s0, 1, themtaulon_player2_2
						beq $s0, 1, dutauroi2
							themtaulon_player2_2:
								add $s0, $s0, 1
								sw $s0, taulon2
								j startinputrow_player2
									startinputrow_player2:
									sub $t5, $t5, 1
									input_row_player2:
										bgt $t8, $t6, load_adress_player2
										la $t1, Second_Player_Board
										lw $s1, size
										mul $s2, $t8, $s1
										add $s2, $s2, $t7
										mul $s2, $s2, 4
										add $t1, $t1, $s2
										li $s3, 1
										sw $s3, 0($t1)
										add $t8, $t8, 1
										li $s3, 0
										j input_row_player2
									
						
loichieudai2:
	li $v0, 4
	la $a0, Error_Line
	syscall
	j getinput2

loiso2:
	li $v0, 4
	la $a0, Error_Num
	syscall
	j getinput2

dacotau2:
	li $v0, 4
	la $a0, cotauroi
	syscall
	j getinput2

swaprow2:
	sw $t6, temp
	move $t6, $t8
	lw $t8, temp
	j check2
swapcol2:
	sw $t7, temp
	move $t7, $t9
	lw $t9, temp
	j check2
dutauroi2:
	li $v0, 4
	la $a0, dadutau
	syscall
	j getinput2
	
	
StartFight:
	li $t4, 16 #16 vi tri cua player 1
	li $t5, 16 #16 vi tri cua player 2
	li $v0, 4
	la $a0, startfightz
	syscall
	li $t8, 0
	li $t9, 0
	
	#open file to write
	li $v0, 13
	la $a0, file
	li $a1, 1
	li $a2, 0
	syscall
	move $s6, $v0
	la $s4, buffer
	
	Realfight:
		
			player1_to_shoot:
				li $v0, 4
				la $a0, Turn1
				syscall
				la $t1, Second_Player_Board
				li $v0, 4
				la $a0, Prompt_shot
				syscall
				li $v0, 5
				syscall
				move $t8, $v0 # $t8 la row cua vi tri ban
				bgt $t8, 6, error_num_3
				blt $t8, 0, error_num_3
				move $t6, $v0
				addi $t6, $t6, 48
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 32
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $v0, 5
				syscall
				move $t9, $v0 # $t9 la col cua vi tri ban
				bgt $t9, 6, error_num_3
				blt $t9, 0, error_num_3
				move $t6, $v0
				addi $t6, $t6, 48
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 32
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 10
				sb $t6, 0($s4)
					shoot_p1:
						lw $s1, size
						mul $s2, $t8, $s1
						add $s2, $s2, $t9
						mul $s2, $s2, 4
						add $t1, $t1, $s2
						lw $s3, 0($t1)
						beq $s3, 1, Trung_p1
						beq $s3, 0, Hutroi_p1
						beq $s3, -1, Hutroi_p1
			player2_to_shoot:
				li $v0, 4
				la $a0, Turn2
				syscall
				la $t2, First_Player_Board
				li $v0, 4
				la $a0, Prompt_shot
				syscall
				li $v0, 5
				syscall
				move $t8, $v0 
				bgt $t8, 6, error_num_player2
				blt $t8, 0, error_num_player2
				move $t6, $v0
				addi $t6, $t6, 48
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 32
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $v0, 5
				syscall
				move $t9, $v0
				bgt $t9, 6, error_num_player2
				blt $t9, 0, error_num_player2
				move $t6, $v0
				addi $t6, $t6, 48
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 32
				sb $t6, 0($s4)
				addi $s4, $s4, 1
				li $t6, 10
				sb $t6, 0($s4)
				addi $s4, $s4, 1
					shoot_p2:
						lw $s1, size
						mul $s2, $t8, $s1
						add $s2, $s2, $t9
						mul $s2, $s2, 4
						add $t2, $t2, $s2
						lw $s3, 0($t2)
						beq $s3, 1, Trung_p2
						beq $s3, 0, Hutroi_p2
						beq $s3, -1, Hutroi_p2
				

error_num_3:
	li $v0, 4
	la $a0, Prompt_Shot_Repeat
	syscall
	j player1_to_shoot
Trung_p1:
	li $s5, -1
	sw $s5, 0($t1)
	li $v0, 4
	la $a0, Hit_Prompt
	syscall
	sub $t5, $t5, 1
	beqz $t5, P1Win
	j player2_to_shoot

Hutroi_p1:
	li $v0, 4
	la $a0, Miss_Prompt
	syscall
	j player2_to_shoot
	
DaBanRoi_p1:
	li $v0, 4
	la $a0, already_hit
	syscall
	j player1_to_shoot
	
error_num_player2:
	li $v0, 4
	la $a0, Prompt_Shot_Repeat
	syscall
	j player2_to_shoot

Trung_p2:
	li $s5, -1
	sw $s5, 0($t2)
	li $v0, 4
	la $a0, Hit_Prompt
	syscall
	sub $t4, $t4, 1
	beqz $t4, P2Win
	j player1_to_shoot
	
Hutroi_p2:
	li $v0, 4
	la $a0, Miss_Prompt
	syscall
	j player1_to_shoot

DaBanRoi_p2:
	li $v0, 4
	la $a0, already_hit
	syscall
	j player2_to_shoot
	
P1Win:
	li $v0, 4
	la $a0, Player1_Won
	syscall
	j sysend

P2Win:
	li $v0, 4
	la $a0, Player2_Won
	syscall
	j sysend

sysend:
	write:
		li $v0, 15
		move $a0, $s6
		la $a1, buffer
		la $a2, 1000
		syscall
	close:
		li $v0, 16
		move $a0, $s6
		syscall
	li $v0, 10
	syscall
	
	

.data
   .empty_string: .asciiz ""
   .single_space: .asciiz " "
   .line_feed: .asciiz "\n"
   .buffer_read: .space 1024
   .align 2
   .last_func_return: .word 0
   .argc: .word 0
   .argv: .space 1024 # 4*256 args maximum
   .arg_concat: .space 1024 # concat de tout les args
   .align 2
   mots: .space 400 # 100*4
   .s0: .asciiz "Entrez le nombre de mots de la phrase : "
   nombre: .space 1024
   i: .space 1024
   .s1: .asciiz "0"
   .tmp_0: .space 1024
   .s2: .asciiz "1"
   .s3: .asciiz "Entrez le mot numero "
   .s4: .asciiz " : "
   .tmp_1: .space 1024
   .s5: .asciiz "1"
   .tmp_2: .space 1024
   .s6: .asciiz "0"
   .s7: .asciiz "1"
   .s8: .asciiz "2"
   .s9: .asciiz "3"
   .s10: .asciiz "4"
   .s11: .asciiz "5"
   .s12: .asciiz "6"
   .s13: .asciiz "7"
   .s14: .asciiz "8"
   .s15: .asciiz "9"
   .s16: .asciiz "10"
   .s17: .asciiz "11"
   .s18: .asciiz "12"
   .s19: .asciiz "13"
   .s20: .asciiz "14"
   .s21: .asciiz "15"
   .s22: .asciiz "16"
   .s23: .asciiz "17"
   .s24: .asciiz "18"
   .s25: .asciiz "19"
   .s26: .asciiz "20"
   .s27: .asciiz "21"
   .s28: .asciiz "22"
   .s29: .asciiz "23"
   .s30: .asciiz "24"
   .s31: .asciiz "25"
   .s32: .asciiz "26"
   .s33: .asciiz "27"
   .s34: .asciiz "28"
   .s35: .asciiz "29"
   .s36: .asciiz "30"
   .s37: .asciiz "31"
   .s38: .asciiz "32"
   .s39: .asciiz "33"
   .s40: .asciiz "34"
   .s41: .asciiz "35"
   .s42: .asciiz "36"
   .s43: .asciiz "37"
   .s44: .asciiz "38"
   .s45: .asciiz "39"
   .s46: .asciiz "40"
   .s47: .asciiz "41"
   .s48: .asciiz "42"
   .s49: .asciiz "43"
   .s50: .asciiz "44"
   .s51: .asciiz "45"
   .s52: .asciiz "46"
   .s53: .asciiz "47"
   .s54: .asciiz "48"
   .s55: .asciiz "49"
   .s56: .asciiz "50"
   .s57: .asciiz "51"
   .s58: .asciiz "52"
   .s59: .asciiz "53"
   .s60: .asciiz "54"
   .s61: .asciiz "55"
   .s62: .asciiz "56"
   .s63: .asciiz "57"
   .s64: .asciiz "58"
   .s65: .asciiz "59"
   .s66: .asciiz "60"
   .s67: .asciiz "61"
   .s68: .asciiz "62"
   .s69: .asciiz "63"
   .s70: .asciiz "64"
   .s71: .asciiz "65"
   .s72: .asciiz "66"
   .s73: .asciiz "67"
   .s74: .asciiz "68"
   .s75: .asciiz "69"
   .s76: .asciiz "70"
   .s77: .asciiz "71"
   .s78: .asciiz "72"
   .s79: .asciiz "73"
   .s80: .asciiz "74"
   .s81: .asciiz "75"
   .s82: .asciiz "76"
   .s83: .asciiz "77"
   .s84: .asciiz "78"
   .s85: .asciiz "79"
   .s86: .asciiz "80"
   .s87: .asciiz "81"
   .s88: .asciiz "82"
   .s89: .asciiz "83"
   .s90: .asciiz "84"
   .s91: .asciiz "85"
   .s92: .asciiz "86"
   .s93: .asciiz "87"
   .s94: .asciiz "88"
   .s95: .asciiz "89"
   .s96: .asciiz "90"
   .s97: .asciiz "91"
   .s98: .asciiz "92"
   .s99: .asciiz "93"
   .s100: .asciiz "94"
   .s101: .asciiz "95"
   .s102: .asciiz "96"
   .s103: .asciiz "97"
   .s104: .asciiz "98"
   .s105: .asciiz "99"
   .s106: .asciiz "\n"
   new_phrase: .space 1024
   .s107: .asciiz ""
   mot: .space 1024
   .align 2
   .tmp_3_for_tab: .space 400 # 100*4
   .tmp_4: .space 1024
   .s108: .asciiz "0"
   .s109: .asciiz "0"
   .s110: .asciiz "1"
   .s111: .asciiz "1"
   .s112: .asciiz "2"
   .s113: .asciiz "2"
   .s114: .asciiz "3"
   .s115: .asciiz "3"
   .s116: .asciiz "4"
   .s117: .asciiz "4"
   .s118: .asciiz "5"
   .s119: .asciiz "5"
   .s120: .asciiz "6"
   .s121: .asciiz "6"
   .s122: .asciiz "7"
   .s123: .asciiz "7"
   .s124: .asciiz "8"
   .s125: .asciiz "8"
   .s126: .asciiz "9"
   .s127: .asciiz "9"
   .s128: .asciiz "10"
   .s129: .asciiz "10"
   .s130: .asciiz "11"
   .s131: .asciiz "11"
   .s132: .asciiz "12"
   .s133: .asciiz "12"
   .s134: .asciiz "13"
   .s135: .asciiz "13"
   .s136: .asciiz "14"
   .s137: .asciiz "14"
   .s138: .asciiz "15"
   .s139: .asciiz "15"
   .s140: .asciiz "16"
   .s141: .asciiz "16"
   .s142: .asciiz "17"
   .s143: .asciiz "17"
   .s144: .asciiz "18"
   .s145: .asciiz "18"
   .s146: .asciiz "19"
   .s147: .asciiz "19"
   .s148: .asciiz "20"
   .s149: .asciiz "20"
   .s150: .asciiz "21"
   .s151: .asciiz "21"
   .s152: .asciiz "22"
   .s153: .asciiz "22"
   .s154: .asciiz "23"
   .s155: .asciiz "23"
   .s156: .asciiz "24"
   .s157: .asciiz "24"
   .s158: .asciiz "25"
   .s159: .asciiz "25"
   .s160: .asciiz "26"
   .s161: .asciiz "26"
   .s162: .asciiz "27"
   .s163: .asciiz "27"
   .s164: .asciiz "28"
   .s165: .asciiz "28"
   .s166: .asciiz "29"
   .s167: .asciiz "29"
   .s168: .asciiz "30"
   .s169: .asciiz "30"
   .s170: .asciiz "31"
   .s171: .asciiz "31"
   .s172: .asciiz "32"
   .s173: .asciiz "32"
   .s174: .asciiz "33"
   .s175: .asciiz "33"
   .s176: .asciiz "34"
   .s177: .asciiz "34"
   .s178: .asciiz "35"
   .s179: .asciiz "35"
   .s180: .asciiz "36"
   .s181: .asciiz "36"
   .s182: .asciiz "37"
   .s183: .asciiz "37"
   .s184: .asciiz "38"
   .s185: .asciiz "38"
   .s186: .asciiz "39"
   .s187: .asciiz "39"
   .s188: .asciiz "40"
   .s189: .asciiz "40"
   .s190: .asciiz "41"
   .s191: .asciiz "41"
   .s192: .asciiz "42"
   .s193: .asciiz "42"
   .s194: .asciiz "43"
   .s195: .asciiz "43"
   .s196: .asciiz "44"
   .s197: .asciiz "44"
   .s198: .asciiz "45"
   .s199: .asciiz "45"
   .s200: .asciiz "46"
   .s201: .asciiz "46"
   .s202: .asciiz "47"
   .s203: .asciiz "47"
   .s204: .asciiz "48"
   .s205: .asciiz "48"
   .s206: .asciiz "49"
   .s207: .asciiz "49"
   .s208: .asciiz "50"
   .s209: .asciiz "50"
   .s210: .asciiz "51"
   .s211: .asciiz "51"
   .s212: .asciiz "52"
   .s213: .asciiz "52"
   .s214: .asciiz "53"
   .s215: .asciiz "53"
   .s216: .asciiz "54"
   .s217: .asciiz "54"
   .s218: .asciiz "55"
   .s219: .asciiz "55"
   .s220: .asciiz "56"
   .s221: .asciiz "56"
   .s222: .asciiz "57"
   .s223: .asciiz "57"
   .s224: .asciiz "58"
   .s225: .asciiz "58"
   .s226: .asciiz "59"
   .s227: .asciiz "59"
   .s228: .asciiz "60"
   .s229: .asciiz "60"
   .s230: .asciiz "61"
   .s231: .asciiz "61"
   .s232: .asciiz "62"
   .s233: .asciiz "62"
   .s234: .asciiz "63"
   .s235: .asciiz "63"
   .s236: .asciiz "64"
   .s237: .asciiz "64"
   .s238: .asciiz "65"
   .s239: .asciiz "65"
   .s240: .asciiz "66"
   .s241: .asciiz "66"
   .s242: .asciiz "67"
   .s243: .asciiz "67"
   .s244: .asciiz "68"
   .s245: .asciiz "68"
   .s246: .asciiz "69"
   .s247: .asciiz "69"
   .s248: .asciiz "70"
   .s249: .asciiz "70"
   .s250: .asciiz "71"
   .s251: .asciiz "71"
   .s252: .asciiz "72"
   .s253: .asciiz "72"
   .s254: .asciiz "73"
   .s255: .asciiz "73"
   .s256: .asciiz "74"
   .s257: .asciiz "74"
   .s258: .asciiz "75"
   .s259: .asciiz "75"
   .s260: .asciiz "76"
   .s261: .asciiz "76"
   .s262: .asciiz "77"
   .s263: .asciiz "77"
   .s264: .asciiz "78"
   .s265: .asciiz "78"
   .s266: .asciiz "79"
   .s267: .asciiz "79"
   .s268: .asciiz "80"
   .s269: .asciiz "80"
   .s270: .asciiz "81"
   .s271: .asciiz "81"
   .s272: .asciiz "82"
   .s273: .asciiz "82"
   .s274: .asciiz "83"
   .s275: .asciiz "83"
   .s276: .asciiz "84"
   .s277: .asciiz "84"
   .s278: .asciiz "85"
   .s279: .asciiz "85"
   .s280: .asciiz "86"
   .s281: .asciiz "86"
   .s282: .asciiz "87"
   .s283: .asciiz "87"
   .s284: .asciiz "88"
   .s285: .asciiz "88"
   .s286: .asciiz "89"
   .s287: .asciiz "89"
   .s288: .asciiz "90"
   .s289: .asciiz "90"
   .s290: .asciiz "91"
   .s291: .asciiz "91"
   .s292: .asciiz "92"
   .s293: .asciiz "92"
   .s294: .asciiz "93"
   .s295: .asciiz "93"
   .s296: .asciiz "94"
   .s297: .asciiz "94"
   .s298: .asciiz "95"
   .s299: .asciiz "95"
   .s300: .asciiz "96"
   .s301: .asciiz "96"
   .s302: .asciiz "97"
   .s303: .asciiz "97"
   .s304: .asciiz "98"
   .s305: .asciiz "98"
   .s306: .asciiz "99"
   .s307: .asciiz "99"
   .tmp_5_for_idx: .space 1024
   .s308: .asciiz "0"
   .s309: .asciiz "100"
   .s310: .asciiz "1"
   .s311: .asciiz "Anne"
   .s312: .asciiz "Corinne"
   .s313: .asciiz "Sabine"
   .s314: .asciiz "Emilie"
   .tmp_6: .space 1024
   .s315: .asciiz " "
   .tmp_7: .space 1024
   .s316: .asciiz "elle"
   .s317: .asciiz "Pierre"
   .s318: .asciiz "Paul"
   .s319: .asciiz "Jacques"
   .s320: .asciiz "Albert"
   .tmp_8: .space 1024
   .s321: .asciiz " "
   .tmp_9: .space 1024
   .s322: .asciiz "lui"
   .tmp_10: .space 1024
   .s323: .asciiz " "
   .tmp_11: .space 1024
   .s324: .asciiz "Nouvelle phrase :"
   .s325: .asciiz "\n"

.text
.globl main

main:
# chargement argc et argv
   move $s0, $a0
   la $t0, .argc
   sw $s0, ($t0) #.argc contient mtn le nmbre d'arg
   move $s1, $a1 #$s1 contient l'adresse des arguments
   la $t2, .argv #adresse dans .argv
   li $t3, 0 # compteur de boucle
   la $t4, .argc
   lw $t4, ($t4) # arret de boucle
   sub $sp, $sp, 20
   sw $t0, 0($sp)
   sw $t1, 4($sp)
   sw $t2, 8($sp)
   sw $t3, 12($sp)
   sw $t4, 16($sp)
   la $a0, .arg_concat
   la $a1, .empty_string
   la $a2, .empty_string
   jal concat
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   lw $t3, 12($sp)
   lw $t4, 16($sp)
   addi $sp, $sp, 20
loop_print_arg:
   beq $t3, $t4, loop_print_arg_end
   lw $t0, ($s1) # chargement d'un argument
   sw $t0, ($t2) # stockage dans .argv
   addi $s1, $s1, 4 # avancer dans les arguments
   sub $sp, $sp, 20
   sw $t0, 0($sp)
   sw $t1, 4($sp)
   sw $t2, 8($sp)
   sw $t3, 12($sp)
   sw $t4, 16($sp)
   la $a0, .arg_concat
   la $a1, .arg_concat
   lw $a2, -4($s1)
   jal concat
   la $a0, .arg_concat
   la $a1, .arg_concat
   la $a2, .single_space
   jal concat
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   lw $t3, 12($sp)
   lw $t4, 16($sp)
   addi $sp, $sp, 20
   addi $t2, $t2, 4 # avancer dans .argv
   addi $t3, $t3, 1 # compteur de boucle
   b loop_print_arg
loop_print_arg_end:
   la $a0, .arg_concat
   jal strlen
   la $t0, .arg_concat
   add $t0, $t0, $v0
   sub $t0, $t0, 1
   li $t1, 0
   sb $t1, ($t0)
# initialisations des variables (premier byte à zéro)
   li $t1, 0
   la $t2, .empty_string
# initialisation du tableau mots
   la $t0, mots
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
# initialisation de nombre
   la $t0, nombre
   sb $t1, 0($t0)
# initialisation de i
   la $t0, i
   sb $t1, 0($t0)
# initialisation de .tmp_0
   la $t0, .tmp_0
   sb $t1, 0($t0)
# initialisation de .tmp_1
   la $t0, .tmp_1
   sb $t1, 0($t0)
# initialisation de .tmp_2
   la $t0, .tmp_2
   sb $t1, 0($t0)
# initialisation de new_phrase
   la $t0, new_phrase
   sb $t1, 0($t0)
# initialisation de mot
   la $t0, mot
   sb $t1, 0($t0)
# initialisation du tableau .tmp_3_for_tab
   la $t0, .tmp_3_for_tab
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
   sw $t2 ($t0)
   addi $t0, $t0, 4
# initialisation de .tmp_4
   la $t0, .tmp_4
   sb $t1, 0($t0)
# initialisation de .tmp_5_for_idx
   la $t0, .tmp_5_for_idx
   sb $t1, 0($t0)
# initialisation de .tmp_6
   la $t0, .tmp_6
   sb $t1, 0($t0)
# initialisation de .tmp_7
   la $t0, .tmp_7
   sb $t1, 0($t0)
# initialisation de .tmp_8
   la $t0, .tmp_8
   sb $t1, 0($t0)
# initialisation de .tmp_9
   la $t0, .tmp_9
   sb $t1, 0($t0)
# initialisation de .tmp_10
   la $t0, .tmp_10
   sb $t1, 0($t0)
# initialisation de .tmp_11
   la $t0, .tmp_11
   sb $t1, 0($t0)
# fin des initialisations ----

# quad 1
   la $a0, .s0
   li $v0, 4
   syscall #print_str
# quad 3
   # read -> nombre
   li $v0, 8
   la $a0, .buffer_read # @ buf
   li $a1, 1024 # buf size
   syscall # read_str
   la $a0, .buffer_read
   jal strlen
   subi $t0, $v0, 1
   la $t2, .buffer_read
   add $t0, $t0, $t2
   li $t1, 0
   sb $t1, ($t0) #suppresion \n
   la $a0, .buffer_read
   jal copy_string
   la $a0, nombre # res
    move $a1, $v0 # val
   la $a2, .empty_string
   jal concat
# quad 5
   la $a0, i
   la $a1, .s1
   la $a2, .empty_string
   jal concat
# quad 6
_l2:
   la $a0, i
   jal convert_entier
   move $a1, $v0
   la $a0, nombre
   jal convert_entier
   blt $a1, $v0, _l0
# quad 7
   b _l1
_l0:
# quad 9

   # .tmp_0 <- i+.s2
   la $a0, i
   jal convert_entier
   move $s0, $v0
   la $a0, .s2
   jal convert_entier
   move $s1, $v0
   add $a0, $s0, $s1
   la $a1, .tmp_0
   jal convert_string
   #---
# quad 10
   la $a0, .s3
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 11
   la $a0, .tmp_0
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 12
   la $a0, .s4
   li $v0, 4
   syscall #print_str
# quad 13
   # read -> mots[i]
   li $v0, 8
   la $a0, .buffer_read # @ buf
   la $a1, 1024 # buf size
   syscall # read_str
   la $a0, .buffer_read
   jal strlen
   subi $t0, $v0, 1
   la $t2, .buffer_read
   add $t0, $t0, $t2
   li $t1, 0
   sb $t1, ($t0) #suppresion \n
   la $a0, .buffer_read
   jal copy_string
   move $s3, $v0 #stockage de la copie dans $s3
   # tab_set
   la $a0, i
   jal convert_entier # conversion index
   move $s0, $v0 # stockage de l'index dans $s0
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots # addresse du tableau 
   add $t0, $t0, $s0 # addresse de la case 
   sw $s3, ($t0) # on stocke la copie
   # ----
# quad 15

   # .tmp_1 <- i+.s5
   la $a0, i
   jal convert_entier
   move $s0, $v0
   la $a0, .s5
   jal convert_entier
   move $s1, $v0
   add $a0, $s0, $s1
   la $a1, .tmp_1
   jal convert_string
   #---
# quad 16
   la $a0, i
   la $a1, .tmp_1
   la $a2, .empty_string
   jal concat
# quad 17
   b _l2
_l1:
# quad 19
   # .tmp_2 <- mots[.s6]
   la $a0, .s6
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 20
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 21
   # .tmp_2 <- mots[.s7]
   la $a0, .s7
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 22
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 23
   # .tmp_2 <- mots[.s8]
   la $a0, .s8
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 24
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 25
   # .tmp_2 <- mots[.s9]
   la $a0, .s9
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 26
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 27
   # .tmp_2 <- mots[.s10]
   la $a0, .s10
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 28
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 29
   # .tmp_2 <- mots[.s11]
   la $a0, .s11
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 30
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 31
   # .tmp_2 <- mots[.s12]
   la $a0, .s12
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 32
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 33
   # .tmp_2 <- mots[.s13]
   la $a0, .s13
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 34
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 35
   # .tmp_2 <- mots[.s14]
   la $a0, .s14
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 36
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 37
   # .tmp_2 <- mots[.s15]
   la $a0, .s15
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 38
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 39
   # .tmp_2 <- mots[.s16]
   la $a0, .s16
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 40
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 41
   # .tmp_2 <- mots[.s17]
   la $a0, .s17
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 42
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 43
   # .tmp_2 <- mots[.s18]
   la $a0, .s18
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 44
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 45
   # .tmp_2 <- mots[.s19]
   la $a0, .s19
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 46
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 47
   # .tmp_2 <- mots[.s20]
   la $a0, .s20
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 48
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 49
   # .tmp_2 <- mots[.s21]
   la $a0, .s21
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 50
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 51
   # .tmp_2 <- mots[.s22]
   la $a0, .s22
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 52
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 53
   # .tmp_2 <- mots[.s23]
   la $a0, .s23
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 54
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 55
   # .tmp_2 <- mots[.s24]
   la $a0, .s24
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 56
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 57
   # .tmp_2 <- mots[.s25]
   la $a0, .s25
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 58
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 59
   # .tmp_2 <- mots[.s26]
   la $a0, .s26
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 60
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 61
   # .tmp_2 <- mots[.s27]
   la $a0, .s27
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 62
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 63
   # .tmp_2 <- mots[.s28]
   la $a0, .s28
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 64
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 65
   # .tmp_2 <- mots[.s29]
   la $a0, .s29
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 66
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 67
   # .tmp_2 <- mots[.s30]
   la $a0, .s30
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 68
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 69
   # .tmp_2 <- mots[.s31]
   la $a0, .s31
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 70
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 71
   # .tmp_2 <- mots[.s32]
   la $a0, .s32
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 72
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 73
   # .tmp_2 <- mots[.s33]
   la $a0, .s33
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 74
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 75
   # .tmp_2 <- mots[.s34]
   la $a0, .s34
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 76
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 77
   # .tmp_2 <- mots[.s35]
   la $a0, .s35
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 78
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 79
   # .tmp_2 <- mots[.s36]
   la $a0, .s36
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 80
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 81
   # .tmp_2 <- mots[.s37]
   la $a0, .s37
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 82
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 83
   # .tmp_2 <- mots[.s38]
   la $a0, .s38
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 84
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 85
   # .tmp_2 <- mots[.s39]
   la $a0, .s39
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 86
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 87
   # .tmp_2 <- mots[.s40]
   la $a0, .s40
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 88
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 89
   # .tmp_2 <- mots[.s41]
   la $a0, .s41
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 90
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 91
   # .tmp_2 <- mots[.s42]
   la $a0, .s42
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 92
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 93
   # .tmp_2 <- mots[.s43]
   la $a0, .s43
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 94
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 95
   # .tmp_2 <- mots[.s44]
   la $a0, .s44
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 96
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 97
   # .tmp_2 <- mots[.s45]
   la $a0, .s45
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 98
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 99
   # .tmp_2 <- mots[.s46]
   la $a0, .s46
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 100
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 101
   # .tmp_2 <- mots[.s47]
   la $a0, .s47
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 102
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 103
   # .tmp_2 <- mots[.s48]
   la $a0, .s48
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 104
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 105
   # .tmp_2 <- mots[.s49]
   la $a0, .s49
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 106
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 107
   # .tmp_2 <- mots[.s50]
   la $a0, .s50
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 108
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 109
   # .tmp_2 <- mots[.s51]
   la $a0, .s51
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 110
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 111
   # .tmp_2 <- mots[.s52]
   la $a0, .s52
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 112
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 113
   # .tmp_2 <- mots[.s53]
   la $a0, .s53
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 114
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 115
   # .tmp_2 <- mots[.s54]
   la $a0, .s54
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 116
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 117
   # .tmp_2 <- mots[.s55]
   la $a0, .s55
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 118
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 119
   # .tmp_2 <- mots[.s56]
   la $a0, .s56
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 120
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 121
   # .tmp_2 <- mots[.s57]
   la $a0, .s57
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 122
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 123
   # .tmp_2 <- mots[.s58]
   la $a0, .s58
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 124
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 125
   # .tmp_2 <- mots[.s59]
   la $a0, .s59
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 126
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 127
   # .tmp_2 <- mots[.s60]
   la $a0, .s60
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 128
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 129
   # .tmp_2 <- mots[.s61]
   la $a0, .s61
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 130
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 131
   # .tmp_2 <- mots[.s62]
   la $a0, .s62
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 132
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 133
   # .tmp_2 <- mots[.s63]
   la $a0, .s63
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 134
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 135
   # .tmp_2 <- mots[.s64]
   la $a0, .s64
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 136
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 137
   # .tmp_2 <- mots[.s65]
   la $a0, .s65
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 138
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 139
   # .tmp_2 <- mots[.s66]
   la $a0, .s66
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 140
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 141
   # .tmp_2 <- mots[.s67]
   la $a0, .s67
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 142
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 143
   # .tmp_2 <- mots[.s68]
   la $a0, .s68
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 144
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 145
   # .tmp_2 <- mots[.s69]
   la $a0, .s69
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 146
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 147
   # .tmp_2 <- mots[.s70]
   la $a0, .s70
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 148
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 149
   # .tmp_2 <- mots[.s71]
   la $a0, .s71
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 150
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 151
   # .tmp_2 <- mots[.s72]
   la $a0, .s72
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 152
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 153
   # .tmp_2 <- mots[.s73]
   la $a0, .s73
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 154
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 155
   # .tmp_2 <- mots[.s74]
   la $a0, .s74
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 156
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 157
   # .tmp_2 <- mots[.s75]
   la $a0, .s75
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 158
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 159
   # .tmp_2 <- mots[.s76]
   la $a0, .s76
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 160
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 161
   # .tmp_2 <- mots[.s77]
   la $a0, .s77
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 162
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 163
   # .tmp_2 <- mots[.s78]
   la $a0, .s78
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 164
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 165
   # .tmp_2 <- mots[.s79]
   la $a0, .s79
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 166
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 167
   # .tmp_2 <- mots[.s80]
   la $a0, .s80
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 168
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 169
   # .tmp_2 <- mots[.s81]
   la $a0, .s81
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 170
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 171
   # .tmp_2 <- mots[.s82]
   la $a0, .s82
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 172
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 173
   # .tmp_2 <- mots[.s83]
   la $a0, .s83
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 174
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 175
   # .tmp_2 <- mots[.s84]
   la $a0, .s84
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 176
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 177
   # .tmp_2 <- mots[.s85]
   la $a0, .s85
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 178
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 179
   # .tmp_2 <- mots[.s86]
   la $a0, .s86
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 180
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 181
   # .tmp_2 <- mots[.s87]
   la $a0, .s87
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 182
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 183
   # .tmp_2 <- mots[.s88]
   la $a0, .s88
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 184
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 185
   # .tmp_2 <- mots[.s89]
   la $a0, .s89
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 186
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 187
   # .tmp_2 <- mots[.s90]
   la $a0, .s90
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 188
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 189
   # .tmp_2 <- mots[.s91]
   la $a0, .s91
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 190
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 191
   # .tmp_2 <- mots[.s92]
   la $a0, .s92
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 192
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 193
   # .tmp_2 <- mots[.s93]
   la $a0, .s93
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 194
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 195
   # .tmp_2 <- mots[.s94]
   la $a0, .s94
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 196
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 197
   # .tmp_2 <- mots[.s95]
   la $a0, .s95
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 198
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 199
   # .tmp_2 <- mots[.s96]
   la $a0, .s96
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 200
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 201
   # .tmp_2 <- mots[.s97]
   la $a0, .s97
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 202
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 203
   # .tmp_2 <- mots[.s98]
   la $a0, .s98
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 204
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 205
   # .tmp_2 <- mots[.s99]
   la $a0, .s99
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 206
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 207
   # .tmp_2 <- mots[.s100]
   la $a0, .s100
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 208
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 209
   # .tmp_2 <- mots[.s101]
   la $a0, .s101
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 210
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 211
   # .tmp_2 <- mots[.s102]
   la $a0, .s102
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 212
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 213
   # .tmp_2 <- mots[.s103]
   la $a0, .s103
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 214
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 215
   # .tmp_2 <- mots[.s104]
   la $a0, .s104
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 216
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 217
   # .tmp_2 <- mots[.s105]
   la $a0, .s105
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_2
   la $a2, .empty_string
   jal concat
   # ----
# quad 218
   la $a0, .tmp_2
   li $v0, 4
   syscall #print_str
# quad 219
   la $a0, .s106
   li $v0, 4
   syscall #print_str
# quad 221
   la $a0, new_phrase
   la $a1, .s107
   la $a2, .empty_string
   jal concat
# quad 225
   # .tmp_4 <- mots[.s108]
   la $a0, .s108
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 226
   # .tmp_3_for_tab[.s109] <- .tmp_4
   la $a0, .s109
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 227
   # .tmp_4 <- mots[.s110]
   la $a0, .s110
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 228
   # .tmp_3_for_tab[.s111] <- .tmp_4
   la $a0, .s111
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 229
   # .tmp_4 <- mots[.s112]
   la $a0, .s112
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 230
   # .tmp_3_for_tab[.s113] <- .tmp_4
   la $a0, .s113
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 231
   # .tmp_4 <- mots[.s114]
   la $a0, .s114
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 232
   # .tmp_3_for_tab[.s115] <- .tmp_4
   la $a0, .s115
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 233
   # .tmp_4 <- mots[.s116]
   la $a0, .s116
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 234
   # .tmp_3_for_tab[.s117] <- .tmp_4
   la $a0, .s117
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 235
   # .tmp_4 <- mots[.s118]
   la $a0, .s118
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 236
   # .tmp_3_for_tab[.s119] <- .tmp_4
   la $a0, .s119
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 237
   # .tmp_4 <- mots[.s120]
   la $a0, .s120
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 238
   # .tmp_3_for_tab[.s121] <- .tmp_4
   la $a0, .s121
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 239
   # .tmp_4 <- mots[.s122]
   la $a0, .s122
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 240
   # .tmp_3_for_tab[.s123] <- .tmp_4
   la $a0, .s123
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 241
   # .tmp_4 <- mots[.s124]
   la $a0, .s124
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 242
   # .tmp_3_for_tab[.s125] <- .tmp_4
   la $a0, .s125
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 243
   # .tmp_4 <- mots[.s126]
   la $a0, .s126
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 244
   # .tmp_3_for_tab[.s127] <- .tmp_4
   la $a0, .s127
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 245
   # .tmp_4 <- mots[.s128]
   la $a0, .s128
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 246
   # .tmp_3_for_tab[.s129] <- .tmp_4
   la $a0, .s129
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 247
   # .tmp_4 <- mots[.s130]
   la $a0, .s130
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 248
   # .tmp_3_for_tab[.s131] <- .tmp_4
   la $a0, .s131
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 249
   # .tmp_4 <- mots[.s132]
   la $a0, .s132
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 250
   # .tmp_3_for_tab[.s133] <- .tmp_4
   la $a0, .s133
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 251
   # .tmp_4 <- mots[.s134]
   la $a0, .s134
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 252
   # .tmp_3_for_tab[.s135] <- .tmp_4
   la $a0, .s135
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 253
   # .tmp_4 <- mots[.s136]
   la $a0, .s136
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 254
   # .tmp_3_for_tab[.s137] <- .tmp_4
   la $a0, .s137
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 255
   # .tmp_4 <- mots[.s138]
   la $a0, .s138
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 256
   # .tmp_3_for_tab[.s139] <- .tmp_4
   la $a0, .s139
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 257
   # .tmp_4 <- mots[.s140]
   la $a0, .s140
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 258
   # .tmp_3_for_tab[.s141] <- .tmp_4
   la $a0, .s141
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 259
   # .tmp_4 <- mots[.s142]
   la $a0, .s142
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 260
   # .tmp_3_for_tab[.s143] <- .tmp_4
   la $a0, .s143
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 261
   # .tmp_4 <- mots[.s144]
   la $a0, .s144
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 262
   # .tmp_3_for_tab[.s145] <- .tmp_4
   la $a0, .s145
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 263
   # .tmp_4 <- mots[.s146]
   la $a0, .s146
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 264
   # .tmp_3_for_tab[.s147] <- .tmp_4
   la $a0, .s147
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 265
   # .tmp_4 <- mots[.s148]
   la $a0, .s148
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 266
   # .tmp_3_for_tab[.s149] <- .tmp_4
   la $a0, .s149
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 267
   # .tmp_4 <- mots[.s150]
   la $a0, .s150
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 268
   # .tmp_3_for_tab[.s151] <- .tmp_4
   la $a0, .s151
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 269
   # .tmp_4 <- mots[.s152]
   la $a0, .s152
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 270
   # .tmp_3_for_tab[.s153] <- .tmp_4
   la $a0, .s153
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 271
   # .tmp_4 <- mots[.s154]
   la $a0, .s154
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 272
   # .tmp_3_for_tab[.s155] <- .tmp_4
   la $a0, .s155
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 273
   # .tmp_4 <- mots[.s156]
   la $a0, .s156
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 274
   # .tmp_3_for_tab[.s157] <- .tmp_4
   la $a0, .s157
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 275
   # .tmp_4 <- mots[.s158]
   la $a0, .s158
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 276
   # .tmp_3_for_tab[.s159] <- .tmp_4
   la $a0, .s159
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 277
   # .tmp_4 <- mots[.s160]
   la $a0, .s160
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 278
   # .tmp_3_for_tab[.s161] <- .tmp_4
   la $a0, .s161
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 279
   # .tmp_4 <- mots[.s162]
   la $a0, .s162
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 280
   # .tmp_3_for_tab[.s163] <- .tmp_4
   la $a0, .s163
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 281
   # .tmp_4 <- mots[.s164]
   la $a0, .s164
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 282
   # .tmp_3_for_tab[.s165] <- .tmp_4
   la $a0, .s165
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 283
   # .tmp_4 <- mots[.s166]
   la $a0, .s166
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 284
   # .tmp_3_for_tab[.s167] <- .tmp_4
   la $a0, .s167
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 285
   # .tmp_4 <- mots[.s168]
   la $a0, .s168
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 286
   # .tmp_3_for_tab[.s169] <- .tmp_4
   la $a0, .s169
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 287
   # .tmp_4 <- mots[.s170]
   la $a0, .s170
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 288
   # .tmp_3_for_tab[.s171] <- .tmp_4
   la $a0, .s171
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 289
   # .tmp_4 <- mots[.s172]
   la $a0, .s172
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 290
   # .tmp_3_for_tab[.s173] <- .tmp_4
   la $a0, .s173
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 291
   # .tmp_4 <- mots[.s174]
   la $a0, .s174
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 292
   # .tmp_3_for_tab[.s175] <- .tmp_4
   la $a0, .s175
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 293
   # .tmp_4 <- mots[.s176]
   la $a0, .s176
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 294
   # .tmp_3_for_tab[.s177] <- .tmp_4
   la $a0, .s177
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 295
   # .tmp_4 <- mots[.s178]
   la $a0, .s178
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 296
   # .tmp_3_for_tab[.s179] <- .tmp_4
   la $a0, .s179
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 297
   # .tmp_4 <- mots[.s180]
   la $a0, .s180
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 298
   # .tmp_3_for_tab[.s181] <- .tmp_4
   la $a0, .s181
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 299
   # .tmp_4 <- mots[.s182]
   la $a0, .s182
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 300
   # .tmp_3_for_tab[.s183] <- .tmp_4
   la $a0, .s183
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 301
   # .tmp_4 <- mots[.s184]
   la $a0, .s184
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 302
   # .tmp_3_for_tab[.s185] <- .tmp_4
   la $a0, .s185
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 303
   # .tmp_4 <- mots[.s186]
   la $a0, .s186
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 304
   # .tmp_3_for_tab[.s187] <- .tmp_4
   la $a0, .s187
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 305
   # .tmp_4 <- mots[.s188]
   la $a0, .s188
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 306
   # .tmp_3_for_tab[.s189] <- .tmp_4
   la $a0, .s189
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 307
   # .tmp_4 <- mots[.s190]
   la $a0, .s190
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 308
   # .tmp_3_for_tab[.s191] <- .tmp_4
   la $a0, .s191
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 309
   # .tmp_4 <- mots[.s192]
   la $a0, .s192
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 310
   # .tmp_3_for_tab[.s193] <- .tmp_4
   la $a0, .s193
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 311
   # .tmp_4 <- mots[.s194]
   la $a0, .s194
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 312
   # .tmp_3_for_tab[.s195] <- .tmp_4
   la $a0, .s195
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 313
   # .tmp_4 <- mots[.s196]
   la $a0, .s196
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 314
   # .tmp_3_for_tab[.s197] <- .tmp_4
   la $a0, .s197
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 315
   # .tmp_4 <- mots[.s198]
   la $a0, .s198
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 316
   # .tmp_3_for_tab[.s199] <- .tmp_4
   la $a0, .s199
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 317
   # .tmp_4 <- mots[.s200]
   la $a0, .s200
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 318
   # .tmp_3_for_tab[.s201] <- .tmp_4
   la $a0, .s201
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 319
   # .tmp_4 <- mots[.s202]
   la $a0, .s202
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 320
   # .tmp_3_for_tab[.s203] <- .tmp_4
   la $a0, .s203
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 321
   # .tmp_4 <- mots[.s204]
   la $a0, .s204
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 322
   # .tmp_3_for_tab[.s205] <- .tmp_4
   la $a0, .s205
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 323
   # .tmp_4 <- mots[.s206]
   la $a0, .s206
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 324
   # .tmp_3_for_tab[.s207] <- .tmp_4
   la $a0, .s207
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 325
   # .tmp_4 <- mots[.s208]
   la $a0, .s208
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 326
   # .tmp_3_for_tab[.s209] <- .tmp_4
   la $a0, .s209
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 327
   # .tmp_4 <- mots[.s210]
   la $a0, .s210
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 328
   # .tmp_3_for_tab[.s211] <- .tmp_4
   la $a0, .s211
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 329
   # .tmp_4 <- mots[.s212]
   la $a0, .s212
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 330
   # .tmp_3_for_tab[.s213] <- .tmp_4
   la $a0, .s213
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 331
   # .tmp_4 <- mots[.s214]
   la $a0, .s214
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 332
   # .tmp_3_for_tab[.s215] <- .tmp_4
   la $a0, .s215
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 333
   # .tmp_4 <- mots[.s216]
   la $a0, .s216
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 334
   # .tmp_3_for_tab[.s217] <- .tmp_4
   la $a0, .s217
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 335
   # .tmp_4 <- mots[.s218]
   la $a0, .s218
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 336
   # .tmp_3_for_tab[.s219] <- .tmp_4
   la $a0, .s219
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 337
   # .tmp_4 <- mots[.s220]
   la $a0, .s220
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 338
   # .tmp_3_for_tab[.s221] <- .tmp_4
   la $a0, .s221
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 339
   # .tmp_4 <- mots[.s222]
   la $a0, .s222
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 340
   # .tmp_3_for_tab[.s223] <- .tmp_4
   la $a0, .s223
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 341
   # .tmp_4 <- mots[.s224]
   la $a0, .s224
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 342
   # .tmp_3_for_tab[.s225] <- .tmp_4
   la $a0, .s225
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 343
   # .tmp_4 <- mots[.s226]
   la $a0, .s226
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 344
   # .tmp_3_for_tab[.s227] <- .tmp_4
   la $a0, .s227
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 345
   # .tmp_4 <- mots[.s228]
   la $a0, .s228
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 346
   # .tmp_3_for_tab[.s229] <- .tmp_4
   la $a0, .s229
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 347
   # .tmp_4 <- mots[.s230]
   la $a0, .s230
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 348
   # .tmp_3_for_tab[.s231] <- .tmp_4
   la $a0, .s231
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 349
   # .tmp_4 <- mots[.s232]
   la $a0, .s232
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 350
   # .tmp_3_for_tab[.s233] <- .tmp_4
   la $a0, .s233
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 351
   # .tmp_4 <- mots[.s234]
   la $a0, .s234
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 352
   # .tmp_3_for_tab[.s235] <- .tmp_4
   la $a0, .s235
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 353
   # .tmp_4 <- mots[.s236]
   la $a0, .s236
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 354
   # .tmp_3_for_tab[.s237] <- .tmp_4
   la $a0, .s237
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 355
   # .tmp_4 <- mots[.s238]
   la $a0, .s238
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 356
   # .tmp_3_for_tab[.s239] <- .tmp_4
   la $a0, .s239
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 357
   # .tmp_4 <- mots[.s240]
   la $a0, .s240
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 358
   # .tmp_3_for_tab[.s241] <- .tmp_4
   la $a0, .s241
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 359
   # .tmp_4 <- mots[.s242]
   la $a0, .s242
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 360
   # .tmp_3_for_tab[.s243] <- .tmp_4
   la $a0, .s243
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 361
   # .tmp_4 <- mots[.s244]
   la $a0, .s244
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 362
   # .tmp_3_for_tab[.s245] <- .tmp_4
   la $a0, .s245
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 363
   # .tmp_4 <- mots[.s246]
   la $a0, .s246
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 364
   # .tmp_3_for_tab[.s247] <- .tmp_4
   la $a0, .s247
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 365
   # .tmp_4 <- mots[.s248]
   la $a0, .s248
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 366
   # .tmp_3_for_tab[.s249] <- .tmp_4
   la $a0, .s249
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 367
   # .tmp_4 <- mots[.s250]
   la $a0, .s250
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 368
   # .tmp_3_for_tab[.s251] <- .tmp_4
   la $a0, .s251
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 369
   # .tmp_4 <- mots[.s252]
   la $a0, .s252
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 370
   # .tmp_3_for_tab[.s253] <- .tmp_4
   la $a0, .s253
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 371
   # .tmp_4 <- mots[.s254]
   la $a0, .s254
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 372
   # .tmp_3_for_tab[.s255] <- .tmp_4
   la $a0, .s255
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 373
   # .tmp_4 <- mots[.s256]
   la $a0, .s256
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 374
   # .tmp_3_for_tab[.s257] <- .tmp_4
   la $a0, .s257
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 375
   # .tmp_4 <- mots[.s258]
   la $a0, .s258
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 376
   # .tmp_3_for_tab[.s259] <- .tmp_4
   la $a0, .s259
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 377
   # .tmp_4 <- mots[.s260]
   la $a0, .s260
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 378
   # .tmp_3_for_tab[.s261] <- .tmp_4
   la $a0, .s261
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 379
   # .tmp_4 <- mots[.s262]
   la $a0, .s262
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 380
   # .tmp_3_for_tab[.s263] <- .tmp_4
   la $a0, .s263
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 381
   # .tmp_4 <- mots[.s264]
   la $a0, .s264
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 382
   # .tmp_3_for_tab[.s265] <- .tmp_4
   la $a0, .s265
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 383
   # .tmp_4 <- mots[.s266]
   la $a0, .s266
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 384
   # .tmp_3_for_tab[.s267] <- .tmp_4
   la $a0, .s267
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 385
   # .tmp_4 <- mots[.s268]
   la $a0, .s268
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 386
   # .tmp_3_for_tab[.s269] <- .tmp_4
   la $a0, .s269
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 387
   # .tmp_4 <- mots[.s270]
   la $a0, .s270
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 388
   # .tmp_3_for_tab[.s271] <- .tmp_4
   la $a0, .s271
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 389
   # .tmp_4 <- mots[.s272]
   la $a0, .s272
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 390
   # .tmp_3_for_tab[.s273] <- .tmp_4
   la $a0, .s273
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 391
   # .tmp_4 <- mots[.s274]
   la $a0, .s274
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 392
   # .tmp_3_for_tab[.s275] <- .tmp_4
   la $a0, .s275
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 393
   # .tmp_4 <- mots[.s276]
   la $a0, .s276
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 394
   # .tmp_3_for_tab[.s277] <- .tmp_4
   la $a0, .s277
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 395
   # .tmp_4 <- mots[.s278]
   la $a0, .s278
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 396
   # .tmp_3_for_tab[.s279] <- .tmp_4
   la $a0, .s279
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 397
   # .tmp_4 <- mots[.s280]
   la $a0, .s280
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 398
   # .tmp_3_for_tab[.s281] <- .tmp_4
   la $a0, .s281
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 399
   # .tmp_4 <- mots[.s282]
   la $a0, .s282
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 400
   # .tmp_3_for_tab[.s283] <- .tmp_4
   la $a0, .s283
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 401
   # .tmp_4 <- mots[.s284]
   la $a0, .s284
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 402
   # .tmp_3_for_tab[.s285] <- .tmp_4
   la $a0, .s285
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 403
   # .tmp_4 <- mots[.s286]
   la $a0, .s286
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 404
   # .tmp_3_for_tab[.s287] <- .tmp_4
   la $a0, .s287
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 405
   # .tmp_4 <- mots[.s288]
   la $a0, .s288
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 406
   # .tmp_3_for_tab[.s289] <- .tmp_4
   la $a0, .s289
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 407
   # .tmp_4 <- mots[.s290]
   la $a0, .s290
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 408
   # .tmp_3_for_tab[.s291] <- .tmp_4
   la $a0, .s291
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 409
   # .tmp_4 <- mots[.s292]
   la $a0, .s292
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 410
   # .tmp_3_for_tab[.s293] <- .tmp_4
   la $a0, .s293
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 411
   # .tmp_4 <- mots[.s294]
   la $a0, .s294
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 412
   # .tmp_3_for_tab[.s295] <- .tmp_4
   la $a0, .s295
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 413
   # .tmp_4 <- mots[.s296]
   la $a0, .s296
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 414
   # .tmp_3_for_tab[.s297] <- .tmp_4
   la $a0, .s297
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 415
   # .tmp_4 <- mots[.s298]
   la $a0, .s298
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 416
   # .tmp_3_for_tab[.s299] <- .tmp_4
   la $a0, .s299
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 417
   # .tmp_4 <- mots[.s300]
   la $a0, .s300
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 418
   # .tmp_3_for_tab[.s301] <- .tmp_4
   la $a0, .s301
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 419
   # .tmp_4 <- mots[.s302]
   la $a0, .s302
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 420
   # .tmp_3_for_tab[.s303] <- .tmp_4
   la $a0, .s303
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 421
   # .tmp_4 <- mots[.s304]
   la $a0, .s304
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 422
   # .tmp_3_for_tab[.s305] <- .tmp_4
   la $a0, .s305
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 423
   # .tmp_4 <- mots[.s306]
   la $a0, .s306
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, mots
   add $t0, $t0, $s0
   # la $t1, mots
   lw $a1, ($t0)
   la $a0, .tmp_4
   la $a2, .empty_string
   jal concat
   # ----
# quad 424
   # .tmp_3_for_tab[.s307] <- .tmp_4
   la $a0, .s307
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $a0, .tmp_4 # copy_string
   jal copy_string
   move $s2, $v0 # on stocke $s2 dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   sw $s2, ($t0)
   # ----
# quad 426
   la $a0, .tmp_5_for_idx
   la $a1, .s308
   la $a2, .empty_string
   jal concat
# quad 427
_l10:
   la $a0, .tmp_5_for_idx
   jal convert_entier
   move $a1, $v0
   la $a0, .s309
   jal convert_entier
   blt $a1, $v0, _l3
# quad 428
   b _l4
# quad 429
_l3:
   # mot <- .tmp_3_for_tab[.tmp_5_for_idx]
   la $a0, .tmp_5_for_idx
   jal convert_entier # conversion index
   move $s0, $v0 # stockage
   la $a0, .empty_string
   move $a1, $s0 # en cas d'erreur
   blt $s0, 0, erreur_out_of_range
   bge $s0, 100, erreur_out_of_range
   mul $s0, $s0, 4 # pour l'addresse dans le tableau
   la $t0, .tmp_3_for_tab
   add $t0, $t0, $s0
   # la $t1, .tmp_3_for_tab
   lw $a1, ($t0)
   la $a0, mot
   la $a2, .empty_string
   jal concat
   # ----
# quad 430

   # .tmp_5_for_idx <- .tmp_5_for_idx+.s310
   la $a0, .tmp_5_for_idx
   jal convert_entier
   move $s0, $v0
   la $a0, .s310
   jal convert_entier
   move $s1, $v0
   add $a0, $s0, $s1
   la $a1, .tmp_5_for_idx
   jal convert_string
   #---
# quad 431
   la $a0, mot
   la $a1, .s311
   jal compare
   beq $v0, 0, _l5
# quad 432
   b _l6
# quad 433
_l6:
   la $a0, mot
   la $a1, .s312
   jal compare
   beq $v0, 0, _l5
# quad 434
   b _l7
# quad 435
_l7:
   la $a0, mot
   la $a1, .s313
   jal compare
   beq $v0, 0, _l5
# quad 436
   b _l8
# quad 437
_l8:
   la $a0, mot
   la $a1, .s314
   jal compare
   beq $v0, 0, _l5
# quad 438
   b _l9
_l5:
# quad 440
   la $a0, .tmp_6
   la $a1, new_phrase
   la $a2, .s315
   jal concat
# quad 442
   la $a0, .tmp_7
   la $a1, .tmp_6
   la $a2, .s316
   jal concat
# quad 443
   la $a0, new_phrase
   la $a1, .tmp_7
   la $a2, .empty_string
   jal concat
# quad 444
   b _l10
# quad 445
_l9:
   la $a0, mot
   la $a1, .s317
   jal compare
   beq $v0, 0, _l11
# quad 446
   b _l12
# quad 447
_l12:
   la $a0, mot
   la $a1, .s318
   jal compare
   beq $v0, 0, _l11
# quad 448
   b _l13
# quad 449
_l13:
   la $a0, mot
   la $a1, .s319
   jal compare
   beq $v0, 0, _l11
# quad 450
   b _l14
# quad 451
_l14:
   la $a0, mot
   la $a1, .s320
   jal compare
   beq $v0, 0, _l11
# quad 452
   b _l15
_l11:
# quad 454
   la $a0, .tmp_8
   la $a1, new_phrase
   la $a2, .s321
   jal concat
# quad 456
   la $a0, .tmp_9
   la $a1, .tmp_8
   la $a2, .s322
   jal concat
# quad 457
   la $a0, new_phrase
   la $a1, .tmp_9
   la $a2, .empty_string
   jal concat
# quad 458
   b _l10
_l15:
# quad 460
   la $a0, .tmp_10
   la $a1, new_phrase
   la $a2, .s323
   jal concat
# quad 462
   la $a0, .tmp_11
   la $a1, .tmp_10
   la $a2, mot
   jal concat
# quad 463
   la $a0, new_phrase
   la $a1, .tmp_11
   la $a2, .empty_string
   jal concat
# quad 464
   b _l10
# quad 465
_l4:
   la $a0, .s324
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 466
   la $a0, new_phrase
   li $v0, 4
   syscall #print_str
   la $a0, .single_space
   li $v0, 4
   syscall #espace après echo
# quad 467
   la $a0, .s325
   li $v0, 4
   syscall #print_str
# quad 468
   li $v0, 10
   syscall #EXIT

.386
.model flat, c
N equ 100

PUBLIC find
PUBLIC calc_avg
PUBLIC calc_avg_all

EXTERN BUF:DWORD
EXTERN in_name:DWORD
EXTERN result:DWORD
EXTERN l:DWORD
EXTERN poin:DWORD
EXTERN score:BYTE

.code
find proc
		mov ecx, N;
		mov ebx, offset BUF;
	find_iterator:
		lea esi, [ebx];
		mov edi, offset in_name;
		push bx;
		push cx;
		mov cl, byte ptr l;
		xor ch, ch;
	strcmp_iterator:
		mov dl, [esi];
		cmp dl, [edi];
		jnz next;
		inc si;
		inc di;
		loop strcmp_iterator;
		jmp found;
	next:
		pop cx;
		pop bx;
		add bx, 15;
		loop find_iterator;
	not_found:
		mov result, 0;
		ret;
	found:    	
		cmp [esi], 0
    	jnz not_found
		mov poin, ebx;
		mov result, 1;
		pop cx;
		pop bx;
		ret;
find endp

calc_avg proc
		mov ebx, dword ptr poin;
		xor ah, ah;
		mov al, [ebx + 11]; //A成绩
		shl ax, 1;
		add al, [ebx + 12];
		adc ah, 0; //处理1字节无法存的情况
		shl ax, 1;
		add al, [ebx + 13]; //这里相当算((((A << 1) + B) << 1) + C) / 7
		adc ah, 0;
		mov dl, 7;
		div dl;
		mov score, al;
		ret;
calc_avg endp

calc_avg_all proc
		mov ebx, offset BUF;
		mov ecx, N;
	calc_avg_iterator:
		xor ah, ah;
		mov al, [ebx + 11]; //A成绩
		shl ax, 1;
		add al, [ebx + 12];
		adc ah, 0; //处理1字节无法存储的情况
		shl ax, 1;
		add al, [ebx + 13]; //这里相当于算((((A << 1) + B) << 1) + C) / 7
		adc ah, 0;
		mov dl, 7;
		div dl;
		mov[ebx + 14], al;
		add bx, 15;
		loop calc_avg_iterator;
		ret;
calc_avg_all endp
end
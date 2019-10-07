.code16
init:
    mov %cs, %ax
    mov %ax, %ds
    mov %ax, %es
    call DispStr
    jmp .

DispStr:
    mov $BootMessage, %ax
    mov %ax, %bp
    mov $16, %cx
    mov $0x1301, %ax
    mov $0x000c, %bx
    mov $0, %dl
    int $0x10
    ret

BootMessage:    .asciz "Hello, OS world!"
.fill 510-(.-init), 1, 0
.word 0xaa55

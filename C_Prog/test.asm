
../test.elf:     file format elf32-littleriscv


Disassembly of section .text:

000100b4 <register_fini>:
   100b4:	00000793          	li	a5,0
   100b8:	00078863          	beqz	a5,100c8 <register_fini+0x14>
   100bc:	00002517          	auipc	a0,0x2
   100c0:	c1050513          	addi	a0,a0,-1008 # 11ccc <__libc_fini_array>
   100c4:	6b00106f          	j	11774 <atexit>
   100c8:	00008067          	ret

000100cc <_start>:
   100cc:	00004197          	auipc	gp,0x4
   100d0:	99c18193          	addi	gp,gp,-1636 # 13a68 <__global_pointer$>
   100d4:	00000513          	li	a0,0
   100d8:	00050463          	beqz	a0,100e0 <_start+0x14>
   100dc:	01751073          	csrw	0x17,a0
   100e0:	d6818513          	addi	a0,gp,-664 # 137d0 <message_index>
   100e4:	09418613          	addi	a2,gp,148 # 13afc <__BSS_END__>
   100e8:	40a60633          	sub	a2,a2,a0
   100ec:	00000593          	li	a1,0
   100f0:	290000ef          	jal	10380 <memset>
   100f4:	00001517          	auipc	a0,0x1
   100f8:	68050513          	addi	a0,a0,1664 # 11774 <atexit>
   100fc:	00050863          	beqz	a0,1010c <_start+0x40>
   10100:	00002517          	auipc	a0,0x2
   10104:	bcc50513          	addi	a0,a0,-1076 # 11ccc <__libc_fini_array>
   10108:	66c010ef          	jal	11774 <atexit>
   1010c:	37c000ef          	jal	10488 <__libc_init_array>
   10110:	00012503          	lw	a0,0(sp)
   10114:	00410593          	addi	a1,sp,4
   10118:	00251613          	slli	a2,a0,0x2
   1011c:	00460613          	addi	a2,a2,4
   10120:	00b60633          	add	a2,a2,a1
   10124:	21c000ef          	jal	10340 <main>
   10128:	3340006f          	j	1045c <exit>

0001012c <deregister_tm_clones>:
   1012c:	d5818793          	addi	a5,gp,-680 # 137c0 <__TMC_END__>
   10130:	d5818713          	addi	a4,gp,-680 # 137c0 <__TMC_END__>
   10134:	00f70a63          	beq	a4,a5,10148 <deregister_tm_clones+0x1c>
   10138:	00000793          	li	a5,0
   1013c:	00078663          	beqz	a5,10148 <deregister_tm_clones+0x1c>
   10140:	d5818513          	addi	a0,gp,-680 # 137c0 <__TMC_END__>
   10144:	00078067          	jr	a5
   10148:	00008067          	ret

0001014c <register_tm_clones>:
   1014c:	d5818793          	addi	a5,gp,-680 # 137c0 <__TMC_END__>
   10150:	d5818593          	addi	a1,gp,-680 # 137c0 <__TMC_END__>
   10154:	40f585b3          	sub	a1,a1,a5
   10158:	4025d793          	srai	a5,a1,0x2
   1015c:	01f5d593          	srli	a1,a1,0x1f
   10160:	00f585b3          	add	a1,a1,a5
   10164:	4015d593          	srai	a1,a1,0x1
   10168:	00058a63          	beqz	a1,1017c <register_tm_clones+0x30>
   1016c:	00000793          	li	a5,0
   10170:	00078663          	beqz	a5,1017c <register_tm_clones+0x30>
   10174:	d5818513          	addi	a0,gp,-680 # 137c0 <__TMC_END__>
   10178:	00078067          	jr	a5
   1017c:	00008067          	ret

00010180 <__do_global_dtors_aux>:
   10180:	ff010113          	addi	sp,sp,-16
   10184:	00812423          	sw	s0,8(sp)
   10188:	d881c783          	lbu	a5,-632(gp) # 137f0 <completed.1>
   1018c:	00112623          	sw	ra,12(sp)
   10190:	02079463          	bnez	a5,101b8 <__do_global_dtors_aux+0x38>
   10194:	f99ff0ef          	jal	1012c <deregister_tm_clones>
   10198:	00000793          	li	a5,0
   1019c:	00078a63          	beqz	a5,101b0 <__do_global_dtors_aux+0x30>
   101a0:	00012537          	lui	a0,0x12
   101a4:	25850513          	addi	a0,a0,600 # 12258 <__EH_FRAME_BEGIN__>
   101a8:	00000097          	auipc	ra,0x0
   101ac:	000000e7          	jalr	zero # 0 <register_fini-0x100b4>
   101b0:	00100793          	li	a5,1
   101b4:	d8f18423          	sb	a5,-632(gp) # 137f0 <completed.1>
   101b8:	00c12083          	lw	ra,12(sp)
   101bc:	00812403          	lw	s0,8(sp)
   101c0:	01010113          	addi	sp,sp,16
   101c4:	00008067          	ret

000101c8 <frame_dummy>:
   101c8:	00000793          	li	a5,0
   101cc:	02078663          	beqz	a5,101f8 <frame_dummy+0x30>
   101d0:	00012537          	lui	a0,0x12
   101d4:	ff010113          	addi	sp,sp,-16
   101d8:	d8c18593          	addi	a1,gp,-628 # 137f4 <object.0>
   101dc:	25850513          	addi	a0,a0,600 # 12258 <__EH_FRAME_BEGIN__>
   101e0:	00112623          	sw	ra,12(sp)
   101e4:	00000097          	auipc	ra,0x0
   101e8:	000000e7          	jalr	zero # 0 <register_fini-0x100b4>
   101ec:	00c12083          	lw	ra,12(sp)
   101f0:	01010113          	addi	sp,sp,16
   101f4:	f59ff06f          	j	1014c <register_tm_clones>
   101f8:	f55ff06f          	j	1014c <register_tm_clones>

000101fc <uart_init>:
   101fc:	ff010113          	addi	sp,sp,-16
   10200:	00112623          	sw	ra,12(sp)
   10204:	00812423          	sw	s0,8(sp)
   10208:	01010413          	addi	s0,sp,16
   1020c:	4000d7b7          	lui	a5,0x4000d
   10210:	00878793          	addi	a5,a5,8 # 4000d008 <__BSS_END__+0x3fff950c>
   10214:	0007a703          	lw	a4,0(a5)
   10218:	4000d7b7          	lui	a5,0x4000d
   1021c:	00878793          	addi	a5,a5,8 # 4000d008 <__BSS_END__+0x3fff950c>
   10220:	00176713          	ori	a4,a4,1
   10224:	00e7a023          	sw	a4,0(a5)
   10228:	4000d7b7          	lui	a5,0x4000d
   1022c:	01078793          	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fff9514>
   10230:	0007a703          	lw	a4,0(a5)
   10234:	4000d7b7          	lui	a5,0x4000d
   10238:	01078793          	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fff9514>
   1023c:	00176713          	ori	a4,a4,1
   10240:	00e7a023          	sw	a4,0(a5)
   10244:	00000013          	nop
   10248:	00c12083          	lw	ra,12(sp)
   1024c:	00812403          	lw	s0,8(sp)
   10250:	01010113          	addi	sp,sp,16
   10254:	00008067          	ret

00010258 <uart_send_char>:
   10258:	fe010113          	addi	sp,sp,-32
   1025c:	00112e23          	sw	ra,28(sp)
   10260:	00812c23          	sw	s0,24(sp)
   10264:	02010413          	addi	s0,sp,32
   10268:	00050793          	mv	a5,a0
   1026c:	fef407a3          	sb	a5,-17(s0)
   10270:	4000d7b7          	lui	a5,0x4000d
   10274:	fef44703          	lbu	a4,-17(s0)
   10278:	00e7a023          	sw	a4,0(a5) # 4000d000 <__BSS_END__+0x3fff9504>
   1027c:	00000013          	nop
   10280:	01c12083          	lw	ra,28(sp)
   10284:	01812403          	lw	s0,24(sp)
   10288:	02010113          	addi	sp,sp,32
   1028c:	00008067          	ret

00010290 <uart_isr>:
   10290:	ff010113          	addi	sp,sp,-16
   10294:	00112623          	sw	ra,12(sp)
   10298:	00812423          	sw	s0,8(sp)
   1029c:	01010413          	addi	s0,sp,16
   102a0:	4000d7b7          	lui	a5,0x4000d
   102a4:	01478793          	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fff9518>
   102a8:	0007a783          	lw	a5,0(a5)
   102ac:	0017f793          	andi	a5,a5,1
   102b0:	06078e63          	beqz	a5,1032c <uart_isr+0x9c>
   102b4:	4000d7b7          	lui	a5,0x4000d
   102b8:	01478793          	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fff9518>
   102bc:	0007a703          	lw	a4,0(a5)
   102c0:	4000d7b7          	lui	a5,0x4000d
   102c4:	01478793          	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fff9518>
   102c8:	ffe77713          	andi	a4,a4,-2
   102cc:	00e7a023          	sw	a4,0(a5)
   102d0:	d681a783          	lw	a5,-664(gp) # 137d0 <message_index>
   102d4:	00012737          	lui	a4,0x12
   102d8:	24c70713          	addi	a4,a4,588 # 1224c <message>
   102dc:	00f707b3          	add	a5,a4,a5
   102e0:	0007c783          	lbu	a5,0(a5)
   102e4:	02078663          	beqz	a5,10310 <uart_isr+0x80>
   102e8:	d681a783          	lw	a5,-664(gp) # 137d0 <message_index>
   102ec:	00178693          	addi	a3,a5,1
   102f0:	d6d1a423          	sw	a3,-664(gp) # 137d0 <message_index>
   102f4:	00012737          	lui	a4,0x12
   102f8:	24c70713          	addi	a4,a4,588 # 1224c <message>
   102fc:	00f707b3          	add	a5,a4,a5
   10300:	0007c783          	lbu	a5,0(a5)
   10304:	00078513          	mv	a0,a5
   10308:	f51ff0ef          	jal	10258 <uart_send_char>
   1030c:	0200006f          	j	1032c <uart_isr+0x9c>
   10310:	4000d7b7          	lui	a5,0x4000d
   10314:	01078793          	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fff9514>
   10318:	0007a703          	lw	a4,0(a5)
   1031c:	4000d7b7          	lui	a5,0x4000d
   10320:	01078793          	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fff9514>
   10324:	ffe77713          	andi	a4,a4,-2
   10328:	00e7a023          	sw	a4,0(a5)
   1032c:	00000013          	nop
   10330:	00c12083          	lw	ra,12(sp)
   10334:	00812403          	lw	s0,8(sp)
   10338:	01010113          	addi	sp,sp,16
   1033c:	00008067          	ret

00010340 <main>:
   10340:	ff010113          	addi	sp,sp,-16
   10344:	00112623          	sw	ra,12(sp)
   10348:	00812423          	sw	s0,8(sp)
   1034c:	01010413          	addi	s0,sp,16
   10350:	eadff0ef          	jal	101fc <uart_init>
   10354:	d681a783          	lw	a5,-664(gp) # 137d0 <message_index>
   10358:	00178693          	addi	a3,a5,1
   1035c:	d6d1a423          	sw	a3,-664(gp) # 137d0 <message_index>
   10360:	00012737          	lui	a4,0x12
   10364:	24c70713          	addi	a4,a4,588 # 1224c <message>
   10368:	00f707b3          	add	a5,a4,a5
   1036c:	0007c783          	lbu	a5,0(a5)
   10370:	00078513          	mv	a0,a5
   10374:	ee5ff0ef          	jal	10258 <uart_send_char>
   10378:	10500073          	wfi
   1037c:	ffdff06f          	j	10378 <main+0x38>

00010380 <memset>:
   10380:	00f00313          	li	t1,15
   10384:	00050713          	mv	a4,a0
   10388:	02c37e63          	bgeu	t1,a2,103c4 <memset+0x44>
   1038c:	00f77793          	andi	a5,a4,15
   10390:	0a079063          	bnez	a5,10430 <memset+0xb0>
   10394:	08059263          	bnez	a1,10418 <memset+0x98>
   10398:	ff067693          	andi	a3,a2,-16
   1039c:	00f67613          	andi	a2,a2,15
   103a0:	00e686b3          	add	a3,a3,a4
   103a4:	00b72023          	sw	a1,0(a4)
   103a8:	00b72223          	sw	a1,4(a4)
   103ac:	00b72423          	sw	a1,8(a4)
   103b0:	00b72623          	sw	a1,12(a4)
   103b4:	01070713          	addi	a4,a4,16
   103b8:	fed766e3          	bltu	a4,a3,103a4 <memset+0x24>
   103bc:	00061463          	bnez	a2,103c4 <memset+0x44>
   103c0:	00008067          	ret
   103c4:	40c306b3          	sub	a3,t1,a2
   103c8:	00269693          	slli	a3,a3,0x2
   103cc:	00000297          	auipc	t0,0x0
   103d0:	005686b3          	add	a3,a3,t0
   103d4:	00c68067          	jr	12(a3)
   103d8:	00b70723          	sb	a1,14(a4)
   103dc:	00b706a3          	sb	a1,13(a4)
   103e0:	00b70623          	sb	a1,12(a4)
   103e4:	00b705a3          	sb	a1,11(a4)
   103e8:	00b70523          	sb	a1,10(a4)
   103ec:	00b704a3          	sb	a1,9(a4)
   103f0:	00b70423          	sb	a1,8(a4)
   103f4:	00b703a3          	sb	a1,7(a4)
   103f8:	00b70323          	sb	a1,6(a4)
   103fc:	00b702a3          	sb	a1,5(a4)
   10400:	00b70223          	sb	a1,4(a4)
   10404:	00b701a3          	sb	a1,3(a4)
   10408:	00b70123          	sb	a1,2(a4)
   1040c:	00b700a3          	sb	a1,1(a4)
   10410:	00b70023          	sb	a1,0(a4)
   10414:	00008067          	ret
   10418:	0ff5f593          	zext.b	a1,a1
   1041c:	00859693          	slli	a3,a1,0x8
   10420:	00d5e5b3          	or	a1,a1,a3
   10424:	01059693          	slli	a3,a1,0x10
   10428:	00d5e5b3          	or	a1,a1,a3
   1042c:	f6dff06f          	j	10398 <memset+0x18>
   10430:	00279693          	slli	a3,a5,0x2
   10434:	00000297          	auipc	t0,0x0
   10438:	005686b3          	add	a3,a3,t0
   1043c:	00008293          	mv	t0,ra
   10440:	fa0680e7          	jalr	-96(a3)
   10444:	00028093          	mv	ra,t0
   10448:	ff078793          	addi	a5,a5,-16
   1044c:	40f70733          	sub	a4,a4,a5
   10450:	00f60633          	add	a2,a2,a5
   10454:	f6c378e3          	bgeu	t1,a2,103c4 <memset+0x44>
   10458:	f3dff06f          	j	10394 <memset+0x14>

0001045c <exit>:
   1045c:	ff010113          	addi	sp,sp,-16
   10460:	00000593          	li	a1,0
   10464:	00812423          	sw	s0,8(sp)
   10468:	00112623          	sw	ra,12(sp)
   1046c:	00050413          	mv	s0,a0
   10470:	154010ef          	jal	115c4 <__call_exitprocs>
   10474:	d6c1a783          	lw	a5,-660(gp) # 137d4 <__stdio_exit_handler>
   10478:	00078463          	beqz	a5,10480 <exit+0x24>
   1047c:	000780e7          	jalr	a5
   10480:	00040513          	mv	a0,s0
   10484:	449010ef          	jal	120cc <_exit>

00010488 <__libc_init_array>:
   10488:	ff010113          	addi	sp,sp,-16
   1048c:	00812423          	sw	s0,8(sp)
   10490:	01212023          	sw	s2,0(sp)
   10494:	00003797          	auipc	a5,0x3
   10498:	dc878793          	addi	a5,a5,-568 # 1325c <__init_array_start>
   1049c:	00003417          	auipc	s0,0x3
   104a0:	dc040413          	addi	s0,s0,-576 # 1325c <__init_array_start>
   104a4:	00112623          	sw	ra,12(sp)
   104a8:	00912223          	sw	s1,4(sp)
   104ac:	40878933          	sub	s2,a5,s0
   104b0:	02878063          	beq	a5,s0,104d0 <__libc_init_array+0x48>
   104b4:	40295913          	srai	s2,s2,0x2
   104b8:	00000493          	li	s1,0
   104bc:	00042783          	lw	a5,0(s0)
   104c0:	00148493          	addi	s1,s1,1
   104c4:	00440413          	addi	s0,s0,4
   104c8:	000780e7          	jalr	a5
   104cc:	ff24e8e3          	bltu	s1,s2,104bc <__libc_init_array+0x34>
   104d0:	00003797          	auipc	a5,0x3
   104d4:	d9478793          	addi	a5,a5,-620 # 13264 <__do_global_dtors_aux_fini_array_entry>
   104d8:	00003417          	auipc	s0,0x3
   104dc:	d8440413          	addi	s0,s0,-636 # 1325c <__init_array_start>
   104e0:	40878933          	sub	s2,a5,s0
   104e4:	40295913          	srai	s2,s2,0x2
   104e8:	00878e63          	beq	a5,s0,10504 <__libc_init_array+0x7c>
   104ec:	00000493          	li	s1,0
   104f0:	00042783          	lw	a5,0(s0)
   104f4:	00148493          	addi	s1,s1,1
   104f8:	00440413          	addi	s0,s0,4
   104fc:	000780e7          	jalr	a5
   10500:	ff24e8e3          	bltu	s1,s2,104f0 <__libc_init_array+0x68>
   10504:	00c12083          	lw	ra,12(sp)
   10508:	00812403          	lw	s0,8(sp)
   1050c:	00412483          	lw	s1,4(sp)
   10510:	00012903          	lw	s2,0(sp)
   10514:	01010113          	addi	sp,sp,16
   10518:	00008067          	ret

0001051c <__fp_lock>:
   1051c:	00000513          	li	a0,0
   10520:	00008067          	ret

00010524 <stdio_exit_handler>:
   10524:	00003617          	auipc	a2,0x3
   10528:	d4460613          	addi	a2,a2,-700 # 13268 <__sglue>
   1052c:	00000597          	auipc	a1,0x0
   10530:	35458593          	addi	a1,a1,852 # 10880 <_fclose_r>
   10534:	c1818513          	addi	a0,gp,-1000 # 13680 <_impure_data>
   10538:	6e00106f          	j	11c18 <_fwalk_sglue>

0001053c <cleanup_stdio>:
   1053c:	00452583          	lw	a1,4(a0)
   10540:	ff010113          	addi	sp,sp,-16
   10544:	00812423          	sw	s0,8(sp)
   10548:	00112623          	sw	ra,12(sp)
   1054c:	da418793          	addi	a5,gp,-604 # 1380c <__sf>
   10550:	00050413          	mv	s0,a0
   10554:	00f58463          	beq	a1,a5,1055c <cleanup_stdio+0x20>
   10558:	328000ef          	jal	10880 <_fclose_r>
   1055c:	00842583          	lw	a1,8(s0)
   10560:	e0c18793          	addi	a5,gp,-500 # 13874 <__sf+0x68>
   10564:	00f58663          	beq	a1,a5,10570 <cleanup_stdio+0x34>
   10568:	00040513          	mv	a0,s0
   1056c:	314000ef          	jal	10880 <_fclose_r>
   10570:	00c42583          	lw	a1,12(s0)
   10574:	e7418793          	addi	a5,gp,-396 # 138dc <__sf+0xd0>
   10578:	00f58c63          	beq	a1,a5,10590 <cleanup_stdio+0x54>
   1057c:	00040513          	mv	a0,s0
   10580:	00812403          	lw	s0,8(sp)
   10584:	00c12083          	lw	ra,12(sp)
   10588:	01010113          	addi	sp,sp,16
   1058c:	2f40006f          	j	10880 <_fclose_r>
   10590:	00c12083          	lw	ra,12(sp)
   10594:	00812403          	lw	s0,8(sp)
   10598:	01010113          	addi	sp,sp,16
   1059c:	00008067          	ret

000105a0 <__fp_unlock>:
   105a0:	00000513          	li	a0,0
   105a4:	00008067          	ret

000105a8 <global_stdio_init.part.0>:
   105a8:	fe010113          	addi	sp,sp,-32
   105ac:	00112e23          	sw	ra,28(sp)
   105b0:	00812c23          	sw	s0,24(sp)
   105b4:	00912a23          	sw	s1,20(sp)
   105b8:	da418413          	addi	s0,gp,-604 # 1380c <__sf>
   105bc:	01212823          	sw	s2,16(sp)
   105c0:	01312623          	sw	s3,12(sp)
   105c4:	01412423          	sw	s4,8(sp)
   105c8:	00000717          	auipc	a4,0x0
   105cc:	f5c70713          	addi	a4,a4,-164 # 10524 <stdio_exit_handler>
   105d0:	00400793          	li	a5,4
   105d4:	00800613          	li	a2,8
   105d8:	00000593          	li	a1,0
   105dc:	e0018513          	addi	a0,gp,-512 # 13868 <__sf+0x5c>
   105e0:	d6e1a623          	sw	a4,-660(gp) # 137d4 <__stdio_exit_handler>
   105e4:	00f42623          	sw	a5,12(s0)
   105e8:	00042023          	sw	zero,0(s0)
   105ec:	00042223          	sw	zero,4(s0)
   105f0:	00042423          	sw	zero,8(s0)
   105f4:	06042223          	sw	zero,100(s0)
   105f8:	00042823          	sw	zero,16(s0)
   105fc:	00042a23          	sw	zero,20(s0)
   10600:	00042c23          	sw	zero,24(s0)
   10604:	d7dff0ef          	jal	10380 <memset>
   10608:	000107b7          	lui	a5,0x10
   1060c:	00001a17          	auipc	s4,0x1
   10610:	17ca0a13          	addi	s4,s4,380 # 11788 <__sread>
   10614:	00001997          	auipc	s3,0x1
   10618:	1d898993          	addi	s3,s3,472 # 117ec <__swrite>
   1061c:	00001917          	auipc	s2,0x1
   10620:	25890913          	addi	s2,s2,600 # 11874 <__sseek>
   10624:	00001497          	auipc	s1,0x1
   10628:	2b448493          	addi	s1,s1,692 # 118d8 <__sclose>
   1062c:	00978793          	addi	a5,a5,9 # 10009 <register_fini-0xab>
   10630:	00800613          	li	a2,8
   10634:	00000593          	li	a1,0
   10638:	e6818513          	addi	a0,gp,-408 # 138d0 <__sf+0xc4>
   1063c:	06f42a23          	sw	a5,116(s0)
   10640:	03442023          	sw	s4,32(s0)
   10644:	03342223          	sw	s3,36(s0)
   10648:	03242423          	sw	s2,40(s0)
   1064c:	02942623          	sw	s1,44(s0)
   10650:	00842e23          	sw	s0,28(s0)
   10654:	06042423          	sw	zero,104(s0)
   10658:	06042623          	sw	zero,108(s0)
   1065c:	06042823          	sw	zero,112(s0)
   10660:	0c042623          	sw	zero,204(s0)
   10664:	06042c23          	sw	zero,120(s0)
   10668:	06042e23          	sw	zero,124(s0)
   1066c:	08042023          	sw	zero,128(s0)
   10670:	d11ff0ef          	jal	10380 <memset>
   10674:	000207b7          	lui	a5,0x20
   10678:	01278793          	addi	a5,a5,18 # 20012 <__BSS_END__+0xc516>
   1067c:	e0c18713          	addi	a4,gp,-500 # 13874 <__sf+0x68>
   10680:	00800613          	li	a2,8
   10684:	00000593          	li	a1,0
   10688:	ed018513          	addi	a0,gp,-304 # 13938 <__sf+0x12c>
   1068c:	09442423          	sw	s4,136(s0)
   10690:	09342623          	sw	s3,140(s0)
   10694:	09242823          	sw	s2,144(s0)
   10698:	08942a23          	sw	s1,148(s0)
   1069c:	0cf42e23          	sw	a5,220(s0)
   106a0:	0c042823          	sw	zero,208(s0)
   106a4:	0c042a23          	sw	zero,212(s0)
   106a8:	0c042c23          	sw	zero,216(s0)
   106ac:	12042a23          	sw	zero,308(s0)
   106b0:	0e042023          	sw	zero,224(s0)
   106b4:	0e042223          	sw	zero,228(s0)
   106b8:	0e042423          	sw	zero,232(s0)
   106bc:	08e42223          	sw	a4,132(s0)
   106c0:	cc1ff0ef          	jal	10380 <memset>
   106c4:	e7418793          	addi	a5,gp,-396 # 138dc <__sf+0xd0>
   106c8:	0f442823          	sw	s4,240(s0)
   106cc:	0f342a23          	sw	s3,244(s0)
   106d0:	0f242c23          	sw	s2,248(s0)
   106d4:	0e942e23          	sw	s1,252(s0)
   106d8:	01c12083          	lw	ra,28(sp)
   106dc:	0ef42623          	sw	a5,236(s0)
   106e0:	01812403          	lw	s0,24(sp)
   106e4:	01412483          	lw	s1,20(sp)
   106e8:	01012903          	lw	s2,16(sp)
   106ec:	00c12983          	lw	s3,12(sp)
   106f0:	00812a03          	lw	s4,8(sp)
   106f4:	02010113          	addi	sp,sp,32
   106f8:	00008067          	ret

000106fc <__sfp>:
   106fc:	d6c1a783          	lw	a5,-660(gp) # 137d4 <__stdio_exit_handler>
   10700:	fe010113          	addi	sp,sp,-32
   10704:	01312623          	sw	s3,12(sp)
   10708:	00112e23          	sw	ra,28(sp)
   1070c:	00812c23          	sw	s0,24(sp)
   10710:	00912a23          	sw	s1,20(sp)
   10714:	01212823          	sw	s2,16(sp)
   10718:	00050993          	mv	s3,a0
   1071c:	0e078863          	beqz	a5,1080c <__sfp+0x110>
   10720:	00003917          	auipc	s2,0x3
   10724:	b4890913          	addi	s2,s2,-1208 # 13268 <__sglue>
   10728:	fff00493          	li	s1,-1
   1072c:	00492783          	lw	a5,4(s2)
   10730:	00892403          	lw	s0,8(s2)
   10734:	fff78793          	addi	a5,a5,-1
   10738:	0007d863          	bgez	a5,10748 <__sfp+0x4c>
   1073c:	0800006f          	j	107bc <__sfp+0xc0>
   10740:	06840413          	addi	s0,s0,104
   10744:	06978c63          	beq	a5,s1,107bc <__sfp+0xc0>
   10748:	00c41703          	lh	a4,12(s0)
   1074c:	fff78793          	addi	a5,a5,-1
   10750:	fe0718e3          	bnez	a4,10740 <__sfp+0x44>
   10754:	ffff07b7          	lui	a5,0xffff0
   10758:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdc505>
   1075c:	06042223          	sw	zero,100(s0)
   10760:	00042023          	sw	zero,0(s0)
   10764:	00042423          	sw	zero,8(s0)
   10768:	00042223          	sw	zero,4(s0)
   1076c:	00042823          	sw	zero,16(s0)
   10770:	00042a23          	sw	zero,20(s0)
   10774:	00042c23          	sw	zero,24(s0)
   10778:	00f42623          	sw	a5,12(s0)
   1077c:	00800613          	li	a2,8
   10780:	00000593          	li	a1,0
   10784:	05c40513          	addi	a0,s0,92
   10788:	bf9ff0ef          	jal	10380 <memset>
   1078c:	02042823          	sw	zero,48(s0)
   10790:	02042a23          	sw	zero,52(s0)
   10794:	04042223          	sw	zero,68(s0)
   10798:	04042423          	sw	zero,72(s0)
   1079c:	01c12083          	lw	ra,28(sp)
   107a0:	00040513          	mv	a0,s0
   107a4:	01812403          	lw	s0,24(sp)
   107a8:	01412483          	lw	s1,20(sp)
   107ac:	01012903          	lw	s2,16(sp)
   107b0:	00c12983          	lw	s3,12(sp)
   107b4:	02010113          	addi	sp,sp,32
   107b8:	00008067          	ret
   107bc:	00092403          	lw	s0,0(s2)
   107c0:	00040663          	beqz	s0,107cc <__sfp+0xd0>
   107c4:	00040913          	mv	s2,s0
   107c8:	f65ff06f          	j	1072c <__sfp+0x30>
   107cc:	1ac00593          	li	a1,428
   107d0:	00098513          	mv	a0,s3
   107d4:	1c0000ef          	jal	10994 <_malloc_r>
   107d8:	00050413          	mv	s0,a0
   107dc:	02050c63          	beqz	a0,10814 <__sfp+0x118>
   107e0:	00400793          	li	a5,4
   107e4:	00c50513          	addi	a0,a0,12
   107e8:	00042023          	sw	zero,0(s0)
   107ec:	00f42223          	sw	a5,4(s0)
   107f0:	00a42423          	sw	a0,8(s0)
   107f4:	1a000613          	li	a2,416
   107f8:	00000593          	li	a1,0
   107fc:	b85ff0ef          	jal	10380 <memset>
   10800:	00892023          	sw	s0,0(s2)
   10804:	00040913          	mv	s2,s0
   10808:	f25ff06f          	j	1072c <__sfp+0x30>
   1080c:	d9dff0ef          	jal	105a8 <global_stdio_init.part.0>
   10810:	f11ff06f          	j	10720 <__sfp+0x24>
   10814:	00092023          	sw	zero,0(s2)
   10818:	00c00793          	li	a5,12
   1081c:	00f9a023          	sw	a5,0(s3)
   10820:	f7dff06f          	j	1079c <__sfp+0xa0>

00010824 <__sinit>:
   10824:	03452783          	lw	a5,52(a0)
   10828:	00078463          	beqz	a5,10830 <__sinit+0xc>
   1082c:	00008067          	ret
   10830:	d6c1a783          	lw	a5,-660(gp) # 137d4 <__stdio_exit_handler>
   10834:	00000717          	auipc	a4,0x0
   10838:	d0870713          	addi	a4,a4,-760 # 1053c <cleanup_stdio>
   1083c:	02e52a23          	sw	a4,52(a0)
   10840:	fe0796e3          	bnez	a5,1082c <__sinit+0x8>
   10844:	d65ff06f          	j	105a8 <global_stdio_init.part.0>

00010848 <__sfp_lock_acquire>:
   10848:	00008067          	ret

0001084c <__sfp_lock_release>:
   1084c:	00008067          	ret

00010850 <__fp_lock_all>:
   10850:	00003617          	auipc	a2,0x3
   10854:	a1860613          	addi	a2,a2,-1512 # 13268 <__sglue>
   10858:	00000597          	auipc	a1,0x0
   1085c:	cc458593          	addi	a1,a1,-828 # 1051c <__fp_lock>
   10860:	00000513          	li	a0,0
   10864:	3b40106f          	j	11c18 <_fwalk_sglue>

00010868 <__fp_unlock_all>:
   10868:	00003617          	auipc	a2,0x3
   1086c:	a0060613          	addi	a2,a2,-1536 # 13268 <__sglue>
   10870:	00000597          	auipc	a1,0x0
   10874:	d3058593          	addi	a1,a1,-720 # 105a0 <__fp_unlock>
   10878:	00000513          	li	a0,0
   1087c:	39c0106f          	j	11c18 <_fwalk_sglue>

00010880 <_fclose_r>:
   10880:	ff010113          	addi	sp,sp,-16
   10884:	00112623          	sw	ra,12(sp)
   10888:	01212023          	sw	s2,0(sp)
   1088c:	02058863          	beqz	a1,108bc <_fclose_r+0x3c>
   10890:	00812423          	sw	s0,8(sp)
   10894:	00912223          	sw	s1,4(sp)
   10898:	00058413          	mv	s0,a1
   1089c:	00050493          	mv	s1,a0
   108a0:	00050663          	beqz	a0,108ac <_fclose_r+0x2c>
   108a4:	03452783          	lw	a5,52(a0)
   108a8:	0c078c63          	beqz	a5,10980 <_fclose_r+0x100>
   108ac:	00c41783          	lh	a5,12(s0)
   108b0:	02079263          	bnez	a5,108d4 <_fclose_r+0x54>
   108b4:	00812403          	lw	s0,8(sp)
   108b8:	00412483          	lw	s1,4(sp)
   108bc:	00c12083          	lw	ra,12(sp)
   108c0:	00000913          	li	s2,0
   108c4:	00090513          	mv	a0,s2
   108c8:	00012903          	lw	s2,0(sp)
   108cc:	01010113          	addi	sp,sp,16
   108d0:	00008067          	ret
   108d4:	00040593          	mv	a1,s0
   108d8:	00048513          	mv	a0,s1
   108dc:	004010ef          	jal	118e0 <__sflush_r>
   108e0:	02c42783          	lw	a5,44(s0)
   108e4:	00050913          	mv	s2,a0
   108e8:	00078a63          	beqz	a5,108fc <_fclose_r+0x7c>
   108ec:	01c42583          	lw	a1,28(s0)
   108f0:	00048513          	mv	a0,s1
   108f4:	000780e7          	jalr	a5
   108f8:	06054463          	bltz	a0,10960 <_fclose_r+0xe0>
   108fc:	00c45783          	lhu	a5,12(s0)
   10900:	0807f793          	andi	a5,a5,128
   10904:	06079663          	bnez	a5,10970 <_fclose_r+0xf0>
   10908:	03042583          	lw	a1,48(s0)
   1090c:	00058c63          	beqz	a1,10924 <_fclose_r+0xa4>
   10910:	04040793          	addi	a5,s0,64
   10914:	00f58663          	beq	a1,a5,10920 <_fclose_r+0xa0>
   10918:	00048513          	mv	a0,s1
   1091c:	1b9000ef          	jal	112d4 <_free_r>
   10920:	02042823          	sw	zero,48(s0)
   10924:	04442583          	lw	a1,68(s0)
   10928:	00058863          	beqz	a1,10938 <_fclose_r+0xb8>
   1092c:	00048513          	mv	a0,s1
   10930:	1a5000ef          	jal	112d4 <_free_r>
   10934:	04042223          	sw	zero,68(s0)
   10938:	f11ff0ef          	jal	10848 <__sfp_lock_acquire>
   1093c:	00041623          	sh	zero,12(s0)
   10940:	f0dff0ef          	jal	1084c <__sfp_lock_release>
   10944:	00c12083          	lw	ra,12(sp)
   10948:	00812403          	lw	s0,8(sp)
   1094c:	00412483          	lw	s1,4(sp)
   10950:	00090513          	mv	a0,s2
   10954:	00012903          	lw	s2,0(sp)
   10958:	01010113          	addi	sp,sp,16
   1095c:	00008067          	ret
   10960:	00c45783          	lhu	a5,12(s0)
   10964:	fff00913          	li	s2,-1
   10968:	0807f793          	andi	a5,a5,128
   1096c:	f8078ee3          	beqz	a5,10908 <_fclose_r+0x88>
   10970:	01042583          	lw	a1,16(s0)
   10974:	00048513          	mv	a0,s1
   10978:	15d000ef          	jal	112d4 <_free_r>
   1097c:	f8dff06f          	j	10908 <_fclose_r+0x88>
   10980:	ea5ff0ef          	jal	10824 <__sinit>
   10984:	f29ff06f          	j	108ac <_fclose_r+0x2c>

00010988 <fclose>:
   10988:	00050593          	mv	a1,a0
   1098c:	d641a503          	lw	a0,-668(gp) # 137cc <_impure_ptr>
   10990:	ef1ff06f          	j	10880 <_fclose_r>

00010994 <_malloc_r>:
   10994:	fd010113          	addi	sp,sp,-48
   10998:	03212023          	sw	s2,32(sp)
   1099c:	02112623          	sw	ra,44(sp)
   109a0:	02812423          	sw	s0,40(sp)
   109a4:	02912223          	sw	s1,36(sp)
   109a8:	01312e23          	sw	s3,28(sp)
   109ac:	00b58793          	addi	a5,a1,11
   109b0:	01600713          	li	a4,22
   109b4:	00050913          	mv	s2,a0
   109b8:	06f76e63          	bltu	a4,a5,10a34 <_malloc_r+0xa0>
   109bc:	01000493          	li	s1,16
   109c0:	1eb4ee63          	bltu	s1,a1,10bbc <_malloc_r+0x228>
   109c4:	539000ef          	jal	116fc <__malloc_lock>
   109c8:	01800793          	li	a5,24
   109cc:	00200593          	li	a1,2
   109d0:	80c18993          	addi	s3,gp,-2036 # 13274 <__malloc_av_>
   109d4:	00f987b3          	add	a5,s3,a5
   109d8:	0047a403          	lw	s0,4(a5)
   109dc:	ff878713          	addi	a4,a5,-8
   109e0:	44e40863          	beq	s0,a4,10e30 <_malloc_r+0x49c>
   109e4:	00442783          	lw	a5,4(s0)
   109e8:	00c42683          	lw	a3,12(s0)
   109ec:	00842603          	lw	a2,8(s0)
   109f0:	ffc7f793          	andi	a5,a5,-4
   109f4:	00f407b3          	add	a5,s0,a5
   109f8:	0047a703          	lw	a4,4(a5)
   109fc:	00d62623          	sw	a3,12(a2)
   10a00:	00c6a423          	sw	a2,8(a3)
   10a04:	00176713          	ori	a4,a4,1
   10a08:	00090513          	mv	a0,s2
   10a0c:	00e7a223          	sw	a4,4(a5)
   10a10:	4f1000ef          	jal	11700 <__malloc_unlock>
   10a14:	02c12083          	lw	ra,44(sp)
   10a18:	00840513          	addi	a0,s0,8
   10a1c:	02812403          	lw	s0,40(sp)
   10a20:	02412483          	lw	s1,36(sp)
   10a24:	02012903          	lw	s2,32(sp)
   10a28:	01c12983          	lw	s3,28(sp)
   10a2c:	03010113          	addi	sp,sp,48
   10a30:	00008067          	ret
   10a34:	ff87f493          	andi	s1,a5,-8
   10a38:	1807c263          	bltz	a5,10bbc <_malloc_r+0x228>
   10a3c:	18b4e063          	bltu	s1,a1,10bbc <_malloc_r+0x228>
   10a40:	4bd000ef          	jal	116fc <__malloc_lock>
   10a44:	1f700793          	li	a5,503
   10a48:	4e97fe63          	bgeu	a5,s1,10f44 <_malloc_r+0x5b0>
   10a4c:	0094d793          	srli	a5,s1,0x9
   10a50:	18078a63          	beqz	a5,10be4 <_malloc_r+0x250>
   10a54:	00400713          	li	a4,4
   10a58:	44f76463          	bltu	a4,a5,10ea0 <_malloc_r+0x50c>
   10a5c:	0064d793          	srli	a5,s1,0x6
   10a60:	03978593          	addi	a1,a5,57
   10a64:	03878813          	addi	a6,a5,56
   10a68:	00359613          	slli	a2,a1,0x3
   10a6c:	80c18993          	addi	s3,gp,-2036 # 13274 <__malloc_av_>
   10a70:	00c98633          	add	a2,s3,a2
   10a74:	00462403          	lw	s0,4(a2)
   10a78:	ff860613          	addi	a2,a2,-8
   10a7c:	02860863          	beq	a2,s0,10aac <_malloc_r+0x118>
   10a80:	00f00513          	li	a0,15
   10a84:	0140006f          	j	10a98 <_malloc_r+0x104>
   10a88:	00c42683          	lw	a3,12(s0)
   10a8c:	36075063          	bgez	a4,10dec <_malloc_r+0x458>
   10a90:	00d60e63          	beq	a2,a3,10aac <_malloc_r+0x118>
   10a94:	00068413          	mv	s0,a3
   10a98:	00442783          	lw	a5,4(s0)
   10a9c:	ffc7f793          	andi	a5,a5,-4
   10aa0:	40978733          	sub	a4,a5,s1
   10aa4:	fee552e3          	bge	a0,a4,10a88 <_malloc_r+0xf4>
   10aa8:	00080593          	mv	a1,a6
   10aac:	0109a403          	lw	s0,16(s3)
   10ab0:	81418893          	addi	a7,gp,-2028 # 1327c <__malloc_av_+0x8>
   10ab4:	2b140c63          	beq	s0,a7,10d6c <_malloc_r+0x3d8>
   10ab8:	00442783          	lw	a5,4(s0)
   10abc:	00f00693          	li	a3,15
   10ac0:	ffc7f793          	andi	a5,a5,-4
   10ac4:	40978733          	sub	a4,a5,s1
   10ac8:	48e6c463          	blt	a3,a4,10f50 <_malloc_r+0x5bc>
   10acc:	0119aa23          	sw	a7,20(s3)
   10ad0:	0119a823          	sw	a7,16(s3)
   10ad4:	44075863          	bgez	a4,10f24 <_malloc_r+0x590>
   10ad8:	1ff00713          	li	a4,511
   10adc:	0049a503          	lw	a0,4(s3)
   10ae0:	36f76063          	bltu	a4,a5,10e40 <_malloc_r+0x4ac>
   10ae4:	ff87f713          	andi	a4,a5,-8
   10ae8:	00870713          	addi	a4,a4,8
   10aec:	00e98733          	add	a4,s3,a4
   10af0:	00072683          	lw	a3,0(a4)
   10af4:	0057d613          	srli	a2,a5,0x5
   10af8:	00100793          	li	a5,1
   10afc:	00c797b3          	sll	a5,a5,a2
   10b00:	00f56533          	or	a0,a0,a5
   10b04:	ff870793          	addi	a5,a4,-8
   10b08:	00d42423          	sw	a3,8(s0)
   10b0c:	00f42623          	sw	a5,12(s0)
   10b10:	00a9a223          	sw	a0,4(s3)
   10b14:	00872023          	sw	s0,0(a4)
   10b18:	0086a623          	sw	s0,12(a3)
   10b1c:	4025d793          	srai	a5,a1,0x2
   10b20:	00100613          	li	a2,1
   10b24:	00f61633          	sll	a2,a2,a5
   10b28:	0cc56663          	bltu	a0,a2,10bf4 <_malloc_r+0x260>
   10b2c:	00a677b3          	and	a5,a2,a0
   10b30:	02079463          	bnez	a5,10b58 <_malloc_r+0x1c4>
   10b34:	00161613          	slli	a2,a2,0x1
   10b38:	ffc5f593          	andi	a1,a1,-4
   10b3c:	00a677b3          	and	a5,a2,a0
   10b40:	00458593          	addi	a1,a1,4
   10b44:	00079a63          	bnez	a5,10b58 <_malloc_r+0x1c4>
   10b48:	00161613          	slli	a2,a2,0x1
   10b4c:	00a677b3          	and	a5,a2,a0
   10b50:	00458593          	addi	a1,a1,4
   10b54:	fe078ae3          	beqz	a5,10b48 <_malloc_r+0x1b4>
   10b58:	00f00813          	li	a6,15
   10b5c:	00359313          	slli	t1,a1,0x3
   10b60:	00698333          	add	t1,s3,t1
   10b64:	00030513          	mv	a0,t1
   10b68:	00c52783          	lw	a5,12(a0)
   10b6c:	00058e13          	mv	t3,a1
   10b70:	34f50a63          	beq	a0,a5,10ec4 <_malloc_r+0x530>
   10b74:	0047a703          	lw	a4,4(a5)
   10b78:	00078413          	mv	s0,a5
   10b7c:	00c7a783          	lw	a5,12(a5)
   10b80:	ffc77713          	andi	a4,a4,-4
   10b84:	409706b3          	sub	a3,a4,s1
   10b88:	34d84a63          	blt	a6,a3,10edc <_malloc_r+0x548>
   10b8c:	fe06c2e3          	bltz	a3,10b70 <_malloc_r+0x1dc>
   10b90:	00e40733          	add	a4,s0,a4
   10b94:	00472683          	lw	a3,4(a4)
   10b98:	00842603          	lw	a2,8(s0)
   10b9c:	00090513          	mv	a0,s2
   10ba0:	0016e693          	ori	a3,a3,1
   10ba4:	00d72223          	sw	a3,4(a4)
   10ba8:	00f62623          	sw	a5,12(a2)
   10bac:	00c7a423          	sw	a2,8(a5)
   10bb0:	351000ef          	jal	11700 <__malloc_unlock>
   10bb4:	00840513          	addi	a0,s0,8
   10bb8:	0100006f          	j	10bc8 <_malloc_r+0x234>
   10bbc:	00c00793          	li	a5,12
   10bc0:	00f92023          	sw	a5,0(s2)
   10bc4:	00000513          	li	a0,0
   10bc8:	02c12083          	lw	ra,44(sp)
   10bcc:	02812403          	lw	s0,40(sp)
   10bd0:	02412483          	lw	s1,36(sp)
   10bd4:	02012903          	lw	s2,32(sp)
   10bd8:	01c12983          	lw	s3,28(sp)
   10bdc:	03010113          	addi	sp,sp,48
   10be0:	00008067          	ret
   10be4:	20000613          	li	a2,512
   10be8:	04000593          	li	a1,64
   10bec:	03f00813          	li	a6,63
   10bf0:	e7dff06f          	j	10a6c <_malloc_r+0xd8>
   10bf4:	0089a403          	lw	s0,8(s3)
   10bf8:	01612823          	sw	s6,16(sp)
   10bfc:	00442783          	lw	a5,4(s0)
   10c00:	ffc7fb13          	andi	s6,a5,-4
   10c04:	009b6863          	bltu	s6,s1,10c14 <_malloc_r+0x280>
   10c08:	409b0733          	sub	a4,s6,s1
   10c0c:	00f00793          	li	a5,15
   10c10:	18e7cc63          	blt	a5,a4,10da8 <_malloc_r+0x414>
   10c14:	01912223          	sw	s9,4(sp)
   10c18:	d5c18c93          	addi	s9,gp,-676 # 137c4 <__malloc_sbrk_base>
   10c1c:	01512a23          	sw	s5,20(sp)
   10c20:	000ca703          	lw	a4,0(s9)
   10c24:	d781aa83          	lw	s5,-648(gp) # 137e0 <__malloc_top_pad>
   10c28:	01412c23          	sw	s4,24(sp)
   10c2c:	01712623          	sw	s7,12(sp)
   10c30:	fff00793          	li	a5,-1
   10c34:	01640a33          	add	s4,s0,s6
   10c38:	01548ab3          	add	s5,s1,s5
   10c3c:	3ef70063          	beq	a4,a5,1101c <_malloc_r+0x688>
   10c40:	000017b7          	lui	a5,0x1
   10c44:	00f78793          	addi	a5,a5,15 # 100f <register_fini-0xf0a5>
   10c48:	00fa8ab3          	add	s5,s5,a5
   10c4c:	fffff7b7          	lui	a5,0xfffff
   10c50:	00fafab3          	and	s5,s5,a5
   10c54:	000a8593          	mv	a1,s5
   10c58:	00090513          	mv	a0,s2
   10c5c:	2a9000ef          	jal	11704 <_sbrk_r>
   10c60:	fff00793          	li	a5,-1
   10c64:	00050b93          	mv	s7,a0
   10c68:	46f50c63          	beq	a0,a5,110e0 <_malloc_r+0x74c>
   10c6c:	01812423          	sw	s8,8(sp)
   10c70:	11456263          	bltu	a0,s4,10d74 <_malloc_r+0x3e0>
   10c74:	edc18c13          	addi	s8,gp,-292 # 13944 <__malloc_current_mallinfo>
   10c78:	000c2583          	lw	a1,0(s8)
   10c7c:	00ba85b3          	add	a1,s5,a1
   10c80:	00bc2023          	sw	a1,0(s8)
   10c84:	00058713          	mv	a4,a1
   10c88:	46aa0263          	beq	s4,a0,110ec <_malloc_r+0x758>
   10c8c:	000ca683          	lw	a3,0(s9)
   10c90:	fff00793          	li	a5,-1
   10c94:	46f68a63          	beq	a3,a5,11108 <_malloc_r+0x774>
   10c98:	414b87b3          	sub	a5,s7,s4
   10c9c:	00e787b3          	add	a5,a5,a4
   10ca0:	00fc2023          	sw	a5,0(s8)
   10ca4:	007bfc93          	andi	s9,s7,7
   10ca8:	380c8a63          	beqz	s9,1103c <_malloc_r+0x6a8>
   10cac:	419b8bb3          	sub	s7,s7,s9
   10cb0:	000015b7          	lui	a1,0x1
   10cb4:	008b8b93          	addi	s7,s7,8
   10cb8:	00858593          	addi	a1,a1,8 # 1008 <register_fini-0xf0ac>
   10cbc:	015b8ab3          	add	s5,s7,s5
   10cc0:	419585b3          	sub	a1,a1,s9
   10cc4:	415585b3          	sub	a1,a1,s5
   10cc8:	01459593          	slli	a1,a1,0x14
   10ccc:	0145da13          	srli	s4,a1,0x14
   10cd0:	000a0593          	mv	a1,s4
   10cd4:	00090513          	mv	a0,s2
   10cd8:	22d000ef          	jal	11704 <_sbrk_r>
   10cdc:	fff00793          	li	a5,-1
   10ce0:	46f50463          	beq	a0,a5,11148 <_malloc_r+0x7b4>
   10ce4:	41750533          	sub	a0,a0,s7
   10ce8:	01450ab3          	add	s5,a0,s4
   10cec:	000c2703          	lw	a4,0(s8)
   10cf0:	0179a423          	sw	s7,8(s3)
   10cf4:	001ae793          	ori	a5,s5,1
   10cf8:	00ea05b3          	add	a1,s4,a4
   10cfc:	00fba223          	sw	a5,4(s7)
   10d00:	00bc2023          	sw	a1,0(s8)
   10d04:	03340e63          	beq	s0,s3,10d40 <_malloc_r+0x3ac>
   10d08:	00f00693          	li	a3,15
   10d0c:	3566fe63          	bgeu	a3,s6,11068 <_malloc_r+0x6d4>
   10d10:	00442703          	lw	a4,4(s0)
   10d14:	ff4b0793          	addi	a5,s6,-12
   10d18:	ff87f793          	andi	a5,a5,-8
   10d1c:	00177713          	andi	a4,a4,1
   10d20:	00f76733          	or	a4,a4,a5
   10d24:	00e42223          	sw	a4,4(s0)
   10d28:	00500613          	li	a2,5
   10d2c:	00f40733          	add	a4,s0,a5
   10d30:	00c72223          	sw	a2,4(a4)
   10d34:	00c72423          	sw	a2,8(a4)
   10d38:	2cf6e663          	bltu	a3,a5,11004 <_malloc_r+0x670>
   10d3c:	004ba783          	lw	a5,4(s7)
   10d40:	d7418713          	addi	a4,gp,-652 # 137dc <__malloc_max_sbrked_mem>
   10d44:	00072683          	lw	a3,0(a4)
   10d48:	00b6f463          	bgeu	a3,a1,10d50 <_malloc_r+0x3bc>
   10d4c:	00b72023          	sw	a1,0(a4)
   10d50:	d7018713          	addi	a4,gp,-656 # 137d8 <__malloc_max_total_mem>
   10d54:	00072683          	lw	a3,0(a4)
   10d58:	00b6f463          	bgeu	a3,a1,10d60 <_malloc_r+0x3cc>
   10d5c:	00b72023          	sw	a1,0(a4)
   10d60:	00812c03          	lw	s8,8(sp)
   10d64:	000b8413          	mv	s0,s7
   10d68:	01c0006f          	j	10d84 <_malloc_r+0x3f0>
   10d6c:	0049a503          	lw	a0,4(s3)
   10d70:	dadff06f          	j	10b1c <_malloc_r+0x188>
   10d74:	35340c63          	beq	s0,s3,110cc <_malloc_r+0x738>
   10d78:	0089a403          	lw	s0,8(s3)
   10d7c:	00812c03          	lw	s8,8(sp)
   10d80:	00442783          	lw	a5,4(s0)
   10d84:	ffc7f793          	andi	a5,a5,-4
   10d88:	40978733          	sub	a4,a5,s1
   10d8c:	2e97e463          	bltu	a5,s1,11074 <_malloc_r+0x6e0>
   10d90:	00f00793          	li	a5,15
   10d94:	2ee7d063          	bge	a5,a4,11074 <_malloc_r+0x6e0>
   10d98:	01812a03          	lw	s4,24(sp)
   10d9c:	01412a83          	lw	s5,20(sp)
   10da0:	00c12b83          	lw	s7,12(sp)
   10da4:	00412c83          	lw	s9,4(sp)
   10da8:	0014e793          	ori	a5,s1,1
   10dac:	00f42223          	sw	a5,4(s0)
   10db0:	009404b3          	add	s1,s0,s1
   10db4:	0099a423          	sw	s1,8(s3)
   10db8:	00176713          	ori	a4,a4,1
   10dbc:	00090513          	mv	a0,s2
   10dc0:	00e4a223          	sw	a4,4(s1)
   10dc4:	13d000ef          	jal	11700 <__malloc_unlock>
   10dc8:	02c12083          	lw	ra,44(sp)
   10dcc:	00840513          	addi	a0,s0,8
   10dd0:	02812403          	lw	s0,40(sp)
   10dd4:	01012b03          	lw	s6,16(sp)
   10dd8:	02412483          	lw	s1,36(sp)
   10ddc:	02012903          	lw	s2,32(sp)
   10de0:	01c12983          	lw	s3,28(sp)
   10de4:	03010113          	addi	sp,sp,48
   10de8:	00008067          	ret
   10dec:	00842603          	lw	a2,8(s0)
   10df0:	00f407b3          	add	a5,s0,a5
   10df4:	0047a703          	lw	a4,4(a5) # fffff004 <__BSS_END__+0xfffeb508>
   10df8:	00d62623          	sw	a3,12(a2)
   10dfc:	00c6a423          	sw	a2,8(a3)
   10e00:	00176713          	ori	a4,a4,1
   10e04:	00090513          	mv	a0,s2
   10e08:	00e7a223          	sw	a4,4(a5)
   10e0c:	0f5000ef          	jal	11700 <__malloc_unlock>
   10e10:	02c12083          	lw	ra,44(sp)
   10e14:	00840513          	addi	a0,s0,8
   10e18:	02812403          	lw	s0,40(sp)
   10e1c:	02412483          	lw	s1,36(sp)
   10e20:	02012903          	lw	s2,32(sp)
   10e24:	01c12983          	lw	s3,28(sp)
   10e28:	03010113          	addi	sp,sp,48
   10e2c:	00008067          	ret
   10e30:	00c7a403          	lw	s0,12(a5)
   10e34:	00258593          	addi	a1,a1,2
   10e38:	c6878ae3          	beq	a5,s0,10aac <_malloc_r+0x118>
   10e3c:	ba9ff06f          	j	109e4 <_malloc_r+0x50>
   10e40:	0097d713          	srli	a4,a5,0x9
   10e44:	00400693          	li	a3,4
   10e48:	14e6f263          	bgeu	a3,a4,10f8c <_malloc_r+0x5f8>
   10e4c:	01400693          	li	a3,20
   10e50:	24e6e263          	bltu	a3,a4,11094 <_malloc_r+0x700>
   10e54:	05c70613          	addi	a2,a4,92
   10e58:	00361613          	slli	a2,a2,0x3
   10e5c:	05b70693          	addi	a3,a4,91
   10e60:	00c98633          	add	a2,s3,a2
   10e64:	00062703          	lw	a4,0(a2)
   10e68:	ff860613          	addi	a2,a2,-8
   10e6c:	00e61863          	bne	a2,a4,10e7c <_malloc_r+0x4e8>
   10e70:	1b40006f          	j	11024 <_malloc_r+0x690>
   10e74:	00872703          	lw	a4,8(a4)
   10e78:	00e60863          	beq	a2,a4,10e88 <_malloc_r+0x4f4>
   10e7c:	00472683          	lw	a3,4(a4)
   10e80:	ffc6f693          	andi	a3,a3,-4
   10e84:	fed7e8e3          	bltu	a5,a3,10e74 <_malloc_r+0x4e0>
   10e88:	00c72603          	lw	a2,12(a4)
   10e8c:	00c42623          	sw	a2,12(s0)
   10e90:	00e42423          	sw	a4,8(s0)
   10e94:	00862423          	sw	s0,8(a2)
   10e98:	00872623          	sw	s0,12(a4)
   10e9c:	c81ff06f          	j	10b1c <_malloc_r+0x188>
   10ea0:	01400713          	li	a4,20
   10ea4:	0ef77e63          	bgeu	a4,a5,10fa0 <_malloc_r+0x60c>
   10ea8:	05400713          	li	a4,84
   10eac:	20f76263          	bltu	a4,a5,110b0 <_malloc_r+0x71c>
   10eb0:	00c4d793          	srli	a5,s1,0xc
   10eb4:	06f78593          	addi	a1,a5,111
   10eb8:	06e78813          	addi	a6,a5,110
   10ebc:	00359613          	slli	a2,a1,0x3
   10ec0:	badff06f          	j	10a6c <_malloc_r+0xd8>
   10ec4:	001e0e13          	addi	t3,t3,1
   10ec8:	003e7793          	andi	a5,t3,3
   10ecc:	00850513          	addi	a0,a0,8
   10ed0:	0e078663          	beqz	a5,10fbc <_malloc_r+0x628>
   10ed4:	00c52783          	lw	a5,12(a0)
   10ed8:	c99ff06f          	j	10b70 <_malloc_r+0x1dc>
   10edc:	00842603          	lw	a2,8(s0)
   10ee0:	0014e593          	ori	a1,s1,1
   10ee4:	00b42223          	sw	a1,4(s0)
   10ee8:	00f62623          	sw	a5,12(a2)
   10eec:	00c7a423          	sw	a2,8(a5)
   10ef0:	009404b3          	add	s1,s0,s1
   10ef4:	0099aa23          	sw	s1,20(s3)
   10ef8:	0099a823          	sw	s1,16(s3)
   10efc:	0016e793          	ori	a5,a3,1
   10f00:	00e40733          	add	a4,s0,a4
   10f04:	0114a623          	sw	a7,12(s1)
   10f08:	0114a423          	sw	a7,8(s1)
   10f0c:	00f4a223          	sw	a5,4(s1)
   10f10:	00090513          	mv	a0,s2
   10f14:	00d72023          	sw	a3,0(a4)
   10f18:	7e8000ef          	jal	11700 <__malloc_unlock>
   10f1c:	00840513          	addi	a0,s0,8
   10f20:	ca9ff06f          	j	10bc8 <_malloc_r+0x234>
   10f24:	00f407b3          	add	a5,s0,a5
   10f28:	0047a703          	lw	a4,4(a5)
   10f2c:	00090513          	mv	a0,s2
   10f30:	00176713          	ori	a4,a4,1
   10f34:	00e7a223          	sw	a4,4(a5)
   10f38:	7c8000ef          	jal	11700 <__malloc_unlock>
   10f3c:	00840513          	addi	a0,s0,8
   10f40:	c89ff06f          	j	10bc8 <_malloc_r+0x234>
   10f44:	0034d593          	srli	a1,s1,0x3
   10f48:	00848793          	addi	a5,s1,8
   10f4c:	a85ff06f          	j	109d0 <_malloc_r+0x3c>
   10f50:	0014e693          	ori	a3,s1,1
   10f54:	00d42223          	sw	a3,4(s0)
   10f58:	009404b3          	add	s1,s0,s1
   10f5c:	0099aa23          	sw	s1,20(s3)
   10f60:	0099a823          	sw	s1,16(s3)
   10f64:	00176693          	ori	a3,a4,1
   10f68:	00f407b3          	add	a5,s0,a5
   10f6c:	0114a623          	sw	a7,12(s1)
   10f70:	0114a423          	sw	a7,8(s1)
   10f74:	00d4a223          	sw	a3,4(s1)
   10f78:	00090513          	mv	a0,s2
   10f7c:	00e7a023          	sw	a4,0(a5)
   10f80:	780000ef          	jal	11700 <__malloc_unlock>
   10f84:	00840513          	addi	a0,s0,8
   10f88:	c41ff06f          	j	10bc8 <_malloc_r+0x234>
   10f8c:	0067d713          	srli	a4,a5,0x6
   10f90:	03970613          	addi	a2,a4,57
   10f94:	00361613          	slli	a2,a2,0x3
   10f98:	03870693          	addi	a3,a4,56
   10f9c:	ec5ff06f          	j	10e60 <_malloc_r+0x4cc>
   10fa0:	05c78593          	addi	a1,a5,92
   10fa4:	05b78813          	addi	a6,a5,91
   10fa8:	00359613          	slli	a2,a1,0x3
   10fac:	ac1ff06f          	j	10a6c <_malloc_r+0xd8>
   10fb0:	00832783          	lw	a5,8(t1)
   10fb4:	fff58593          	addi	a1,a1,-1
   10fb8:	1c679e63          	bne	a5,t1,11194 <_malloc_r+0x800>
   10fbc:	0035f793          	andi	a5,a1,3
   10fc0:	ff830313          	addi	t1,t1,-8
   10fc4:	fe0796e3          	bnez	a5,10fb0 <_malloc_r+0x61c>
   10fc8:	0049a703          	lw	a4,4(s3)
   10fcc:	fff64793          	not	a5,a2
   10fd0:	00e7f7b3          	and	a5,a5,a4
   10fd4:	00f9a223          	sw	a5,4(s3)
   10fd8:	00161613          	slli	a2,a2,0x1
   10fdc:	c0c7ece3          	bltu	a5,a2,10bf4 <_malloc_r+0x260>
   10fe0:	c0060ae3          	beqz	a2,10bf4 <_malloc_r+0x260>
   10fe4:	00f67733          	and	a4,a2,a5
   10fe8:	00071a63          	bnez	a4,10ffc <_malloc_r+0x668>
   10fec:	00161613          	slli	a2,a2,0x1
   10ff0:	00f67733          	and	a4,a2,a5
   10ff4:	004e0e13          	addi	t3,t3,4
   10ff8:	fe070ae3          	beqz	a4,10fec <_malloc_r+0x658>
   10ffc:	000e0593          	mv	a1,t3
   11000:	b5dff06f          	j	10b5c <_malloc_r+0x1c8>
   11004:	00840593          	addi	a1,s0,8
   11008:	00090513          	mv	a0,s2
   1100c:	2c8000ef          	jal	112d4 <_free_r>
   11010:	000c2583          	lw	a1,0(s8)
   11014:	0089ab83          	lw	s7,8(s3)
   11018:	d25ff06f          	j	10d3c <_malloc_r+0x3a8>
   1101c:	010a8a93          	addi	s5,s5,16
   11020:	c35ff06f          	j	10c54 <_malloc_r+0x2c0>
   11024:	4026d693          	srai	a3,a3,0x2
   11028:	00100793          	li	a5,1
   1102c:	00d797b3          	sll	a5,a5,a3
   11030:	00f56533          	or	a0,a0,a5
   11034:	00a9a223          	sw	a0,4(s3)
   11038:	e55ff06f          	j	10e8c <_malloc_r+0x4f8>
   1103c:	015b85b3          	add	a1,s7,s5
   11040:	40b005b3          	neg	a1,a1
   11044:	01459593          	slli	a1,a1,0x14
   11048:	0145da13          	srli	s4,a1,0x14
   1104c:	000a0593          	mv	a1,s4
   11050:	00090513          	mv	a0,s2
   11054:	6b0000ef          	jal	11704 <_sbrk_r>
   11058:	fff00793          	li	a5,-1
   1105c:	c8f514e3          	bne	a0,a5,10ce4 <_malloc_r+0x350>
   11060:	00000a13          	li	s4,0
   11064:	c89ff06f          	j	10cec <_malloc_r+0x358>
   11068:	00812c03          	lw	s8,8(sp)
   1106c:	00100793          	li	a5,1
   11070:	00fba223          	sw	a5,4(s7)
   11074:	00090513          	mv	a0,s2
   11078:	688000ef          	jal	11700 <__malloc_unlock>
   1107c:	01812a03          	lw	s4,24(sp)
   11080:	01412a83          	lw	s5,20(sp)
   11084:	01012b03          	lw	s6,16(sp)
   11088:	00c12b83          	lw	s7,12(sp)
   1108c:	00412c83          	lw	s9,4(sp)
   11090:	b35ff06f          	j	10bc4 <_malloc_r+0x230>
   11094:	05400693          	li	a3,84
   11098:	06e6ec63          	bltu	a3,a4,11110 <_malloc_r+0x77c>
   1109c:	00c7d713          	srli	a4,a5,0xc
   110a0:	06f70613          	addi	a2,a4,111
   110a4:	00361613          	slli	a2,a2,0x3
   110a8:	06e70693          	addi	a3,a4,110
   110ac:	db5ff06f          	j	10e60 <_malloc_r+0x4cc>
   110b0:	15400713          	li	a4,340
   110b4:	06f76c63          	bltu	a4,a5,1112c <_malloc_r+0x798>
   110b8:	00f4d793          	srli	a5,s1,0xf
   110bc:	07878593          	addi	a1,a5,120
   110c0:	07778813          	addi	a6,a5,119
   110c4:	00359613          	slli	a2,a1,0x3
   110c8:	9a5ff06f          	j	10a6c <_malloc_r+0xd8>
   110cc:	edc18c13          	addi	s8,gp,-292 # 13944 <__malloc_current_mallinfo>
   110d0:	000c2703          	lw	a4,0(s8)
   110d4:	00ea8733          	add	a4,s5,a4
   110d8:	00ec2023          	sw	a4,0(s8)
   110dc:	bb1ff06f          	j	10c8c <_malloc_r+0x2f8>
   110e0:	0089a403          	lw	s0,8(s3)
   110e4:	00442783          	lw	a5,4(s0)
   110e8:	c9dff06f          	j	10d84 <_malloc_r+0x3f0>
   110ec:	01451793          	slli	a5,a0,0x14
   110f0:	b8079ee3          	bnez	a5,10c8c <_malloc_r+0x2f8>
   110f4:	0089ab83          	lw	s7,8(s3)
   110f8:	015b07b3          	add	a5,s6,s5
   110fc:	0017e793          	ori	a5,a5,1
   11100:	00fba223          	sw	a5,4(s7)
   11104:	c3dff06f          	j	10d40 <_malloc_r+0x3ac>
   11108:	017ca023          	sw	s7,0(s9)
   1110c:	b99ff06f          	j	10ca4 <_malloc_r+0x310>
   11110:	15400693          	li	a3,340
   11114:	04e6e463          	bltu	a3,a4,1115c <_malloc_r+0x7c8>
   11118:	00f7d713          	srli	a4,a5,0xf
   1111c:	07870613          	addi	a2,a4,120
   11120:	00361613          	slli	a2,a2,0x3
   11124:	07770693          	addi	a3,a4,119
   11128:	d39ff06f          	j	10e60 <_malloc_r+0x4cc>
   1112c:	55400713          	li	a4,1364
   11130:	04f76463          	bltu	a4,a5,11178 <_malloc_r+0x7e4>
   11134:	0124d793          	srli	a5,s1,0x12
   11138:	07d78593          	addi	a1,a5,125
   1113c:	07c78813          	addi	a6,a5,124
   11140:	00359613          	slli	a2,a1,0x3
   11144:	929ff06f          	j	10a6c <_malloc_r+0xd8>
   11148:	ff8c8c93          	addi	s9,s9,-8
   1114c:	019a8ab3          	add	s5,s5,s9
   11150:	417a8ab3          	sub	s5,s5,s7
   11154:	00000a13          	li	s4,0
   11158:	b95ff06f          	j	10cec <_malloc_r+0x358>
   1115c:	55400693          	li	a3,1364
   11160:	02e6e463          	bltu	a3,a4,11188 <_malloc_r+0x7f4>
   11164:	0127d713          	srli	a4,a5,0x12
   11168:	07d70613          	addi	a2,a4,125
   1116c:	00361613          	slli	a2,a2,0x3
   11170:	07c70693          	addi	a3,a4,124
   11174:	cedff06f          	j	10e60 <_malloc_r+0x4cc>
   11178:	3f800613          	li	a2,1016
   1117c:	07f00593          	li	a1,127
   11180:	07e00813          	li	a6,126
   11184:	8e9ff06f          	j	10a6c <_malloc_r+0xd8>
   11188:	3f800613          	li	a2,1016
   1118c:	07e00693          	li	a3,126
   11190:	cd1ff06f          	j	10e60 <_malloc_r+0x4cc>
   11194:	0049a783          	lw	a5,4(s3)
   11198:	e41ff06f          	j	10fd8 <_malloc_r+0x644>

0001119c <_malloc_trim_r>:
   1119c:	fe010113          	addi	sp,sp,-32
   111a0:	00812c23          	sw	s0,24(sp)
   111a4:	00912a23          	sw	s1,20(sp)
   111a8:	01212823          	sw	s2,16(sp)
   111ac:	01312623          	sw	s3,12(sp)
   111b0:	01412423          	sw	s4,8(sp)
   111b4:	00058993          	mv	s3,a1
   111b8:	00112e23          	sw	ra,28(sp)
   111bc:	00050913          	mv	s2,a0
   111c0:	00002a17          	auipc	s4,0x2
   111c4:	0b4a0a13          	addi	s4,s4,180 # 13274 <__malloc_av_>
   111c8:	534000ef          	jal	116fc <__malloc_lock>
   111cc:	008a2783          	lw	a5,8(s4)
   111d0:	00001437          	lui	s0,0x1
   111d4:	fef40413          	addi	s0,s0,-17 # fef <register_fini-0xf0c5>
   111d8:	0047a483          	lw	s1,4(a5)
   111dc:	000017b7          	lui	a5,0x1
   111e0:	ffc4f493          	andi	s1,s1,-4
   111e4:	00848433          	add	s0,s1,s0
   111e8:	41340433          	sub	s0,s0,s3
   111ec:	00c45413          	srli	s0,s0,0xc
   111f0:	fff40413          	addi	s0,s0,-1
   111f4:	00c41413          	slli	s0,s0,0xc
   111f8:	00f44e63          	blt	s0,a5,11214 <_malloc_trim_r+0x78>
   111fc:	00000593          	li	a1,0
   11200:	00090513          	mv	a0,s2
   11204:	500000ef          	jal	11704 <_sbrk_r>
   11208:	008a2783          	lw	a5,8(s4)
   1120c:	009787b3          	add	a5,a5,s1
   11210:	02f50863          	beq	a0,a5,11240 <_malloc_trim_r+0xa4>
   11214:	00090513          	mv	a0,s2
   11218:	4e8000ef          	jal	11700 <__malloc_unlock>
   1121c:	01c12083          	lw	ra,28(sp)
   11220:	01812403          	lw	s0,24(sp)
   11224:	01412483          	lw	s1,20(sp)
   11228:	01012903          	lw	s2,16(sp)
   1122c:	00c12983          	lw	s3,12(sp)
   11230:	00812a03          	lw	s4,8(sp)
   11234:	00000513          	li	a0,0
   11238:	02010113          	addi	sp,sp,32
   1123c:	00008067          	ret
   11240:	408005b3          	neg	a1,s0
   11244:	00090513          	mv	a0,s2
   11248:	4bc000ef          	jal	11704 <_sbrk_r>
   1124c:	fff00793          	li	a5,-1
   11250:	04f50863          	beq	a0,a5,112a0 <_malloc_trim_r+0x104>
   11254:	edc18713          	addi	a4,gp,-292 # 13944 <__malloc_current_mallinfo>
   11258:	008a2683          	lw	a3,8(s4)
   1125c:	00072783          	lw	a5,0(a4)
   11260:	408484b3          	sub	s1,s1,s0
   11264:	0014e493          	ori	s1,s1,1
   11268:	00090513          	mv	a0,s2
   1126c:	408787b3          	sub	a5,a5,s0
   11270:	0096a223          	sw	s1,4(a3)
   11274:	00f72023          	sw	a5,0(a4)
   11278:	488000ef          	jal	11700 <__malloc_unlock>
   1127c:	01c12083          	lw	ra,28(sp)
   11280:	01812403          	lw	s0,24(sp)
   11284:	01412483          	lw	s1,20(sp)
   11288:	01012903          	lw	s2,16(sp)
   1128c:	00c12983          	lw	s3,12(sp)
   11290:	00812a03          	lw	s4,8(sp)
   11294:	00100513          	li	a0,1
   11298:	02010113          	addi	sp,sp,32
   1129c:	00008067          	ret
   112a0:	00000593          	li	a1,0
   112a4:	00090513          	mv	a0,s2
   112a8:	45c000ef          	jal	11704 <_sbrk_r>
   112ac:	008a2703          	lw	a4,8(s4)
   112b0:	00f00693          	li	a3,15
   112b4:	40e507b3          	sub	a5,a0,a4
   112b8:	f4f6dee3          	bge	a3,a5,11214 <_malloc_trim_r+0x78>
   112bc:	d5c1a683          	lw	a3,-676(gp) # 137c4 <__malloc_sbrk_base>
   112c0:	0017e793          	ori	a5,a5,1
   112c4:	00f72223          	sw	a5,4(a4)
   112c8:	40d50533          	sub	a0,a0,a3
   112cc:	eca1ae23          	sw	a0,-292(gp) # 13944 <__malloc_current_mallinfo>
   112d0:	f45ff06f          	j	11214 <_malloc_trim_r+0x78>

000112d4 <_free_r>:
   112d4:	12058663          	beqz	a1,11400 <_free_r+0x12c>
   112d8:	ff010113          	addi	sp,sp,-16
   112dc:	00812423          	sw	s0,8(sp)
   112e0:	00912223          	sw	s1,4(sp)
   112e4:	00058413          	mv	s0,a1
   112e8:	00050493          	mv	s1,a0
   112ec:	00112623          	sw	ra,12(sp)
   112f0:	40c000ef          	jal	116fc <__malloc_lock>
   112f4:	ffc42583          	lw	a1,-4(s0)
   112f8:	ff840713          	addi	a4,s0,-8
   112fc:	00002817          	auipc	a6,0x2
   11300:	f7880813          	addi	a6,a6,-136 # 13274 <__malloc_av_>
   11304:	ffe5f793          	andi	a5,a1,-2
   11308:	00f70633          	add	a2,a4,a5
   1130c:	00462683          	lw	a3,4(a2)
   11310:	00882503          	lw	a0,8(a6)
   11314:	0015f893          	andi	a7,a1,1
   11318:	ffc6f693          	andi	a3,a3,-4
   1131c:	18c50c63          	beq	a0,a2,114b4 <_free_r+0x1e0>
   11320:	00d62223          	sw	a3,4(a2)
   11324:	00d60533          	add	a0,a2,a3
   11328:	00452503          	lw	a0,4(a0)
   1132c:	00157513          	andi	a0,a0,1
   11330:	08089c63          	bnez	a7,113c8 <_free_r+0xf4>
   11334:	ff842303          	lw	t1,-8(s0)
   11338:	00002897          	auipc	a7,0x2
   1133c:	f4488893          	addi	a7,a7,-188 # 1327c <__malloc_av_+0x8>
   11340:	40670733          	sub	a4,a4,t1
   11344:	00872583          	lw	a1,8(a4)
   11348:	006787b3          	add	a5,a5,t1
   1134c:	13158e63          	beq	a1,a7,11488 <_free_r+0x1b4>
   11350:	00c72303          	lw	t1,12(a4)
   11354:	0065a623          	sw	t1,12(a1)
   11358:	00b32423          	sw	a1,8(t1)
   1135c:	1a050063          	beqz	a0,114fc <_free_r+0x228>
   11360:	0017e693          	ori	a3,a5,1
   11364:	00d72223          	sw	a3,4(a4)
   11368:	00f62023          	sw	a5,0(a2)
   1136c:	1ff00693          	li	a3,511
   11370:	0af6e463          	bltu	a3,a5,11418 <_free_r+0x144>
   11374:	ff87f693          	andi	a3,a5,-8
   11378:	00868693          	addi	a3,a3,8
   1137c:	00482583          	lw	a1,4(a6)
   11380:	00d806b3          	add	a3,a6,a3
   11384:	0006a603          	lw	a2,0(a3)
   11388:	0057d513          	srli	a0,a5,0x5
   1138c:	00100793          	li	a5,1
   11390:	00a797b3          	sll	a5,a5,a0
   11394:	00b7e7b3          	or	a5,a5,a1
   11398:	ff868593          	addi	a1,a3,-8
   1139c:	00c72423          	sw	a2,8(a4)
   113a0:	00b72623          	sw	a1,12(a4)
   113a4:	00f82223          	sw	a5,4(a6)
   113a8:	00e6a023          	sw	a4,0(a3)
   113ac:	00e62623          	sw	a4,12(a2)
   113b0:	00812403          	lw	s0,8(sp)
   113b4:	00c12083          	lw	ra,12(sp)
   113b8:	00048513          	mv	a0,s1
   113bc:	00412483          	lw	s1,4(sp)
   113c0:	01010113          	addi	sp,sp,16
   113c4:	33c0006f          	j	11700 <__malloc_unlock>
   113c8:	02051e63          	bnez	a0,11404 <_free_r+0x130>
   113cc:	00d787b3          	add	a5,a5,a3
   113d0:	00002897          	auipc	a7,0x2
   113d4:	eac88893          	addi	a7,a7,-340 # 1327c <__malloc_av_+0x8>
   113d8:	00862683          	lw	a3,8(a2)
   113dc:	0017e513          	ori	a0,a5,1
   113e0:	00f705b3          	add	a1,a4,a5
   113e4:	17168263          	beq	a3,a7,11548 <_free_r+0x274>
   113e8:	00c62603          	lw	a2,12(a2)
   113ec:	00c6a623          	sw	a2,12(a3)
   113f0:	00d62423          	sw	a3,8(a2)
   113f4:	00a72223          	sw	a0,4(a4)
   113f8:	00f5a023          	sw	a5,0(a1)
   113fc:	f71ff06f          	j	1136c <_free_r+0x98>
   11400:	00008067          	ret
   11404:	0015e593          	ori	a1,a1,1
   11408:	feb42e23          	sw	a1,-4(s0)
   1140c:	00f62023          	sw	a5,0(a2)
   11410:	1ff00693          	li	a3,511
   11414:	f6f6f0e3          	bgeu	a3,a5,11374 <_free_r+0xa0>
   11418:	0097d693          	srli	a3,a5,0x9
   1141c:	00400613          	li	a2,4
   11420:	0ed66263          	bltu	a2,a3,11504 <_free_r+0x230>
   11424:	0067d693          	srli	a3,a5,0x6
   11428:	03968593          	addi	a1,a3,57
   1142c:	00359593          	slli	a1,a1,0x3
   11430:	03868613          	addi	a2,a3,56
   11434:	00b805b3          	add	a1,a6,a1
   11438:	0005a683          	lw	a3,0(a1)
   1143c:	ff858593          	addi	a1,a1,-8
   11440:	00d59863          	bne	a1,a3,11450 <_free_r+0x17c>
   11444:	1200006f          	j	11564 <_free_r+0x290>
   11448:	0086a683          	lw	a3,8(a3)
   1144c:	00d58863          	beq	a1,a3,1145c <_free_r+0x188>
   11450:	0046a603          	lw	a2,4(a3)
   11454:	ffc67613          	andi	a2,a2,-4
   11458:	fec7e8e3          	bltu	a5,a2,11448 <_free_r+0x174>
   1145c:	00c6a583          	lw	a1,12(a3)
   11460:	00b72623          	sw	a1,12(a4)
   11464:	00d72423          	sw	a3,8(a4)
   11468:	00812403          	lw	s0,8(sp)
   1146c:	00c12083          	lw	ra,12(sp)
   11470:	00e5a423          	sw	a4,8(a1)
   11474:	00048513          	mv	a0,s1
   11478:	00412483          	lw	s1,4(sp)
   1147c:	00e6a623          	sw	a4,12(a3)
   11480:	01010113          	addi	sp,sp,16
   11484:	27c0006f          	j	11700 <__malloc_unlock>
   11488:	0a051063          	bnez	a0,11528 <_free_r+0x254>
   1148c:	00c62583          	lw	a1,12(a2)
   11490:	00862603          	lw	a2,8(a2)
   11494:	00f686b3          	add	a3,a3,a5
   11498:	0016e793          	ori	a5,a3,1
   1149c:	00b62623          	sw	a1,12(a2)
   114a0:	00c5a423          	sw	a2,8(a1)
   114a4:	00f72223          	sw	a5,4(a4)
   114a8:	00d70733          	add	a4,a4,a3
   114ac:	00d72023          	sw	a3,0(a4)
   114b0:	f01ff06f          	j	113b0 <_free_r+0xdc>
   114b4:	00d786b3          	add	a3,a5,a3
   114b8:	02089063          	bnez	a7,114d8 <_free_r+0x204>
   114bc:	ff842583          	lw	a1,-8(s0)
   114c0:	40b70733          	sub	a4,a4,a1
   114c4:	00c72783          	lw	a5,12(a4)
   114c8:	00872603          	lw	a2,8(a4)
   114cc:	00b686b3          	add	a3,a3,a1
   114d0:	00f62623          	sw	a5,12(a2)
   114d4:	00c7a423          	sw	a2,8(a5) # 1008 <register_fini-0xf0ac>
   114d8:	0016e613          	ori	a2,a3,1
   114dc:	d601a783          	lw	a5,-672(gp) # 137c8 <__malloc_trim_threshold>
   114e0:	00c72223          	sw	a2,4(a4)
   114e4:	00e82423          	sw	a4,8(a6)
   114e8:	ecf6e4e3          	bltu	a3,a5,113b0 <_free_r+0xdc>
   114ec:	d781a583          	lw	a1,-648(gp) # 137e0 <__malloc_top_pad>
   114f0:	00048513          	mv	a0,s1
   114f4:	ca9ff0ef          	jal	1119c <_malloc_trim_r>
   114f8:	eb9ff06f          	j	113b0 <_free_r+0xdc>
   114fc:	00d787b3          	add	a5,a5,a3
   11500:	ed9ff06f          	j	113d8 <_free_r+0x104>
   11504:	01400613          	li	a2,20
   11508:	02d67863          	bgeu	a2,a3,11538 <_free_r+0x264>
   1150c:	05400613          	li	a2,84
   11510:	06d66863          	bltu	a2,a3,11580 <_free_r+0x2ac>
   11514:	00c7d693          	srli	a3,a5,0xc
   11518:	06f68593          	addi	a1,a3,111
   1151c:	00359593          	slli	a1,a1,0x3
   11520:	06e68613          	addi	a2,a3,110
   11524:	f11ff06f          	j	11434 <_free_r+0x160>
   11528:	0017e693          	ori	a3,a5,1
   1152c:	00d72223          	sw	a3,4(a4)
   11530:	00f62023          	sw	a5,0(a2)
   11534:	e7dff06f          	j	113b0 <_free_r+0xdc>
   11538:	05c68593          	addi	a1,a3,92
   1153c:	00359593          	slli	a1,a1,0x3
   11540:	05b68613          	addi	a2,a3,91
   11544:	ef1ff06f          	j	11434 <_free_r+0x160>
   11548:	00e82a23          	sw	a4,20(a6)
   1154c:	00e82823          	sw	a4,16(a6)
   11550:	01172623          	sw	a7,12(a4)
   11554:	01172423          	sw	a7,8(a4)
   11558:	00a72223          	sw	a0,4(a4)
   1155c:	00f5a023          	sw	a5,0(a1)
   11560:	e51ff06f          	j	113b0 <_free_r+0xdc>
   11564:	00482503          	lw	a0,4(a6)
   11568:	40265613          	srai	a2,a2,0x2
   1156c:	00100793          	li	a5,1
   11570:	00c797b3          	sll	a5,a5,a2
   11574:	00a7e7b3          	or	a5,a5,a0
   11578:	00f82223          	sw	a5,4(a6)
   1157c:	ee5ff06f          	j	11460 <_free_r+0x18c>
   11580:	15400613          	li	a2,340
   11584:	00d66c63          	bltu	a2,a3,1159c <_free_r+0x2c8>
   11588:	00f7d693          	srli	a3,a5,0xf
   1158c:	07868593          	addi	a1,a3,120
   11590:	00359593          	slli	a1,a1,0x3
   11594:	07768613          	addi	a2,a3,119
   11598:	e9dff06f          	j	11434 <_free_r+0x160>
   1159c:	55400613          	li	a2,1364
   115a0:	00d66c63          	bltu	a2,a3,115b8 <_free_r+0x2e4>
   115a4:	0127d693          	srli	a3,a5,0x12
   115a8:	07d68593          	addi	a1,a3,125
   115ac:	00359593          	slli	a1,a1,0x3
   115b0:	07c68613          	addi	a2,a3,124
   115b4:	e81ff06f          	j	11434 <_free_r+0x160>
   115b8:	3f800593          	li	a1,1016
   115bc:	07e00613          	li	a2,126
   115c0:	e75ff06f          	j	11434 <_free_r+0x160>

000115c4 <__call_exitprocs>:
   115c4:	fd010113          	addi	sp,sp,-48
   115c8:	01412c23          	sw	s4,24(sp)
   115cc:	d7c18a13          	addi	s4,gp,-644 # 137e4 <__atexit>
   115d0:	03212023          	sw	s2,32(sp)
   115d4:	000a2903          	lw	s2,0(s4)
   115d8:	02112623          	sw	ra,44(sp)
   115dc:	06090c63          	beqz	s2,11654 <__call_exitprocs+0x90>
   115e0:	01312e23          	sw	s3,28(sp)
   115e4:	01512a23          	sw	s5,20(sp)
   115e8:	01612823          	sw	s6,16(sp)
   115ec:	01712623          	sw	s7,12(sp)
   115f0:	02812423          	sw	s0,40(sp)
   115f4:	02912223          	sw	s1,36(sp)
   115f8:	01812423          	sw	s8,8(sp)
   115fc:	00050b13          	mv	s6,a0
   11600:	00058b93          	mv	s7,a1
   11604:	fff00993          	li	s3,-1
   11608:	00100a93          	li	s5,1
   1160c:	00492483          	lw	s1,4(s2)
   11610:	fff48413          	addi	s0,s1,-1
   11614:	02044263          	bltz	s0,11638 <__call_exitprocs+0x74>
   11618:	00249493          	slli	s1,s1,0x2
   1161c:	009904b3          	add	s1,s2,s1
   11620:	040b8463          	beqz	s7,11668 <__call_exitprocs+0xa4>
   11624:	1044a783          	lw	a5,260(s1)
   11628:	05778063          	beq	a5,s7,11668 <__call_exitprocs+0xa4>
   1162c:	fff40413          	addi	s0,s0,-1
   11630:	ffc48493          	addi	s1,s1,-4
   11634:	ff3418e3          	bne	s0,s3,11624 <__call_exitprocs+0x60>
   11638:	02812403          	lw	s0,40(sp)
   1163c:	02412483          	lw	s1,36(sp)
   11640:	01c12983          	lw	s3,28(sp)
   11644:	01412a83          	lw	s5,20(sp)
   11648:	01012b03          	lw	s6,16(sp)
   1164c:	00c12b83          	lw	s7,12(sp)
   11650:	00812c03          	lw	s8,8(sp)
   11654:	02c12083          	lw	ra,44(sp)
   11658:	02012903          	lw	s2,32(sp)
   1165c:	01812a03          	lw	s4,24(sp)
   11660:	03010113          	addi	sp,sp,48
   11664:	00008067          	ret
   11668:	00492783          	lw	a5,4(s2)
   1166c:	0044a683          	lw	a3,4(s1)
   11670:	fff78793          	addi	a5,a5,-1
   11674:	06878a63          	beq	a5,s0,116e8 <__call_exitprocs+0x124>
   11678:	0004a223          	sw	zero,4(s1)
   1167c:	02068663          	beqz	a3,116a8 <__call_exitprocs+0xe4>
   11680:	18892783          	lw	a5,392(s2)
   11684:	008a9733          	sll	a4,s5,s0
   11688:	00492c03          	lw	s8,4(s2)
   1168c:	00f777b3          	and	a5,a4,a5
   11690:	02079463          	bnez	a5,116b8 <__call_exitprocs+0xf4>
   11694:	000680e7          	jalr	a3
   11698:	00492703          	lw	a4,4(s2)
   1169c:	000a2783          	lw	a5,0(s4)
   116a0:	03871e63          	bne	a4,s8,116dc <__call_exitprocs+0x118>
   116a4:	03279c63          	bne	a5,s2,116dc <__call_exitprocs+0x118>
   116a8:	fff40413          	addi	s0,s0,-1
   116ac:	ffc48493          	addi	s1,s1,-4
   116b0:	f73418e3          	bne	s0,s3,11620 <__call_exitprocs+0x5c>
   116b4:	f85ff06f          	j	11638 <__call_exitprocs+0x74>
   116b8:	18c92783          	lw	a5,396(s2)
   116bc:	0844a583          	lw	a1,132(s1)
   116c0:	00f77733          	and	a4,a4,a5
   116c4:	02071663          	bnez	a4,116f0 <__call_exitprocs+0x12c>
   116c8:	000b0513          	mv	a0,s6
   116cc:	000680e7          	jalr	a3
   116d0:	00492703          	lw	a4,4(s2)
   116d4:	000a2783          	lw	a5,0(s4)
   116d8:	fd8706e3          	beq	a4,s8,116a4 <__call_exitprocs+0xe0>
   116dc:	f4078ee3          	beqz	a5,11638 <__call_exitprocs+0x74>
   116e0:	00078913          	mv	s2,a5
   116e4:	f29ff06f          	j	1160c <__call_exitprocs+0x48>
   116e8:	00892223          	sw	s0,4(s2)
   116ec:	f91ff06f          	j	1167c <__call_exitprocs+0xb8>
   116f0:	00058513          	mv	a0,a1
   116f4:	000680e7          	jalr	a3
   116f8:	fa1ff06f          	j	11698 <__call_exitprocs+0xd4>

000116fc <__malloc_lock>:
   116fc:	00008067          	ret

00011700 <__malloc_unlock>:
   11700:	00008067          	ret

00011704 <_sbrk_r>:
   11704:	ff010113          	addi	sp,sp,-16
   11708:	00812423          	sw	s0,8(sp)
   1170c:	00050413          	mv	s0,a0
   11710:	00058513          	mv	a0,a1
   11714:	d801a023          	sw	zero,-640(gp) # 137e8 <errno>
   11718:	00112623          	sw	ra,12(sp)
   1171c:	269000ef          	jal	12184 <_sbrk>
   11720:	fff00793          	li	a5,-1
   11724:	00f50a63          	beq	a0,a5,11738 <_sbrk_r+0x34>
   11728:	00c12083          	lw	ra,12(sp)
   1172c:	00812403          	lw	s0,8(sp)
   11730:	01010113          	addi	sp,sp,16
   11734:	00008067          	ret
   11738:	00912223          	sw	s1,4(sp)
   1173c:	d8018493          	addi	s1,gp,-640 # 137e8 <errno>
   11740:	0004a783          	lw	a5,0(s1)
   11744:	00078e63          	beqz	a5,11760 <_sbrk_r+0x5c>
   11748:	00c12083          	lw	ra,12(sp)
   1174c:	00f42023          	sw	a5,0(s0)
   11750:	00812403          	lw	s0,8(sp)
   11754:	00412483          	lw	s1,4(sp)
   11758:	01010113          	addi	sp,sp,16
   1175c:	00008067          	ret
   11760:	00c12083          	lw	ra,12(sp)
   11764:	00812403          	lw	s0,8(sp)
   11768:	00412483          	lw	s1,4(sp)
   1176c:	01010113          	addi	sp,sp,16
   11770:	00008067          	ret

00011774 <atexit>:
   11774:	00050593          	mv	a1,a0
   11778:	00000693          	li	a3,0
   1177c:	00000613          	li	a2,0
   11780:	00000513          	li	a0,0
   11784:	7f00006f          	j	11f74 <__register_exitproc>

00011788 <__sread>:
   11788:	ff010113          	addi	sp,sp,-16
   1178c:	00812423          	sw	s0,8(sp)
   11790:	00058413          	mv	s0,a1
   11794:	00e59583          	lh	a1,14(a1)
   11798:	00112623          	sw	ra,12(sp)
   1179c:	071000ef          	jal	1200c <_read_r>
   117a0:	02054063          	bltz	a0,117c0 <__sread+0x38>
   117a4:	05042783          	lw	a5,80(s0)
   117a8:	00c12083          	lw	ra,12(sp)
   117ac:	00a787b3          	add	a5,a5,a0
   117b0:	04f42823          	sw	a5,80(s0)
   117b4:	00812403          	lw	s0,8(sp)
   117b8:	01010113          	addi	sp,sp,16
   117bc:	00008067          	ret
   117c0:	00c45783          	lhu	a5,12(s0)
   117c4:	fffff737          	lui	a4,0xfffff
   117c8:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb503>
   117cc:	00e7f7b3          	and	a5,a5,a4
   117d0:	00c12083          	lw	ra,12(sp)
   117d4:	00f41623          	sh	a5,12(s0)
   117d8:	00812403          	lw	s0,8(sp)
   117dc:	01010113          	addi	sp,sp,16
   117e0:	00008067          	ret

000117e4 <__seofread>:
   117e4:	00000513          	li	a0,0
   117e8:	00008067          	ret

000117ec <__swrite>:
   117ec:	00c59783          	lh	a5,12(a1)
   117f0:	fe010113          	addi	sp,sp,-32
   117f4:	00812c23          	sw	s0,24(sp)
   117f8:	00912a23          	sw	s1,20(sp)
   117fc:	01212823          	sw	s2,16(sp)
   11800:	01312623          	sw	s3,12(sp)
   11804:	00112e23          	sw	ra,28(sp)
   11808:	1007f713          	andi	a4,a5,256
   1180c:	00058413          	mv	s0,a1
   11810:	00060913          	mv	s2,a2
   11814:	00068993          	mv	s3,a3
   11818:	00050493          	mv	s1,a0
   1181c:	04071063          	bnez	a4,1185c <__swrite+0x70>
   11820:	fffff737          	lui	a4,0xfffff
   11824:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb503>
   11828:	00e7f7b3          	and	a5,a5,a4
   1182c:	00e41583          	lh	a1,14(s0)
   11830:	00f41623          	sh	a5,12(s0)
   11834:	01812403          	lw	s0,24(sp)
   11838:	01c12083          	lw	ra,28(sp)
   1183c:	00098693          	mv	a3,s3
   11840:	00090613          	mv	a2,s2
   11844:	00c12983          	lw	s3,12(sp)
   11848:	01012903          	lw	s2,16(sp)
   1184c:	00048513          	mv	a0,s1
   11850:	01412483          	lw	s1,20(sp)
   11854:	02010113          	addi	sp,sp,32
   11858:	5b40006f          	j	11e0c <_write_r>
   1185c:	00e59583          	lh	a1,14(a1)
   11860:	00200693          	li	a3,2
   11864:	00000613          	li	a2,0
   11868:	690000ef          	jal	11ef8 <_lseek_r>
   1186c:	00c41783          	lh	a5,12(s0)
   11870:	fb1ff06f          	j	11820 <__swrite+0x34>

00011874 <__sseek>:
   11874:	ff010113          	addi	sp,sp,-16
   11878:	00812423          	sw	s0,8(sp)
   1187c:	00058413          	mv	s0,a1
   11880:	00e59583          	lh	a1,14(a1)
   11884:	00112623          	sw	ra,12(sp)
   11888:	670000ef          	jal	11ef8 <_lseek_r>
   1188c:	fff00713          	li	a4,-1
   11890:	00c41783          	lh	a5,12(s0)
   11894:	02e50263          	beq	a0,a4,118b8 <__sseek+0x44>
   11898:	00001737          	lui	a4,0x1
   1189c:	00e7e7b3          	or	a5,a5,a4
   118a0:	00c12083          	lw	ra,12(sp)
   118a4:	04a42823          	sw	a0,80(s0)
   118a8:	00f41623          	sh	a5,12(s0)
   118ac:	00812403          	lw	s0,8(sp)
   118b0:	01010113          	addi	sp,sp,16
   118b4:	00008067          	ret
   118b8:	fffff737          	lui	a4,0xfffff
   118bc:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb503>
   118c0:	00e7f7b3          	and	a5,a5,a4
   118c4:	00c12083          	lw	ra,12(sp)
   118c8:	00f41623          	sh	a5,12(s0)
   118cc:	00812403          	lw	s0,8(sp)
   118d0:	01010113          	addi	sp,sp,16
   118d4:	00008067          	ret

000118d8 <__sclose>:
   118d8:	00e59583          	lh	a1,14(a1)
   118dc:	5ac0006f          	j	11e88 <_close_r>

000118e0 <__sflush_r>:
   118e0:	00c59703          	lh	a4,12(a1)
   118e4:	fe010113          	addi	sp,sp,-32
   118e8:	00812c23          	sw	s0,24(sp)
   118ec:	01312623          	sw	s3,12(sp)
   118f0:	00112e23          	sw	ra,28(sp)
   118f4:	00877793          	andi	a5,a4,8
   118f8:	00058413          	mv	s0,a1
   118fc:	00050993          	mv	s3,a0
   11900:	12079063          	bnez	a5,11a20 <__sflush_r+0x140>
   11904:	000017b7          	lui	a5,0x1
   11908:	80078793          	addi	a5,a5,-2048 # 800 <register_fini-0xf8b4>
   1190c:	0045a683          	lw	a3,4(a1)
   11910:	00f767b3          	or	a5,a4,a5
   11914:	00f59623          	sh	a5,12(a1)
   11918:	18d05a63          	blez	a3,11aac <__sflush_r+0x1cc>
   1191c:	02842803          	lw	a6,40(s0)
   11920:	0e080463          	beqz	a6,11a08 <__sflush_r+0x128>
   11924:	00912a23          	sw	s1,20(sp)
   11928:	01371693          	slli	a3,a4,0x13
   1192c:	0009a483          	lw	s1,0(s3)
   11930:	0009a023          	sw	zero,0(s3)
   11934:	1806c863          	bltz	a3,11ac4 <__sflush_r+0x1e4>
   11938:	01c42583          	lw	a1,28(s0)
   1193c:	00000613          	li	a2,0
   11940:	00100693          	li	a3,1
   11944:	00098513          	mv	a0,s3
   11948:	000800e7          	jalr	a6
   1194c:	fff00793          	li	a5,-1
   11950:	00050613          	mv	a2,a0
   11954:	1af50a63          	beq	a0,a5,11b08 <__sflush_r+0x228>
   11958:	00c41783          	lh	a5,12(s0)
   1195c:	02842803          	lw	a6,40(s0)
   11960:	0047f793          	andi	a5,a5,4
   11964:	00078e63          	beqz	a5,11980 <__sflush_r+0xa0>
   11968:	00442703          	lw	a4,4(s0)
   1196c:	03042783          	lw	a5,48(s0)
   11970:	40e60633          	sub	a2,a2,a4
   11974:	00078663          	beqz	a5,11980 <__sflush_r+0xa0>
   11978:	03c42783          	lw	a5,60(s0)
   1197c:	40f60633          	sub	a2,a2,a5
   11980:	01c42583          	lw	a1,28(s0)
   11984:	00000693          	li	a3,0
   11988:	00098513          	mv	a0,s3
   1198c:	000800e7          	jalr	a6
   11990:	fff00713          	li	a4,-1
   11994:	00c41783          	lh	a5,12(s0)
   11998:	12e51a63          	bne	a0,a4,11acc <__sflush_r+0x1ec>
   1199c:	0009a683          	lw	a3,0(s3)
   119a0:	01d00713          	li	a4,29
   119a4:	18d76063          	bltu	a4,a3,11b24 <__sflush_r+0x244>
   119a8:	20400737          	lui	a4,0x20400
   119ac:	00170713          	addi	a4,a4,1 # 20400001 <__BSS_END__+0x203ec505>
   119b0:	00d75733          	srl	a4,a4,a3
   119b4:	00177713          	andi	a4,a4,1
   119b8:	16070663          	beqz	a4,11b24 <__sflush_r+0x244>
   119bc:	01042603          	lw	a2,16(s0)
   119c0:	fffff737          	lui	a4,0xfffff
   119c4:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffebd03>
   119c8:	00e7f733          	and	a4,a5,a4
   119cc:	00e41623          	sh	a4,12(s0)
   119d0:	00042223          	sw	zero,4(s0)
   119d4:	00c42023          	sw	a2,0(s0)
   119d8:	01379713          	slli	a4,a5,0x13
   119dc:	00075463          	bgez	a4,119e4 <__sflush_r+0x104>
   119e0:	10068863          	beqz	a3,11af0 <__sflush_r+0x210>
   119e4:	03042583          	lw	a1,48(s0)
   119e8:	0099a023          	sw	s1,0(s3)
   119ec:	10058a63          	beqz	a1,11b00 <__sflush_r+0x220>
   119f0:	04040793          	addi	a5,s0,64
   119f4:	00f58663          	beq	a1,a5,11a00 <__sflush_r+0x120>
   119f8:	00098513          	mv	a0,s3
   119fc:	8d9ff0ef          	jal	112d4 <_free_r>
   11a00:	01412483          	lw	s1,20(sp)
   11a04:	02042823          	sw	zero,48(s0)
   11a08:	01c12083          	lw	ra,28(sp)
   11a0c:	01812403          	lw	s0,24(sp)
   11a10:	00c12983          	lw	s3,12(sp)
   11a14:	00000513          	li	a0,0
   11a18:	02010113          	addi	sp,sp,32
   11a1c:	00008067          	ret
   11a20:	01212823          	sw	s2,16(sp)
   11a24:	0105a903          	lw	s2,16(a1)
   11a28:	08090a63          	beqz	s2,11abc <__sflush_r+0x1dc>
   11a2c:	00912a23          	sw	s1,20(sp)
   11a30:	0005a483          	lw	s1,0(a1)
   11a34:	00377713          	andi	a4,a4,3
   11a38:	0125a023          	sw	s2,0(a1)
   11a3c:	412484b3          	sub	s1,s1,s2
   11a40:	00000793          	li	a5,0
   11a44:	00071463          	bnez	a4,11a4c <__sflush_r+0x16c>
   11a48:	0145a783          	lw	a5,20(a1)
   11a4c:	00f42423          	sw	a5,8(s0)
   11a50:	00904863          	bgtz	s1,11a60 <__sflush_r+0x180>
   11a54:	0640006f          	j	11ab8 <__sflush_r+0x1d8>
   11a58:	00a90933          	add	s2,s2,a0
   11a5c:	04905e63          	blez	s1,11ab8 <__sflush_r+0x1d8>
   11a60:	02442783          	lw	a5,36(s0)
   11a64:	01c42583          	lw	a1,28(s0)
   11a68:	00048693          	mv	a3,s1
   11a6c:	00090613          	mv	a2,s2
   11a70:	00098513          	mv	a0,s3
   11a74:	000780e7          	jalr	a5
   11a78:	40a484b3          	sub	s1,s1,a0
   11a7c:	fca04ee3          	bgtz	a0,11a58 <__sflush_r+0x178>
   11a80:	00c41783          	lh	a5,12(s0)
   11a84:	01012903          	lw	s2,16(sp)
   11a88:	0407e793          	ori	a5,a5,64
   11a8c:	01c12083          	lw	ra,28(sp)
   11a90:	00f41623          	sh	a5,12(s0)
   11a94:	01812403          	lw	s0,24(sp)
   11a98:	01412483          	lw	s1,20(sp)
   11a9c:	00c12983          	lw	s3,12(sp)
   11aa0:	fff00513          	li	a0,-1
   11aa4:	02010113          	addi	sp,sp,32
   11aa8:	00008067          	ret
   11aac:	03c5a683          	lw	a3,60(a1)
   11ab0:	e6d046e3          	bgtz	a3,1191c <__sflush_r+0x3c>
   11ab4:	f55ff06f          	j	11a08 <__sflush_r+0x128>
   11ab8:	01412483          	lw	s1,20(sp)
   11abc:	01012903          	lw	s2,16(sp)
   11ac0:	f49ff06f          	j	11a08 <__sflush_r+0x128>
   11ac4:	05042603          	lw	a2,80(s0)
   11ac8:	e99ff06f          	j	11960 <__sflush_r+0x80>
   11acc:	01042683          	lw	a3,16(s0)
   11ad0:	fffff737          	lui	a4,0xfffff
   11ad4:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffebd03>
   11ad8:	00e7f733          	and	a4,a5,a4
   11adc:	00e41623          	sh	a4,12(s0)
   11ae0:	00042223          	sw	zero,4(s0)
   11ae4:	00d42023          	sw	a3,0(s0)
   11ae8:	01379713          	slli	a4,a5,0x13
   11aec:	ee075ce3          	bgez	a4,119e4 <__sflush_r+0x104>
   11af0:	03042583          	lw	a1,48(s0)
   11af4:	04a42823          	sw	a0,80(s0)
   11af8:	0099a023          	sw	s1,0(s3)
   11afc:	ee059ae3          	bnez	a1,119f0 <__sflush_r+0x110>
   11b00:	01412483          	lw	s1,20(sp)
   11b04:	f05ff06f          	j	11a08 <__sflush_r+0x128>
   11b08:	0009a783          	lw	a5,0(s3)
   11b0c:	e40786e3          	beqz	a5,11958 <__sflush_r+0x78>
   11b10:	01d00713          	li	a4,29
   11b14:	00e78c63          	beq	a5,a4,11b2c <__sflush_r+0x24c>
   11b18:	01600713          	li	a4,22
   11b1c:	00e78863          	beq	a5,a4,11b2c <__sflush_r+0x24c>
   11b20:	00c41783          	lh	a5,12(s0)
   11b24:	0407e793          	ori	a5,a5,64
   11b28:	f65ff06f          	j	11a8c <__sflush_r+0x1ac>
   11b2c:	0099a023          	sw	s1,0(s3)
   11b30:	01412483          	lw	s1,20(sp)
   11b34:	ed5ff06f          	j	11a08 <__sflush_r+0x128>

00011b38 <_fflush_r>:
   11b38:	fe010113          	addi	sp,sp,-32
   11b3c:	00812c23          	sw	s0,24(sp)
   11b40:	00112e23          	sw	ra,28(sp)
   11b44:	00050413          	mv	s0,a0
   11b48:	00050663          	beqz	a0,11b54 <_fflush_r+0x1c>
   11b4c:	03452783          	lw	a5,52(a0)
   11b50:	02078a63          	beqz	a5,11b84 <_fflush_r+0x4c>
   11b54:	00c59783          	lh	a5,12(a1)
   11b58:	00079c63          	bnez	a5,11b70 <_fflush_r+0x38>
   11b5c:	01c12083          	lw	ra,28(sp)
   11b60:	01812403          	lw	s0,24(sp)
   11b64:	00000513          	li	a0,0
   11b68:	02010113          	addi	sp,sp,32
   11b6c:	00008067          	ret
   11b70:	00040513          	mv	a0,s0
   11b74:	01812403          	lw	s0,24(sp)
   11b78:	01c12083          	lw	ra,28(sp)
   11b7c:	02010113          	addi	sp,sp,32
   11b80:	d61ff06f          	j	118e0 <__sflush_r>
   11b84:	00b12623          	sw	a1,12(sp)
   11b88:	c9dfe0ef          	jal	10824 <__sinit>
   11b8c:	00c12583          	lw	a1,12(sp)
   11b90:	fc5ff06f          	j	11b54 <_fflush_r+0x1c>

00011b94 <fflush>:
   11b94:	06050063          	beqz	a0,11bf4 <fflush+0x60>
   11b98:	00050593          	mv	a1,a0
   11b9c:	d641a503          	lw	a0,-668(gp) # 137cc <_impure_ptr>
   11ba0:	00050663          	beqz	a0,11bac <fflush+0x18>
   11ba4:	03452783          	lw	a5,52(a0)
   11ba8:	00078c63          	beqz	a5,11bc0 <fflush+0x2c>
   11bac:	00c59783          	lh	a5,12(a1)
   11bb0:	00079663          	bnez	a5,11bbc <fflush+0x28>
   11bb4:	00000513          	li	a0,0
   11bb8:	00008067          	ret
   11bbc:	d25ff06f          	j	118e0 <__sflush_r>
   11bc0:	fe010113          	addi	sp,sp,-32
   11bc4:	00b12623          	sw	a1,12(sp)
   11bc8:	00a12423          	sw	a0,8(sp)
   11bcc:	00112e23          	sw	ra,28(sp)
   11bd0:	c55fe0ef          	jal	10824 <__sinit>
   11bd4:	00c12583          	lw	a1,12(sp)
   11bd8:	00812503          	lw	a0,8(sp)
   11bdc:	00c59783          	lh	a5,12(a1)
   11be0:	02079663          	bnez	a5,11c0c <fflush+0x78>
   11be4:	01c12083          	lw	ra,28(sp)
   11be8:	00000513          	li	a0,0
   11bec:	02010113          	addi	sp,sp,32
   11bf0:	00008067          	ret
   11bf4:	00001617          	auipc	a2,0x1
   11bf8:	67460613          	addi	a2,a2,1652 # 13268 <__sglue>
   11bfc:	00000597          	auipc	a1,0x0
   11c00:	f3c58593          	addi	a1,a1,-196 # 11b38 <_fflush_r>
   11c04:	c1818513          	addi	a0,gp,-1000 # 13680 <_impure_data>
   11c08:	0100006f          	j	11c18 <_fwalk_sglue>
   11c0c:	01c12083          	lw	ra,28(sp)
   11c10:	02010113          	addi	sp,sp,32
   11c14:	ccdff06f          	j	118e0 <__sflush_r>

00011c18 <_fwalk_sglue>:
   11c18:	fd010113          	addi	sp,sp,-48
   11c1c:	03212023          	sw	s2,32(sp)
   11c20:	01312e23          	sw	s3,28(sp)
   11c24:	01412c23          	sw	s4,24(sp)
   11c28:	01512a23          	sw	s5,20(sp)
   11c2c:	01612823          	sw	s6,16(sp)
   11c30:	01712623          	sw	s7,12(sp)
   11c34:	02112623          	sw	ra,44(sp)
   11c38:	02812423          	sw	s0,40(sp)
   11c3c:	02912223          	sw	s1,36(sp)
   11c40:	00050b13          	mv	s6,a0
   11c44:	00058b93          	mv	s7,a1
   11c48:	00060a93          	mv	s5,a2
   11c4c:	00000a13          	li	s4,0
   11c50:	00100993          	li	s3,1
   11c54:	fff00913          	li	s2,-1
   11c58:	004aa483          	lw	s1,4(s5)
   11c5c:	008aa403          	lw	s0,8(s5)
   11c60:	fff48493          	addi	s1,s1,-1
   11c64:	0204c863          	bltz	s1,11c94 <_fwalk_sglue+0x7c>
   11c68:	00c45783          	lhu	a5,12(s0)
   11c6c:	00f9fe63          	bgeu	s3,a5,11c88 <_fwalk_sglue+0x70>
   11c70:	00e41783          	lh	a5,14(s0)
   11c74:	00040593          	mv	a1,s0
   11c78:	000b0513          	mv	a0,s6
   11c7c:	01278663          	beq	a5,s2,11c88 <_fwalk_sglue+0x70>
   11c80:	000b80e7          	jalr	s7
   11c84:	00aa6a33          	or	s4,s4,a0
   11c88:	fff48493          	addi	s1,s1,-1
   11c8c:	06840413          	addi	s0,s0,104
   11c90:	fd249ce3          	bne	s1,s2,11c68 <_fwalk_sglue+0x50>
   11c94:	000aaa83          	lw	s5,0(s5)
   11c98:	fc0a90e3          	bnez	s5,11c58 <_fwalk_sglue+0x40>
   11c9c:	02c12083          	lw	ra,44(sp)
   11ca0:	02812403          	lw	s0,40(sp)
   11ca4:	02412483          	lw	s1,36(sp)
   11ca8:	02012903          	lw	s2,32(sp)
   11cac:	01c12983          	lw	s3,28(sp)
   11cb0:	01412a83          	lw	s5,20(sp)
   11cb4:	01012b03          	lw	s6,16(sp)
   11cb8:	00c12b83          	lw	s7,12(sp)
   11cbc:	000a0513          	mv	a0,s4
   11cc0:	01812a03          	lw	s4,24(sp)
   11cc4:	03010113          	addi	sp,sp,48
   11cc8:	00008067          	ret

00011ccc <__libc_fini_array>:
   11ccc:	ff010113          	addi	sp,sp,-16
   11cd0:	00812423          	sw	s0,8(sp)
   11cd4:	00001797          	auipc	a5,0x1
   11cd8:	59078793          	addi	a5,a5,1424 # 13264 <__do_global_dtors_aux_fini_array_entry>
   11cdc:	00001417          	auipc	s0,0x1
   11ce0:	58c40413          	addi	s0,s0,1420 # 13268 <__sglue>
   11ce4:	40f40433          	sub	s0,s0,a5
   11ce8:	00912223          	sw	s1,4(sp)
   11cec:	00112623          	sw	ra,12(sp)
   11cf0:	40245493          	srai	s1,s0,0x2
   11cf4:	02048063          	beqz	s1,11d14 <__libc_fini_array+0x48>
   11cf8:	ffc40413          	addi	s0,s0,-4
   11cfc:	00f40433          	add	s0,s0,a5
   11d00:	00042783          	lw	a5,0(s0)
   11d04:	fff48493          	addi	s1,s1,-1
   11d08:	ffc40413          	addi	s0,s0,-4
   11d0c:	000780e7          	jalr	a5
   11d10:	fe0498e3          	bnez	s1,11d00 <__libc_fini_array+0x34>
   11d14:	00c12083          	lw	ra,12(sp)
   11d18:	00812403          	lw	s0,8(sp)
   11d1c:	00412483          	lw	s1,4(sp)
   11d20:	01010113          	addi	sp,sp,16
   11d24:	00008067          	ret

00011d28 <_reclaim_reent>:
   11d28:	d641a783          	lw	a5,-668(gp) # 137cc <_impure_ptr>
   11d2c:	0ca78e63          	beq	a5,a0,11e08 <_reclaim_reent+0xe0>
   11d30:	04452583          	lw	a1,68(a0)
   11d34:	fe010113          	addi	sp,sp,-32
   11d38:	00912a23          	sw	s1,20(sp)
   11d3c:	00112e23          	sw	ra,28(sp)
   11d40:	00812c23          	sw	s0,24(sp)
   11d44:	00050493          	mv	s1,a0
   11d48:	04058863          	beqz	a1,11d98 <_reclaim_reent+0x70>
   11d4c:	01212823          	sw	s2,16(sp)
   11d50:	01312623          	sw	s3,12(sp)
   11d54:	00000913          	li	s2,0
   11d58:	08000993          	li	s3,128
   11d5c:	012587b3          	add	a5,a1,s2
   11d60:	0007a403          	lw	s0,0(a5)
   11d64:	00040e63          	beqz	s0,11d80 <_reclaim_reent+0x58>
   11d68:	00040593          	mv	a1,s0
   11d6c:	00042403          	lw	s0,0(s0)
   11d70:	00048513          	mv	a0,s1
   11d74:	d60ff0ef          	jal	112d4 <_free_r>
   11d78:	fe0418e3          	bnez	s0,11d68 <_reclaim_reent+0x40>
   11d7c:	0444a583          	lw	a1,68(s1)
   11d80:	00490913          	addi	s2,s2,4
   11d84:	fd391ce3          	bne	s2,s3,11d5c <_reclaim_reent+0x34>
   11d88:	00048513          	mv	a0,s1
   11d8c:	d48ff0ef          	jal	112d4 <_free_r>
   11d90:	01012903          	lw	s2,16(sp)
   11d94:	00c12983          	lw	s3,12(sp)
   11d98:	0384a583          	lw	a1,56(s1)
   11d9c:	00058663          	beqz	a1,11da8 <_reclaim_reent+0x80>
   11da0:	00048513          	mv	a0,s1
   11da4:	d30ff0ef          	jal	112d4 <_free_r>
   11da8:	0404a403          	lw	s0,64(s1)
   11dac:	00040c63          	beqz	s0,11dc4 <_reclaim_reent+0x9c>
   11db0:	00040593          	mv	a1,s0
   11db4:	00042403          	lw	s0,0(s0)
   11db8:	00048513          	mv	a0,s1
   11dbc:	d18ff0ef          	jal	112d4 <_free_r>
   11dc0:	fe0418e3          	bnez	s0,11db0 <_reclaim_reent+0x88>
   11dc4:	04c4a583          	lw	a1,76(s1)
   11dc8:	00058663          	beqz	a1,11dd4 <_reclaim_reent+0xac>
   11dcc:	00048513          	mv	a0,s1
   11dd0:	d04ff0ef          	jal	112d4 <_free_r>
   11dd4:	0344a783          	lw	a5,52(s1)
   11dd8:	00078e63          	beqz	a5,11df4 <_reclaim_reent+0xcc>
   11ddc:	01812403          	lw	s0,24(sp)
   11de0:	01c12083          	lw	ra,28(sp)
   11de4:	00048513          	mv	a0,s1
   11de8:	01412483          	lw	s1,20(sp)
   11dec:	02010113          	addi	sp,sp,32
   11df0:	00078067          	jr	a5
   11df4:	01c12083          	lw	ra,28(sp)
   11df8:	01812403          	lw	s0,24(sp)
   11dfc:	01412483          	lw	s1,20(sp)
   11e00:	02010113          	addi	sp,sp,32
   11e04:	00008067          	ret
   11e08:	00008067          	ret

00011e0c <_write_r>:
   11e0c:	ff010113          	addi	sp,sp,-16
   11e10:	00058713          	mv	a4,a1
   11e14:	00812423          	sw	s0,8(sp)
   11e18:	00060593          	mv	a1,a2
   11e1c:	00050413          	mv	s0,a0
   11e20:	00068613          	mv	a2,a3
   11e24:	00070513          	mv	a0,a4
   11e28:	d801a023          	sw	zero,-640(gp) # 137e8 <errno>
   11e2c:	00112623          	sw	ra,12(sp)
   11e30:	3d0000ef          	jal	12200 <_write>
   11e34:	fff00793          	li	a5,-1
   11e38:	00f50a63          	beq	a0,a5,11e4c <_write_r+0x40>
   11e3c:	00c12083          	lw	ra,12(sp)
   11e40:	00812403          	lw	s0,8(sp)
   11e44:	01010113          	addi	sp,sp,16
   11e48:	00008067          	ret
   11e4c:	00912223          	sw	s1,4(sp)
   11e50:	d8018493          	addi	s1,gp,-640 # 137e8 <errno>
   11e54:	0004a783          	lw	a5,0(s1)
   11e58:	00078e63          	beqz	a5,11e74 <_write_r+0x68>
   11e5c:	00c12083          	lw	ra,12(sp)
   11e60:	00f42023          	sw	a5,0(s0)
   11e64:	00812403          	lw	s0,8(sp)
   11e68:	00412483          	lw	s1,4(sp)
   11e6c:	01010113          	addi	sp,sp,16
   11e70:	00008067          	ret
   11e74:	00c12083          	lw	ra,12(sp)
   11e78:	00812403          	lw	s0,8(sp)
   11e7c:	00412483          	lw	s1,4(sp)
   11e80:	01010113          	addi	sp,sp,16
   11e84:	00008067          	ret

00011e88 <_close_r>:
   11e88:	ff010113          	addi	sp,sp,-16
   11e8c:	00812423          	sw	s0,8(sp)
   11e90:	00050413          	mv	s0,a0
   11e94:	00058513          	mv	a0,a1
   11e98:	d801a023          	sw	zero,-640(gp) # 137e8 <errno>
   11e9c:	00112623          	sw	ra,12(sp)
   11ea0:	1e8000ef          	jal	12088 <_close>
   11ea4:	fff00793          	li	a5,-1
   11ea8:	00f50a63          	beq	a0,a5,11ebc <_close_r+0x34>
   11eac:	00c12083          	lw	ra,12(sp)
   11eb0:	00812403          	lw	s0,8(sp)
   11eb4:	01010113          	addi	sp,sp,16
   11eb8:	00008067          	ret
   11ebc:	00912223          	sw	s1,4(sp)
   11ec0:	d8018493          	addi	s1,gp,-640 # 137e8 <errno>
   11ec4:	0004a783          	lw	a5,0(s1)
   11ec8:	00078e63          	beqz	a5,11ee4 <_close_r+0x5c>
   11ecc:	00c12083          	lw	ra,12(sp)
   11ed0:	00f42023          	sw	a5,0(s0)
   11ed4:	00812403          	lw	s0,8(sp)
   11ed8:	00412483          	lw	s1,4(sp)
   11edc:	01010113          	addi	sp,sp,16
   11ee0:	00008067          	ret
   11ee4:	00c12083          	lw	ra,12(sp)
   11ee8:	00812403          	lw	s0,8(sp)
   11eec:	00412483          	lw	s1,4(sp)
   11ef0:	01010113          	addi	sp,sp,16
   11ef4:	00008067          	ret

00011ef8 <_lseek_r>:
   11ef8:	ff010113          	addi	sp,sp,-16
   11efc:	00058713          	mv	a4,a1
   11f00:	00812423          	sw	s0,8(sp)
   11f04:	00060593          	mv	a1,a2
   11f08:	00050413          	mv	s0,a0
   11f0c:	00068613          	mv	a2,a3
   11f10:	00070513          	mv	a0,a4
   11f14:	d801a023          	sw	zero,-640(gp) # 137e8 <errno>
   11f18:	00112623          	sw	ra,12(sp)
   11f1c:	1e0000ef          	jal	120fc <_lseek>
   11f20:	fff00793          	li	a5,-1
   11f24:	00f50a63          	beq	a0,a5,11f38 <_lseek_r+0x40>
   11f28:	00c12083          	lw	ra,12(sp)
   11f2c:	00812403          	lw	s0,8(sp)
   11f30:	01010113          	addi	sp,sp,16
   11f34:	00008067          	ret
   11f38:	00912223          	sw	s1,4(sp)
   11f3c:	d8018493          	addi	s1,gp,-640 # 137e8 <errno>
   11f40:	0004a783          	lw	a5,0(s1)
   11f44:	00078e63          	beqz	a5,11f60 <_lseek_r+0x68>
   11f48:	00c12083          	lw	ra,12(sp)
   11f4c:	00f42023          	sw	a5,0(s0)
   11f50:	00812403          	lw	s0,8(sp)
   11f54:	00412483          	lw	s1,4(sp)
   11f58:	01010113          	addi	sp,sp,16
   11f5c:	00008067          	ret
   11f60:	00c12083          	lw	ra,12(sp)
   11f64:	00812403          	lw	s0,8(sp)
   11f68:	00412483          	lw	s1,4(sp)
   11f6c:	01010113          	addi	sp,sp,16
   11f70:	00008067          	ret

00011f74 <__register_exitproc>:
   11f74:	d7c18713          	addi	a4,gp,-644 # 137e4 <__atexit>
   11f78:	00072783          	lw	a5,0(a4)
   11f7c:	04078c63          	beqz	a5,11fd4 <__register_exitproc+0x60>
   11f80:	0047a703          	lw	a4,4(a5)
   11f84:	01f00813          	li	a6,31
   11f88:	06e84e63          	blt	a6,a4,12004 <__register_exitproc+0x90>
   11f8c:	00271813          	slli	a6,a4,0x2
   11f90:	02050663          	beqz	a0,11fbc <__register_exitproc+0x48>
   11f94:	01078333          	add	t1,a5,a6
   11f98:	08c32423          	sw	a2,136(t1)
   11f9c:	1887a883          	lw	a7,392(a5)
   11fa0:	00100613          	li	a2,1
   11fa4:	00e61633          	sll	a2,a2,a4
   11fa8:	00c8e8b3          	or	a7,a7,a2
   11fac:	1917a423          	sw	a7,392(a5)
   11fb0:	10d32423          	sw	a3,264(t1)
   11fb4:	00200693          	li	a3,2
   11fb8:	02d50463          	beq	a0,a3,11fe0 <__register_exitproc+0x6c>
   11fbc:	00170713          	addi	a4,a4,1
   11fc0:	00e7a223          	sw	a4,4(a5)
   11fc4:	010787b3          	add	a5,a5,a6
   11fc8:	00b7a423          	sw	a1,8(a5)
   11fcc:	00000513          	li	a0,0
   11fd0:	00008067          	ret
   11fd4:	f0418793          	addi	a5,gp,-252 # 1396c <__atexit0>
   11fd8:	00f72023          	sw	a5,0(a4)
   11fdc:	fa5ff06f          	j	11f80 <__register_exitproc+0xc>
   11fe0:	18c7a683          	lw	a3,396(a5)
   11fe4:	00170713          	addi	a4,a4,1
   11fe8:	00e7a223          	sw	a4,4(a5)
   11fec:	00c6e6b3          	or	a3,a3,a2
   11ff0:	18d7a623          	sw	a3,396(a5)
   11ff4:	010787b3          	add	a5,a5,a6
   11ff8:	00b7a423          	sw	a1,8(a5)
   11ffc:	00000513          	li	a0,0
   12000:	00008067          	ret
   12004:	fff00513          	li	a0,-1
   12008:	00008067          	ret

0001200c <_read_r>:
   1200c:	ff010113          	addi	sp,sp,-16
   12010:	00058713          	mv	a4,a1
   12014:	00812423          	sw	s0,8(sp)
   12018:	00060593          	mv	a1,a2
   1201c:	00050413          	mv	s0,a0
   12020:	00068613          	mv	a2,a3
   12024:	00070513          	mv	a0,a4
   12028:	d801a023          	sw	zero,-640(gp) # 137e8 <errno>
   1202c:	00112623          	sw	ra,12(sp)
   12030:	110000ef          	jal	12140 <_read>
   12034:	fff00793          	li	a5,-1
   12038:	00f50a63          	beq	a0,a5,1204c <_read_r+0x40>
   1203c:	00c12083          	lw	ra,12(sp)
   12040:	00812403          	lw	s0,8(sp)
   12044:	01010113          	addi	sp,sp,16
   12048:	00008067          	ret
   1204c:	00912223          	sw	s1,4(sp)
   12050:	d8018493          	addi	s1,gp,-640 # 137e8 <errno>
   12054:	0004a783          	lw	a5,0(s1)
   12058:	00078e63          	beqz	a5,12074 <_read_r+0x68>
   1205c:	00c12083          	lw	ra,12(sp)
   12060:	00f42023          	sw	a5,0(s0)
   12064:	00812403          	lw	s0,8(sp)
   12068:	00412483          	lw	s1,4(sp)
   1206c:	01010113          	addi	sp,sp,16
   12070:	00008067          	ret
   12074:	00c12083          	lw	ra,12(sp)
   12078:	00812403          	lw	s0,8(sp)
   1207c:	00412483          	lw	s1,4(sp)
   12080:	01010113          	addi	sp,sp,16
   12084:	00008067          	ret

00012088 <_close>:
   12088:	ff010113          	addi	sp,sp,-16
   1208c:	00112623          	sw	ra,12(sp)
   12090:	00812423          	sw	s0,8(sp)
   12094:	03900893          	li	a7,57
   12098:	00000073          	ecall
   1209c:	00050413          	mv	s0,a0
   120a0:	00054c63          	bltz	a0,120b8 <_close+0x30>
   120a4:	00c12083          	lw	ra,12(sp)
   120a8:	00040513          	mv	a0,s0
   120ac:	00812403          	lw	s0,8(sp)
   120b0:	01010113          	addi	sp,sp,16
   120b4:	00008067          	ret
   120b8:	40800433          	neg	s0,s0
   120bc:	188000ef          	jal	12244 <__errno>
   120c0:	00852023          	sw	s0,0(a0)
   120c4:	fff00413          	li	s0,-1
   120c8:	fddff06f          	j	120a4 <_close+0x1c>

000120cc <_exit>:
   120cc:	05d00893          	li	a7,93
   120d0:	00000073          	ecall
   120d4:	00054463          	bltz	a0,120dc <_exit+0x10>
   120d8:	0000006f          	j	120d8 <_exit+0xc>
   120dc:	ff010113          	addi	sp,sp,-16
   120e0:	00812423          	sw	s0,8(sp)
   120e4:	00050413          	mv	s0,a0
   120e8:	00112623          	sw	ra,12(sp)
   120ec:	40800433          	neg	s0,s0
   120f0:	154000ef          	jal	12244 <__errno>
   120f4:	00852023          	sw	s0,0(a0)
   120f8:	0000006f          	j	120f8 <_exit+0x2c>

000120fc <_lseek>:
   120fc:	ff010113          	addi	sp,sp,-16
   12100:	00112623          	sw	ra,12(sp)
   12104:	00812423          	sw	s0,8(sp)
   12108:	03e00893          	li	a7,62
   1210c:	00000073          	ecall
   12110:	00050413          	mv	s0,a0
   12114:	00054c63          	bltz	a0,1212c <_lseek+0x30>
   12118:	00c12083          	lw	ra,12(sp)
   1211c:	00040513          	mv	a0,s0
   12120:	00812403          	lw	s0,8(sp)
   12124:	01010113          	addi	sp,sp,16
   12128:	00008067          	ret
   1212c:	40800433          	neg	s0,s0
   12130:	114000ef          	jal	12244 <__errno>
   12134:	00852023          	sw	s0,0(a0)
   12138:	fff00413          	li	s0,-1
   1213c:	fddff06f          	j	12118 <_lseek+0x1c>

00012140 <_read>:
   12140:	ff010113          	addi	sp,sp,-16
   12144:	00112623          	sw	ra,12(sp)
   12148:	00812423          	sw	s0,8(sp)
   1214c:	03f00893          	li	a7,63
   12150:	00000073          	ecall
   12154:	00050413          	mv	s0,a0
   12158:	00054c63          	bltz	a0,12170 <_read+0x30>
   1215c:	00c12083          	lw	ra,12(sp)
   12160:	00040513          	mv	a0,s0
   12164:	00812403          	lw	s0,8(sp)
   12168:	01010113          	addi	sp,sp,16
   1216c:	00008067          	ret
   12170:	40800433          	neg	s0,s0
   12174:	0d0000ef          	jal	12244 <__errno>
   12178:	00852023          	sw	s0,0(a0)
   1217c:	fff00413          	li	s0,-1
   12180:	fddff06f          	j	1215c <_read+0x1c>

00012184 <_sbrk>:
   12184:	d8418693          	addi	a3,gp,-636 # 137ec <heap_end.0>
   12188:	0006a703          	lw	a4,0(a3)
   1218c:	ff010113          	addi	sp,sp,-16
   12190:	00112623          	sw	ra,12(sp)
   12194:	00050793          	mv	a5,a0
   12198:	02071063          	bnez	a4,121b8 <_sbrk+0x34>
   1219c:	0d600893          	li	a7,214
   121a0:	00000513          	li	a0,0
   121a4:	00000073          	ecall
   121a8:	fff00613          	li	a2,-1
   121ac:	00050713          	mv	a4,a0
   121b0:	02c50a63          	beq	a0,a2,121e4 <_sbrk+0x60>
   121b4:	00a6a023          	sw	a0,0(a3)
   121b8:	00e78533          	add	a0,a5,a4
   121bc:	0d600893          	li	a7,214
   121c0:	00000073          	ecall
   121c4:	0006a703          	lw	a4,0(a3)
   121c8:	00e787b3          	add	a5,a5,a4
   121cc:	00f51c63          	bne	a0,a5,121e4 <_sbrk+0x60>
   121d0:	00c12083          	lw	ra,12(sp)
   121d4:	00a6a023          	sw	a0,0(a3)
   121d8:	00070513          	mv	a0,a4
   121dc:	01010113          	addi	sp,sp,16
   121e0:	00008067          	ret
   121e4:	060000ef          	jal	12244 <__errno>
   121e8:	00c12083          	lw	ra,12(sp)
   121ec:	00c00793          	li	a5,12
   121f0:	00f52023          	sw	a5,0(a0)
   121f4:	fff00513          	li	a0,-1
   121f8:	01010113          	addi	sp,sp,16
   121fc:	00008067          	ret

00012200 <_write>:
   12200:	ff010113          	addi	sp,sp,-16
   12204:	00112623          	sw	ra,12(sp)
   12208:	00812423          	sw	s0,8(sp)
   1220c:	04000893          	li	a7,64
   12210:	00000073          	ecall
   12214:	00050413          	mv	s0,a0
   12218:	00054c63          	bltz	a0,12230 <_write+0x30>
   1221c:	00c12083          	lw	ra,12(sp)
   12220:	00040513          	mv	a0,s0
   12224:	00812403          	lw	s0,8(sp)
   12228:	01010113          	addi	sp,sp,16
   1222c:	00008067          	ret
   12230:	40800433          	neg	s0,s0
   12234:	010000ef          	jal	12244 <__errno>
   12238:	00852023          	sw	s0,0(a0)
   1223c:	fff00413          	li	s0,-1
   12240:	fddff06f          	j	1221c <_write+0x1c>

00012244 <__errno>:
   12244:	d641a503          	lw	a0,-668(gp) # 137cc <_impure_ptr>
   12248:	00008067          	ret
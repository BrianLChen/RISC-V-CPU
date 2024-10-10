
../test.elf:     file format elf32-littleriscv


Disassembly of section .text:

000100b4 <register_fini>:
   100b4:	00000793          	li	a5,0
   100b8:	c799                	beqz	a5,100c6 <register_fini+0x12>
   100ba:	00001517          	auipc	a0,0x1
   100be:	35a50513          	addi	a0,a0,858 # 11414 <__libc_fini_array>
   100c2:	7ef0006f          	j	110b0 <atexit>
   100c6:	8082                	ret

000100c8 <_start>:
   100c8:	00002197          	auipc	gp,0x2
   100cc:	74818193          	addi	gp,gp,1864 # 12810 <__global_pointer$>
   100d0:	00000513          	li	a0,0
   100d4:	c119                	beqz	a0,100da <_start+0x12>
   100d6:	01751073          	csrw	0x17,a0
   100da:	d6818513          	addi	a0,gp,-664 # 12578 <message_index>
   100de:	09418613          	addi	a2,gp,148 # 128a4 <__BSS_END__>
   100e2:	8e09                	sub	a2,a2,a0
   100e4:	4581                	li	a1,0
   100e6:	2a5d                	jal	1029c <memset>
   100e8:	00001517          	auipc	a0,0x1
   100ec:	fc850513          	addi	a0,a0,-56 # 110b0 <atexit>
   100f0:	c519                	beqz	a0,100fe <_start+0x36>
   100f2:	00001517          	auipc	a0,0x1
   100f6:	32250513          	addi	a0,a0,802 # 11414 <__libc_fini_array>
   100fa:	7b7000ef          	jal	110b0 <atexit>
   100fe:	248d                	jal	10360 <__libc_init_array>
   10100:	4502                	lw	a0,0(sp)
   10102:	004c                	addi	a1,sp,4
   10104:	00251613          	slli	a2,a0,0x2
   10108:	0611                	addi	a2,a2,4
   1010a:	962e                	add	a2,a2,a1
   1010c:	2295                	jal	10270 <main>
   1010e:	ac1d                	j	10344 <exit>

00010110 <deregister_tm_clones>:
   10110:	d5818793          	addi	a5,gp,-680 # 12568 <__TMC_END__>
   10114:	d5818713          	addi	a4,gp,-680 # 12568 <__TMC_END__>
   10118:	00f70863          	beq	a4,a5,10128 <deregister_tm_clones+0x18>
   1011c:	00000793          	li	a5,0
   10120:	c781                	beqz	a5,10128 <deregister_tm_clones+0x18>
   10122:	d5818513          	addi	a0,gp,-680 # 12568 <__TMC_END__>
   10126:	8782                	jr	a5
   10128:	8082                	ret

0001012a <register_tm_clones>:
   1012a:	d5818793          	addi	a5,gp,-680 # 12568 <__TMC_END__>
   1012e:	d5818593          	addi	a1,gp,-680 # 12568 <__TMC_END__>
   10132:	8d9d                	sub	a1,a1,a5
   10134:	4025d793          	srai	a5,a1,0x2
   10138:	81fd                	srli	a1,a1,0x1f
   1013a:	95be                	add	a1,a1,a5
   1013c:	8585                	srai	a1,a1,0x1
   1013e:	c599                	beqz	a1,1014c <register_tm_clones+0x22>
   10140:	00000793          	li	a5,0
   10144:	c781                	beqz	a5,1014c <register_tm_clones+0x22>
   10146:	d5818513          	addi	a0,gp,-680 # 12568 <__TMC_END__>
   1014a:	8782                	jr	a5
   1014c:	8082                	ret

0001014e <__do_global_dtors_aux>:
   1014e:	1141                	addi	sp,sp,-16
   10150:	c422                	sw	s0,8(sp)
   10152:	d881c783          	lbu	a5,-632(gp) # 12598 <completed.1>
   10156:	c606                	sw	ra,12(sp)
   10158:	ef99                	bnez	a5,10176 <__do_global_dtors_aux+0x28>
   1015a:	3f5d                	jal	10110 <deregister_tm_clones>
   1015c:	00000793          	li	a5,0
   10160:	cb81                	beqz	a5,10170 <__do_global_dtors_aux+0x22>
   10162:	6545                	lui	a0,0x11
   10164:	76c50513          	addi	a0,a0,1900 # 1176c <__EH_FRAME_BEGIN__>
   10168:	00000097          	auipc	ra,0x0
   1016c:	000000e7          	jalr	zero # 0 <register_fini-0x100b4>
   10170:	4785                	li	a5,1
   10172:	d8f18423          	sb	a5,-632(gp) # 12598 <completed.1>
   10176:	40b2                	lw	ra,12(sp)
   10178:	4422                	lw	s0,8(sp)
   1017a:	0141                	addi	sp,sp,16
   1017c:	8082                	ret

0001017e <frame_dummy>:
   1017e:	00000793          	li	a5,0
   10182:	cf99                	beqz	a5,101a0 <frame_dummy+0x22>
   10184:	6545                	lui	a0,0x11
   10186:	1141                	addi	sp,sp,-16
   10188:	d8c18593          	addi	a1,gp,-628 # 1259c <object.0>
   1018c:	76c50513          	addi	a0,a0,1900 # 1176c <__EH_FRAME_BEGIN__>
   10190:	c606                	sw	ra,12(sp)
   10192:	00000097          	auipc	ra,0x0
   10196:	000000e7          	jalr	zero # 0 <register_fini-0x100b4>
   1019a:	40b2                	lw	ra,12(sp)
   1019c:	0141                	addi	sp,sp,16
   1019e:	b771                	j	1012a <register_tm_clones>
   101a0:	b769                	j	1012a <register_tm_clones>

000101a2 <uart_init>:
   101a2:	1141                	addi	sp,sp,-16
   101a4:	c606                	sw	ra,12(sp)
   101a6:	c422                	sw	s0,8(sp)
   101a8:	0800                	addi	s0,sp,16
   101aa:	4000d7b7          	lui	a5,0x4000d
   101ae:	07a1                	addi	a5,a5,8 # 4000d008 <__BSS_END__+0x3fffa764>
   101b0:	4398                	lw	a4,0(a5)
   101b2:	4000d7b7          	lui	a5,0x4000d
   101b6:	07a1                	addi	a5,a5,8 # 4000d008 <__BSS_END__+0x3fffa764>
   101b8:	00176713          	ori	a4,a4,1
   101bc:	c398                	sw	a4,0(a5)
   101be:	4000d7b7          	lui	a5,0x4000d
   101c2:	07c1                	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fffa76c>
   101c4:	4398                	lw	a4,0(a5)
   101c6:	4000d7b7          	lui	a5,0x4000d
   101ca:	07c1                	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fffa76c>
   101cc:	00176713          	ori	a4,a4,1
   101d0:	c398                	sw	a4,0(a5)
   101d2:	0001                	nop
   101d4:	40b2                	lw	ra,12(sp)
   101d6:	4422                	lw	s0,8(sp)
   101d8:	0141                	addi	sp,sp,16
   101da:	8082                	ret

000101dc <uart_send_char>:
   101dc:	1101                	addi	sp,sp,-32
   101de:	ce06                	sw	ra,28(sp)
   101e0:	cc22                	sw	s0,24(sp)
   101e2:	1000                	addi	s0,sp,32
   101e4:	87aa                	mv	a5,a0
   101e6:	fef407a3          	sb	a5,-17(s0)
   101ea:	4000d7b7          	lui	a5,0x4000d
   101ee:	fef44703          	lbu	a4,-17(s0)
   101f2:	c398                	sw	a4,0(a5)
   101f4:	0001                	nop
   101f6:	40f2                	lw	ra,28(sp)
   101f8:	4462                	lw	s0,24(sp)
   101fa:	6105                	addi	sp,sp,32
   101fc:	8082                	ret

000101fe <uart_isr>:
   101fe:	1141                	addi	sp,sp,-16
   10200:	c606                	sw	ra,12(sp)
   10202:	c422                	sw	s0,8(sp)
   10204:	0800                	addi	s0,sp,16
   10206:	4000d7b7          	lui	a5,0x4000d
   1020a:	07d1                	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fffa770>
   1020c:	439c                	lw	a5,0(a5)
   1020e:	8b85                	andi	a5,a5,1
   10210:	cbb9                	beqz	a5,10266 <uart_isr+0x68>
   10212:	4000d7b7          	lui	a5,0x4000d
   10216:	07d1                	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fffa770>
   10218:	4398                	lw	a4,0(a5)
   1021a:	4000d7b7          	lui	a5,0x4000d
   1021e:	07d1                	addi	a5,a5,20 # 4000d014 <__BSS_END__+0x3fffa770>
   10220:	9b79                	andi	a4,a4,-2
   10222:	c398                	sw	a4,0(a5)
   10224:	d681a783          	lw	a5,-664(gp) # 12578 <message_index>
   10228:	6745                	lui	a4,0x11
   1022a:	76070713          	addi	a4,a4,1888 # 11760 <message>
   1022e:	97ba                	add	a5,a5,a4
   10230:	0007c783          	lbu	a5,0(a5)
   10234:	c385                	beqz	a5,10254 <uart_isr+0x56>
   10236:	d681a783          	lw	a5,-664(gp) # 12578 <message_index>
   1023a:	00178693          	addi	a3,a5,1
   1023e:	d6d1a423          	sw	a3,-664(gp) # 12578 <message_index>
   10242:	6745                	lui	a4,0x11
   10244:	76070713          	addi	a4,a4,1888 # 11760 <message>
   10248:	97ba                	add	a5,a5,a4
   1024a:	0007c783          	lbu	a5,0(a5)
   1024e:	853e                	mv	a0,a5
   10250:	3771                	jal	101dc <uart_send_char>
   10252:	a811                	j	10266 <uart_isr+0x68>
   10254:	4000d7b7          	lui	a5,0x4000d
   10258:	07c1                	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fffa76c>
   1025a:	4398                	lw	a4,0(a5)
   1025c:	4000d7b7          	lui	a5,0x4000d
   10260:	07c1                	addi	a5,a5,16 # 4000d010 <__BSS_END__+0x3fffa76c>
   10262:	9b79                	andi	a4,a4,-2
   10264:	c398                	sw	a4,0(a5)
   10266:	0001                	nop
   10268:	40b2                	lw	ra,12(sp)
   1026a:	4422                	lw	s0,8(sp)
   1026c:	0141                	addi	sp,sp,16
   1026e:	8082                	ret

00010270 <main>:
   10270:	1141                	addi	sp,sp,-16
   10272:	c606                	sw	ra,12(sp)
   10274:	c422                	sw	s0,8(sp)
   10276:	0800                	addi	s0,sp,16
   10278:	372d                	jal	101a2 <uart_init>
   1027a:	d681a783          	lw	a5,-664(gp) # 12578 <message_index>
   1027e:	00178693          	addi	a3,a5,1
   10282:	d6d1a423          	sw	a3,-664(gp) # 12578 <message_index>
   10286:	6745                	lui	a4,0x11
   10288:	76070713          	addi	a4,a4,1888 # 11760 <message>
   1028c:	97ba                	add	a5,a5,a4
   1028e:	0007c783          	lbu	a5,0(a5)
   10292:	853e                	mv	a0,a5
   10294:	37a1                	jal	101dc <uart_send_char>
   10296:	10500073          	wfi
   1029a:	bff5                	j	10296 <main+0x26>

0001029c <memset>:
   1029c:	433d                	li	t1,15
   1029e:	872a                	mv	a4,a0
   102a0:	02c37363          	bgeu	t1,a2,102c6 <memset+0x2a>
   102a4:	00f77793          	andi	a5,a4,15
   102a8:	efbd                	bnez	a5,10326 <memset+0x8a>
   102aa:	e5ad                	bnez	a1,10314 <memset+0x78>
   102ac:	ff067693          	andi	a3,a2,-16
   102b0:	8a3d                	andi	a2,a2,15
   102b2:	96ba                	add	a3,a3,a4
   102b4:	c30c                	sw	a1,0(a4)
   102b6:	c34c                	sw	a1,4(a4)
   102b8:	c70c                	sw	a1,8(a4)
   102ba:	c74c                	sw	a1,12(a4)
   102bc:	0741                	addi	a4,a4,16
   102be:	fed76be3          	bltu	a4,a3,102b4 <memset+0x18>
   102c2:	e211                	bnez	a2,102c6 <memset+0x2a>
   102c4:	8082                	ret
   102c6:	40c306b3          	sub	a3,t1,a2
   102ca:	068a                	slli	a3,a3,0x2
   102cc:	00000297          	auipc	t0,0x0
   102d0:	9696                	add	a3,a3,t0
   102d2:	00a68067          	jr	10(a3)
   102d6:	00b70723          	sb	a1,14(a4)
   102da:	00b706a3          	sb	a1,13(a4)
   102de:	00b70623          	sb	a1,12(a4)
   102e2:	00b705a3          	sb	a1,11(a4)
   102e6:	00b70523          	sb	a1,10(a4)
   102ea:	00b704a3          	sb	a1,9(a4)
   102ee:	00b70423          	sb	a1,8(a4)
   102f2:	00b703a3          	sb	a1,7(a4)
   102f6:	00b70323          	sb	a1,6(a4)
   102fa:	00b702a3          	sb	a1,5(a4)
   102fe:	00b70223          	sb	a1,4(a4)
   10302:	00b701a3          	sb	a1,3(a4)
   10306:	00b70123          	sb	a1,2(a4)
   1030a:	00b700a3          	sb	a1,1(a4)
   1030e:	00b70023          	sb	a1,0(a4)
   10312:	8082                	ret
   10314:	0ff5f593          	zext.b	a1,a1
   10318:	00859693          	slli	a3,a1,0x8
   1031c:	8dd5                	or	a1,a1,a3
   1031e:	01059693          	slli	a3,a1,0x10
   10322:	8dd5                	or	a1,a1,a3
   10324:	b761                	j	102ac <memset+0x10>
   10326:	00279693          	slli	a3,a5,0x2
   1032a:	00000297          	auipc	t0,0x0
   1032e:	9696                	add	a3,a3,t0
   10330:	8286                	mv	t0,ra
   10332:	fa8680e7          	jalr	-88(a3)
   10336:	8096                	mv	ra,t0
   10338:	17c1                	addi	a5,a5,-16
   1033a:	8f1d                	sub	a4,a4,a5
   1033c:	963e                	add	a2,a2,a5
   1033e:	f8c374e3          	bgeu	t1,a2,102c6 <memset+0x2a>
   10342:	b7a5                	j	102aa <memset+0xe>

00010344 <exit>:
   10344:	1141                	addi	sp,sp,-16
   10346:	4581                	li	a1,0
   10348:	c422                	sw	s0,8(sp)
   1034a:	c606                	sw	ra,12(sp)
   1034c:	842a                	mv	s0,a0
   1034e:	44f000ef          	jal	10f9c <__call_exitprocs>
   10352:	d6c1a783          	lw	a5,-660(gp) # 1257c <__stdio_exit_handler>
   10356:	c391                	beqz	a5,1035a <exit+0x16>
   10358:	9782                	jalr	a5
   1035a:	8522                	mv	a0,s0
   1035c:	312010ef          	jal	1166e <_exit>

00010360 <__libc_init_array>:
   10360:	1141                	addi	sp,sp,-16
   10362:	c422                	sw	s0,8(sp)
   10364:	c04a                	sw	s2,0(sp)
   10366:	00002797          	auipc	a5,0x2
   1036a:	c9a78793          	addi	a5,a5,-870 # 12000 <__init_array_start>
   1036e:	00002417          	auipc	s0,0x2
   10372:	c9240413          	addi	s0,s0,-878 # 12000 <__init_array_start>
   10376:	c606                	sw	ra,12(sp)
   10378:	c226                	sw	s1,4(sp)
   1037a:	40878933          	sub	s2,a5,s0
   1037e:	00878b63          	beq	a5,s0,10394 <__libc_init_array+0x34>
   10382:	40295913          	srai	s2,s2,0x2
   10386:	4481                	li	s1,0
   10388:	401c                	lw	a5,0(s0)
   1038a:	0485                	addi	s1,s1,1
   1038c:	0411                	addi	s0,s0,4
   1038e:	9782                	jalr	a5
   10390:	ff24ece3          	bltu	s1,s2,10388 <__libc_init_array+0x28>
   10394:	00002797          	auipc	a5,0x2
   10398:	c7478793          	addi	a5,a5,-908 # 12008 <__do_global_dtors_aux_fini_array_entry>
   1039c:	00002417          	auipc	s0,0x2
   103a0:	c6440413          	addi	s0,s0,-924 # 12000 <__init_array_start>
   103a4:	40878933          	sub	s2,a5,s0
   103a8:	40295913          	srai	s2,s2,0x2
   103ac:	00878963          	beq	a5,s0,103be <__libc_init_array+0x5e>
   103b0:	4481                	li	s1,0
   103b2:	401c                	lw	a5,0(s0)
   103b4:	0485                	addi	s1,s1,1
   103b6:	0411                	addi	s0,s0,4
   103b8:	9782                	jalr	a5
   103ba:	ff24ece3          	bltu	s1,s2,103b2 <__libc_init_array+0x52>
   103be:	40b2                	lw	ra,12(sp)
   103c0:	4422                	lw	s0,8(sp)
   103c2:	4492                	lw	s1,4(sp)
   103c4:	4902                	lw	s2,0(sp)
   103c6:	0141                	addi	sp,sp,16
   103c8:	8082                	ret

000103ca <__fp_lock>:
   103ca:	4501                	li	a0,0
   103cc:	8082                	ret

000103ce <stdio_exit_handler>:
   103ce:	00002617          	auipc	a2,0x2
   103d2:	c4260613          	addi	a2,a2,-958 # 12010 <__sglue>
   103d6:	00000597          	auipc	a1,0x0
   103da:	27a58593          	addi	a1,a1,634 # 10650 <_fclose_r>
   103de:	c1818513          	addi	a0,gp,-1000 # 12428 <_impure_data>
   103e2:	7c10006f          	j	113a2 <_fwalk_sglue>

000103e6 <cleanup_stdio>:
   103e6:	414c                	lw	a1,4(a0)
   103e8:	1141                	addi	sp,sp,-16
   103ea:	c422                	sw	s0,8(sp)
   103ec:	c606                	sw	ra,12(sp)
   103ee:	da418793          	addi	a5,gp,-604 # 125b4 <__sf>
   103f2:	842a                	mv	s0,a0
   103f4:	00f58363          	beq	a1,a5,103fa <cleanup_stdio+0x14>
   103f8:	2ca1                	jal	10650 <_fclose_r>
   103fa:	440c                	lw	a1,8(s0)
   103fc:	e0c18793          	addi	a5,gp,-500 # 1261c <__sf+0x68>
   10400:	00f58463          	beq	a1,a5,10408 <cleanup_stdio+0x22>
   10404:	8522                	mv	a0,s0
   10406:	24a9                	jal	10650 <_fclose_r>
   10408:	444c                	lw	a1,12(s0)
   1040a:	e7418793          	addi	a5,gp,-396 # 12684 <__sf+0xd0>
   1040e:	00f58763          	beq	a1,a5,1041c <cleanup_stdio+0x36>
   10412:	8522                	mv	a0,s0
   10414:	4422                	lw	s0,8(sp)
   10416:	40b2                	lw	ra,12(sp)
   10418:	0141                	addi	sp,sp,16
   1041a:	ac1d                	j	10650 <_fclose_r>
   1041c:	40b2                	lw	ra,12(sp)
   1041e:	4422                	lw	s0,8(sp)
   10420:	0141                	addi	sp,sp,16
   10422:	8082                	ret

00010424 <__fp_unlock>:
   10424:	4501                	li	a0,0
   10426:	8082                	ret

00010428 <global_stdio_init.part.0>:
   10428:	1101                	addi	sp,sp,-32
   1042a:	ce06                	sw	ra,28(sp)
   1042c:	cc22                	sw	s0,24(sp)
   1042e:	ca26                	sw	s1,20(sp)
   10430:	da418413          	addi	s0,gp,-604 # 125b4 <__sf>
   10434:	c84a                	sw	s2,16(sp)
   10436:	c64e                	sw	s3,12(sp)
   10438:	c452                	sw	s4,8(sp)
   1043a:	00000717          	auipc	a4,0x0
   1043e:	f9470713          	addi	a4,a4,-108 # 103ce <stdio_exit_handler>
   10442:	4791                	li	a5,4
   10444:	4621                	li	a2,8
   10446:	4581                	li	a1,0
   10448:	e0018513          	addi	a0,gp,-512 # 12610 <__sf+0x5c>
   1044c:	d6e1a623          	sw	a4,-660(gp) # 1257c <__stdio_exit_handler>
   10450:	c45c                	sw	a5,12(s0)
   10452:	00042023          	sw	zero,0(s0)
   10456:	00042223          	sw	zero,4(s0)
   1045a:	00042423          	sw	zero,8(s0)
   1045e:	06042223          	sw	zero,100(s0)
   10462:	00042823          	sw	zero,16(s0)
   10466:	00042a23          	sw	zero,20(s0)
   1046a:	00042c23          	sw	zero,24(s0)
   1046e:	353d                	jal	1029c <memset>
   10470:	67c1                	lui	a5,0x10
   10472:	00001a17          	auipc	s4,0x1
   10476:	c48a0a13          	addi	s4,s4,-952 # 110ba <__sread>
   1047a:	00001997          	auipc	s3,0x1
   1047e:	c7a98993          	addi	s3,s3,-902 # 110f4 <__swrite>
   10482:	00001917          	auipc	s2,0x1
   10486:	cc290913          	addi	s2,s2,-830 # 11144 <__sseek>
   1048a:	00001497          	auipc	s1,0x1
   1048e:	cf648493          	addi	s1,s1,-778 # 11180 <__sclose>
   10492:	07a5                	addi	a5,a5,9 # 10009 <register_fini-0xab>
   10494:	4621                	li	a2,8
   10496:	4581                	li	a1,0
   10498:	e6818513          	addi	a0,gp,-408 # 12678 <__sf+0xc4>
   1049c:	d87c                	sw	a5,116(s0)
   1049e:	03442023          	sw	s4,32(s0)
   104a2:	03342223          	sw	s3,36(s0)
   104a6:	03242423          	sw	s2,40(s0)
   104aa:	d444                	sw	s1,44(s0)
   104ac:	cc40                	sw	s0,28(s0)
   104ae:	06042423          	sw	zero,104(s0)
   104b2:	06042623          	sw	zero,108(s0)
   104b6:	06042823          	sw	zero,112(s0)
   104ba:	0c042623          	sw	zero,204(s0)
   104be:	06042c23          	sw	zero,120(s0)
   104c2:	06042e23          	sw	zero,124(s0)
   104c6:	08042023          	sw	zero,128(s0)
   104ca:	3bc9                	jal	1029c <memset>
   104cc:	000207b7          	lui	a5,0x20
   104d0:	07c9                	addi	a5,a5,18 # 20012 <__BSS_END__+0xd76e>
   104d2:	e0c18713          	addi	a4,gp,-500 # 1261c <__sf+0x68>
   104d6:	4621                	li	a2,8
   104d8:	4581                	li	a1,0
   104da:	ed018513          	addi	a0,gp,-304 # 126e0 <__sf+0x12c>
   104de:	09442423          	sw	s4,136(s0)
   104e2:	09342623          	sw	s3,140(s0)
   104e6:	09242823          	sw	s2,144(s0)
   104ea:	08942a23          	sw	s1,148(s0)
   104ee:	0cf42e23          	sw	a5,220(s0)
   104f2:	0c042823          	sw	zero,208(s0)
   104f6:	0c042a23          	sw	zero,212(s0)
   104fa:	0c042c23          	sw	zero,216(s0)
   104fe:	12042a23          	sw	zero,308(s0)
   10502:	0e042023          	sw	zero,224(s0)
   10506:	0e042223          	sw	zero,228(s0)
   1050a:	0e042423          	sw	zero,232(s0)
   1050e:	08e42223          	sw	a4,132(s0)
   10512:	3369                	jal	1029c <memset>
   10514:	e7418793          	addi	a5,gp,-396 # 12684 <__sf+0xd0>
   10518:	0f442823          	sw	s4,240(s0)
   1051c:	0f342a23          	sw	s3,244(s0)
   10520:	0f242c23          	sw	s2,248(s0)
   10524:	0e942e23          	sw	s1,252(s0)
   10528:	40f2                	lw	ra,28(sp)
   1052a:	0ef42623          	sw	a5,236(s0)
   1052e:	4462                	lw	s0,24(sp)
   10530:	44d2                	lw	s1,20(sp)
   10532:	4942                	lw	s2,16(sp)
   10534:	49b2                	lw	s3,12(sp)
   10536:	4a22                	lw	s4,8(sp)
   10538:	6105                	addi	sp,sp,32
   1053a:	8082                	ret

0001053c <__sfp>:
   1053c:	d6c1a783          	lw	a5,-660(gp) # 1257c <__stdio_exit_handler>
   10540:	1101                	addi	sp,sp,-32
   10542:	c64e                	sw	s3,12(sp)
   10544:	ce06                	sw	ra,28(sp)
   10546:	cc22                	sw	s0,24(sp)
   10548:	ca26                	sw	s1,20(sp)
   1054a:	c84a                	sw	s2,16(sp)
   1054c:	89aa                	mv	s3,a0
   1054e:	c7cd                	beqz	a5,105f8 <__sfp+0xbc>
   10550:	00002917          	auipc	s2,0x2
   10554:	ac090913          	addi	s2,s2,-1344 # 12010 <__sglue>
   10558:	54fd                	li	s1,-1
   1055a:	00492783          	lw	a5,4(s2)
   1055e:	00892403          	lw	s0,8(s2)
   10562:	17fd                	addi	a5,a5,-1
   10564:	0007d763          	bgez	a5,10572 <__sfp+0x36>
   10568:	a8b9                	j	105c6 <__sfp+0x8a>
   1056a:	06840413          	addi	s0,s0,104
   1056e:	04978c63          	beq	a5,s1,105c6 <__sfp+0x8a>
   10572:	00c41703          	lh	a4,12(s0)
   10576:	17fd                	addi	a5,a5,-1
   10578:	fb6d                	bnez	a4,1056a <__sfp+0x2e>
   1057a:	77c1                	lui	a5,0xffff0
   1057c:	0785                	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdd75d>
   1057e:	06042223          	sw	zero,100(s0)
   10582:	00042023          	sw	zero,0(s0)
   10586:	00042423          	sw	zero,8(s0)
   1058a:	00042223          	sw	zero,4(s0)
   1058e:	00042823          	sw	zero,16(s0)
   10592:	00042a23          	sw	zero,20(s0)
   10596:	00042c23          	sw	zero,24(s0)
   1059a:	c45c                	sw	a5,12(s0)
   1059c:	4621                	li	a2,8
   1059e:	4581                	li	a1,0
   105a0:	05c40513          	addi	a0,s0,92
   105a4:	39e5                	jal	1029c <memset>
   105a6:	02042823          	sw	zero,48(s0)
   105aa:	02042a23          	sw	zero,52(s0)
   105ae:	04042223          	sw	zero,68(s0)
   105b2:	04042423          	sw	zero,72(s0)
   105b6:	40f2                	lw	ra,28(sp)
   105b8:	8522                	mv	a0,s0
   105ba:	4462                	lw	s0,24(sp)
   105bc:	44d2                	lw	s1,20(sp)
   105be:	4942                	lw	s2,16(sp)
   105c0:	49b2                	lw	s3,12(sp)
   105c2:	6105                	addi	sp,sp,32
   105c4:	8082                	ret
   105c6:	00092403          	lw	s0,0(s2)
   105ca:	c019                	beqz	s0,105d0 <__sfp+0x94>
   105cc:	8922                	mv	s2,s0
   105ce:	b771                	j	1055a <__sfp+0x1e>
   105d0:	1ac00593          	li	a1,428
   105d4:	854e                	mv	a0,s3
   105d6:	2a39                	jal	106f4 <_malloc_r>
   105d8:	842a                	mv	s0,a0
   105da:	c10d                	beqz	a0,105fc <__sfp+0xc0>
   105dc:	4791                	li	a5,4
   105de:	0531                	addi	a0,a0,12
   105e0:	00042023          	sw	zero,0(s0)
   105e4:	c05c                	sw	a5,4(s0)
   105e6:	c408                	sw	a0,8(s0)
   105e8:	1a000613          	li	a2,416
   105ec:	4581                	li	a1,0
   105ee:	317d                	jal	1029c <memset>
   105f0:	00892023          	sw	s0,0(s2)
   105f4:	8922                	mv	s2,s0
   105f6:	b795                	j	1055a <__sfp+0x1e>
   105f8:	3d05                	jal	10428 <global_stdio_init.part.0>
   105fa:	bf99                	j	10550 <__sfp+0x14>
   105fc:	00092023          	sw	zero,0(s2)
   10600:	47b1                	li	a5,12
   10602:	00f9a023          	sw	a5,0(s3)
   10606:	bf45                	j	105b6 <__sfp+0x7a>

00010608 <__sinit>:
   10608:	595c                	lw	a5,52(a0)
   1060a:	c391                	beqz	a5,1060e <__sinit+0x6>
   1060c:	8082                	ret
   1060e:	d6c1a783          	lw	a5,-660(gp) # 1257c <__stdio_exit_handler>
   10612:	00000717          	auipc	a4,0x0
   10616:	dd470713          	addi	a4,a4,-556 # 103e6 <cleanup_stdio>
   1061a:	d958                	sw	a4,52(a0)
   1061c:	fbe5                	bnez	a5,1060c <__sinit+0x4>
   1061e:	b529                	j	10428 <global_stdio_init.part.0>

00010620 <__sfp_lock_acquire>:
   10620:	8082                	ret

00010622 <__sfp_lock_release>:
   10622:	8082                	ret

00010624 <__fp_lock_all>:
   10624:	00002617          	auipc	a2,0x2
   10628:	9ec60613          	addi	a2,a2,-1556 # 12010 <__sglue>
   1062c:	00000597          	auipc	a1,0x0
   10630:	d9e58593          	addi	a1,a1,-610 # 103ca <__fp_lock>
   10634:	4501                	li	a0,0
   10636:	56d0006f          	j	113a2 <_fwalk_sglue>

0001063a <__fp_unlock_all>:
   1063a:	00002617          	auipc	a2,0x2
   1063e:	9d660613          	addi	a2,a2,-1578 # 12010 <__sglue>
   10642:	00000597          	auipc	a1,0x0
   10646:	de258593          	addi	a1,a1,-542 # 10424 <__fp_unlock>
   1064a:	4501                	li	a0,0
   1064c:	5570006f          	j	113a2 <_fwalk_sglue>

00010650 <_fclose_r>:
   10650:	1141                	addi	sp,sp,-16
   10652:	c606                	sw	ra,12(sp)
   10654:	c04a                	sw	s2,0(sp)
   10656:	cd89                	beqz	a1,10670 <_fclose_r+0x20>
   10658:	c422                	sw	s0,8(sp)
   1065a:	c226                	sw	s1,4(sp)
   1065c:	842e                	mv	s0,a1
   1065e:	84aa                	mv	s1,a0
   10660:	c119                	beqz	a0,10666 <_fclose_r+0x16>
   10662:	595c                	lw	a5,52(a0)
   10664:	c3d1                	beqz	a5,106e8 <_fclose_r+0x98>
   10666:	00c41783          	lh	a5,12(s0)
   1066a:	eb89                	bnez	a5,1067c <_fclose_r+0x2c>
   1066c:	4422                	lw	s0,8(sp)
   1066e:	4492                	lw	s1,4(sp)
   10670:	40b2                	lw	ra,12(sp)
   10672:	4901                	li	s2,0
   10674:	854a                	mv	a0,s2
   10676:	4902                	lw	s2,0(sp)
   10678:	0141                	addi	sp,sp,16
   1067a:	8082                	ret
   1067c:	85a2                	mv	a1,s0
   1067e:	8526                	mv	a0,s1
   10680:	307000ef          	jal	11186 <__sflush_r>
   10684:	545c                	lw	a5,44(s0)
   10686:	892a                	mv	s2,a0
   10688:	c791                	beqz	a5,10694 <_fclose_r+0x44>
   1068a:	4c4c                	lw	a1,28(s0)
   1068c:	8526                	mv	a0,s1
   1068e:	9782                	jalr	a5
   10690:	04054263          	bltz	a0,106d4 <_fclose_r+0x84>
   10694:	00c45783          	lhu	a5,12(s0)
   10698:	0807f793          	andi	a5,a5,128
   1069c:	e3b1                	bnez	a5,106e0 <_fclose_r+0x90>
   1069e:	580c                	lw	a1,48(s0)
   106a0:	c989                	beqz	a1,106b2 <_fclose_r+0x62>
   106a2:	04040793          	addi	a5,s0,64
   106a6:	00f58463          	beq	a1,a5,106ae <_fclose_r+0x5e>
   106aa:	8526                	mv	a0,s1
   106ac:	2dd1                	jal	10d80 <_free_r>
   106ae:	02042823          	sw	zero,48(s0)
   106b2:	406c                	lw	a1,68(s0)
   106b4:	c589                	beqz	a1,106be <_fclose_r+0x6e>
   106b6:	8526                	mv	a0,s1
   106b8:	25e1                	jal	10d80 <_free_r>
   106ba:	04042223          	sw	zero,68(s0)
   106be:	378d                	jal	10620 <__sfp_lock_acquire>
   106c0:	00041623          	sh	zero,12(s0)
   106c4:	3fb9                	jal	10622 <__sfp_lock_release>
   106c6:	40b2                	lw	ra,12(sp)
   106c8:	4422                	lw	s0,8(sp)
   106ca:	4492                	lw	s1,4(sp)
   106cc:	854a                	mv	a0,s2
   106ce:	4902                	lw	s2,0(sp)
   106d0:	0141                	addi	sp,sp,16
   106d2:	8082                	ret
   106d4:	00c45783          	lhu	a5,12(s0)
   106d8:	597d                	li	s2,-1
   106da:	0807f793          	andi	a5,a5,128
   106de:	d3e1                	beqz	a5,1069e <_fclose_r+0x4e>
   106e0:	480c                	lw	a1,16(s0)
   106e2:	8526                	mv	a0,s1
   106e4:	2d71                	jal	10d80 <_free_r>
   106e6:	bf65                	j	1069e <_fclose_r+0x4e>
   106e8:	3705                	jal	10608 <__sinit>
   106ea:	bfb5                	j	10666 <_fclose_r+0x16>

000106ec <fclose>:
   106ec:	85aa                	mv	a1,a0
   106ee:	d641a503          	lw	a0,-668(gp) # 12574 <_impure_ptr>
   106f2:	bfb9                	j	10650 <_fclose_r>

000106f4 <_malloc_r>:
   106f4:	7179                	addi	sp,sp,-48
   106f6:	d04a                	sw	s2,32(sp)
   106f8:	d606                	sw	ra,44(sp)
   106fa:	d422                	sw	s0,40(sp)
   106fc:	d226                	sw	s1,36(sp)
   106fe:	ce4e                	sw	s3,28(sp)
   10700:	00b58793          	addi	a5,a1,11
   10704:	4759                	li	a4,22
   10706:	892a                	mv	s2,a0
   10708:	04f76863          	bltu	a4,a5,10758 <_malloc_r+0x64>
   1070c:	44c1                	li	s1,16
   1070e:	16b4e863          	bltu	s1,a1,1087e <_malloc_r+0x18a>
   10712:	15d000ef          	jal	1106e <__malloc_lock>
   10716:	47e1                	li	a5,24
   10718:	4589                	li	a1,2
   1071a:	80c18993          	addi	s3,gp,-2036 # 1201c <__malloc_av_>
   1071e:	97ce                	add	a5,a5,s3
   10720:	43c0                	lw	s0,4(a5)
   10722:	ff878713          	addi	a4,a5,-8
   10726:	30e40863          	beq	s0,a4,10a36 <_malloc_r+0x342>
   1072a:	405c                	lw	a5,4(s0)
   1072c:	4454                	lw	a3,12(s0)
   1072e:	4410                	lw	a2,8(s0)
   10730:	9bf1                	andi	a5,a5,-4
   10732:	97a2                	add	a5,a5,s0
   10734:	43d8                	lw	a4,4(a5)
   10736:	c654                	sw	a3,12(a2)
   10738:	c690                	sw	a2,8(a3)
   1073a:	00176713          	ori	a4,a4,1
   1073e:	854a                	mv	a0,s2
   10740:	c3d8                	sw	a4,4(a5)
   10742:	12f000ef          	jal	11070 <__malloc_unlock>
   10746:	50b2                	lw	ra,44(sp)
   10748:	00840513          	addi	a0,s0,8
   1074c:	5422                	lw	s0,40(sp)
   1074e:	5492                	lw	s1,36(sp)
   10750:	5902                	lw	s2,32(sp)
   10752:	49f2                	lw	s3,28(sp)
   10754:	6145                	addi	sp,sp,48
   10756:	8082                	ret
   10758:	ff87f493          	andi	s1,a5,-8
   1075c:	1207c163          	bltz	a5,1087e <_malloc_r+0x18a>
   10760:	10b4ef63          	bltu	s1,a1,1087e <_malloc_r+0x18a>
   10764:	10b000ef          	jal	1106e <__malloc_lock>
   10768:	1f700793          	li	a5,503
   1076c:	3897f463          	bgeu	a5,s1,10af4 <_malloc_r+0x400>
   10770:	0094d793          	srli	a5,s1,0x9
   10774:	12078063          	beqz	a5,10894 <_malloc_r+0x1a0>
   10778:	4711                	li	a4,4
   1077a:	30f76363          	bltu	a4,a5,10a80 <_malloc_r+0x38c>
   1077e:	0064d793          	srli	a5,s1,0x6
   10782:	03978593          	addi	a1,a5,57
   10786:	03878813          	addi	a6,a5,56
   1078a:	00359613          	slli	a2,a1,0x3
   1078e:	80c18993          	addi	s3,gp,-2036 # 1201c <__malloc_av_>
   10792:	964e                	add	a2,a2,s3
   10794:	4240                	lw	s0,4(a2)
   10796:	1661                	addi	a2,a2,-8
   10798:	02860163          	beq	a2,s0,107ba <_malloc_r+0xc6>
   1079c:	453d                	li	a0,15
   1079e:	a039                	j	107ac <_malloc_r+0xb8>
   107a0:	4454                	lw	a3,12(s0)
   107a2:	26075763          	bgez	a4,10a10 <_malloc_r+0x31c>
   107a6:	00d60a63          	beq	a2,a3,107ba <_malloc_r+0xc6>
   107aa:	8436                	mv	s0,a3
   107ac:	405c                	lw	a5,4(s0)
   107ae:	9bf1                	andi	a5,a5,-4
   107b0:	40978733          	sub	a4,a5,s1
   107b4:	fee556e3          	bge	a0,a4,107a0 <_malloc_r+0xac>
   107b8:	85c2                	mv	a1,a6
   107ba:	0109a403          	lw	s0,16(s3)
   107be:	81418893          	addi	a7,gp,-2028 # 12024 <__malloc_av_+0x8>
   107c2:	1f140d63          	beq	s0,a7,109bc <_malloc_r+0x2c8>
   107c6:	405c                	lw	a5,4(s0)
   107c8:	46bd                	li	a3,15
   107ca:	9bf1                	andi	a5,a5,-4
   107cc:	40978733          	sub	a4,a5,s1
   107d0:	32e6c763          	blt	a3,a4,10afe <_malloc_r+0x40a>
   107d4:	0119aa23          	sw	a7,20(s3)
   107d8:	0119a823          	sw	a7,16(s3)
   107dc:	30075263          	bgez	a4,10ae0 <_malloc_r+0x3ec>
   107e0:	1ff00713          	li	a4,511
   107e4:	0049a503          	lw	a0,4(s3)
   107e8:	24f76c63          	bltu	a4,a5,10a40 <_malloc_r+0x34c>
   107ec:	ff87f713          	andi	a4,a5,-8
   107f0:	0721                	addi	a4,a4,8
   107f2:	974e                	add	a4,a4,s3
   107f4:	4314                	lw	a3,0(a4)
   107f6:	0057d613          	srli	a2,a5,0x5
   107fa:	4785                	li	a5,1
   107fc:	00c797b3          	sll	a5,a5,a2
   10800:	8d5d                	or	a0,a0,a5
   10802:	ff870793          	addi	a5,a4,-8
   10806:	c414                	sw	a3,8(s0)
   10808:	c45c                	sw	a5,12(s0)
   1080a:	00a9a223          	sw	a0,4(s3)
   1080e:	c300                	sw	s0,0(a4)
   10810:	c6c0                	sw	s0,12(a3)
   10812:	4025d793          	srai	a5,a1,0x2
   10816:	4605                	li	a2,1
   10818:	00f61633          	sll	a2,a2,a5
   1081c:	08c56363          	bltu	a0,a2,108a2 <_malloc_r+0x1ae>
   10820:	00a677b3          	and	a5,a2,a0
   10824:	ef81                	bnez	a5,1083c <_malloc_r+0x148>
   10826:	0606                	slli	a2,a2,0x1
   10828:	99f1                	andi	a1,a1,-4
   1082a:	00a677b3          	and	a5,a2,a0
   1082e:	0591                	addi	a1,a1,4
   10830:	e791                	bnez	a5,1083c <_malloc_r+0x148>
   10832:	0606                	slli	a2,a2,0x1
   10834:	00a677b3          	and	a5,a2,a0
   10838:	0591                	addi	a1,a1,4
   1083a:	dfe5                	beqz	a5,10832 <_malloc_r+0x13e>
   1083c:	483d                	li	a6,15
   1083e:	00359313          	slli	t1,a1,0x3
   10842:	934e                	add	t1,t1,s3
   10844:	851a                	mv	a0,t1
   10846:	455c                	lw	a5,12(a0)
   10848:	8e2e                	mv	t3,a1
   1084a:	24f50b63          	beq	a0,a5,10aa0 <_malloc_r+0x3ac>
   1084e:	43d8                	lw	a4,4(a5)
   10850:	843e                	mv	s0,a5
   10852:	47dc                	lw	a5,12(a5)
   10854:	9b71                	andi	a4,a4,-4
   10856:	409706b3          	sub	a3,a4,s1
   1085a:	24d84a63          	blt	a6,a3,10aae <_malloc_r+0x3ba>
   1085e:	fe06c6e3          	bltz	a3,1084a <_malloc_r+0x156>
   10862:	9722                	add	a4,a4,s0
   10864:	4354                	lw	a3,4(a4)
   10866:	4410                	lw	a2,8(s0)
   10868:	854a                	mv	a0,s2
   1086a:	0016e693          	ori	a3,a3,1
   1086e:	c354                	sw	a3,4(a4)
   10870:	c65c                	sw	a5,12(a2)
   10872:	c790                	sw	a2,8(a5)
   10874:	7fc000ef          	jal	11070 <__malloc_unlock>
   10878:	00840513          	addi	a0,s0,8
   1087c:	a029                	j	10886 <_malloc_r+0x192>
   1087e:	47b1                	li	a5,12
   10880:	00f92023          	sw	a5,0(s2)
   10884:	4501                	li	a0,0
   10886:	50b2                	lw	ra,44(sp)
   10888:	5422                	lw	s0,40(sp)
   1088a:	5492                	lw	s1,36(sp)
   1088c:	5902                	lw	s2,32(sp)
   1088e:	49f2                	lw	s3,28(sp)
   10890:	6145                	addi	sp,sp,48
   10892:	8082                	ret
   10894:	20000613          	li	a2,512
   10898:	04000593          	li	a1,64
   1089c:	03f00813          	li	a6,63
   108a0:	b5fd                	j	1078e <_malloc_r+0x9a>
   108a2:	0089a403          	lw	s0,8(s3)
   108a6:	c85a                	sw	s6,16(sp)
   108a8:	405c                	lw	a5,4(s0)
   108aa:	ffc7fb13          	andi	s6,a5,-4
   108ae:	009b6763          	bltu	s6,s1,108bc <_malloc_r+0x1c8>
   108b2:	409b0733          	sub	a4,s6,s1
   108b6:	47bd                	li	a5,15
   108b8:	12e7c763          	blt	a5,a4,109e6 <_malloc_r+0x2f2>
   108bc:	c266                	sw	s9,4(sp)
   108be:	d5c18c93          	addi	s9,gp,-676 # 1256c <__malloc_sbrk_base>
   108c2:	ca56                	sw	s5,20(sp)
   108c4:	000ca703          	lw	a4,0(s9)
   108c8:	d781aa83          	lw	s5,-648(gp) # 12588 <__malloc_top_pad>
   108cc:	cc52                	sw	s4,24(sp)
   108ce:	c65e                	sw	s7,12(sp)
   108d0:	57fd                	li	a5,-1
   108d2:	01640a33          	add	s4,s0,s6
   108d6:	9aa6                	add	s5,s5,s1
   108d8:	2cf70063          	beq	a4,a5,10b98 <_malloc_r+0x4a4>
   108dc:	6785                	lui	a5,0x1
   108de:	07bd                	addi	a5,a5,15 # 100f <register_fini-0xf0a5>
   108e0:	9abe                	add	s5,s5,a5
   108e2:	77fd                	lui	a5,0xfffff
   108e4:	00fafab3          	and	s5,s5,a5
   108e8:	85d6                	mv	a1,s5
   108ea:	854a                	mv	a0,s2
   108ec:	786000ef          	jal	11072 <_sbrk_r>
   108f0:	57fd                	li	a5,-1
   108f2:	8baa                	mv	s7,a0
   108f4:	32f50863          	beq	a0,a5,10c24 <_malloc_r+0x530>
   108f8:	c462                	sw	s8,8(sp)
   108fa:	0d456463          	bltu	a0,s4,109c2 <_malloc_r+0x2ce>
   108fe:	edc18c13          	addi	s8,gp,-292 # 126ec <__malloc_current_mallinfo>
   10902:	000c2583          	lw	a1,0(s8)
   10906:	95d6                	add	a1,a1,s5
   10908:	00bc2023          	sw	a1,0(s8)
   1090c:	872e                	mv	a4,a1
   1090e:	30aa0f63          	beq	s4,a0,10c2c <_malloc_r+0x538>
   10912:	000ca683          	lw	a3,0(s9)
   10916:	57fd                	li	a5,-1
   10918:	32f68763          	beq	a3,a5,10c46 <_malloc_r+0x552>
   1091c:	414b87b3          	sub	a5,s7,s4
   10920:	97ba                	add	a5,a5,a4
   10922:	00fc2023          	sw	a5,0(s8)
   10926:	007bfc93          	andi	s9,s7,7
   1092a:	280c8163          	beqz	s9,10bac <_malloc_r+0x4b8>
   1092e:	419b8bb3          	sub	s7,s7,s9
   10932:	6585                	lui	a1,0x1
   10934:	0ba1                	addi	s7,s7,8
   10936:	05a1                	addi	a1,a1,8 # 1008 <register_fini-0xf0ac>
   10938:	9ade                	add	s5,s5,s7
   1093a:	419585b3          	sub	a1,a1,s9
   1093e:	415585b3          	sub	a1,a1,s5
   10942:	05d2                	slli	a1,a1,0x14
   10944:	0145da13          	srli	s4,a1,0x14
   10948:	85d2                	mv	a1,s4
   1094a:	854a                	mv	a0,s2
   1094c:	271d                	jal	11072 <_sbrk_r>
   1094e:	57fd                	li	a5,-1
   10950:	32f50763          	beq	a0,a5,10c7e <_malloc_r+0x58a>
   10954:	41750533          	sub	a0,a0,s7
   10958:	01450ab3          	add	s5,a0,s4
   1095c:	000c2703          	lw	a4,0(s8)
   10960:	0179a423          	sw	s7,8(s3)
   10964:	001ae793          	ori	a5,s5,1
   10968:	00ea05b3          	add	a1,s4,a4
   1096c:	00fba223          	sw	a5,4(s7)
   10970:	00bc2023          	sw	a1,0(s8)
   10974:	03340563          	beq	s0,s3,1099e <_malloc_r+0x2aa>
   10978:	46bd                	li	a3,15
   1097a:	2566f863          	bgeu	a3,s6,10bca <_malloc_r+0x4d6>
   1097e:	4058                	lw	a4,4(s0)
   10980:	ff4b0793          	addi	a5,s6,-12
   10984:	9be1                	andi	a5,a5,-8
   10986:	8b05                	andi	a4,a4,1
   10988:	8f5d                	or	a4,a4,a5
   1098a:	c058                	sw	a4,4(s0)
   1098c:	4615                	li	a2,5
   1098e:	00f40733          	add	a4,s0,a5
   10992:	c350                	sw	a2,4(a4)
   10994:	c710                	sw	a2,8(a4)
   10996:	1ef6e863          	bltu	a3,a5,10b86 <_malloc_r+0x492>
   1099a:	004ba783          	lw	a5,4(s7)
   1099e:	d7418713          	addi	a4,gp,-652 # 12584 <__malloc_max_sbrked_mem>
   109a2:	4314                	lw	a3,0(a4)
   109a4:	00b6f363          	bgeu	a3,a1,109aa <_malloc_r+0x2b6>
   109a8:	c30c                	sw	a1,0(a4)
   109aa:	d7018713          	addi	a4,gp,-656 # 12580 <__malloc_max_total_mem>
   109ae:	4314                	lw	a3,0(a4)
   109b0:	00b6f363          	bgeu	a3,a1,109b6 <_malloc_r+0x2c2>
   109b4:	c30c                	sw	a1,0(a4)
   109b6:	4c22                	lw	s8,8(sp)
   109b8:	845e                	mv	s0,s7
   109ba:	a811                	j	109ce <_malloc_r+0x2da>
   109bc:	0049a503          	lw	a0,4(s3)
   109c0:	bd89                	j	10812 <_malloc_r+0x11e>
   109c2:	25340963          	beq	s0,s3,10c14 <_malloc_r+0x520>
   109c6:	0089a403          	lw	s0,8(s3)
   109ca:	4c22                	lw	s8,8(sp)
   109cc:	405c                	lw	a5,4(s0)
   109ce:	9bf1                	andi	a5,a5,-4
   109d0:	40978733          	sub	a4,a5,s1
   109d4:	1e97ef63          	bltu	a5,s1,10bd2 <_malloc_r+0x4de>
   109d8:	47bd                	li	a5,15
   109da:	1ee7dc63          	bge	a5,a4,10bd2 <_malloc_r+0x4de>
   109de:	4a62                	lw	s4,24(sp)
   109e0:	4ad2                	lw	s5,20(sp)
   109e2:	4bb2                	lw	s7,12(sp)
   109e4:	4c92                	lw	s9,4(sp)
   109e6:	0014e793          	ori	a5,s1,1
   109ea:	c05c                	sw	a5,4(s0)
   109ec:	94a2                	add	s1,s1,s0
   109ee:	0099a423          	sw	s1,8(s3)
   109f2:	00176713          	ori	a4,a4,1
   109f6:	854a                	mv	a0,s2
   109f8:	c0d8                	sw	a4,4(s1)
   109fa:	2d9d                	jal	11070 <__malloc_unlock>
   109fc:	50b2                	lw	ra,44(sp)
   109fe:	00840513          	addi	a0,s0,8
   10a02:	5422                	lw	s0,40(sp)
   10a04:	4b42                	lw	s6,16(sp)
   10a06:	5492                	lw	s1,36(sp)
   10a08:	5902                	lw	s2,32(sp)
   10a0a:	49f2                	lw	s3,28(sp)
   10a0c:	6145                	addi	sp,sp,48
   10a0e:	8082                	ret
   10a10:	4410                	lw	a2,8(s0)
   10a12:	97a2                	add	a5,a5,s0
   10a14:	43d8                	lw	a4,4(a5)
   10a16:	c654                	sw	a3,12(a2)
   10a18:	c690                	sw	a2,8(a3)
   10a1a:	00176713          	ori	a4,a4,1
   10a1e:	854a                	mv	a0,s2
   10a20:	c3d8                	sw	a4,4(a5)
   10a22:	25b9                	jal	11070 <__malloc_unlock>
   10a24:	50b2                	lw	ra,44(sp)
   10a26:	00840513          	addi	a0,s0,8
   10a2a:	5422                	lw	s0,40(sp)
   10a2c:	5492                	lw	s1,36(sp)
   10a2e:	5902                	lw	s2,32(sp)
   10a30:	49f2                	lw	s3,28(sp)
   10a32:	6145                	addi	sp,sp,48
   10a34:	8082                	ret
   10a36:	47c0                	lw	s0,12(a5)
   10a38:	0589                	addi	a1,a1,2
   10a3a:	d88780e3          	beq	a5,s0,107ba <_malloc_r+0xc6>
   10a3e:	b1f5                	j	1072a <_malloc_r+0x36>
   10a40:	0097d713          	srli	a4,a5,0x9
   10a44:	4691                	li	a3,4
   10a46:	0ee6f263          	bgeu	a3,a4,10b2a <_malloc_r+0x436>
   10a4a:	46d1                	li	a3,20
   10a4c:	18e6eb63          	bltu	a3,a4,10be2 <_malloc_r+0x4ee>
   10a50:	05c70613          	addi	a2,a4,92
   10a54:	060e                	slli	a2,a2,0x3
   10a56:	05b70693          	addi	a3,a4,91
   10a5a:	964e                	add	a2,a2,s3
   10a5c:	4218                	lw	a4,0(a2)
   10a5e:	1661                	addi	a2,a2,-8
   10a60:	00e61663          	bne	a2,a4,10a6c <_malloc_r+0x378>
   10a64:	aa25                	j	10b9c <_malloc_r+0x4a8>
   10a66:	4718                	lw	a4,8(a4)
   10a68:	00e60663          	beq	a2,a4,10a74 <_malloc_r+0x380>
   10a6c:	4354                	lw	a3,4(a4)
   10a6e:	9af1                	andi	a3,a3,-4
   10a70:	fed7ebe3          	bltu	a5,a3,10a66 <_malloc_r+0x372>
   10a74:	4750                	lw	a2,12(a4)
   10a76:	c450                	sw	a2,12(s0)
   10a78:	c418                	sw	a4,8(s0)
   10a7a:	c600                	sw	s0,8(a2)
   10a7c:	c740                	sw	s0,12(a4)
   10a7e:	bb51                	j	10812 <_malloc_r+0x11e>
   10a80:	4751                	li	a4,20
   10a82:	0af77c63          	bgeu	a4,a5,10b3a <_malloc_r+0x446>
   10a86:	05400713          	li	a4,84
   10a8a:	16f76863          	bltu	a4,a5,10bfa <_malloc_r+0x506>
   10a8e:	00c4d793          	srli	a5,s1,0xc
   10a92:	06f78593          	addi	a1,a5,111 # fffff06f <__BSS_END__+0xfffec7cb>
   10a96:	06e78813          	addi	a6,a5,110
   10a9a:	00359613          	slli	a2,a1,0x3
   10a9e:	b9c5                	j	1078e <_malloc_r+0x9a>
   10aa0:	0e05                	addi	t3,t3,1
   10aa2:	003e7793          	andi	a5,t3,3
   10aa6:	0521                	addi	a0,a0,8
   10aa8:	c7cd                	beqz	a5,10b52 <_malloc_r+0x45e>
   10aaa:	455c                	lw	a5,12(a0)
   10aac:	bb79                	j	1084a <_malloc_r+0x156>
   10aae:	4410                	lw	a2,8(s0)
   10ab0:	0014e593          	ori	a1,s1,1
   10ab4:	c04c                	sw	a1,4(s0)
   10ab6:	c65c                	sw	a5,12(a2)
   10ab8:	c790                	sw	a2,8(a5)
   10aba:	94a2                	add	s1,s1,s0
   10abc:	0099aa23          	sw	s1,20(s3)
   10ac0:	0099a823          	sw	s1,16(s3)
   10ac4:	0016e793          	ori	a5,a3,1
   10ac8:	9722                	add	a4,a4,s0
   10aca:	0114a623          	sw	a7,12(s1)
   10ace:	0114a423          	sw	a7,8(s1)
   10ad2:	c0dc                	sw	a5,4(s1)
   10ad4:	854a                	mv	a0,s2
   10ad6:	c314                	sw	a3,0(a4)
   10ad8:	2b61                	jal	11070 <__malloc_unlock>
   10ada:	00840513          	addi	a0,s0,8
   10ade:	b365                	j	10886 <_malloc_r+0x192>
   10ae0:	97a2                	add	a5,a5,s0
   10ae2:	43d8                	lw	a4,4(a5)
   10ae4:	854a                	mv	a0,s2
   10ae6:	00176713          	ori	a4,a4,1
   10aea:	c3d8                	sw	a4,4(a5)
   10aec:	2351                	jal	11070 <__malloc_unlock>
   10aee:	00840513          	addi	a0,s0,8
   10af2:	bb51                	j	10886 <_malloc_r+0x192>
   10af4:	0034d593          	srli	a1,s1,0x3
   10af8:	00848793          	addi	a5,s1,8
   10afc:	b939                	j	1071a <_malloc_r+0x26>
   10afe:	0014e693          	ori	a3,s1,1
   10b02:	c054                	sw	a3,4(s0)
   10b04:	94a2                	add	s1,s1,s0
   10b06:	0099aa23          	sw	s1,20(s3)
   10b0a:	0099a823          	sw	s1,16(s3)
   10b0e:	00176693          	ori	a3,a4,1
   10b12:	97a2                	add	a5,a5,s0
   10b14:	0114a623          	sw	a7,12(s1)
   10b18:	0114a423          	sw	a7,8(s1)
   10b1c:	c0d4                	sw	a3,4(s1)
   10b1e:	854a                	mv	a0,s2
   10b20:	c398                	sw	a4,0(a5)
   10b22:	23b9                	jal	11070 <__malloc_unlock>
   10b24:	00840513          	addi	a0,s0,8
   10b28:	bbb9                	j	10886 <_malloc_r+0x192>
   10b2a:	0067d713          	srli	a4,a5,0x6
   10b2e:	03970613          	addi	a2,a4,57
   10b32:	060e                	slli	a2,a2,0x3
   10b34:	03870693          	addi	a3,a4,56
   10b38:	b70d                	j	10a5a <_malloc_r+0x366>
   10b3a:	05c78593          	addi	a1,a5,92
   10b3e:	05b78813          	addi	a6,a5,91
   10b42:	00359613          	slli	a2,a1,0x3
   10b46:	b1a1                	j	1078e <_malloc_r+0x9a>
   10b48:	00832783          	lw	a5,8(t1)
   10b4c:	15fd                	addi	a1,a1,-1
   10b4e:	16679663          	bne	a5,t1,10cba <_malloc_r+0x5c6>
   10b52:	0035f793          	andi	a5,a1,3
   10b56:	1361                	addi	t1,t1,-8
   10b58:	fbe5                	bnez	a5,10b48 <_malloc_r+0x454>
   10b5a:	0049a703          	lw	a4,4(s3)
   10b5e:	fff64793          	not	a5,a2
   10b62:	8ff9                	and	a5,a5,a4
   10b64:	00f9a223          	sw	a5,4(s3)
   10b68:	0606                	slli	a2,a2,0x1
   10b6a:	d2c7ece3          	bltu	a5,a2,108a2 <_malloc_r+0x1ae>
   10b6e:	d2060ae3          	beqz	a2,108a2 <_malloc_r+0x1ae>
   10b72:	00f67733          	and	a4,a2,a5
   10b76:	e711                	bnez	a4,10b82 <_malloc_r+0x48e>
   10b78:	0606                	slli	a2,a2,0x1
   10b7a:	00f67733          	and	a4,a2,a5
   10b7e:	0e11                	addi	t3,t3,4
   10b80:	df65                	beqz	a4,10b78 <_malloc_r+0x484>
   10b82:	85f2                	mv	a1,t3
   10b84:	b96d                	j	1083e <_malloc_r+0x14a>
   10b86:	00840593          	addi	a1,s0,8
   10b8a:	854a                	mv	a0,s2
   10b8c:	2ad5                	jal	10d80 <_free_r>
   10b8e:	000c2583          	lw	a1,0(s8)
   10b92:	0089ab83          	lw	s7,8(s3)
   10b96:	b511                	j	1099a <_malloc_r+0x2a6>
   10b98:	0ac1                	addi	s5,s5,16
   10b9a:	b3b9                	j	108e8 <_malloc_r+0x1f4>
   10b9c:	8689                	srai	a3,a3,0x2
   10b9e:	4785                	li	a5,1
   10ba0:	00d797b3          	sll	a5,a5,a3
   10ba4:	8d5d                	or	a0,a0,a5
   10ba6:	00a9a223          	sw	a0,4(s3)
   10baa:	b5f1                	j	10a76 <_malloc_r+0x382>
   10bac:	015b85b3          	add	a1,s7,s5
   10bb0:	40b005b3          	neg	a1,a1
   10bb4:	05d2                	slli	a1,a1,0x14
   10bb6:	0145da13          	srli	s4,a1,0x14
   10bba:	85d2                	mv	a1,s4
   10bbc:	854a                	mv	a0,s2
   10bbe:	2955                	jal	11072 <_sbrk_r>
   10bc0:	57fd                	li	a5,-1
   10bc2:	d8f519e3          	bne	a0,a5,10954 <_malloc_r+0x260>
   10bc6:	4a01                	li	s4,0
   10bc8:	bb51                	j	1095c <_malloc_r+0x268>
   10bca:	4c22                	lw	s8,8(sp)
   10bcc:	4785                	li	a5,1
   10bce:	00fba223          	sw	a5,4(s7)
   10bd2:	854a                	mv	a0,s2
   10bd4:	2971                	jal	11070 <__malloc_unlock>
   10bd6:	4a62                	lw	s4,24(sp)
   10bd8:	4ad2                	lw	s5,20(sp)
   10bda:	4b42                	lw	s6,16(sp)
   10bdc:	4bb2                	lw	s7,12(sp)
   10bde:	4c92                	lw	s9,4(sp)
   10be0:	b155                	j	10884 <_malloc_r+0x190>
   10be2:	05400693          	li	a3,84
   10be6:	06e6e363          	bltu	a3,a4,10c4c <_malloc_r+0x558>
   10bea:	00c7d713          	srli	a4,a5,0xc
   10bee:	06f70613          	addi	a2,a4,111
   10bf2:	060e                	slli	a2,a2,0x3
   10bf4:	06e70693          	addi	a3,a4,110
   10bf8:	b58d                	j	10a5a <_malloc_r+0x366>
   10bfa:	15400713          	li	a4,340
   10bfe:	06f76363          	bltu	a4,a5,10c64 <_malloc_r+0x570>
   10c02:	00f4d793          	srli	a5,s1,0xf
   10c06:	07878593          	addi	a1,a5,120
   10c0a:	07778813          	addi	a6,a5,119
   10c0e:	00359613          	slli	a2,a1,0x3
   10c12:	beb5                	j	1078e <_malloc_r+0x9a>
   10c14:	edc18c13          	addi	s8,gp,-292 # 126ec <__malloc_current_mallinfo>
   10c18:	000c2703          	lw	a4,0(s8)
   10c1c:	9756                	add	a4,a4,s5
   10c1e:	00ec2023          	sw	a4,0(s8)
   10c22:	b9c5                	j	10912 <_malloc_r+0x21e>
   10c24:	0089a403          	lw	s0,8(s3)
   10c28:	405c                	lw	a5,4(s0)
   10c2a:	b355                	j	109ce <_malloc_r+0x2da>
   10c2c:	01451793          	slli	a5,a0,0x14
   10c30:	ce0791e3          	bnez	a5,10912 <_malloc_r+0x21e>
   10c34:	0089ab83          	lw	s7,8(s3)
   10c38:	015b07b3          	add	a5,s6,s5
   10c3c:	0017e793          	ori	a5,a5,1
   10c40:	00fba223          	sw	a5,4(s7)
   10c44:	bba9                	j	1099e <_malloc_r+0x2aa>
   10c46:	017ca023          	sw	s7,0(s9)
   10c4a:	b9f1                	j	10926 <_malloc_r+0x232>
   10c4c:	15400693          	li	a3,340
   10c50:	02e6ed63          	bltu	a3,a4,10c8a <_malloc_r+0x596>
   10c54:	00f7d713          	srli	a4,a5,0xf
   10c58:	07870613          	addi	a2,a4,120
   10c5c:	060e                	slli	a2,a2,0x3
   10c5e:	07770693          	addi	a3,a4,119
   10c62:	bbe5                	j	10a5a <_malloc_r+0x366>
   10c64:	55400713          	li	a4,1364
   10c68:	02f76d63          	bltu	a4,a5,10ca2 <_malloc_r+0x5ae>
   10c6c:	0124d793          	srli	a5,s1,0x12
   10c70:	07d78593          	addi	a1,a5,125
   10c74:	07c78813          	addi	a6,a5,124
   10c78:	00359613          	slli	a2,a1,0x3
   10c7c:	be09                	j	1078e <_malloc_r+0x9a>
   10c7e:	1ce1                	addi	s9,s9,-8
   10c80:	9ae6                	add	s5,s5,s9
   10c82:	417a8ab3          	sub	s5,s5,s7
   10c86:	4a01                	li	s4,0
   10c88:	b9d1                	j	1095c <_malloc_r+0x268>
   10c8a:	55400693          	li	a3,1364
   10c8e:	02e6e163          	bltu	a3,a4,10cb0 <_malloc_r+0x5bc>
   10c92:	0127d713          	srli	a4,a5,0x12
   10c96:	07d70613          	addi	a2,a4,125
   10c9a:	060e                	slli	a2,a2,0x3
   10c9c:	07c70693          	addi	a3,a4,124
   10ca0:	bb6d                	j	10a5a <_malloc_r+0x366>
   10ca2:	3f800613          	li	a2,1016
   10ca6:	07f00593          	li	a1,127
   10caa:	07e00813          	li	a6,126
   10cae:	b4c5                	j	1078e <_malloc_r+0x9a>
   10cb0:	3f800613          	li	a2,1016
   10cb4:	07e00693          	li	a3,126
   10cb8:	b34d                	j	10a5a <_malloc_r+0x366>
   10cba:	0049a783          	lw	a5,4(s3)
   10cbe:	b56d                	j	10b68 <_malloc_r+0x474>

00010cc0 <_malloc_trim_r>:
   10cc0:	1101                	addi	sp,sp,-32
   10cc2:	cc22                	sw	s0,24(sp)
   10cc4:	ca26                	sw	s1,20(sp)
   10cc6:	c84a                	sw	s2,16(sp)
   10cc8:	c64e                	sw	s3,12(sp)
   10cca:	c452                	sw	s4,8(sp)
   10ccc:	89ae                	mv	s3,a1
   10cce:	ce06                	sw	ra,28(sp)
   10cd0:	892a                	mv	s2,a0
   10cd2:	00001a17          	auipc	s4,0x1
   10cd6:	34aa0a13          	addi	s4,s4,842 # 1201c <__malloc_av_>
   10cda:	2e51                	jal	1106e <__malloc_lock>
   10cdc:	008a2783          	lw	a5,8(s4)
   10ce0:	6405                	lui	s0,0x1
   10ce2:	143d                	addi	s0,s0,-17 # fef <register_fini-0xf0c5>
   10ce4:	43c4                	lw	s1,4(a5)
   10ce6:	6785                	lui	a5,0x1
   10ce8:	98f1                	andi	s1,s1,-4
   10cea:	9426                	add	s0,s0,s1
   10cec:	41340433          	sub	s0,s0,s3
   10cf0:	8031                	srli	s0,s0,0xc
   10cf2:	147d                	addi	s0,s0,-1
   10cf4:	0432                	slli	s0,s0,0xc
   10cf6:	00f44a63          	blt	s0,a5,10d0a <_malloc_trim_r+0x4a>
   10cfa:	4581                	li	a1,0
   10cfc:	854a                	mv	a0,s2
   10cfe:	2e95                	jal	11072 <_sbrk_r>
   10d00:	008a2783          	lw	a5,8(s4)
   10d04:	97a6                	add	a5,a5,s1
   10d06:	00f50d63          	beq	a0,a5,10d20 <_malloc_trim_r+0x60>
   10d0a:	854a                	mv	a0,s2
   10d0c:	2695                	jal	11070 <__malloc_unlock>
   10d0e:	40f2                	lw	ra,28(sp)
   10d10:	4462                	lw	s0,24(sp)
   10d12:	44d2                	lw	s1,20(sp)
   10d14:	4942                	lw	s2,16(sp)
   10d16:	49b2                	lw	s3,12(sp)
   10d18:	4a22                	lw	s4,8(sp)
   10d1a:	4501                	li	a0,0
   10d1c:	6105                	addi	sp,sp,32
   10d1e:	8082                	ret
   10d20:	408005b3          	neg	a1,s0
   10d24:	854a                	mv	a0,s2
   10d26:	26b1                	jal	11072 <_sbrk_r>
   10d28:	57fd                	li	a5,-1
   10d2a:	02f50863          	beq	a0,a5,10d5a <_malloc_trim_r+0x9a>
   10d2e:	edc18713          	addi	a4,gp,-292 # 126ec <__malloc_current_mallinfo>
   10d32:	008a2683          	lw	a3,8(s4)
   10d36:	431c                	lw	a5,0(a4)
   10d38:	8c81                	sub	s1,s1,s0
   10d3a:	0014e493          	ori	s1,s1,1
   10d3e:	854a                	mv	a0,s2
   10d40:	8f81                	sub	a5,a5,s0
   10d42:	c2c4                	sw	s1,4(a3)
   10d44:	c31c                	sw	a5,0(a4)
   10d46:	262d                	jal	11070 <__malloc_unlock>
   10d48:	40f2                	lw	ra,28(sp)
   10d4a:	4462                	lw	s0,24(sp)
   10d4c:	44d2                	lw	s1,20(sp)
   10d4e:	4942                	lw	s2,16(sp)
   10d50:	49b2                	lw	s3,12(sp)
   10d52:	4a22                	lw	s4,8(sp)
   10d54:	4505                	li	a0,1
   10d56:	6105                	addi	sp,sp,32
   10d58:	8082                	ret
   10d5a:	4581                	li	a1,0
   10d5c:	854a                	mv	a0,s2
   10d5e:	2e11                	jal	11072 <_sbrk_r>
   10d60:	008a2703          	lw	a4,8(s4)
   10d64:	46bd                	li	a3,15
   10d66:	40e507b3          	sub	a5,a0,a4
   10d6a:	faf6d0e3          	bge	a3,a5,10d0a <_malloc_trim_r+0x4a>
   10d6e:	d5c1a683          	lw	a3,-676(gp) # 1256c <__malloc_sbrk_base>
   10d72:	0017e793          	ori	a5,a5,1
   10d76:	c35c                	sw	a5,4(a4)
   10d78:	8d15                	sub	a0,a0,a3
   10d7a:	eca1ae23          	sw	a0,-292(gp) # 126ec <__malloc_current_mallinfo>
   10d7e:	b771                	j	10d0a <_malloc_trim_r+0x4a>

00010d80 <_free_r>:
   10d80:	cde9                	beqz	a1,10e5a <_free_r+0xda>
   10d82:	1141                	addi	sp,sp,-16
   10d84:	c422                	sw	s0,8(sp)
   10d86:	c226                	sw	s1,4(sp)
   10d88:	842e                	mv	s0,a1
   10d8a:	84aa                	mv	s1,a0
   10d8c:	c606                	sw	ra,12(sp)
   10d8e:	24c5                	jal	1106e <__malloc_lock>
   10d90:	ffc42583          	lw	a1,-4(s0)
   10d94:	ff840713          	addi	a4,s0,-8
   10d98:	00001817          	auipc	a6,0x1
   10d9c:	28480813          	addi	a6,a6,644 # 1201c <__malloc_av_>
   10da0:	ffe5f793          	andi	a5,a1,-2
   10da4:	00f70633          	add	a2,a4,a5
   10da8:	4254                	lw	a3,4(a2)
   10daa:	00882503          	lw	a0,8(a6)
   10dae:	0015f893          	andi	a7,a1,1
   10db2:	9af1                	andi	a3,a3,-4
   10db4:	10c50d63          	beq	a0,a2,10ece <_free_r+0x14e>
   10db8:	c254                	sw	a3,4(a2)
   10dba:	00d60533          	add	a0,a2,a3
   10dbe:	4148                	lw	a0,4(a0)
   10dc0:	8905                	andi	a0,a0,1
   10dc2:	06089963          	bnez	a7,10e34 <_free_r+0xb4>
   10dc6:	ff842303          	lw	t1,-8(s0)
   10dca:	00001897          	auipc	a7,0x1
   10dce:	25a88893          	addi	a7,a7,602 # 12024 <__malloc_av_+0x8>
   10dd2:	40670733          	sub	a4,a4,t1
   10dd6:	470c                	lw	a1,8(a4)
   10dd8:	979a                	add	a5,a5,t1
   10dda:	0d158e63          	beq	a1,a7,10eb6 <_free_r+0x136>
   10dde:	00c72303          	lw	t1,12(a4)
   10de2:	0065a623          	sw	t1,12(a1)
   10de6:	00b32423          	sw	a1,8(t1)
   10dea:	10050b63          	beqz	a0,10f00 <_free_r+0x180>
   10dee:	0017e693          	ori	a3,a5,1
   10df2:	c354                	sw	a3,4(a4)
   10df4:	c21c                	sw	a5,0(a2)
   10df6:	1ff00693          	li	a3,511
   10dfa:	06f6ea63          	bltu	a3,a5,10e6e <_free_r+0xee>
   10dfe:	ff87f693          	andi	a3,a5,-8
   10e02:	06a1                	addi	a3,a3,8
   10e04:	00482583          	lw	a1,4(a6)
   10e08:	96c2                	add	a3,a3,a6
   10e0a:	4290                	lw	a2,0(a3)
   10e0c:	0057d513          	srli	a0,a5,0x5
   10e10:	4785                	li	a5,1
   10e12:	00a797b3          	sll	a5,a5,a0
   10e16:	8fcd                	or	a5,a5,a1
   10e18:	ff868593          	addi	a1,a3,-8
   10e1c:	c710                	sw	a2,8(a4)
   10e1e:	c74c                	sw	a1,12(a4)
   10e20:	00f82223          	sw	a5,4(a6)
   10e24:	c298                	sw	a4,0(a3)
   10e26:	c658                	sw	a4,12(a2)
   10e28:	4422                	lw	s0,8(sp)
   10e2a:	40b2                	lw	ra,12(sp)
   10e2c:	8526                	mv	a0,s1
   10e2e:	4492                	lw	s1,4(sp)
   10e30:	0141                	addi	sp,sp,16
   10e32:	ac3d                	j	11070 <__malloc_unlock>
   10e34:	e505                	bnez	a0,10e5c <_free_r+0xdc>
   10e36:	97b6                	add	a5,a5,a3
   10e38:	00001897          	auipc	a7,0x1
   10e3c:	1ec88893          	addi	a7,a7,492 # 12024 <__malloc_av_+0x8>
   10e40:	4614                	lw	a3,8(a2)
   10e42:	0017e513          	ori	a0,a5,1
   10e46:	00f705b3          	add	a1,a4,a5
   10e4a:	0f168763          	beq	a3,a7,10f38 <_free_r+0x1b8>
   10e4e:	4650                	lw	a2,12(a2)
   10e50:	c6d0                	sw	a2,12(a3)
   10e52:	c614                	sw	a3,8(a2)
   10e54:	c348                	sw	a0,4(a4)
   10e56:	c19c                	sw	a5,0(a1)
   10e58:	bf79                	j	10df6 <_free_r+0x76>
   10e5a:	8082                	ret
   10e5c:	0015e593          	ori	a1,a1,1
   10e60:	feb42e23          	sw	a1,-4(s0)
   10e64:	c21c                	sw	a5,0(a2)
   10e66:	1ff00693          	li	a3,511
   10e6a:	f8f6fae3          	bgeu	a3,a5,10dfe <_free_r+0x7e>
   10e6e:	0097d693          	srli	a3,a5,0x9
   10e72:	4611                	li	a2,4
   10e74:	08d66863          	bltu	a2,a3,10f04 <_free_r+0x184>
   10e78:	0067d693          	srli	a3,a5,0x6
   10e7c:	03968593          	addi	a1,a3,57
   10e80:	058e                	slli	a1,a1,0x3
   10e82:	03868613          	addi	a2,a3,56
   10e86:	95c2                	add	a1,a1,a6
   10e88:	4194                	lw	a3,0(a1)
   10e8a:	15e1                	addi	a1,a1,-8
   10e8c:	00d59663          	bne	a1,a3,10e98 <_free_r+0x118>
   10e90:	a87d                	j	10f4e <_free_r+0x1ce>
   10e92:	4694                	lw	a3,8(a3)
   10e94:	00d58663          	beq	a1,a3,10ea0 <_free_r+0x120>
   10e98:	42d0                	lw	a2,4(a3)
   10e9a:	9a71                	andi	a2,a2,-4
   10e9c:	fec7ebe3          	bltu	a5,a2,10e92 <_free_r+0x112>
   10ea0:	46cc                	lw	a1,12(a3)
   10ea2:	c74c                	sw	a1,12(a4)
   10ea4:	c714                	sw	a3,8(a4)
   10ea6:	4422                	lw	s0,8(sp)
   10ea8:	40b2                	lw	ra,12(sp)
   10eaa:	c598                	sw	a4,8(a1)
   10eac:	8526                	mv	a0,s1
   10eae:	4492                	lw	s1,4(sp)
   10eb0:	c6d8                	sw	a4,12(a3)
   10eb2:	0141                	addi	sp,sp,16
   10eb4:	aa75                	j	11070 <__malloc_unlock>
   10eb6:	e535                	bnez	a0,10f22 <_free_r+0x1a2>
   10eb8:	464c                	lw	a1,12(a2)
   10eba:	4610                	lw	a2,8(a2)
   10ebc:	96be                	add	a3,a3,a5
   10ebe:	0016e793          	ori	a5,a3,1
   10ec2:	c64c                	sw	a1,12(a2)
   10ec4:	c590                	sw	a2,8(a1)
   10ec6:	c35c                	sw	a5,4(a4)
   10ec8:	9736                	add	a4,a4,a3
   10eca:	c314                	sw	a3,0(a4)
   10ecc:	bfb1                	j	10e28 <_free_r+0xa8>
   10ece:	96be                	add	a3,a3,a5
   10ed0:	00089a63          	bnez	a7,10ee4 <_free_r+0x164>
   10ed4:	ff842583          	lw	a1,-8(s0)
   10ed8:	8f0d                	sub	a4,a4,a1
   10eda:	475c                	lw	a5,12(a4)
   10edc:	4710                	lw	a2,8(a4)
   10ede:	96ae                	add	a3,a3,a1
   10ee0:	c65c                	sw	a5,12(a2)
   10ee2:	c790                	sw	a2,8(a5)
   10ee4:	0016e613          	ori	a2,a3,1
   10ee8:	d601a783          	lw	a5,-672(gp) # 12570 <__malloc_trim_threshold>
   10eec:	c350                	sw	a2,4(a4)
   10eee:	00e82423          	sw	a4,8(a6)
   10ef2:	f2f6ebe3          	bltu	a3,a5,10e28 <_free_r+0xa8>
   10ef6:	d781a583          	lw	a1,-648(gp) # 12588 <__malloc_top_pad>
   10efa:	8526                	mv	a0,s1
   10efc:	33d1                	jal	10cc0 <_malloc_trim_r>
   10efe:	b72d                	j	10e28 <_free_r+0xa8>
   10f00:	97b6                	add	a5,a5,a3
   10f02:	bf3d                	j	10e40 <_free_r+0xc0>
   10f04:	4651                	li	a2,20
   10f06:	02d67363          	bgeu	a2,a3,10f2c <_free_r+0x1ac>
   10f0a:	05400613          	li	a2,84
   10f0e:	04d66a63          	bltu	a2,a3,10f62 <_free_r+0x1e2>
   10f12:	00c7d693          	srli	a3,a5,0xc
   10f16:	06f68593          	addi	a1,a3,111
   10f1a:	058e                	slli	a1,a1,0x3
   10f1c:	06e68613          	addi	a2,a3,110
   10f20:	b79d                	j	10e86 <_free_r+0x106>
   10f22:	0017e693          	ori	a3,a5,1
   10f26:	c354                	sw	a3,4(a4)
   10f28:	c21c                	sw	a5,0(a2)
   10f2a:	bdfd                	j	10e28 <_free_r+0xa8>
   10f2c:	05c68593          	addi	a1,a3,92
   10f30:	058e                	slli	a1,a1,0x3
   10f32:	05b68613          	addi	a2,a3,91
   10f36:	bf81                	j	10e86 <_free_r+0x106>
   10f38:	00e82a23          	sw	a4,20(a6)
   10f3c:	00e82823          	sw	a4,16(a6)
   10f40:	01172623          	sw	a7,12(a4)
   10f44:	01172423          	sw	a7,8(a4)
   10f48:	c348                	sw	a0,4(a4)
   10f4a:	c19c                	sw	a5,0(a1)
   10f4c:	bdf1                	j	10e28 <_free_r+0xa8>
   10f4e:	00482503          	lw	a0,4(a6)
   10f52:	8609                	srai	a2,a2,0x2
   10f54:	4785                	li	a5,1
   10f56:	00c797b3          	sll	a5,a5,a2
   10f5a:	8fc9                	or	a5,a5,a0
   10f5c:	00f82223          	sw	a5,4(a6)
   10f60:	b789                	j	10ea2 <_free_r+0x122>
   10f62:	15400613          	li	a2,340
   10f66:	00d66a63          	bltu	a2,a3,10f7a <_free_r+0x1fa>
   10f6a:	00f7d693          	srli	a3,a5,0xf
   10f6e:	07868593          	addi	a1,a3,120
   10f72:	058e                	slli	a1,a1,0x3
   10f74:	07768613          	addi	a2,a3,119
   10f78:	b739                	j	10e86 <_free_r+0x106>
   10f7a:	55400613          	li	a2,1364
   10f7e:	00d66a63          	bltu	a2,a3,10f92 <_free_r+0x212>
   10f82:	0127d693          	srli	a3,a5,0x12
   10f86:	07d68593          	addi	a1,a3,125
   10f8a:	058e                	slli	a1,a1,0x3
   10f8c:	07c68613          	addi	a2,a3,124
   10f90:	bddd                	j	10e86 <_free_r+0x106>
   10f92:	3f800593          	li	a1,1016
   10f96:	07e00613          	li	a2,126
   10f9a:	b5f5                	j	10e86 <_free_r+0x106>

00010f9c <__call_exitprocs>:
   10f9c:	7179                	addi	sp,sp,-48
   10f9e:	cc52                	sw	s4,24(sp)
   10fa0:	d7c18a13          	addi	s4,gp,-644 # 1258c <__atexit>
   10fa4:	d04a                	sw	s2,32(sp)
   10fa6:	000a2903          	lw	s2,0(s4)
   10faa:	d606                	sw	ra,44(sp)
   10fac:	04090663          	beqz	s2,10ff8 <__call_exitprocs+0x5c>
   10fb0:	ce4e                	sw	s3,28(sp)
   10fb2:	ca56                	sw	s5,20(sp)
   10fb4:	c85a                	sw	s6,16(sp)
   10fb6:	c65e                	sw	s7,12(sp)
   10fb8:	d422                	sw	s0,40(sp)
   10fba:	d226                	sw	s1,36(sp)
   10fbc:	c462                	sw	s8,8(sp)
   10fbe:	8b2a                	mv	s6,a0
   10fc0:	8bae                	mv	s7,a1
   10fc2:	59fd                	li	s3,-1
   10fc4:	4a85                	li	s5,1
   10fc6:	00492483          	lw	s1,4(s2)
   10fca:	fff48413          	addi	s0,s1,-1
   10fce:	00044e63          	bltz	s0,10fea <__call_exitprocs+0x4e>
   10fd2:	048a                	slli	s1,s1,0x2
   10fd4:	94ca                	add	s1,s1,s2
   10fd6:	020b8663          	beqz	s7,11002 <__call_exitprocs+0x66>
   10fda:	1044a783          	lw	a5,260(s1)
   10fde:	03778263          	beq	a5,s7,11002 <__call_exitprocs+0x66>
   10fe2:	147d                	addi	s0,s0,-1
   10fe4:	14f1                	addi	s1,s1,-4
   10fe6:	ff341ae3          	bne	s0,s3,10fda <__call_exitprocs+0x3e>
   10fea:	5422                	lw	s0,40(sp)
   10fec:	5492                	lw	s1,36(sp)
   10fee:	49f2                	lw	s3,28(sp)
   10ff0:	4ad2                	lw	s5,20(sp)
   10ff2:	4b42                	lw	s6,16(sp)
   10ff4:	4bb2                	lw	s7,12(sp)
   10ff6:	4c22                	lw	s8,8(sp)
   10ff8:	50b2                	lw	ra,44(sp)
   10ffa:	5902                	lw	s2,32(sp)
   10ffc:	4a62                	lw	s4,24(sp)
   10ffe:	6145                	addi	sp,sp,48
   11000:	8082                	ret
   11002:	00492783          	lw	a5,4(s2)
   11006:	40d4                	lw	a3,4(s1)
   11008:	17fd                	addi	a5,a5,-1 # fff <register_fini-0xf0b5>
   1100a:	04878c63          	beq	a5,s0,11062 <__call_exitprocs+0xc6>
   1100e:	0004a223          	sw	zero,4(s1)
   11012:	c295                	beqz	a3,11036 <__call_exitprocs+0x9a>
   11014:	18892783          	lw	a5,392(s2)
   11018:	008a9733          	sll	a4,s5,s0
   1101c:	00492c03          	lw	s8,4(s2)
   11020:	8ff9                	and	a5,a5,a4
   11022:	ef99                	bnez	a5,11040 <__call_exitprocs+0xa4>
   11024:	9682                	jalr	a3
   11026:	00492703          	lw	a4,4(s2)
   1102a:	000a2783          	lw	a5,0(s4)
   1102e:	03871763          	bne	a4,s8,1105c <__call_exitprocs+0xc0>
   11032:	03279563          	bne	a5,s2,1105c <__call_exitprocs+0xc0>
   11036:	147d                	addi	s0,s0,-1
   11038:	14f1                	addi	s1,s1,-4
   1103a:	f9341ee3          	bne	s0,s3,10fd6 <__call_exitprocs+0x3a>
   1103e:	b775                	j	10fea <__call_exitprocs+0x4e>
   11040:	18c92783          	lw	a5,396(s2)
   11044:	0844a583          	lw	a1,132(s1)
   11048:	8f7d                	and	a4,a4,a5
   1104a:	ef19                	bnez	a4,11068 <__call_exitprocs+0xcc>
   1104c:	855a                	mv	a0,s6
   1104e:	9682                	jalr	a3
   11050:	00492703          	lw	a4,4(s2)
   11054:	000a2783          	lw	a5,0(s4)
   11058:	fd870de3          	beq	a4,s8,11032 <__call_exitprocs+0x96>
   1105c:	d7d9                	beqz	a5,10fea <__call_exitprocs+0x4e>
   1105e:	893e                	mv	s2,a5
   11060:	b79d                	j	10fc6 <__call_exitprocs+0x2a>
   11062:	00892223          	sw	s0,4(s2)
   11066:	b775                	j	11012 <__call_exitprocs+0x76>
   11068:	852e                	mv	a0,a1
   1106a:	9682                	jalr	a3
   1106c:	bf6d                	j	11026 <__call_exitprocs+0x8a>

0001106e <__malloc_lock>:
   1106e:	8082                	ret

00011070 <__malloc_unlock>:
   11070:	8082                	ret

00011072 <_sbrk_r>:
   11072:	1141                	addi	sp,sp,-16
   11074:	c422                	sw	s0,8(sp)
   11076:	842a                	mv	s0,a0
   11078:	852e                	mv	a0,a1
   1107a:	d801a023          	sw	zero,-640(gp) # 12590 <errno>
   1107e:	c606                	sw	ra,12(sp)
   11080:	258d                	jal	116e2 <_sbrk>
   11082:	57fd                	li	a5,-1
   11084:	00f50663          	beq	a0,a5,11090 <_sbrk_r+0x1e>
   11088:	40b2                	lw	ra,12(sp)
   1108a:	4422                	lw	s0,8(sp)
   1108c:	0141                	addi	sp,sp,16
   1108e:	8082                	ret
   11090:	c226                	sw	s1,4(sp)
   11092:	d8018493          	addi	s1,gp,-640 # 12590 <errno>
   11096:	409c                	lw	a5,0(s1)
   11098:	c799                	beqz	a5,110a6 <_sbrk_r+0x34>
   1109a:	40b2                	lw	ra,12(sp)
   1109c:	c01c                	sw	a5,0(s0)
   1109e:	4422                	lw	s0,8(sp)
   110a0:	4492                	lw	s1,4(sp)
   110a2:	0141                	addi	sp,sp,16
   110a4:	8082                	ret
   110a6:	40b2                	lw	ra,12(sp)
   110a8:	4422                	lw	s0,8(sp)
   110aa:	4492                	lw	s1,4(sp)
   110ac:	0141                	addi	sp,sp,16
   110ae:	8082                	ret

000110b0 <atexit>:
   110b0:	85aa                	mv	a1,a0
   110b2:	4681                	li	a3,0
   110b4:	4601                	li	a2,0
   110b6:	4501                	li	a0,0
   110b8:	a1c5                	j	11598 <__register_exitproc>

000110ba <__sread>:
   110ba:	1141                	addi	sp,sp,-16
   110bc:	c422                	sw	s0,8(sp)
   110be:	842e                	mv	s0,a1
   110c0:	00e59583          	lh	a1,14(a1)
   110c4:	c606                	sw	ra,12(sp)
   110c6:	2b2d                	jal	11600 <_read_r>
   110c8:	00054963          	bltz	a0,110da <__sread+0x20>
   110cc:	483c                	lw	a5,80(s0)
   110ce:	40b2                	lw	ra,12(sp)
   110d0:	97aa                	add	a5,a5,a0
   110d2:	c83c                	sw	a5,80(s0)
   110d4:	4422                	lw	s0,8(sp)
   110d6:	0141                	addi	sp,sp,16
   110d8:	8082                	ret
   110da:	00c45783          	lhu	a5,12(s0)
   110de:	777d                	lui	a4,0xfffff
   110e0:	177d                	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffec75b>
   110e2:	8ff9                	and	a5,a5,a4
   110e4:	40b2                	lw	ra,12(sp)
   110e6:	00f41623          	sh	a5,12(s0)
   110ea:	4422                	lw	s0,8(sp)
   110ec:	0141                	addi	sp,sp,16
   110ee:	8082                	ret

000110f0 <__seofread>:
   110f0:	4501                	li	a0,0
   110f2:	8082                	ret

000110f4 <__swrite>:
   110f4:	00c59783          	lh	a5,12(a1)
   110f8:	1101                	addi	sp,sp,-32
   110fa:	cc22                	sw	s0,24(sp)
   110fc:	ca26                	sw	s1,20(sp)
   110fe:	c84a                	sw	s2,16(sp)
   11100:	c64e                	sw	s3,12(sp)
   11102:	ce06                	sw	ra,28(sp)
   11104:	1007f713          	andi	a4,a5,256
   11108:	842e                	mv	s0,a1
   1110a:	8932                	mv	s2,a2
   1110c:	89b6                	mv	s3,a3
   1110e:	84aa                	mv	s1,a0
   11110:	e315                	bnez	a4,11134 <__swrite+0x40>
   11112:	777d                	lui	a4,0xfffff
   11114:	177d                	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffec75b>
   11116:	8ff9                	and	a5,a5,a4
   11118:	00e41583          	lh	a1,14(s0)
   1111c:	00f41623          	sh	a5,12(s0)
   11120:	4462                	lw	s0,24(sp)
   11122:	40f2                	lw	ra,28(sp)
   11124:	86ce                	mv	a3,s3
   11126:	864a                	mv	a2,s2
   11128:	49b2                	lw	s3,12(sp)
   1112a:	4942                	lw	s2,16(sp)
   1112c:	8526                	mv	a0,s1
   1112e:	44d2                	lw	s1,20(sp)
   11130:	6105                	addi	sp,sp,32
   11132:	a645                	j	114d2 <_write_r>
   11134:	00e59583          	lh	a1,14(a1)
   11138:	4689                	li	a3,2
   1113a:	4601                	li	a2,0
   1113c:	2921                	jal	11554 <_lseek_r>
   1113e:	00c41783          	lh	a5,12(s0)
   11142:	bfc1                	j	11112 <__swrite+0x1e>

00011144 <__sseek>:
   11144:	1141                	addi	sp,sp,-16
   11146:	c422                	sw	s0,8(sp)
   11148:	842e                	mv	s0,a1
   1114a:	00e59583          	lh	a1,14(a1)
   1114e:	c606                	sw	ra,12(sp)
   11150:	2111                	jal	11554 <_lseek_r>
   11152:	577d                	li	a4,-1
   11154:	00c41783          	lh	a5,12(s0)
   11158:	00e50b63          	beq	a0,a4,1116e <__sseek+0x2a>
   1115c:	6705                	lui	a4,0x1
   1115e:	8fd9                	or	a5,a5,a4
   11160:	40b2                	lw	ra,12(sp)
   11162:	c828                	sw	a0,80(s0)
   11164:	00f41623          	sh	a5,12(s0)
   11168:	4422                	lw	s0,8(sp)
   1116a:	0141                	addi	sp,sp,16
   1116c:	8082                	ret
   1116e:	777d                	lui	a4,0xfffff
   11170:	177d                	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffec75b>
   11172:	8ff9                	and	a5,a5,a4
   11174:	40b2                	lw	ra,12(sp)
   11176:	00f41623          	sh	a5,12(s0)
   1117a:	4422                	lw	s0,8(sp)
   1117c:	0141                	addi	sp,sp,16
   1117e:	8082                	ret

00011180 <__sclose>:
   11180:	00e59583          	lh	a1,14(a1)
   11184:	ae49                	j	11516 <_close_r>

00011186 <__sflush_r>:
   11186:	00c59703          	lh	a4,12(a1)
   1118a:	1101                	addi	sp,sp,-32
   1118c:	cc22                	sw	s0,24(sp)
   1118e:	c64e                	sw	s3,12(sp)
   11190:	ce06                	sw	ra,28(sp)
   11192:	00877793          	andi	a5,a4,8
   11196:	842e                	mv	s0,a1
   11198:	89aa                	mv	s3,a0
   1119a:	e3f9                	bnez	a5,11260 <__sflush_r+0xda>
   1119c:	6785                	lui	a5,0x1
   1119e:	80078793          	addi	a5,a5,-2048 # 800 <register_fini-0xf8b4>
   111a2:	41d4                	lw	a3,4(a1)
   111a4:	8fd9                	or	a5,a5,a4
   111a6:	00f59623          	sh	a5,12(a1)
   111aa:	10d05863          	blez	a3,112ba <__sflush_r+0x134>
   111ae:	02842803          	lw	a6,40(s0)
   111b2:	0a080163          	beqz	a6,11254 <__sflush_r+0xce>
   111b6:	ca26                	sw	s1,20(sp)
   111b8:	01371693          	slli	a3,a4,0x13
   111bc:	0009a483          	lw	s1,0(s3)
   111c0:	0009a023          	sw	zero,0(s3)
   111c4:	1006c263          	bltz	a3,112c8 <__sflush_r+0x142>
   111c8:	4c4c                	lw	a1,28(s0)
   111ca:	4601                	li	a2,0
   111cc:	4685                	li	a3,1
   111ce:	854e                	mv	a0,s3
   111d0:	9802                	jalr	a6
   111d2:	57fd                	li	a5,-1
   111d4:	862a                	mv	a2,a0
   111d6:	12f50063          	beq	a0,a5,112f6 <__sflush_r+0x170>
   111da:	00c41783          	lh	a5,12(s0)
   111de:	02842803          	lw	a6,40(s0)
   111e2:	8b91                	andi	a5,a5,4
   111e4:	c799                	beqz	a5,111f2 <__sflush_r+0x6c>
   111e6:	4058                	lw	a4,4(s0)
   111e8:	581c                	lw	a5,48(s0)
   111ea:	8e19                	sub	a2,a2,a4
   111ec:	c399                	beqz	a5,111f2 <__sflush_r+0x6c>
   111ee:	5c5c                	lw	a5,60(s0)
   111f0:	8e1d                	sub	a2,a2,a5
   111f2:	4c4c                	lw	a1,28(s0)
   111f4:	4681                	li	a3,0
   111f6:	854e                	mv	a0,s3
   111f8:	9802                	jalr	a6
   111fa:	577d                	li	a4,-1
   111fc:	00c41783          	lh	a5,12(s0)
   11200:	0ce51663          	bne	a0,a4,112cc <__sflush_r+0x146>
   11204:	0009a683          	lw	a3,0(s3)
   11208:	4775                	li	a4,29
   1120a:	10d76263          	bltu	a4,a3,1130e <__sflush_r+0x188>
   1120e:	20400737          	lui	a4,0x20400
   11212:	0705                	addi	a4,a4,1 # 20400001 <__BSS_END__+0x203ed75d>
   11214:	00d75733          	srl	a4,a4,a3
   11218:	8b05                	andi	a4,a4,1
   1121a:	cb75                	beqz	a4,1130e <__sflush_r+0x188>
   1121c:	4810                	lw	a2,16(s0)
   1121e:	777d                	lui	a4,0xfffff
   11220:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffecf5b>
   11224:	8f7d                	and	a4,a4,a5
   11226:	00e41623          	sh	a4,12(s0)
   1122a:	00042223          	sw	zero,4(s0)
   1122e:	c010                	sw	a2,0(s0)
   11230:	01379713          	slli	a4,a5,0x13
   11234:	00075363          	bgez	a4,1123a <__sflush_r+0xb4>
   11238:	cac5                	beqz	a3,112e8 <__sflush_r+0x162>
   1123a:	580c                	lw	a1,48(s0)
   1123c:	0099a023          	sw	s1,0(s3)
   11240:	c9cd                	beqz	a1,112f2 <__sflush_r+0x16c>
   11242:	04040793          	addi	a5,s0,64
   11246:	00f58463          	beq	a1,a5,1124e <__sflush_r+0xc8>
   1124a:	854e                	mv	a0,s3
   1124c:	3e15                	jal	10d80 <_free_r>
   1124e:	44d2                	lw	s1,20(sp)
   11250:	02042823          	sw	zero,48(s0)
   11254:	40f2                	lw	ra,28(sp)
   11256:	4462                	lw	s0,24(sp)
   11258:	49b2                	lw	s3,12(sp)
   1125a:	4501                	li	a0,0
   1125c:	6105                	addi	sp,sp,32
   1125e:	8082                	ret
   11260:	c84a                	sw	s2,16(sp)
   11262:	0105a903          	lw	s2,16(a1)
   11266:	04090f63          	beqz	s2,112c4 <__sflush_r+0x13e>
   1126a:	ca26                	sw	s1,20(sp)
   1126c:	4184                	lw	s1,0(a1)
   1126e:	8b0d                	andi	a4,a4,3
   11270:	0125a023          	sw	s2,0(a1)
   11274:	412484b3          	sub	s1,s1,s2
   11278:	4781                	li	a5,0
   1127a:	e311                	bnez	a4,1127e <__sflush_r+0xf8>
   1127c:	49dc                	lw	a5,20(a1)
   1127e:	c41c                	sw	a5,8(s0)
   11280:	00904663          	bgtz	s1,1128c <__sflush_r+0x106>
   11284:	a83d                	j	112c2 <__sflush_r+0x13c>
   11286:	992a                	add	s2,s2,a0
   11288:	02905d63          	blez	s1,112c2 <__sflush_r+0x13c>
   1128c:	505c                	lw	a5,36(s0)
   1128e:	4c4c                	lw	a1,28(s0)
   11290:	86a6                	mv	a3,s1
   11292:	864a                	mv	a2,s2
   11294:	854e                	mv	a0,s3
   11296:	9782                	jalr	a5
   11298:	8c89                	sub	s1,s1,a0
   1129a:	fea046e3          	bgtz	a0,11286 <__sflush_r+0x100>
   1129e:	00c41783          	lh	a5,12(s0)
   112a2:	4942                	lw	s2,16(sp)
   112a4:	0407e793          	ori	a5,a5,64
   112a8:	40f2                	lw	ra,28(sp)
   112aa:	00f41623          	sh	a5,12(s0)
   112ae:	4462                	lw	s0,24(sp)
   112b0:	44d2                	lw	s1,20(sp)
   112b2:	49b2                	lw	s3,12(sp)
   112b4:	557d                	li	a0,-1
   112b6:	6105                	addi	sp,sp,32
   112b8:	8082                	ret
   112ba:	5dd4                	lw	a3,60(a1)
   112bc:	eed049e3          	bgtz	a3,111ae <__sflush_r+0x28>
   112c0:	bf51                	j	11254 <__sflush_r+0xce>
   112c2:	44d2                	lw	s1,20(sp)
   112c4:	4942                	lw	s2,16(sp)
   112c6:	b779                	j	11254 <__sflush_r+0xce>
   112c8:	4830                	lw	a2,80(s0)
   112ca:	bf21                	j	111e2 <__sflush_r+0x5c>
   112cc:	4814                	lw	a3,16(s0)
   112ce:	777d                	lui	a4,0xfffff
   112d0:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffecf5b>
   112d4:	8f7d                	and	a4,a4,a5
   112d6:	00e41623          	sh	a4,12(s0)
   112da:	00042223          	sw	zero,4(s0)
   112de:	c014                	sw	a3,0(s0)
   112e0:	01379713          	slli	a4,a5,0x13
   112e4:	f4075be3          	bgez	a4,1123a <__sflush_r+0xb4>
   112e8:	580c                	lw	a1,48(s0)
   112ea:	c828                	sw	a0,80(s0)
   112ec:	0099a023          	sw	s1,0(s3)
   112f0:	f9a9                	bnez	a1,11242 <__sflush_r+0xbc>
   112f2:	44d2                	lw	s1,20(sp)
   112f4:	b785                	j	11254 <__sflush_r+0xce>
   112f6:	0009a783          	lw	a5,0(s3)
   112fa:	ee0780e3          	beqz	a5,111da <__sflush_r+0x54>
   112fe:	4775                	li	a4,29
   11300:	00e78a63          	beq	a5,a4,11314 <__sflush_r+0x18e>
   11304:	4759                	li	a4,22
   11306:	00e78763          	beq	a5,a4,11314 <__sflush_r+0x18e>
   1130a:	00c41783          	lh	a5,12(s0)
   1130e:	0407e793          	ori	a5,a5,64
   11312:	bf59                	j	112a8 <__sflush_r+0x122>
   11314:	0099a023          	sw	s1,0(s3)
   11318:	44d2                	lw	s1,20(sp)
   1131a:	bf2d                	j	11254 <__sflush_r+0xce>

0001131c <_fflush_r>:
   1131c:	1101                	addi	sp,sp,-32
   1131e:	cc22                	sw	s0,24(sp)
   11320:	ce06                	sw	ra,28(sp)
   11322:	842a                	mv	s0,a0
   11324:	c119                	beqz	a0,1132a <_fflush_r+0xe>
   11326:	595c                	lw	a5,52(a0)
   11328:	cf91                	beqz	a5,11344 <_fflush_r+0x28>
   1132a:	00c59783          	lh	a5,12(a1)
   1132e:	e791                	bnez	a5,1133a <_fflush_r+0x1e>
   11330:	40f2                	lw	ra,28(sp)
   11332:	4462                	lw	s0,24(sp)
   11334:	4501                	li	a0,0
   11336:	6105                	addi	sp,sp,32
   11338:	8082                	ret
   1133a:	8522                	mv	a0,s0
   1133c:	4462                	lw	s0,24(sp)
   1133e:	40f2                	lw	ra,28(sp)
   11340:	6105                	addi	sp,sp,32
   11342:	b591                	j	11186 <__sflush_r>
   11344:	c62e                	sw	a1,12(sp)
   11346:	ac2ff0ef          	jal	10608 <__sinit>
   1134a:	45b2                	lw	a1,12(sp)
   1134c:	bff9                	j	1132a <_fflush_r+0xe>

0001134e <fflush>:
   1134e:	cd05                	beqz	a0,11386 <fflush+0x38>
   11350:	85aa                	mv	a1,a0
   11352:	d641a503          	lw	a0,-668(gp) # 12574 <_impure_ptr>
   11356:	c119                	beqz	a0,1135c <fflush+0xe>
   11358:	595c                	lw	a5,52(a0)
   1135a:	c799                	beqz	a5,11368 <fflush+0x1a>
   1135c:	00c59783          	lh	a5,12(a1)
   11360:	e399                	bnez	a5,11366 <fflush+0x18>
   11362:	4501                	li	a0,0
   11364:	8082                	ret
   11366:	b505                	j	11186 <__sflush_r>
   11368:	1101                	addi	sp,sp,-32
   1136a:	c62e                	sw	a1,12(sp)
   1136c:	c42a                	sw	a0,8(sp)
   1136e:	ce06                	sw	ra,28(sp)
   11370:	a98ff0ef          	jal	10608 <__sinit>
   11374:	45b2                	lw	a1,12(sp)
   11376:	4522                	lw	a0,8(sp)
   11378:	00c59783          	lh	a5,12(a1)
   1137c:	e385                	bnez	a5,1139c <fflush+0x4e>
   1137e:	40f2                	lw	ra,28(sp)
   11380:	4501                	li	a0,0
   11382:	6105                	addi	sp,sp,32
   11384:	8082                	ret
   11386:	00001617          	auipc	a2,0x1
   1138a:	c8a60613          	addi	a2,a2,-886 # 12010 <__sglue>
   1138e:	00000597          	auipc	a1,0x0
   11392:	f8e58593          	addi	a1,a1,-114 # 1131c <_fflush_r>
   11396:	c1818513          	addi	a0,gp,-1000 # 12428 <_impure_data>
   1139a:	a021                	j	113a2 <_fwalk_sglue>
   1139c:	40f2                	lw	ra,28(sp)
   1139e:	6105                	addi	sp,sp,32
   113a0:	b3dd                	j	11186 <__sflush_r>

000113a2 <_fwalk_sglue>:
   113a2:	7179                	addi	sp,sp,-48
   113a4:	d04a                	sw	s2,32(sp)
   113a6:	ce4e                	sw	s3,28(sp)
   113a8:	cc52                	sw	s4,24(sp)
   113aa:	ca56                	sw	s5,20(sp)
   113ac:	c85a                	sw	s6,16(sp)
   113ae:	c65e                	sw	s7,12(sp)
   113b0:	d606                	sw	ra,44(sp)
   113b2:	d422                	sw	s0,40(sp)
   113b4:	d226                	sw	s1,36(sp)
   113b6:	8b2a                	mv	s6,a0
   113b8:	8bae                	mv	s7,a1
   113ba:	8ab2                	mv	s5,a2
   113bc:	4a01                	li	s4,0
   113be:	4985                	li	s3,1
   113c0:	597d                	li	s2,-1
   113c2:	004aa483          	lw	s1,4(s5)
   113c6:	008aa403          	lw	s0,8(s5)
   113ca:	14fd                	addi	s1,s1,-1
   113cc:	0204c463          	bltz	s1,113f4 <_fwalk_sglue+0x52>
   113d0:	00c45783          	lhu	a5,12(s0)
   113d4:	00f9fb63          	bgeu	s3,a5,113ea <_fwalk_sglue+0x48>
   113d8:	00e41783          	lh	a5,14(s0)
   113dc:	85a2                	mv	a1,s0
   113de:	855a                	mv	a0,s6
   113e0:	01278563          	beq	a5,s2,113ea <_fwalk_sglue+0x48>
   113e4:	9b82                	jalr	s7
   113e6:	00aa6a33          	or	s4,s4,a0
   113ea:	14fd                	addi	s1,s1,-1
   113ec:	06840413          	addi	s0,s0,104
   113f0:	ff2490e3          	bne	s1,s2,113d0 <_fwalk_sglue+0x2e>
   113f4:	000aaa83          	lw	s5,0(s5)
   113f8:	fc0a95e3          	bnez	s5,113c2 <_fwalk_sglue+0x20>
   113fc:	50b2                	lw	ra,44(sp)
   113fe:	5422                	lw	s0,40(sp)
   11400:	5492                	lw	s1,36(sp)
   11402:	5902                	lw	s2,32(sp)
   11404:	49f2                	lw	s3,28(sp)
   11406:	4ad2                	lw	s5,20(sp)
   11408:	4b42                	lw	s6,16(sp)
   1140a:	4bb2                	lw	s7,12(sp)
   1140c:	8552                	mv	a0,s4
   1140e:	4a62                	lw	s4,24(sp)
   11410:	6145                	addi	sp,sp,48
   11412:	8082                	ret

00011414 <__libc_fini_array>:
   11414:	1141                	addi	sp,sp,-16
   11416:	c422                	sw	s0,8(sp)
   11418:	00001797          	auipc	a5,0x1
   1141c:	bf078793          	addi	a5,a5,-1040 # 12008 <__do_global_dtors_aux_fini_array_entry>
   11420:	00001417          	auipc	s0,0x1
   11424:	bec40413          	addi	s0,s0,-1044 # 1200c <__fini_array_end>
   11428:	8c1d                	sub	s0,s0,a5
   1142a:	c226                	sw	s1,4(sp)
   1142c:	c606                	sw	ra,12(sp)
   1142e:	40245493          	srai	s1,s0,0x2
   11432:	c881                	beqz	s1,11442 <__libc_fini_array+0x2e>
   11434:	1471                	addi	s0,s0,-4
   11436:	943e                	add	s0,s0,a5
   11438:	401c                	lw	a5,0(s0)
   1143a:	14fd                	addi	s1,s1,-1
   1143c:	1471                	addi	s0,s0,-4
   1143e:	9782                	jalr	a5
   11440:	fce5                	bnez	s1,11438 <__libc_fini_array+0x24>
   11442:	40b2                	lw	ra,12(sp)
   11444:	4422                	lw	s0,8(sp)
   11446:	4492                	lw	s1,4(sp)
   11448:	0141                	addi	sp,sp,16
   1144a:	8082                	ret

0001144c <_reclaim_reent>:
   1144c:	d641a783          	lw	a5,-668(gp) # 12574 <_impure_ptr>
   11450:	08a78063          	beq	a5,a0,114d0 <_reclaim_reent+0x84>
   11454:	416c                	lw	a1,68(a0)
   11456:	1101                	addi	sp,sp,-32
   11458:	ca26                	sw	s1,20(sp)
   1145a:	ce06                	sw	ra,28(sp)
   1145c:	cc22                	sw	s0,24(sp)
   1145e:	84aa                	mv	s1,a0
   11460:	c98d                	beqz	a1,11492 <_reclaim_reent+0x46>
   11462:	c84a                	sw	s2,16(sp)
   11464:	c64e                	sw	s3,12(sp)
   11466:	4901                	li	s2,0
   11468:	08000993          	li	s3,128
   1146c:	012587b3          	add	a5,a1,s2
   11470:	4380                	lw	s0,0(a5)
   11472:	c801                	beqz	s0,11482 <_reclaim_reent+0x36>
   11474:	85a2                	mv	a1,s0
   11476:	4000                	lw	s0,0(s0)
   11478:	8526                	mv	a0,s1
   1147a:	907ff0ef          	jal	10d80 <_free_r>
   1147e:	f87d                	bnez	s0,11474 <_reclaim_reent+0x28>
   11480:	40ec                	lw	a1,68(s1)
   11482:	0911                	addi	s2,s2,4
   11484:	ff3914e3          	bne	s2,s3,1146c <_reclaim_reent+0x20>
   11488:	8526                	mv	a0,s1
   1148a:	8f7ff0ef          	jal	10d80 <_free_r>
   1148e:	4942                	lw	s2,16(sp)
   11490:	49b2                	lw	s3,12(sp)
   11492:	5c8c                	lw	a1,56(s1)
   11494:	c581                	beqz	a1,1149c <_reclaim_reent+0x50>
   11496:	8526                	mv	a0,s1
   11498:	8e9ff0ef          	jal	10d80 <_free_r>
   1149c:	40a0                	lw	s0,64(s1)
   1149e:	c419                	beqz	s0,114ac <_reclaim_reent+0x60>
   114a0:	85a2                	mv	a1,s0
   114a2:	4000                	lw	s0,0(s0)
   114a4:	8526                	mv	a0,s1
   114a6:	8dbff0ef          	jal	10d80 <_free_r>
   114aa:	f87d                	bnez	s0,114a0 <_reclaim_reent+0x54>
   114ac:	44ec                	lw	a1,76(s1)
   114ae:	c581                	beqz	a1,114b6 <_reclaim_reent+0x6a>
   114b0:	8526                	mv	a0,s1
   114b2:	8cfff0ef          	jal	10d80 <_free_r>
   114b6:	58dc                	lw	a5,52(s1)
   114b8:	c799                	beqz	a5,114c6 <_reclaim_reent+0x7a>
   114ba:	4462                	lw	s0,24(sp)
   114bc:	40f2                	lw	ra,28(sp)
   114be:	8526                	mv	a0,s1
   114c0:	44d2                	lw	s1,20(sp)
   114c2:	6105                	addi	sp,sp,32
   114c4:	8782                	jr	a5
   114c6:	40f2                	lw	ra,28(sp)
   114c8:	4462                	lw	s0,24(sp)
   114ca:	44d2                	lw	s1,20(sp)
   114cc:	6105                	addi	sp,sp,32
   114ce:	8082                	ret
   114d0:	8082                	ret

000114d2 <_write_r>:
   114d2:	1141                	addi	sp,sp,-16
   114d4:	872e                	mv	a4,a1
   114d6:	c422                	sw	s0,8(sp)
   114d8:	85b2                	mv	a1,a2
   114da:	842a                	mv	s0,a0
   114dc:	8636                	mv	a2,a3
   114de:	853a                	mv	a0,a4
   114e0:	d801a023          	sw	zero,-640(gp) # 12590 <errno>
   114e4:	c606                	sw	ra,12(sp)
   114e6:	24a9                	jal	11730 <_write>
   114e8:	57fd                	li	a5,-1
   114ea:	00f50663          	beq	a0,a5,114f6 <_write_r+0x24>
   114ee:	40b2                	lw	ra,12(sp)
   114f0:	4422                	lw	s0,8(sp)
   114f2:	0141                	addi	sp,sp,16
   114f4:	8082                	ret
   114f6:	c226                	sw	s1,4(sp)
   114f8:	d8018493          	addi	s1,gp,-640 # 12590 <errno>
   114fc:	409c                	lw	a5,0(s1)
   114fe:	c799                	beqz	a5,1150c <_write_r+0x3a>
   11500:	40b2                	lw	ra,12(sp)
   11502:	c01c                	sw	a5,0(s0)
   11504:	4422                	lw	s0,8(sp)
   11506:	4492                	lw	s1,4(sp)
   11508:	0141                	addi	sp,sp,16
   1150a:	8082                	ret
   1150c:	40b2                	lw	ra,12(sp)
   1150e:	4422                	lw	s0,8(sp)
   11510:	4492                	lw	s1,4(sp)
   11512:	0141                	addi	sp,sp,16
   11514:	8082                	ret

00011516 <_close_r>:
   11516:	1141                	addi	sp,sp,-16
   11518:	c422                	sw	s0,8(sp)
   1151a:	842a                	mv	s0,a0
   1151c:	852e                	mv	a0,a1
   1151e:	d801a023          	sw	zero,-640(gp) # 12590 <errno>
   11522:	c606                	sw	ra,12(sp)
   11524:	2205                	jal	11644 <_close>
   11526:	57fd                	li	a5,-1
   11528:	00f50663          	beq	a0,a5,11534 <_close_r+0x1e>
   1152c:	40b2                	lw	ra,12(sp)
   1152e:	4422                	lw	s0,8(sp)
   11530:	0141                	addi	sp,sp,16
   11532:	8082                	ret
   11534:	c226                	sw	s1,4(sp)
   11536:	d8018493          	addi	s1,gp,-640 # 12590 <errno>
   1153a:	409c                	lw	a5,0(s1)
   1153c:	c799                	beqz	a5,1154a <_close_r+0x34>
   1153e:	40b2                	lw	ra,12(sp)
   11540:	c01c                	sw	a5,0(s0)
   11542:	4422                	lw	s0,8(sp)
   11544:	4492                	lw	s1,4(sp)
   11546:	0141                	addi	sp,sp,16
   11548:	8082                	ret
   1154a:	40b2                	lw	ra,12(sp)
   1154c:	4422                	lw	s0,8(sp)
   1154e:	4492                	lw	s1,4(sp)
   11550:	0141                	addi	sp,sp,16
   11552:	8082                	ret

00011554 <_lseek_r>:
   11554:	1141                	addi	sp,sp,-16
   11556:	872e                	mv	a4,a1
   11558:	c422                	sw	s0,8(sp)
   1155a:	85b2                	mv	a1,a2
   1155c:	842a                	mv	s0,a0
   1155e:	8636                	mv	a2,a3
   11560:	853a                	mv	a0,a4
   11562:	d801a023          	sw	zero,-640(gp) # 12590 <errno>
   11566:	c606                	sw	ra,12(sp)
   11568:	221d                	jal	1168e <_lseek>
   1156a:	57fd                	li	a5,-1
   1156c:	00f50663          	beq	a0,a5,11578 <_lseek_r+0x24>
   11570:	40b2                	lw	ra,12(sp)
   11572:	4422                	lw	s0,8(sp)
   11574:	0141                	addi	sp,sp,16
   11576:	8082                	ret
   11578:	c226                	sw	s1,4(sp)
   1157a:	d8018493          	addi	s1,gp,-640 # 12590 <errno>
   1157e:	409c                	lw	a5,0(s1)
   11580:	c799                	beqz	a5,1158e <_lseek_r+0x3a>
   11582:	40b2                	lw	ra,12(sp)
   11584:	c01c                	sw	a5,0(s0)
   11586:	4422                	lw	s0,8(sp)
   11588:	4492                	lw	s1,4(sp)
   1158a:	0141                	addi	sp,sp,16
   1158c:	8082                	ret
   1158e:	40b2                	lw	ra,12(sp)
   11590:	4422                	lw	s0,8(sp)
   11592:	4492                	lw	s1,4(sp)
   11594:	0141                	addi	sp,sp,16
   11596:	8082                	ret

00011598 <__register_exitproc>:
   11598:	d7c18713          	addi	a4,gp,-644 # 1258c <__atexit>
   1159c:	431c                	lw	a5,0(a4)
   1159e:	c3a1                	beqz	a5,115de <__register_exitproc+0x46>
   115a0:	43d8                	lw	a4,4(a5)
   115a2:	487d                	li	a6,31
   115a4:	04e84c63          	blt	a6,a4,115fc <__register_exitproc+0x64>
   115a8:	00271813          	slli	a6,a4,0x2
   115ac:	c11d                	beqz	a0,115d2 <__register_exitproc+0x3a>
   115ae:	01078333          	add	t1,a5,a6
   115b2:	08c32423          	sw	a2,136(t1)
   115b6:	1887a883          	lw	a7,392(a5)
   115ba:	4605                	li	a2,1
   115bc:	00e61633          	sll	a2,a2,a4
   115c0:	00c8e8b3          	or	a7,a7,a2
   115c4:	1917a423          	sw	a7,392(a5)
   115c8:	10d32423          	sw	a3,264(t1)
   115cc:	4689                	li	a3,2
   115ce:	00d50c63          	beq	a0,a3,115e6 <__register_exitproc+0x4e>
   115d2:	0705                	addi	a4,a4,1
   115d4:	c3d8                	sw	a4,4(a5)
   115d6:	97c2                	add	a5,a5,a6
   115d8:	c78c                	sw	a1,8(a5)
   115da:	4501                	li	a0,0
   115dc:	8082                	ret
   115de:	f0418793          	addi	a5,gp,-252 # 12714 <__atexit0>
   115e2:	c31c                	sw	a5,0(a4)
   115e4:	bf75                	j	115a0 <__register_exitproc+0x8>
   115e6:	18c7a683          	lw	a3,396(a5)
   115ea:	0705                	addi	a4,a4,1
   115ec:	c3d8                	sw	a4,4(a5)
   115ee:	8ed1                	or	a3,a3,a2
   115f0:	18d7a623          	sw	a3,396(a5)
   115f4:	97c2                	add	a5,a5,a6
   115f6:	c78c                	sw	a1,8(a5)
   115f8:	4501                	li	a0,0
   115fa:	8082                	ret
   115fc:	557d                	li	a0,-1
   115fe:	8082                	ret

00011600 <_read_r>:
   11600:	1141                	addi	sp,sp,-16
   11602:	872e                	mv	a4,a1
   11604:	c422                	sw	s0,8(sp)
   11606:	85b2                	mv	a1,a2
   11608:	842a                	mv	s0,a0
   1160a:	8636                	mv	a2,a3
   1160c:	853a                	mv	a0,a4
   1160e:	d801a023          	sw	zero,-640(gp) # 12590 <errno>
   11612:	c606                	sw	ra,12(sp)
   11614:	2055                	jal	116b8 <_read>
   11616:	57fd                	li	a5,-1
   11618:	00f50663          	beq	a0,a5,11624 <_read_r+0x24>
   1161c:	40b2                	lw	ra,12(sp)
   1161e:	4422                	lw	s0,8(sp)
   11620:	0141                	addi	sp,sp,16
   11622:	8082                	ret
   11624:	c226                	sw	s1,4(sp)
   11626:	d8018493          	addi	s1,gp,-640 # 12590 <errno>
   1162a:	409c                	lw	a5,0(s1)
   1162c:	c799                	beqz	a5,1163a <_read_r+0x3a>
   1162e:	40b2                	lw	ra,12(sp)
   11630:	c01c                	sw	a5,0(s0)
   11632:	4422                	lw	s0,8(sp)
   11634:	4492                	lw	s1,4(sp)
   11636:	0141                	addi	sp,sp,16
   11638:	8082                	ret
   1163a:	40b2                	lw	ra,12(sp)
   1163c:	4422                	lw	s0,8(sp)
   1163e:	4492                	lw	s1,4(sp)
   11640:	0141                	addi	sp,sp,16
   11642:	8082                	ret

00011644 <_close>:
   11644:	1141                	addi	sp,sp,-16
   11646:	c606                	sw	ra,12(sp)
   11648:	c422                	sw	s0,8(sp)
   1164a:	03900893          	li	a7,57
   1164e:	00000073          	ecall
   11652:	842a                	mv	s0,a0
   11654:	00054763          	bltz	a0,11662 <_close+0x1e>
   11658:	40b2                	lw	ra,12(sp)
   1165a:	8522                	mv	a0,s0
   1165c:	4422                	lw	s0,8(sp)
   1165e:	0141                	addi	sp,sp,16
   11660:	8082                	ret
   11662:	40800433          	neg	s0,s0
   11666:	28d5                	jal	1175a <__errno>
   11668:	c100                	sw	s0,0(a0)
   1166a:	547d                	li	s0,-1
   1166c:	b7f5                	j	11658 <_close+0x14>

0001166e <_exit>:
   1166e:	05d00893          	li	a7,93
   11672:	00000073          	ecall
   11676:	00054363          	bltz	a0,1167c <_exit+0xe>
   1167a:	a001                	j	1167a <_exit+0xc>
   1167c:	1141                	addi	sp,sp,-16
   1167e:	c422                	sw	s0,8(sp)
   11680:	842a                	mv	s0,a0
   11682:	c606                	sw	ra,12(sp)
   11684:	40800433          	neg	s0,s0
   11688:	28c9                	jal	1175a <__errno>
   1168a:	c100                	sw	s0,0(a0)
   1168c:	a001                	j	1168c <_exit+0x1e>

0001168e <_lseek>:
   1168e:	1141                	addi	sp,sp,-16
   11690:	c606                	sw	ra,12(sp)
   11692:	c422                	sw	s0,8(sp)
   11694:	03e00893          	li	a7,62
   11698:	00000073          	ecall
   1169c:	842a                	mv	s0,a0
   1169e:	00054763          	bltz	a0,116ac <_lseek+0x1e>
   116a2:	40b2                	lw	ra,12(sp)
   116a4:	8522                	mv	a0,s0
   116a6:	4422                	lw	s0,8(sp)
   116a8:	0141                	addi	sp,sp,16
   116aa:	8082                	ret
   116ac:	40800433          	neg	s0,s0
   116b0:	206d                	jal	1175a <__errno>
   116b2:	c100                	sw	s0,0(a0)
   116b4:	547d                	li	s0,-1
   116b6:	b7f5                	j	116a2 <_lseek+0x14>

000116b8 <_read>:
   116b8:	1141                	addi	sp,sp,-16
   116ba:	c606                	sw	ra,12(sp)
   116bc:	c422                	sw	s0,8(sp)
   116be:	03f00893          	li	a7,63
   116c2:	00000073          	ecall
   116c6:	842a                	mv	s0,a0
   116c8:	00054763          	bltz	a0,116d6 <_read+0x1e>
   116cc:	40b2                	lw	ra,12(sp)
   116ce:	8522                	mv	a0,s0
   116d0:	4422                	lw	s0,8(sp)
   116d2:	0141                	addi	sp,sp,16
   116d4:	8082                	ret
   116d6:	40800433          	neg	s0,s0
   116da:	2041                	jal	1175a <__errno>
   116dc:	c100                	sw	s0,0(a0)
   116de:	547d                	li	s0,-1
   116e0:	b7f5                	j	116cc <_read+0x14>

000116e2 <_sbrk>:
   116e2:	d8418693          	addi	a3,gp,-636 # 12594 <heap_end.0>
   116e6:	4298                	lw	a4,0(a3)
   116e8:	1141                	addi	sp,sp,-16
   116ea:	c606                	sw	ra,12(sp)
   116ec:	87aa                	mv	a5,a0
   116ee:	eb19                	bnez	a4,11704 <_sbrk+0x22>
   116f0:	0d600893          	li	a7,214
   116f4:	4501                	li	a0,0
   116f6:	00000073          	ecall
   116fa:	567d                	li	a2,-1
   116fc:	872a                	mv	a4,a0
   116fe:	02c50263          	beq	a0,a2,11722 <_sbrk+0x40>
   11702:	c288                	sw	a0,0(a3)
   11704:	00e78533          	add	a0,a5,a4
   11708:	0d600893          	li	a7,214
   1170c:	00000073          	ecall
   11710:	4298                	lw	a4,0(a3)
   11712:	97ba                	add	a5,a5,a4
   11714:	00f51763          	bne	a0,a5,11722 <_sbrk+0x40>
   11718:	40b2                	lw	ra,12(sp)
   1171a:	c288                	sw	a0,0(a3)
   1171c:	853a                	mv	a0,a4
   1171e:	0141                	addi	sp,sp,16
   11720:	8082                	ret
   11722:	2825                	jal	1175a <__errno>
   11724:	40b2                	lw	ra,12(sp)
   11726:	47b1                	li	a5,12
   11728:	c11c                	sw	a5,0(a0)
   1172a:	557d                	li	a0,-1
   1172c:	0141                	addi	sp,sp,16
   1172e:	8082                	ret

00011730 <_write>:
   11730:	1141                	addi	sp,sp,-16
   11732:	c606                	sw	ra,12(sp)
   11734:	c422                	sw	s0,8(sp)
   11736:	04000893          	li	a7,64
   1173a:	00000073          	ecall
   1173e:	842a                	mv	s0,a0
   11740:	00054763          	bltz	a0,1174e <_write+0x1e>
   11744:	40b2                	lw	ra,12(sp)
   11746:	8522                	mv	a0,s0
   11748:	4422                	lw	s0,8(sp)
   1174a:	0141                	addi	sp,sp,16
   1174c:	8082                	ret
   1174e:	40800433          	neg	s0,s0
   11752:	2021                	jal	1175a <__errno>
   11754:	c100                	sw	s0,0(a0)
   11756:	547d                	li	s0,-1
   11758:	b7f5                	j	11744 <_write+0x14>

0001175a <__errno>:
   1175a:	d641a503          	lw	a0,-668(gp) # 12574 <_impure_ptr>
   1175e:	8082                	ret


user/_nsh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <run_pipe_program>:
} cmdblock;

void parse_into_tokens(char *buf, int bufsz, char *argv[16]);

void run_pipe_program(cmdblock prog1, cmdblock prog2, char *argv[16])
{
       0:	7115                	addi	sp,sp,-224
       2:	ed86                	sd	ra,216(sp)
       4:	e9a2                	sd	s0,208(sp)
       6:	e5a6                	sd	s1,200(sp)
       8:	e1ca                	sd	s2,192(sp)
       a:	fd4e                	sd	s3,184(sp)
       c:	1180                	addi	s0,sp,224
       e:	f2b43c23          	sd	a1,-200(s0)
      12:	f2d43423          	sd	a3,-216(s0)
      16:	84ba                	mv	s1,a4
      18:	42055913          	srai	s2,a0,0x20
      1c:	42065993          	srai	s3,a2,0x20
    int fd[2];
    pipe(fd);
      20:	fc840513          	addi	a0,s0,-56
      24:	00001097          	auipc	ra,0x1
      28:	b0a080e7          	jalr	-1270(ra) # b2e <pipe>
    if (fork() == 0)
      2c:	00001097          	auipc	ra,0x1
      30:	aea080e7          	jalr	-1302(ra) # b16 <fork>
      34:	e941                	bnez	a0,c4 <run_pipe_program+0xc4>
    {
        close(1);
      36:	4505                	li	a0,1
      38:	00001097          	auipc	ra,0x1
      3c:	b0e080e7          	jalr	-1266(ra) # b46 <close>
        dup(fd[1]);
      40:	fcc42503          	lw	a0,-52(s0)
      44:	00001097          	auipc	ra,0x1
      48:	b52080e7          	jalr	-1198(ra) # b96 <dup>
        close(fd[0]);
      4c:	fc842503          	lw	a0,-56(s0)
      50:	00001097          	auipc	ra,0x1
      54:	af6080e7          	jalr	-1290(ra) # b46 <close>
        close(fd[1]);
      58:	fcc42503          	lw	a0,-52(s0)
      5c:	00001097          	auipc	ra,0x1
      60:	aea080e7          	jalr	-1302(ra) # b46 <close>
        char *prog_argv[16] = {0};
      64:	08000613          	li	a2,128
      68:	4581                	li	a1,0
      6a:	f4840513          	addi	a0,s0,-184
      6e:	00001097          	auipc	ra,0x1
      72:	8b6080e7          	jalr	-1866(ra) # 924 <memset>
        // Move into prog_argv all the arguments of this program from argv using memcpy.
        memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
      76:	00391793          	slli	a5,s2,0x3
      7a:	94be                	add	s1,s1,a5
      7c:	f3842603          	lw	a2,-200(s0)
      80:	4126063b          	subw	a2,a2,s2
      84:	2605                	addiw	a2,a2,1
      86:	0036161b          	slliw	a2,a2,0x3
      8a:	85a6                	mv	a1,s1
      8c:	f4840513          	addi	a0,s0,-184
      90:	00001097          	auipc	ra,0x1
      94:	a6e080e7          	jalr	-1426(ra) # afe <memcpy>
        exec(argv[prog1.cmdstart], prog_argv);
      98:	f4840593          	addi	a1,s0,-184
      9c:	6088                	ld	a0,0(s1)
      9e:	00001097          	auipc	ra,0x1
      a2:	ab8080e7          	jalr	-1352(ra) # b56 <exec>
        printf("exec %s failed");
      a6:	00001517          	auipc	a0,0x1
      aa:	f9a50513          	addi	a0,a0,-102 # 1040 <malloc+0xf0>
      ae:	00001097          	auipc	ra,0x1
      b2:	dea080e7          	jalr	-534(ra) # e98 <printf>
            close(fd[1]);
            wait(0);
            wait(0);
        }
    }
}
      b6:	60ee                	ld	ra,216(sp)
      b8:	644e                	ld	s0,208(sp)
      ba:	64ae                	ld	s1,200(sp)
      bc:	690e                	ld	s2,192(sp)
      be:	79ea                	ld	s3,184(sp)
      c0:	612d                	addi	sp,sp,224
      c2:	8082                	ret
        if (fork() == 0)
      c4:	00001097          	auipc	ra,0x1
      c8:	a52080e7          	jalr	-1454(ra) # b16 <fork>
      cc:	e149                	bnez	a0,14e <run_pipe_program+0x14e>
            close(0);
      ce:	00001097          	auipc	ra,0x1
      d2:	a78080e7          	jalr	-1416(ra) # b46 <close>
            dup(fd[0]);
      d6:	fc842503          	lw	a0,-56(s0)
      da:	00001097          	auipc	ra,0x1
      de:	abc080e7          	jalr	-1348(ra) # b96 <dup>
            close(fd[0]);
      e2:	fc842503          	lw	a0,-56(s0)
      e6:	00001097          	auipc	ra,0x1
      ea:	a60080e7          	jalr	-1440(ra) # b46 <close>
            close(fd[1]);
      ee:	fcc42503          	lw	a0,-52(s0)
      f2:	00001097          	auipc	ra,0x1
      f6:	a54080e7          	jalr	-1452(ra) # b46 <close>
            char *prog_argv[16] = {0};
      fa:	08000613          	li	a2,128
      fe:	4581                	li	a1,0
     100:	f4840513          	addi	a0,s0,-184
     104:	00001097          	auipc	ra,0x1
     108:	820080e7          	jalr	-2016(ra) # 924 <memset>
            memcpy(prog_argv, argv + prog2.cmdstart, (prog2.cmdend - prog2.cmdstart + 1) * sizeof(char *));
     10c:	00399793          	slli	a5,s3,0x3
     110:	94be                	add	s1,s1,a5
     112:	f2842603          	lw	a2,-216(s0)
     116:	4136063b          	subw	a2,a2,s3
     11a:	2605                	addiw	a2,a2,1
     11c:	0036161b          	slliw	a2,a2,0x3
     120:	85a6                	mv	a1,s1
     122:	f4840513          	addi	a0,s0,-184
     126:	00001097          	auipc	ra,0x1
     12a:	9d8080e7          	jalr	-1576(ra) # afe <memcpy>
            exec(argv[prog2.cmdstart], prog_argv);
     12e:	f4840593          	addi	a1,s0,-184
     132:	6088                	ld	a0,0(s1)
     134:	00001097          	auipc	ra,0x1
     138:	a22080e7          	jalr	-1502(ra) # b56 <exec>
            printf("exec %s failed");
     13c:	00001517          	auipc	a0,0x1
     140:	f0450513          	addi	a0,a0,-252 # 1040 <malloc+0xf0>
     144:	00001097          	auipc	ra,0x1
     148:	d54080e7          	jalr	-684(ra) # e98 <printf>
     14c:	b7ad                	j	b6 <run_pipe_program+0xb6>
            close(fd[0]);
     14e:	fc842503          	lw	a0,-56(s0)
     152:	00001097          	auipc	ra,0x1
     156:	9f4080e7          	jalr	-1548(ra) # b46 <close>
            close(fd[1]);
     15a:	fcc42503          	lw	a0,-52(s0)
     15e:	00001097          	auipc	ra,0x1
     162:	9e8080e7          	jalr	-1560(ra) # b46 <close>
            wait(0);
     166:	4501                	li	a0,0
     168:	00001097          	auipc	ra,0x1
     16c:	9be080e7          	jalr	-1602(ra) # b26 <wait>
            wait(0);
     170:	4501                	li	a0,0
     172:	00001097          	auipc	ra,0x1
     176:	9b4080e7          	jalr	-1612(ra) # b26 <wait>
}
     17a:	bf35                	j	b6 <run_pipe_program+0xb6>

000000000000017c <run_writeout_program>:

void run_writeout_program(cmdblock prog1, cmdblock prog2, char *argv[16])
{
     17c:	7155                	addi	sp,sp,-208
     17e:	e586                	sd	ra,200(sp)
     180:	e1a2                	sd	s0,192(sp)
     182:	fd26                	sd	s1,184(sp)
     184:	f94a                	sd	s2,176(sp)
     186:	f54e                	sd	s3,168(sp)
     188:	0980                	addi	s0,sp,208
     18a:	f4b43423          	sd	a1,-184(s0)
     18e:	893a                	mv	s2,a4
     190:	42055993          	srai	s3,a0,0x20
     194:	42065493          	srai	s1,a2,0x20
    close(1);
     198:	4505                	li	a0,1
     19a:	00001097          	auipc	ra,0x1
     19e:	9ac080e7          	jalr	-1620(ra) # b46 <close>
    int fd = open(argv[prog2.cmdstart], O_WRONLY | O_CREATE);
     1a2:	048e                	slli	s1,s1,0x3
     1a4:	94ca                	add	s1,s1,s2
     1a6:	20100593          	li	a1,513
     1aa:	6088                	ld	a0,0(s1)
     1ac:	00001097          	auipc	ra,0x1
     1b0:	9b2080e7          	jalr	-1614(ra) # b5e <open>
    if (fd < 0)
     1b4:	06054263          	bltz	a0,218 <run_writeout_program+0x9c>
    {
        printf("open %s failed", argv[prog2.cmdstart]);
    }
    else
    {
        if (fork() == 0)
     1b8:	00001097          	auipc	ra,0x1
     1bc:	95e080e7          	jalr	-1698(ra) # b16 <fork>
     1c0:	ed25                	bnez	a0,238 <run_writeout_program+0xbc>
        {
            char *prog_argv[16] = {0};
     1c2:	08000613          	li	a2,128
     1c6:	4581                	li	a1,0
     1c8:	f5040513          	addi	a0,s0,-176
     1cc:	00000097          	auipc	ra,0x0
     1d0:	758080e7          	jalr	1880(ra) # 924 <memset>
            // Move into prog_argv all the arguments of this program from argv using memcpy.
            memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
     1d4:	00399793          	slli	a5,s3,0x3
     1d8:	993e                	add	s2,s2,a5
     1da:	f4842603          	lw	a2,-184(s0)
     1de:	4136063b          	subw	a2,a2,s3
     1e2:	2605                	addiw	a2,a2,1
     1e4:	0036161b          	slliw	a2,a2,0x3
     1e8:	85ca                	mv	a1,s2
     1ea:	f5040513          	addi	a0,s0,-176
     1ee:	00001097          	auipc	ra,0x1
     1f2:	910080e7          	jalr	-1776(ra) # afe <memcpy>
            exec(argv[prog1.cmdstart], prog_argv);
     1f6:	f5040593          	addi	a1,s0,-176
     1fa:	00093503          	ld	a0,0(s2)
     1fe:	00001097          	auipc	ra,0x1
     202:	958080e7          	jalr	-1704(ra) # b56 <exec>
            printf("exec %s failed");
     206:	00001517          	auipc	a0,0x1
     20a:	e3a50513          	addi	a0,a0,-454 # 1040 <malloc+0xf0>
     20e:	00001097          	auipc	ra,0x1
     212:	c8a080e7          	jalr	-886(ra) # e98 <printf>
     216:	a811                	j	22a <run_writeout_program+0xae>
        printf("open %s failed", argv[prog2.cmdstart]);
     218:	608c                	ld	a1,0(s1)
     21a:	00001517          	auipc	a0,0x1
     21e:	e3650513          	addi	a0,a0,-458 # 1050 <malloc+0x100>
     222:	00001097          	auipc	ra,0x1
     226:	c76080e7          	jalr	-906(ra) # e98 <printf>
        else
        {
            wait(0);
        }
    }
}
     22a:	60ae                	ld	ra,200(sp)
     22c:	640e                	ld	s0,192(sp)
     22e:	74ea                	ld	s1,184(sp)
     230:	794a                	ld	s2,176(sp)
     232:	79aa                	ld	s3,168(sp)
     234:	6169                	addi	sp,sp,208
     236:	8082                	ret
            wait(0);
     238:	4501                	li	a0,0
     23a:	00001097          	auipc	ra,0x1
     23e:	8ec080e7          	jalr	-1812(ra) # b26 <wait>
}
     242:	b7e5                	j	22a <run_writeout_program+0xae>

0000000000000244 <run_readin_program>:

void run_readin_program(cmdblock prog1, cmdblock prog2, char *argv[16])
{
     244:	7155                	addi	sp,sp,-208
     246:	e586                	sd	ra,200(sp)
     248:	e1a2                	sd	s0,192(sp)
     24a:	fd26                	sd	s1,184(sp)
     24c:	f94a                	sd	s2,176(sp)
     24e:	f54e                	sd	s3,168(sp)
     250:	0980                	addi	s0,sp,208
     252:	f2d43c23          	sd	a3,-200(s0)
     256:	893a                	mv	s2,a4
     258:	42055493          	srai	s1,a0,0x20
     25c:	42065993          	srai	s3,a2,0x20
    close(0);
     260:	4501                	li	a0,0
     262:	00001097          	auipc	ra,0x1
     266:	8e4080e7          	jalr	-1820(ra) # b46 <close>
    int fd = open(argv[prog1.cmdstart], O_RDONLY);
     26a:	048e                	slli	s1,s1,0x3
     26c:	94ca                	add	s1,s1,s2
     26e:	4581                	li	a1,0
     270:	6088                	ld	a0,0(s1)
     272:	00001097          	auipc	ra,0x1
     276:	8ec080e7          	jalr	-1812(ra) # b5e <open>
    if (fd < 0)
     27a:	06054263          	bltz	a0,2de <run_readin_program+0x9a>
    {
        printf("open %s failed", argv[prog1.cmdstart]);
    }
    else
    {
        if (fork() == 0)
     27e:	00001097          	auipc	ra,0x1
     282:	898080e7          	jalr	-1896(ra) # b16 <fork>
     286:	ed25                	bnez	a0,2fe <run_readin_program+0xba>
        {
            char *prog_argv[16] = {0};
     288:	08000613          	li	a2,128
     28c:	4581                	li	a1,0
     28e:	f5040513          	addi	a0,s0,-176
     292:	00000097          	auipc	ra,0x0
     296:	692080e7          	jalr	1682(ra) # 924 <memset>
            // Move into prog_argv all the arguments of this program from argv using memcpy.
            memcpy(prog_argv, argv + prog2.cmdstart, (prog2.cmdend - prog2.cmdstart + 1) * sizeof(char *));
     29a:	00399793          	slli	a5,s3,0x3
     29e:	993e                	add	s2,s2,a5
     2a0:	f3842603          	lw	a2,-200(s0)
     2a4:	4136063b          	subw	a2,a2,s3
     2a8:	2605                	addiw	a2,a2,1
     2aa:	0036161b          	slliw	a2,a2,0x3
     2ae:	85ca                	mv	a1,s2
     2b0:	f5040513          	addi	a0,s0,-176
     2b4:	00001097          	auipc	ra,0x1
     2b8:	84a080e7          	jalr	-1974(ra) # afe <memcpy>
            exec(argv[prog2.cmdstart], prog_argv);
     2bc:	f5040593          	addi	a1,s0,-176
     2c0:	00093503          	ld	a0,0(s2)
     2c4:	00001097          	auipc	ra,0x1
     2c8:	892080e7          	jalr	-1902(ra) # b56 <exec>
            printf("exec %s failed");
     2cc:	00001517          	auipc	a0,0x1
     2d0:	d7450513          	addi	a0,a0,-652 # 1040 <malloc+0xf0>
     2d4:	00001097          	auipc	ra,0x1
     2d8:	bc4080e7          	jalr	-1084(ra) # e98 <printf>
     2dc:	a811                	j	2f0 <run_readin_program+0xac>
        printf("open %s failed", argv[prog1.cmdstart]);
     2de:	608c                	ld	a1,0(s1)
     2e0:	00001517          	auipc	a0,0x1
     2e4:	d7050513          	addi	a0,a0,-656 # 1050 <malloc+0x100>
     2e8:	00001097          	auipc	ra,0x1
     2ec:	bb0080e7          	jalr	-1104(ra) # e98 <printf>
        else
        {
            wait(0);
        }
    }
}
     2f0:	60ae                	ld	ra,200(sp)
     2f2:	640e                	ld	s0,192(sp)
     2f4:	74ea                	ld	s1,184(sp)
     2f6:	794a                	ld	s2,176(sp)
     2f8:	79aa                	ld	s3,168(sp)
     2fa:	6169                	addi	sp,sp,208
     2fc:	8082                	ret
            wait(0);
     2fe:	4501                	li	a0,0
     300:	00001097          	auipc	ra,0x1
     304:	826080e7          	jalr	-2010(ra) # b26 <wait>
}
     308:	b7e5                	j	2f0 <run_readin_program+0xac>

000000000000030a <run_single_program>:

void run_single_program(cmdblock prog1, char *argv[16])
{
     30a:	7171                	addi	sp,sp,-176
     30c:	f506                	sd	ra,168(sp)
     30e:	f122                	sd	s0,160(sp)
     310:	ed26                	sd	s1,152(sp)
     312:	e94a                	sd	s2,144(sp)
     314:	1900                	addi	s0,sp,176
     316:	f4b43c23          	sd	a1,-168(s0)
     31a:	84b2                	mv	s1,a2
     31c:	42055913          	srai	s2,a0,0x20
    if (fork() == 0)
     320:	00000097          	auipc	ra,0x0
     324:	7f6080e7          	jalr	2038(ra) # b16 <fork>
     328:	e125                	bnez	a0,388 <run_single_program+0x7e>
    {
        char *prog_argv[16] = {0};
     32a:	08000613          	li	a2,128
     32e:	4581                	li	a1,0
     330:	f6040513          	addi	a0,s0,-160
     334:	00000097          	auipc	ra,0x0
     338:	5f0080e7          	jalr	1520(ra) # 924 <memset>
        // Move into prog_argv all the arguments of this program from argv using memcpy.
        memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
     33c:	00391793          	slli	a5,s2,0x3
     340:	94be                	add	s1,s1,a5
     342:	f5842603          	lw	a2,-168(s0)
     346:	4126063b          	subw	a2,a2,s2
     34a:	2605                	addiw	a2,a2,1
     34c:	0036161b          	slliw	a2,a2,0x3
     350:	85a6                	mv	a1,s1
     352:	f6040513          	addi	a0,s0,-160
     356:	00000097          	auipc	ra,0x0
     35a:	7a8080e7          	jalr	1960(ra) # afe <memcpy>
        exec(argv[prog1.cmdstart], prog_argv);
     35e:	f6040593          	addi	a1,s0,-160
     362:	6088                	ld	a0,0(s1)
     364:	00000097          	auipc	ra,0x0
     368:	7f2080e7          	jalr	2034(ra) # b56 <exec>
        printf("exec %s failed");
     36c:	00001517          	auipc	a0,0x1
     370:	cd450513          	addi	a0,a0,-812 # 1040 <malloc+0xf0>
     374:	00001097          	auipc	ra,0x1
     378:	b24080e7          	jalr	-1244(ra) # e98 <printf>
    }
    else
    {
        wait(0);
    }
}
     37c:	70aa                	ld	ra,168(sp)
     37e:	740a                	ld	s0,160(sp)
     380:	64ea                	ld	s1,152(sp)
     382:	694a                	ld	s2,144(sp)
     384:	614d                	addi	sp,sp,176
     386:	8082                	ret
        wait(0);
     388:	4501                	li	a0,0
     38a:	00000097          	auipc	ra,0x0
     38e:	79c080e7          	jalr	1948(ra) # b26 <wait>
}
     392:	b7ed                	j	37c <run_single_program+0x72>

0000000000000394 <execute_cmdblocks>:

void execute_cmdblocks(cmdblock blocks[4], char *argv[16])
{
     394:	1141                	addi	sp,sp,-16
     396:	e406                	sd	ra,8(sp)
     398:	e022                	sd	s0,0(sp)
     39a:	0800                	addi	s0,sp,16
     39c:	87aa                	mv	a5,a0
     39e:	872e                	mv	a4,a1
    switch (blocks[1].type)
     3a0:	454c                	lw	a1,12(a0)
     3a2:	4689                	li	a3,2
     3a4:	08d58f63          	beq	a1,a3,442 <execute_cmdblocks+0xae>
     3a8:	02b6ee63          	bltu	a3,a1,3e4 <execute_cmdblocks+0x50>
     3ac:	cda9                	beqz	a1,406 <execute_cmdblocks+0x72>
        break;
    case WRITEOUT:
        run_writeout_program(blocks[0], blocks[2], argv);
        break;
    case READIN:
        run_readin_program(blocks[0], blocks[2], argv);
     3ae:	01856883          	lwu	a7,24(a0)
     3b2:	01c56603          	lwu	a2,28(a0)
     3b6:	1602                	slli	a2,a2,0x20
     3b8:	02056683          	lwu	a3,32(a0)
     3bc:	55fd                	li	a1,-1
     3be:	9181                	srli	a1,a1,0x20
     3c0:	00056803          	lwu	a6,0(a0)
     3c4:	00456503          	lwu	a0,4(a0)
     3c8:	1502                	slli	a0,a0,0x20
     3ca:	0087e783          	lwu	a5,8(a5)
     3ce:	01166633          	or	a2,a2,a7
     3d2:	8eed                	and	a3,a3,a1
     3d4:	01056533          	or	a0,a0,a6
     3d8:	8dfd                	and	a1,a1,a5
     3da:	00000097          	auipc	ra,0x0
     3de:	e6a080e7          	jalr	-406(ra) # 244 <run_readin_program>
        break;
     3e2:	a8a1                	j	43a <execute_cmdblocks+0xa6>
    switch (blocks[1].type)
     3e4:	4691                	li	a3,4
     3e6:	08d59963          	bne	a1,a3,478 <execute_cmdblocks+0xe4>
    case EMPTY:
        run_single_program(blocks[0], argv);
     3ea:	00056503          	lwu	a0,0(a0)
     3ee:	0047e683          	lwu	a3,4(a5)
     3f2:	1682                	slli	a3,a3,0x20
     3f4:	863a                	mv	a2,a4
     3f6:	8d55                	or	a0,a0,a3
     3f8:	0087e583          	lwu	a1,8(a5)
     3fc:	00000097          	auipc	ra,0x0
     400:	f0e080e7          	jalr	-242(ra) # 30a <run_single_program>
        break;
     404:	a81d                	j	43a <execute_cmdblocks+0xa6>
        run_pipe_program(blocks[0], blocks[2], argv);
     406:	01856883          	lwu	a7,24(a0)
     40a:	01c56603          	lwu	a2,28(a0)
     40e:	1602                	slli	a2,a2,0x20
     410:	02056683          	lwu	a3,32(a0)
     414:	55fd                	li	a1,-1
     416:	9181                	srli	a1,a1,0x20
     418:	00056803          	lwu	a6,0(a0)
     41c:	00456503          	lwu	a0,4(a0)
     420:	1502                	slli	a0,a0,0x20
     422:	0087e783          	lwu	a5,8(a5)
     426:	01166633          	or	a2,a2,a7
     42a:	8eed                	and	a3,a3,a1
     42c:	01056533          	or	a0,a0,a6
     430:	8dfd                	and	a1,a1,a5
     432:	00000097          	auipc	ra,0x0
     436:	bce080e7          	jalr	-1074(ra) # 0 <run_pipe_program>
    default:
        printf("Can't have two simple commands chained together", blocks[1].type);
        break;
    }
}
     43a:	60a2                	ld	ra,8(sp)
     43c:	6402                	ld	s0,0(sp)
     43e:	0141                	addi	sp,sp,16
     440:	8082                	ret
        run_writeout_program(blocks[0], blocks[2], argv);
     442:	01856883          	lwu	a7,24(a0)
     446:	01c56603          	lwu	a2,28(a0)
     44a:	1602                	slli	a2,a2,0x20
     44c:	02056683          	lwu	a3,32(a0)
     450:	55fd                	li	a1,-1
     452:	9181                	srli	a1,a1,0x20
     454:	00056803          	lwu	a6,0(a0)
     458:	00456503          	lwu	a0,4(a0)
     45c:	1502                	slli	a0,a0,0x20
     45e:	0087e783          	lwu	a5,8(a5)
     462:	01166633          	or	a2,a2,a7
     466:	8eed                	and	a3,a3,a1
     468:	01056533          	or	a0,a0,a6
     46c:	8dfd                	and	a1,a1,a5
     46e:	00000097          	auipc	ra,0x0
     472:	d0e080e7          	jalr	-754(ra) # 17c <run_writeout_program>
        break;
     476:	b7d1                	j	43a <execute_cmdblocks+0xa6>
        printf("Can't have two simple commands chained together", blocks[1].type);
     478:	00001517          	auipc	a0,0x1
     47c:	be850513          	addi	a0,a0,-1048 # 1060 <malloc+0x110>
     480:	00001097          	auipc	ra,0x1
     484:	a18080e7          	jalr	-1512(ra) # e98 <printf>
}
     488:	bf4d                	j	43a <execute_cmdblocks+0xa6>

000000000000048a <parse_into_tokens>:

    execute_cmdblocks(blocks, argv);
}

void parse_into_tokens(char *buf, int bufsz, char *argv[16])
{
     48a:	1141                	addi	sp,sp,-16
     48c:	e406                	sd	ra,8(sp)
     48e:	e022                	sd	s0,0(sp)
     490:	0800                	addi	s0,sp,16
    // Parsing into words.
    char *procname = buf;
    int i = 0;
    while (buf[i] != ' ' && buf[i] != '\0')
     492:	00054703          	lbu	a4,0(a0)
     496:	02000893          	li	a7,32
     49a:	86aa                	mv	a3,a0
    int i = 0;
     49c:	4781                	li	a5,0
    while (buf[i] != ' ' && buf[i] != '\0')
     49e:	02000813          	li	a6,32
     4a2:	01170963          	beq	a4,a7,4b4 <parse_into_tokens+0x2a>
     4a6:	c719                	beqz	a4,4b4 <parse_into_tokens+0x2a>
    {
        i++;
     4a8:	2785                	addiw	a5,a5,1
    while (buf[i] != ' ' && buf[i] != '\0')
     4aa:	0685                	addi	a3,a3,1
     4ac:	0006c703          	lbu	a4,0(a3)
     4b0:	ff071be3          	bne	a4,a6,4a6 <parse_into_tokens+0x1c>
    }
    buf[i++] = '\0';
     4b4:	2785                	addiw	a5,a5,1
     4b6:	00068023          	sb	zero,0(a3)

    argv[0] = procname;
     4ba:	e208                	sd	a0,0(a2)
    int j = 1;
    while (i < bufsz && buf[i] != '\0')
     4bc:	06b7dd63          	bge	a5,a1,536 <parse_into_tokens+0xac>
     4c0:	00860e93          	addi	t4,a2,8
    int j = 1;
     4c4:	4f05                	li	t5,1
    {
        // Skip spaces
        while (buf[i] == ' ' && buf[i] != '\0')
     4c6:	02000813          	li	a6,32
     4ca:	00150f93          	addi	t6,a0,1
     4ce:	a801                	j	4de <parse_into_tokens+0x54>
            break;
        }

        argv[j++] = buf + i;

        while (buf[i] != ' ' && buf[i] != '\0')
     4d0:	88f2                	mv	a7,t3
        {
            i++;
        }
        buf[i++] = '\0';
     4d2:	2785                	addiw	a5,a5,1
     4d4:	00088023          	sb	zero,0(a7)
    while (i < bufsz && buf[i] != '\0')
     4d8:	0ea1                	addi	t4,t4,8
     4da:	04b7df63          	bge	a5,a1,538 <parse_into_tokens+0xae>
     4de:	00f508b3          	add	a7,a0,a5
     4e2:	0008c683          	lbu	a3,0(a7)
     4e6:	caa9                	beqz	a3,538 <parse_into_tokens+0xae>
        while (buf[i] == ' ' && buf[i] != '\0')
     4e8:	00178713          	addi	a4,a5,1
     4ec:	972a                	add	a4,a4,a0
     4ee:	01069a63          	bne	a3,a6,502 <parse_into_tokens+0x78>
            i++;
     4f2:	2785                	addiw	a5,a5,1
        while (buf[i] == ' ' && buf[i] != '\0')
     4f4:	88ba                	mv	a7,a4
     4f6:	0705                	addi	a4,a4,1
     4f8:	fff74683          	lbu	a3,-1(a4)
     4fc:	ff068be3          	beq	a3,a6,4f2 <parse_into_tokens+0x68>
        if (buf[i] == '\0')
     500:	ce85                	beqz	a3,538 <parse_into_tokens+0xae>
        argv[j++] = buf + i;
     502:	2f05                	addiw	t5,t5,1
     504:	011eb023          	sd	a7,0(t4)
        while (buf[i] != ' ' && buf[i] != '\0')
     508:	00f50e33          	add	t3,a0,a5
     50c:	000e4683          	lbu	a3,0(t3)
     510:	fd0680e3          	beq	a3,a6,4d0 <parse_into_tokens+0x46>
     514:	00178713          	addi	a4,a5,1
     518:	972a                	add	a4,a4,a0
     51a:	88f2                	mv	a7,t3
     51c:	00ff8333          	add	t1,t6,a5
     520:	41c30333          	sub	t1,t1,t3
     524:	d6dd                	beqz	a3,4d2 <parse_into_tokens+0x48>
            i++;
     526:	2785                	addiw	a5,a5,1
        while (buf[i] != ' ' && buf[i] != '\0')
     528:	989a                	add	a7,a7,t1
     52a:	0705                	addi	a4,a4,1
     52c:	fff74683          	lbu	a3,-1(a4)
     530:	ff069ae3          	bne	a3,a6,524 <parse_into_tokens+0x9a>
     534:	bf79                	j	4d2 <parse_into_tokens+0x48>
    int j = 1;
     536:	4f05                	li	t5,1
    }

    argv[j] = 0;
     538:	0f0e                	slli	t5,t5,0x3
     53a:	967a                	add	a2,a2,t5
     53c:	00063023          	sd	zero,0(a2)

    if (strcmp(procname, "exit") == 0)
     540:	00001597          	auipc	a1,0x1
     544:	b5058593          	addi	a1,a1,-1200 # 1090 <malloc+0x140>
     548:	00000097          	auipc	ra,0x0
     54c:	386080e7          	jalr	902(ra) # 8ce <strcmp>
     550:	c509                	beqz	a0,55a <parse_into_tokens+0xd0>
    {
        exit(0);
    }
}
     552:	60a2                	ld	ra,8(sp)
     554:	6402                	ld	s0,0(sp)
     556:	0141                	addi	sp,sp,16
     558:	8082                	ret
        exit(0);
     55a:	00000097          	auipc	ra,0x0
     55e:	5c4080e7          	jalr	1476(ra) # b1e <exit>

0000000000000562 <parse_into_cmdblocks>:
{
     562:	712d                	addi	sp,sp,-288
     564:	ee06                	sd	ra,280(sp)
     566:	ea22                	sd	s0,272(sp)
     568:	e626                	sd	s1,264(sp)
     56a:	e24a                	sd	s2,256(sp)
     56c:	fdce                	sd	s3,248(sp)
     56e:	f9d2                	sd	s4,240(sp)
     570:	f5d6                	sd	s5,232(sp)
     572:	f1da                	sd	s6,224(sp)
     574:	edde                	sd	s7,216(sp)
     576:	e9e2                	sd	s8,208(sp)
     578:	e5e6                	sd	s9,200(sp)
     57a:	e1ea                	sd	s10,192(sp)
     57c:	fd6e                	sd	s11,184(sp)
     57e:	1200                	addi	s0,sp,288
     580:	84aa                	mv	s1,a0
     582:	892e                	mv	s2,a1
    char *argv[16] = {0};
     584:	08000613          	li	a2,128
     588:	4581                	li	a1,0
     58a:	f1040513          	addi	a0,s0,-240
     58e:	00000097          	auipc	ra,0x0
     592:	396080e7          	jalr	918(ra) # 924 <memset>
    parse_into_tokens(buf, bufsz, argv);
     596:	f1040613          	addi	a2,s0,-240
     59a:	85ca                	mv	a1,s2
     59c:	8526                	mv	a0,s1
     59e:	00000097          	auipc	ra,0x0
     5a2:	eec080e7          	jalr	-276(ra) # 48a <parse_into_tokens>
    cmdblock blocks[4] = {0};
     5a6:	ee043023          	sd	zero,-288(s0)
     5aa:	ee043423          	sd	zero,-280(s0)
     5ae:	ee043823          	sd	zero,-272(s0)
     5b2:	ee043c23          	sd	zero,-264(s0)
     5b6:	f0043023          	sd	zero,-256(s0)
     5ba:	f0043423          	sd	zero,-248(s0)
    while (argv[cmdend] != 0 && curr_cmdblock < 4)
     5be:	f1043503          	ld	a0,-240(s0)
     5c2:	14050363          	beqz	a0,708 <parse_into_cmdblocks+0x1a6>
     5c6:	f1040a13          	addi	s4,s0,-240
     5ca:	5afd                	li	s5,-1
     5cc:	4905                	li	s2,1
    int curr_cmdblock = 0;
     5ce:	4481                	li	s1,0
    int cmdstart = 0;
     5d0:	4c01                	li	s8,0
        if (strcmp(argv[cmdend], "|") == 0)
     5d2:	00001c97          	auipc	s9,0x1
     5d6:	ac6c8c93          	addi	s9,s9,-1338 # 1098 <malloc+0x148>
        else if (strcmp(argv[cmdend], "<") == 0)
     5da:	00001d17          	auipc	s10,0x1
     5de:	ac6d0d13          	addi	s10,s10,-1338 # 10a0 <malloc+0x150>
            blocks[curr_cmdblock].type = EXEC;
     5e2:	4b0d                	li	s6,3
            blocks[curr_cmdblock].type = READIN;
     5e4:	4d85                	li	s11,1
     5e6:	a0ad                	j	650 <parse_into_cmdblocks+0xee>
        else if (strcmp(argv[cmdend], "<") == 0)
     5e8:	85ea                	mv	a1,s10
     5ea:	000a3503          	ld	a0,0(s4)
     5ee:	00000097          	auipc	ra,0x0
     5f2:	2e0080e7          	jalr	736(ra) # 8ce <strcmp>
     5f6:	e955                	bnez	a0,6aa <parse_into_cmdblocks+0x148>
            blocks[curr_cmdblock].type = EXEC;
     5f8:	00149793          	slli	a5,s1,0x1
     5fc:	97a6                	add	a5,a5,s1
     5fe:	078a                	slli	a5,a5,0x2
     600:	f9078793          	addi	a5,a5,-112
     604:	97a2                	add	a5,a5,s0
     606:	f567a823          	sw	s6,-176(a5)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     60a:	f587aa23          	sw	s8,-172(a5)
            blocks[curr_cmdblock].cmdend = cmdend - 1;
     60e:	f557ac23          	sw	s5,-168(a5)
            curr_cmdblock++;
     612:	0014869b          	addiw	a3,s1,1
            if (curr_cmdblock >= 4)
     616:	16db4063          	blt	s6,a3,776 <parse_into_cmdblocks+0x214>
            blocks[curr_cmdblock].type = READIN;
     61a:	00169793          	slli	a5,a3,0x1
     61e:	00d78733          	add	a4,a5,a3
     622:	070a                	slli	a4,a4,0x2
     624:	f9070713          	addi	a4,a4,-112
     628:	9722                	add	a4,a4,s0
     62a:	f5b72823          	sw	s11,-176(a4)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     62e:	f5372a23          	sw	s3,-172(a4)
            blocks[curr_cmdblock].cmdend = cmdend;
     632:	f5372c23          	sw	s3,-168(a4)
            curr_cmdblock++;
     636:	2489                	addiw	s1,s1,2
            cmdstart = cmdend + 1;
     638:	00090c1b          	sext.w	s8,s2
        cmdend++;
     63c:	00090b9b          	sext.w	s7,s2
    while (argv[cmdend] != 0 && curr_cmdblock < 4)
     640:	008a3503          	ld	a0,8(s4)
     644:	c961                	beqz	a0,714 <parse_into_cmdblocks+0x1b2>
     646:	0905                	addi	s2,s2,1
     648:	0a21                	addi	s4,s4,8
     64a:	2a85                	addiw	s5,s5,1
     64c:	0c9b4463          	blt	s6,s1,714 <parse_into_cmdblocks+0x1b2>
     650:	fff9099b          	addiw	s3,s2,-1
     654:	00098b9b          	sext.w	s7,s3
        if (strcmp(argv[cmdend], "|") == 0)
     658:	85e6                	mv	a1,s9
     65a:	00000097          	auipc	ra,0x0
     65e:	274080e7          	jalr	628(ra) # 8ce <strcmp>
     662:	f159                	bnez	a0,5e8 <parse_into_cmdblocks+0x86>
            blocks[curr_cmdblock].type = EXEC;
     664:	00149793          	slli	a5,s1,0x1
     668:	97a6                	add	a5,a5,s1
     66a:	078a                	slli	a5,a5,0x2
     66c:	f9078793          	addi	a5,a5,-112
     670:	97a2                	add	a5,a5,s0
     672:	f567a823          	sw	s6,-176(a5)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     676:	f587aa23          	sw	s8,-172(a5)
            blocks[curr_cmdblock].cmdend = cmdend - 1;
     67a:	f557ac23          	sw	s5,-168(a5)
            curr_cmdblock++;
     67e:	0014869b          	addiw	a3,s1,1
            if (curr_cmdblock >= 4)
     682:	08db4763          	blt	s6,a3,710 <parse_into_cmdblocks+0x1ae>
            blocks[curr_cmdblock].type = PIPE;
     686:	00169793          	slli	a5,a3,0x1
     68a:	00d78733          	add	a4,a5,a3
     68e:	070a                	slli	a4,a4,0x2
     690:	f9070713          	addi	a4,a4,-112
     694:	9722                	add	a4,a4,s0
     696:	f4072823          	sw	zero,-176(a4)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     69a:	f5372a23          	sw	s3,-172(a4)
            blocks[curr_cmdblock].cmdend = cmdend;
     69e:	f5372c23          	sw	s3,-168(a4)
            curr_cmdblock++;
     6a2:	2489                	addiw	s1,s1,2
            cmdstart = cmdend + 1;
     6a4:	00090c1b          	sext.w	s8,s2
     6a8:	bf51                	j	63c <parse_into_cmdblocks+0xda>
        else if (strcmp(argv[cmdend], ">") == 0)
     6aa:	00001597          	auipc	a1,0x1
     6ae:	9fe58593          	addi	a1,a1,-1538 # 10a8 <malloc+0x158>
     6b2:	000a3503          	ld	a0,0(s4)
     6b6:	00000097          	auipc	ra,0x0
     6ba:	218080e7          	jalr	536(ra) # 8ce <strcmp>
     6be:	fd3d                	bnez	a0,63c <parse_into_cmdblocks+0xda>
            blocks[curr_cmdblock].type = EXEC;
     6c0:	00149793          	slli	a5,s1,0x1
     6c4:	97a6                	add	a5,a5,s1
     6c6:	078a                	slli	a5,a5,0x2
     6c8:	f9078793          	addi	a5,a5,-112
     6cc:	97a2                	add	a5,a5,s0
     6ce:	f567a823          	sw	s6,-176(a5)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     6d2:	f587aa23          	sw	s8,-172(a5)
            blocks[curr_cmdblock].cmdend = cmdend - 1;
     6d6:	f557ac23          	sw	s5,-168(a5)
            curr_cmdblock++;
     6da:	0014869b          	addiw	a3,s1,1
            if (curr_cmdblock >= 4)
     6de:	08db4f63          	blt	s6,a3,77c <parse_into_cmdblocks+0x21a>
            blocks[curr_cmdblock].type = WRITEOUT;
     6e2:	00169793          	slli	a5,a3,0x1
     6e6:	00d78733          	add	a4,a5,a3
     6ea:	070a                	slli	a4,a4,0x2
     6ec:	f9070713          	addi	a4,a4,-112
     6f0:	9722                	add	a4,a4,s0
     6f2:	4609                	li	a2,2
     6f4:	f4c72823          	sw	a2,-176(a4)
            blocks[curr_cmdblock].cmdstart = cmdstart;
     6f8:	f5372a23          	sw	s3,-172(a4)
            blocks[curr_cmdblock].cmdend = cmdend;
     6fc:	f5372c23          	sw	s3,-168(a4)
            curr_cmdblock++;
     700:	2489                	addiw	s1,s1,2
            cmdstart = cmdend + 1;
     702:	00090c1b          	sext.w	s8,s2
     706:	bf1d                	j	63c <parse_into_cmdblocks+0xda>
    int cmdend = 0;
     708:	4b81                	li	s7,0
    int curr_cmdblock = 0;
     70a:	4481                	li	s1,0
    int cmdstart = 0;
     70c:	4c01                	li	s8,0
     70e:	a019                	j	714 <parse_into_cmdblocks+0x1b2>
            curr_cmdblock++;
     710:	84b6                	mv	s1,a3
     712:	8c5e                	mv	s8,s7
    blocks[curr_cmdblock].type = EXEC;
     714:	00149793          	slli	a5,s1,0x1
     718:	97a6                	add	a5,a5,s1
     71a:	078a                	slli	a5,a5,0x2
     71c:	f9078793          	addi	a5,a5,-112
     720:	97a2                	add	a5,a5,s0
     722:	470d                	li	a4,3
     724:	f4e7a823          	sw	a4,-176(a5)
    blocks[curr_cmdblock].cmdstart = cmdstart;
     728:	f587aa23          	sw	s8,-172(a5)
    blocks[curr_cmdblock].cmdend = cmdend - 1;
     72c:	3bfd                	addiw	s7,s7,-1
     72e:	f577ac23          	sw	s7,-168(a5)
    blocks[curr_cmdblock].type = EMPTY;
     732:	2485                	addiw	s1,s1,1
     734:	00149793          	slli	a5,s1,0x1
     738:	97a6                	add	a5,a5,s1
     73a:	078a                	slli	a5,a5,0x2
     73c:	f9078793          	addi	a5,a5,-112
     740:	97a2                	add	a5,a5,s0
     742:	4711                	li	a4,4
     744:	f4e7a823          	sw	a4,-176(a5)
    execute_cmdblocks(blocks, argv);
     748:	f1040593          	addi	a1,s0,-240
     74c:	ee040513          	addi	a0,s0,-288
     750:	00000097          	auipc	ra,0x0
     754:	c44080e7          	jalr	-956(ra) # 394 <execute_cmdblocks>
}
     758:	60f2                	ld	ra,280(sp)
     75a:	6452                	ld	s0,272(sp)
     75c:	64b2                	ld	s1,264(sp)
     75e:	6912                	ld	s2,256(sp)
     760:	79ee                	ld	s3,248(sp)
     762:	7a4e                	ld	s4,240(sp)
     764:	7aae                	ld	s5,232(sp)
     766:	7b0e                	ld	s6,224(sp)
     768:	6bee                	ld	s7,216(sp)
     76a:	6c4e                	ld	s8,208(sp)
     76c:	6cae                	ld	s9,200(sp)
     76e:	6d0e                	ld	s10,192(sp)
     770:	7dea                	ld	s11,184(sp)
     772:	6115                	addi	sp,sp,288
     774:	8082                	ret
            curr_cmdblock++;
     776:	84b6                	mv	s1,a3
     778:	8c5e                	mv	s8,s7
     77a:	bf69                	j	714 <parse_into_cmdblocks+0x1b2>
            curr_cmdblock++;
     77c:	84b6                	mv	s1,a3
     77e:	8c5e                	mv	s8,s7
     780:	bf51                	j	714 <parse_into_cmdblocks+0x1b2>

0000000000000782 <parse_and_execute>:

void parse_and_execute(char *buf, int bufsz)
{
     782:	1141                	addi	sp,sp,-16
     784:	e406                	sd	ra,8(sp)
     786:	e022                	sd	s0,0(sp)
     788:	0800                	addi	s0,sp,16
    parse_into_cmdblocks(buf, bufsz);
     78a:	00000097          	auipc	ra,0x0
     78e:	dd8080e7          	jalr	-552(ra) # 562 <parse_into_cmdblocks>
}
     792:	60a2                	ld	ra,8(sp)
     794:	6402                	ld	s0,0(sp)
     796:	0141                	addi	sp,sp,16
     798:	8082                	ret

000000000000079a <main>:

int main(int argc, char *argv[])
{
     79a:	bd010113          	addi	sp,sp,-1072
     79e:	42113423          	sd	ra,1064(sp)
     7a2:	42813023          	sd	s0,1056(sp)
     7a6:	40913c23          	sd	s1,1048(sp)
     7aa:	41213823          	sd	s2,1040(sp)
     7ae:	41313423          	sd	s3,1032(sp)
     7b2:	41413023          	sd	s4,1024(sp)
     7b6:	43010413          	addi	s0,sp,1072
    char buf[1024];
    int fd;
    // Ensure 3 file descriptors are open
    while ((fd = open("console", O_RDWR)) >= 0)
     7ba:	00001497          	auipc	s1,0x1
     7be:	8f648493          	addi	s1,s1,-1802 # 10b0 <malloc+0x160>
     7c2:	4589                	li	a1,2
     7c4:	8526                	mv	a0,s1
     7c6:	00000097          	auipc	ra,0x0
     7ca:	398080e7          	jalr	920(ra) # b5e <open>
     7ce:	00054963          	bltz	a0,7e0 <main+0x46>
    {
        if (fd >= 3)
     7d2:	4789                	li	a5,2
     7d4:	fea7d7e3          	bge	a5,a0,7c2 <main+0x28>
        {
            close(fd);
     7d8:	00000097          	auipc	ra,0x0
     7dc:	36e080e7          	jalr	878(ra) # b46 <close>
            break;
        }
    }

    fprintf(1, "@ ");
     7e0:	00001597          	auipc	a1,0x1
     7e4:	8d858593          	addi	a1,a1,-1832 # 10b8 <malloc+0x168>
     7e8:	4505                	li	a0,1
     7ea:	00000097          	auipc	ra,0x0
     7ee:	680080e7          	jalr	1664(ra) # e6a <fprintf>
    // Read and run input commands.
    while (gets(buf, sizeof(buf)) != 0)
    {
        // Find the \n and chop it off with a null.
        int i = 0;
        while (buf[i] != '\n' && buf[i] != '\0')
     7f2:	44a9                	li	s1,10
        int i = 0;
     7f4:	4981                	li	s3,0

        parse_and_execute(buf, sizeof(buf));

        close(0);
        close(1);
        open("console", O_RDWR);
     7f6:	00001917          	auipc	s2,0x1
     7fa:	8ba90913          	addi	s2,s2,-1862 # 10b0 <malloc+0x160>
        open("console", O_RDWR);
        fprintf(1, "@ ");
     7fe:	00001a17          	auipc	s4,0x1
     802:	8baa0a13          	addi	s4,s4,-1862 # 10b8 <malloc+0x168>
    while (gets(buf, sizeof(buf)) != 0)
     806:	a8a1                	j	85e <main+0xc4>
        int i = 0;
     808:	86ce                	mv	a3,s3
        buf[i] = '\0';
     80a:	fd068793          	addi	a5,a3,-48
     80e:	008786b3          	add	a3,a5,s0
     812:	c0068023          	sb	zero,-1024(a3)
    parse_into_cmdblocks(buf, bufsz);
     816:	40000593          	li	a1,1024
     81a:	bd040513          	addi	a0,s0,-1072
     81e:	00000097          	auipc	ra,0x0
     822:	d44080e7          	jalr	-700(ra) # 562 <parse_into_cmdblocks>
        close(0);
     826:	854e                	mv	a0,s3
     828:	00000097          	auipc	ra,0x0
     82c:	31e080e7          	jalr	798(ra) # b46 <close>
        close(1);
     830:	4505                	li	a0,1
     832:	00000097          	auipc	ra,0x0
     836:	314080e7          	jalr	788(ra) # b46 <close>
        open("console", O_RDWR);
     83a:	4589                	li	a1,2
     83c:	854a                	mv	a0,s2
     83e:	00000097          	auipc	ra,0x0
     842:	320080e7          	jalr	800(ra) # b5e <open>
        open("console", O_RDWR);
     846:	4589                	li	a1,2
     848:	854a                	mv	a0,s2
     84a:	00000097          	auipc	ra,0x0
     84e:	314080e7          	jalr	788(ra) # b5e <open>
        fprintf(1, "@ ");
     852:	85d2                	mv	a1,s4
     854:	4505                	li	a0,1
     856:	00000097          	auipc	ra,0x0
     85a:	614080e7          	jalr	1556(ra) # e6a <fprintf>
    while (gets(buf, sizeof(buf)) != 0)
     85e:	40000593          	li	a1,1024
     862:	bd040513          	addi	a0,s0,-1072
     866:	00000097          	auipc	ra,0x0
     86a:	104080e7          	jalr	260(ra) # 96a <gets>
     86e:	c105                	beqz	a0,88e <main+0xf4>
        while (buf[i] != '\n' && buf[i] != '\0')
     870:	bd044783          	lbu	a5,-1072(s0)
     874:	f8978ae3          	beq	a5,s1,808 <main+0x6e>
     878:	bd140713          	addi	a4,s0,-1071
        int i = 0;
     87c:	86ce                	mv	a3,s3
        while (buf[i] != '\n' && buf[i] != '\0')
     87e:	d7d1                	beqz	a5,80a <main+0x70>
            i++;
     880:	2685                	addiw	a3,a3,1
        while (buf[i] != '\n' && buf[i] != '\0')
     882:	0705                	addi	a4,a4,1
     884:	fff74783          	lbu	a5,-1(a4)
     888:	fe979be3          	bne	a5,s1,87e <main+0xe4>
     88c:	bfbd                	j	80a <main+0x70>
    }

    exit(0);
     88e:	4501                	li	a0,0
     890:	00000097          	auipc	ra,0x0
     894:	28e080e7          	jalr	654(ra) # b1e <exit>

0000000000000898 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
     898:	1141                	addi	sp,sp,-16
     89a:	e406                	sd	ra,8(sp)
     89c:	e022                	sd	s0,0(sp)
     89e:	0800                	addi	s0,sp,16
  extern int main();
  main();
     8a0:	00000097          	auipc	ra,0x0
     8a4:	efa080e7          	jalr	-262(ra) # 79a <main>
  exit(0);
     8a8:	4501                	li	a0,0
     8aa:	00000097          	auipc	ra,0x0
     8ae:	274080e7          	jalr	628(ra) # b1e <exit>

00000000000008b2 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     8b2:	1141                	addi	sp,sp,-16
     8b4:	e422                	sd	s0,8(sp)
     8b6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     8b8:	87aa                	mv	a5,a0
     8ba:	0585                	addi	a1,a1,1
     8bc:	0785                	addi	a5,a5,1
     8be:	fff5c703          	lbu	a4,-1(a1)
     8c2:	fee78fa3          	sb	a4,-1(a5)
     8c6:	fb75                	bnez	a4,8ba <strcpy+0x8>
    ;
  return os;
}
     8c8:	6422                	ld	s0,8(sp)
     8ca:	0141                	addi	sp,sp,16
     8cc:	8082                	ret

00000000000008ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
     8ce:	1141                	addi	sp,sp,-16
     8d0:	e422                	sd	s0,8(sp)
     8d2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     8d4:	00054783          	lbu	a5,0(a0)
     8d8:	cb91                	beqz	a5,8ec <strcmp+0x1e>
     8da:	0005c703          	lbu	a4,0(a1)
     8de:	00f71763          	bne	a4,a5,8ec <strcmp+0x1e>
    p++, q++;
     8e2:	0505                	addi	a0,a0,1
     8e4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     8e6:	00054783          	lbu	a5,0(a0)
     8ea:	fbe5                	bnez	a5,8da <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     8ec:	0005c503          	lbu	a0,0(a1)
}
     8f0:	40a7853b          	subw	a0,a5,a0
     8f4:	6422                	ld	s0,8(sp)
     8f6:	0141                	addi	sp,sp,16
     8f8:	8082                	ret

00000000000008fa <strlen>:

uint
strlen(const char *s)
{
     8fa:	1141                	addi	sp,sp,-16
     8fc:	e422                	sd	s0,8(sp)
     8fe:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     900:	00054783          	lbu	a5,0(a0)
     904:	cf91                	beqz	a5,920 <strlen+0x26>
     906:	0505                	addi	a0,a0,1
     908:	87aa                	mv	a5,a0
     90a:	4685                	li	a3,1
     90c:	9e89                	subw	a3,a3,a0
     90e:	00f6853b          	addw	a0,a3,a5
     912:	0785                	addi	a5,a5,1
     914:	fff7c703          	lbu	a4,-1(a5)
     918:	fb7d                	bnez	a4,90e <strlen+0x14>
    ;
  return n;
}
     91a:	6422                	ld	s0,8(sp)
     91c:	0141                	addi	sp,sp,16
     91e:	8082                	ret
  for(n = 0; s[n]; n++)
     920:	4501                	li	a0,0
     922:	bfe5                	j	91a <strlen+0x20>

0000000000000924 <memset>:

void*
memset(void *dst, int c, uint n)
{
     924:	1141                	addi	sp,sp,-16
     926:	e422                	sd	s0,8(sp)
     928:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     92a:	ca19                	beqz	a2,940 <memset+0x1c>
     92c:	87aa                	mv	a5,a0
     92e:	1602                	slli	a2,a2,0x20
     930:	9201                	srli	a2,a2,0x20
     932:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     936:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     93a:	0785                	addi	a5,a5,1
     93c:	fee79de3          	bne	a5,a4,936 <memset+0x12>
  }
  return dst;
}
     940:	6422                	ld	s0,8(sp)
     942:	0141                	addi	sp,sp,16
     944:	8082                	ret

0000000000000946 <strchr>:

char*
strchr(const char *s, char c)
{
     946:	1141                	addi	sp,sp,-16
     948:	e422                	sd	s0,8(sp)
     94a:	0800                	addi	s0,sp,16
  for(; *s; s++)
     94c:	00054783          	lbu	a5,0(a0)
     950:	cb99                	beqz	a5,966 <strchr+0x20>
    if(*s == c)
     952:	00f58763          	beq	a1,a5,960 <strchr+0x1a>
  for(; *s; s++)
     956:	0505                	addi	a0,a0,1
     958:	00054783          	lbu	a5,0(a0)
     95c:	fbfd                	bnez	a5,952 <strchr+0xc>
      return (char*)s;
  return 0;
     95e:	4501                	li	a0,0
}
     960:	6422                	ld	s0,8(sp)
     962:	0141                	addi	sp,sp,16
     964:	8082                	ret
  return 0;
     966:	4501                	li	a0,0
     968:	bfe5                	j	960 <strchr+0x1a>

000000000000096a <gets>:

char*
gets(char *buf, int max)
{
     96a:	711d                	addi	sp,sp,-96
     96c:	ec86                	sd	ra,88(sp)
     96e:	e8a2                	sd	s0,80(sp)
     970:	e4a6                	sd	s1,72(sp)
     972:	e0ca                	sd	s2,64(sp)
     974:	fc4e                	sd	s3,56(sp)
     976:	f852                	sd	s4,48(sp)
     978:	f456                	sd	s5,40(sp)
     97a:	f05a                	sd	s6,32(sp)
     97c:	ec5e                	sd	s7,24(sp)
     97e:	1080                	addi	s0,sp,96
     980:	8baa                	mv	s7,a0
     982:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     984:	892a                	mv	s2,a0
     986:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     988:	4aa9                	li	s5,10
     98a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
     98c:	89a6                	mv	s3,s1
     98e:	2485                	addiw	s1,s1,1
     990:	0344d863          	bge	s1,s4,9c0 <gets+0x56>
    cc = read(0, &c, 1);
     994:	4605                	li	a2,1
     996:	faf40593          	addi	a1,s0,-81
     99a:	4501                	li	a0,0
     99c:	00000097          	auipc	ra,0x0
     9a0:	19a080e7          	jalr	410(ra) # b36 <read>
    if(cc < 1)
     9a4:	00a05e63          	blez	a0,9c0 <gets+0x56>
    buf[i++] = c;
     9a8:	faf44783          	lbu	a5,-81(s0)
     9ac:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     9b0:	01578763          	beq	a5,s5,9be <gets+0x54>
     9b4:	0905                	addi	s2,s2,1
     9b6:	fd679be3          	bne	a5,s6,98c <gets+0x22>
  for(i=0; i+1 < max; ){
     9ba:	89a6                	mv	s3,s1
     9bc:	a011                	j	9c0 <gets+0x56>
     9be:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
     9c0:	99de                	add	s3,s3,s7
     9c2:	00098023          	sb	zero,0(s3)
  return buf;
}
     9c6:	855e                	mv	a0,s7
     9c8:	60e6                	ld	ra,88(sp)
     9ca:	6446                	ld	s0,80(sp)
     9cc:	64a6                	ld	s1,72(sp)
     9ce:	6906                	ld	s2,64(sp)
     9d0:	79e2                	ld	s3,56(sp)
     9d2:	7a42                	ld	s4,48(sp)
     9d4:	7aa2                	ld	s5,40(sp)
     9d6:	7b02                	ld	s6,32(sp)
     9d8:	6be2                	ld	s7,24(sp)
     9da:	6125                	addi	sp,sp,96
     9dc:	8082                	ret

00000000000009de <stat>:

int
stat(const char *n, struct stat *st)
{
     9de:	1101                	addi	sp,sp,-32
     9e0:	ec06                	sd	ra,24(sp)
     9e2:	e822                	sd	s0,16(sp)
     9e4:	e426                	sd	s1,8(sp)
     9e6:	e04a                	sd	s2,0(sp)
     9e8:	1000                	addi	s0,sp,32
     9ea:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     9ec:	4581                	li	a1,0
     9ee:	00000097          	auipc	ra,0x0
     9f2:	170080e7          	jalr	368(ra) # b5e <open>
  if(fd < 0)
     9f6:	02054563          	bltz	a0,a20 <stat+0x42>
     9fa:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     9fc:	85ca                	mv	a1,s2
     9fe:	00000097          	auipc	ra,0x0
     a02:	178080e7          	jalr	376(ra) # b76 <fstat>
     a06:	892a                	mv	s2,a0
  close(fd);
     a08:	8526                	mv	a0,s1
     a0a:	00000097          	auipc	ra,0x0
     a0e:	13c080e7          	jalr	316(ra) # b46 <close>
  return r;
}
     a12:	854a                	mv	a0,s2
     a14:	60e2                	ld	ra,24(sp)
     a16:	6442                	ld	s0,16(sp)
     a18:	64a2                	ld	s1,8(sp)
     a1a:	6902                	ld	s2,0(sp)
     a1c:	6105                	addi	sp,sp,32
     a1e:	8082                	ret
    return -1;
     a20:	597d                	li	s2,-1
     a22:	bfc5                	j	a12 <stat+0x34>

0000000000000a24 <atoi>:

int
atoi(const char *s)
{
     a24:	1141                	addi	sp,sp,-16
     a26:	e422                	sd	s0,8(sp)
     a28:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     a2a:	00054683          	lbu	a3,0(a0)
     a2e:	fd06879b          	addiw	a5,a3,-48
     a32:	0ff7f793          	zext.b	a5,a5
     a36:	4625                	li	a2,9
     a38:	02f66863          	bltu	a2,a5,a68 <atoi+0x44>
     a3c:	872a                	mv	a4,a0
  n = 0;
     a3e:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
     a40:	0705                	addi	a4,a4,1
     a42:	0025179b          	slliw	a5,a0,0x2
     a46:	9fa9                	addw	a5,a5,a0
     a48:	0017979b          	slliw	a5,a5,0x1
     a4c:	9fb5                	addw	a5,a5,a3
     a4e:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     a52:	00074683          	lbu	a3,0(a4)
     a56:	fd06879b          	addiw	a5,a3,-48
     a5a:	0ff7f793          	zext.b	a5,a5
     a5e:	fef671e3          	bgeu	a2,a5,a40 <atoi+0x1c>
  return n;
}
     a62:	6422                	ld	s0,8(sp)
     a64:	0141                	addi	sp,sp,16
     a66:	8082                	ret
  n = 0;
     a68:	4501                	li	a0,0
     a6a:	bfe5                	j	a62 <atoi+0x3e>

0000000000000a6c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     a6c:	1141                	addi	sp,sp,-16
     a6e:	e422                	sd	s0,8(sp)
     a70:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     a72:	02b57463          	bgeu	a0,a1,a9a <memmove+0x2e>
    while(n-- > 0)
     a76:	00c05f63          	blez	a2,a94 <memmove+0x28>
     a7a:	1602                	slli	a2,a2,0x20
     a7c:	9201                	srli	a2,a2,0x20
     a7e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
     a82:	872a                	mv	a4,a0
      *dst++ = *src++;
     a84:	0585                	addi	a1,a1,1
     a86:	0705                	addi	a4,a4,1
     a88:	fff5c683          	lbu	a3,-1(a1)
     a8c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
     a90:	fee79ae3          	bne	a5,a4,a84 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
     a94:	6422                	ld	s0,8(sp)
     a96:	0141                	addi	sp,sp,16
     a98:	8082                	ret
    dst += n;
     a9a:	00c50733          	add	a4,a0,a2
    src += n;
     a9e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
     aa0:	fec05ae3          	blez	a2,a94 <memmove+0x28>
     aa4:	fff6079b          	addiw	a5,a2,-1
     aa8:	1782                	slli	a5,a5,0x20
     aaa:	9381                	srli	a5,a5,0x20
     aac:	fff7c793          	not	a5,a5
     ab0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
     ab2:	15fd                	addi	a1,a1,-1
     ab4:	177d                	addi	a4,a4,-1
     ab6:	0005c683          	lbu	a3,0(a1)
     aba:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
     abe:	fee79ae3          	bne	a5,a4,ab2 <memmove+0x46>
     ac2:	bfc9                	j	a94 <memmove+0x28>

0000000000000ac4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     ac4:	1141                	addi	sp,sp,-16
     ac6:	e422                	sd	s0,8(sp)
     ac8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
     aca:	ca05                	beqz	a2,afa <memcmp+0x36>
     acc:	fff6069b          	addiw	a3,a2,-1
     ad0:	1682                	slli	a3,a3,0x20
     ad2:	9281                	srli	a3,a3,0x20
     ad4:	0685                	addi	a3,a3,1
     ad6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
     ad8:	00054783          	lbu	a5,0(a0)
     adc:	0005c703          	lbu	a4,0(a1)
     ae0:	00e79863          	bne	a5,a4,af0 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
     ae4:	0505                	addi	a0,a0,1
    p2++;
     ae6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
     ae8:	fed518e3          	bne	a0,a3,ad8 <memcmp+0x14>
  }
  return 0;
     aec:	4501                	li	a0,0
     aee:	a019                	j	af4 <memcmp+0x30>
      return *p1 - *p2;
     af0:	40e7853b          	subw	a0,a5,a4
}
     af4:	6422                	ld	s0,8(sp)
     af6:	0141                	addi	sp,sp,16
     af8:	8082                	ret
  return 0;
     afa:	4501                	li	a0,0
     afc:	bfe5                	j	af4 <memcmp+0x30>

0000000000000afe <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     afe:	1141                	addi	sp,sp,-16
     b00:	e406                	sd	ra,8(sp)
     b02:	e022                	sd	s0,0(sp)
     b04:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
     b06:	00000097          	auipc	ra,0x0
     b0a:	f66080e7          	jalr	-154(ra) # a6c <memmove>
}
     b0e:	60a2                	ld	ra,8(sp)
     b10:	6402                	ld	s0,0(sp)
     b12:	0141                	addi	sp,sp,16
     b14:	8082                	ret

0000000000000b16 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     b16:	4885                	li	a7,1
 ecall
     b18:	00000073          	ecall
 ret
     b1c:	8082                	ret

0000000000000b1e <exit>:
.global exit
exit:
 li a7, SYS_exit
     b1e:	4889                	li	a7,2
 ecall
     b20:	00000073          	ecall
 ret
     b24:	8082                	ret

0000000000000b26 <wait>:
.global wait
wait:
 li a7, SYS_wait
     b26:	488d                	li	a7,3
 ecall
     b28:	00000073          	ecall
 ret
     b2c:	8082                	ret

0000000000000b2e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     b2e:	4891                	li	a7,4
 ecall
     b30:	00000073          	ecall
 ret
     b34:	8082                	ret

0000000000000b36 <read>:
.global read
read:
 li a7, SYS_read
     b36:	4895                	li	a7,5
 ecall
     b38:	00000073          	ecall
 ret
     b3c:	8082                	ret

0000000000000b3e <write>:
.global write
write:
 li a7, SYS_write
     b3e:	48c1                	li	a7,16
 ecall
     b40:	00000073          	ecall
 ret
     b44:	8082                	ret

0000000000000b46 <close>:
.global close
close:
 li a7, SYS_close
     b46:	48d5                	li	a7,21
 ecall
     b48:	00000073          	ecall
 ret
     b4c:	8082                	ret

0000000000000b4e <kill>:
.global kill
kill:
 li a7, SYS_kill
     b4e:	4899                	li	a7,6
 ecall
     b50:	00000073          	ecall
 ret
     b54:	8082                	ret

0000000000000b56 <exec>:
.global exec
exec:
 li a7, SYS_exec
     b56:	489d                	li	a7,7
 ecall
     b58:	00000073          	ecall
 ret
     b5c:	8082                	ret

0000000000000b5e <open>:
.global open
open:
 li a7, SYS_open
     b5e:	48bd                	li	a7,15
 ecall
     b60:	00000073          	ecall
 ret
     b64:	8082                	ret

0000000000000b66 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     b66:	48c5                	li	a7,17
 ecall
     b68:	00000073          	ecall
 ret
     b6c:	8082                	ret

0000000000000b6e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     b6e:	48c9                	li	a7,18
 ecall
     b70:	00000073          	ecall
 ret
     b74:	8082                	ret

0000000000000b76 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     b76:	48a1                	li	a7,8
 ecall
     b78:	00000073          	ecall
 ret
     b7c:	8082                	ret

0000000000000b7e <link>:
.global link
link:
 li a7, SYS_link
     b7e:	48cd                	li	a7,19
 ecall
     b80:	00000073          	ecall
 ret
     b84:	8082                	ret

0000000000000b86 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     b86:	48d1                	li	a7,20
 ecall
     b88:	00000073          	ecall
 ret
     b8c:	8082                	ret

0000000000000b8e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     b8e:	48a5                	li	a7,9
 ecall
     b90:	00000073          	ecall
 ret
     b94:	8082                	ret

0000000000000b96 <dup>:
.global dup
dup:
 li a7, SYS_dup
     b96:	48a9                	li	a7,10
 ecall
     b98:	00000073          	ecall
 ret
     b9c:	8082                	ret

0000000000000b9e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     b9e:	48ad                	li	a7,11
 ecall
     ba0:	00000073          	ecall
 ret
     ba4:	8082                	ret

0000000000000ba6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     ba6:	48b1                	li	a7,12
 ecall
     ba8:	00000073          	ecall
 ret
     bac:	8082                	ret

0000000000000bae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     bae:	48b5                	li	a7,13
 ecall
     bb0:	00000073          	ecall
 ret
     bb4:	8082                	ret

0000000000000bb6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     bb6:	48b9                	li	a7,14
 ecall
     bb8:	00000073          	ecall
 ret
     bbc:	8082                	ret

0000000000000bbe <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     bbe:	1101                	addi	sp,sp,-32
     bc0:	ec06                	sd	ra,24(sp)
     bc2:	e822                	sd	s0,16(sp)
     bc4:	1000                	addi	s0,sp,32
     bc6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
     bca:	4605                	li	a2,1
     bcc:	fef40593          	addi	a1,s0,-17
     bd0:	00000097          	auipc	ra,0x0
     bd4:	f6e080e7          	jalr	-146(ra) # b3e <write>
}
     bd8:	60e2                	ld	ra,24(sp)
     bda:	6442                	ld	s0,16(sp)
     bdc:	6105                	addi	sp,sp,32
     bde:	8082                	ret

0000000000000be0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     be0:	7139                	addi	sp,sp,-64
     be2:	fc06                	sd	ra,56(sp)
     be4:	f822                	sd	s0,48(sp)
     be6:	f426                	sd	s1,40(sp)
     be8:	f04a                	sd	s2,32(sp)
     bea:	ec4e                	sd	s3,24(sp)
     bec:	0080                	addi	s0,sp,64
     bee:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if (sgn && xx < 0)
     bf0:	c299                	beqz	a3,bf6 <printint+0x16>
     bf2:	0805c963          	bltz	a1,c84 <printint+0xa4>
    neg = 1;
    x = -xx;
  }
  else
  {
    x = xx;
     bf6:	2581                	sext.w	a1,a1
  neg = 0;
     bf8:	4881                	li	a7,0
     bfa:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
     bfe:	4701                	li	a4,0
  do
  {
    buf[i++] = digits[x % base];
     c00:	2601                	sext.w	a2,a2
     c02:	00000517          	auipc	a0,0x0
     c06:	51e50513          	addi	a0,a0,1310 # 1120 <digits>
     c0a:	883a                	mv	a6,a4
     c0c:	2705                	addiw	a4,a4,1
     c0e:	02c5f7bb          	remuw	a5,a1,a2
     c12:	1782                	slli	a5,a5,0x20
     c14:	9381                	srli	a5,a5,0x20
     c16:	97aa                	add	a5,a5,a0
     c18:	0007c783          	lbu	a5,0(a5)
     c1c:	00f68023          	sb	a5,0(a3)
  } while ((x /= base) != 0);
     c20:	0005879b          	sext.w	a5,a1
     c24:	02c5d5bb          	divuw	a1,a1,a2
     c28:	0685                	addi	a3,a3,1
     c2a:	fec7f0e3          	bgeu	a5,a2,c0a <printint+0x2a>
  if (neg)
     c2e:	00088c63          	beqz	a7,c46 <printint+0x66>
    buf[i++] = '-';
     c32:	fd070793          	addi	a5,a4,-48
     c36:	00878733          	add	a4,a5,s0
     c3a:	02d00793          	li	a5,45
     c3e:	fef70823          	sb	a5,-16(a4)
     c42:	0028071b          	addiw	a4,a6,2

  while (--i >= 0)
     c46:	02e05863          	blez	a4,c76 <printint+0x96>
     c4a:	fc040793          	addi	a5,s0,-64
     c4e:	00e78933          	add	s2,a5,a4
     c52:	fff78993          	addi	s3,a5,-1
     c56:	99ba                	add	s3,s3,a4
     c58:	377d                	addiw	a4,a4,-1
     c5a:	1702                	slli	a4,a4,0x20
     c5c:	9301                	srli	a4,a4,0x20
     c5e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
     c62:	fff94583          	lbu	a1,-1(s2)
     c66:	8526                	mv	a0,s1
     c68:	00000097          	auipc	ra,0x0
     c6c:	f56080e7          	jalr	-170(ra) # bbe <putc>
  while (--i >= 0)
     c70:	197d                	addi	s2,s2,-1
     c72:	ff3918e3          	bne	s2,s3,c62 <printint+0x82>
}
     c76:	70e2                	ld	ra,56(sp)
     c78:	7442                	ld	s0,48(sp)
     c7a:	74a2                	ld	s1,40(sp)
     c7c:	7902                	ld	s2,32(sp)
     c7e:	69e2                	ld	s3,24(sp)
     c80:	6121                	addi	sp,sp,64
     c82:	8082                	ret
    x = -xx;
     c84:	40b005bb          	negw	a1,a1
    neg = 1;
     c88:	4885                	li	a7,1
    x = -xx;
     c8a:	bf85                	j	bfa <printint+0x1a>

0000000000000c8c <vprintf>:
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void vprintf(int fd, const char *fmt, va_list ap)
{
     c8c:	7119                	addi	sp,sp,-128
     c8e:	fc86                	sd	ra,120(sp)
     c90:	f8a2                	sd	s0,112(sp)
     c92:	f4a6                	sd	s1,104(sp)
     c94:	f0ca                	sd	s2,96(sp)
     c96:	ecce                	sd	s3,88(sp)
     c98:	e8d2                	sd	s4,80(sp)
     c9a:	e4d6                	sd	s5,72(sp)
     c9c:	e0da                	sd	s6,64(sp)
     c9e:	fc5e                	sd	s7,56(sp)
     ca0:	f862                	sd	s8,48(sp)
     ca2:	f466                	sd	s9,40(sp)
     ca4:	f06a                	sd	s10,32(sp)
     ca6:	ec6e                	sd	s11,24(sp)
     ca8:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for (i = 0; fmt[i]; i++)
     caa:	0005c903          	lbu	s2,0(a1)
     cae:	18090f63          	beqz	s2,e4c <vprintf+0x1c0>
     cb2:	8aaa                	mv	s5,a0
     cb4:	8b32                	mv	s6,a2
     cb6:	00158493          	addi	s1,a1,1
  state = 0;
     cba:	4981                	li	s3,0
      else
      {
        putc(fd, c);
      }
    }
    else if (state == '%')
     cbc:	02500a13          	li	s4,37
     cc0:	4c55                	li	s8,21
     cc2:	00000c97          	auipc	s9,0x0
     cc6:	406c8c93          	addi	s9,s9,1030 # 10c8 <malloc+0x178>
      else if (c == 's')
      {
        s = va_arg(ap, char *);
        if (s == 0)
          s = "(null)";
        while (*s != 0)
     cca:	02800d93          	li	s11,40
  putc(fd, 'x');
     cce:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     cd0:	00000b97          	auipc	s7,0x0
     cd4:	450b8b93          	addi	s7,s7,1104 # 1120 <digits>
     cd8:	a839                	j	cf6 <vprintf+0x6a>
        putc(fd, c);
     cda:	85ca                	mv	a1,s2
     cdc:	8556                	mv	a0,s5
     cde:	00000097          	auipc	ra,0x0
     ce2:	ee0080e7          	jalr	-288(ra) # bbe <putc>
     ce6:	a019                	j	cec <vprintf+0x60>
    else if (state == '%')
     ce8:	01498d63          	beq	s3,s4,d02 <vprintf+0x76>
  for (i = 0; fmt[i]; i++)
     cec:	0485                	addi	s1,s1,1
     cee:	fff4c903          	lbu	s2,-1(s1)
     cf2:	14090d63          	beqz	s2,e4c <vprintf+0x1c0>
    if (state == 0)
     cf6:	fe0999e3          	bnez	s3,ce8 <vprintf+0x5c>
      if (c == '%')
     cfa:	ff4910e3          	bne	s2,s4,cda <vprintf+0x4e>
        state = '%';
     cfe:	89d2                	mv	s3,s4
     d00:	b7f5                	j	cec <vprintf+0x60>
      if (c == 'd')
     d02:	11490c63          	beq	s2,s4,e1a <vprintf+0x18e>
     d06:	f9d9079b          	addiw	a5,s2,-99
     d0a:	0ff7f793          	zext.b	a5,a5
     d0e:	10fc6e63          	bltu	s8,a5,e2a <vprintf+0x19e>
     d12:	f9d9079b          	addiw	a5,s2,-99
     d16:	0ff7f713          	zext.b	a4,a5
     d1a:	10ec6863          	bltu	s8,a4,e2a <vprintf+0x19e>
     d1e:	00271793          	slli	a5,a4,0x2
     d22:	97e6                	add	a5,a5,s9
     d24:	439c                	lw	a5,0(a5)
     d26:	97e6                	add	a5,a5,s9
     d28:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
     d2a:	008b0913          	addi	s2,s6,8
     d2e:	4685                	li	a3,1
     d30:	4629                	li	a2,10
     d32:	000b2583          	lw	a1,0(s6)
     d36:	8556                	mv	a0,s5
     d38:	00000097          	auipc	ra,0x0
     d3c:	ea8080e7          	jalr	-344(ra) # be0 <printint>
     d40:	8b4a                	mv	s6,s2
      {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     d42:	4981                	li	s3,0
     d44:	b765                	j	cec <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
     d46:	008b0913          	addi	s2,s6,8
     d4a:	4681                	li	a3,0
     d4c:	4629                	li	a2,10
     d4e:	000b2583          	lw	a1,0(s6)
     d52:	8556                	mv	a0,s5
     d54:	00000097          	auipc	ra,0x0
     d58:	e8c080e7          	jalr	-372(ra) # be0 <printint>
     d5c:	8b4a                	mv	s6,s2
      state = 0;
     d5e:	4981                	li	s3,0
     d60:	b771                	j	cec <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
     d62:	008b0913          	addi	s2,s6,8
     d66:	4681                	li	a3,0
     d68:	866a                	mv	a2,s10
     d6a:	000b2583          	lw	a1,0(s6)
     d6e:	8556                	mv	a0,s5
     d70:	00000097          	auipc	ra,0x0
     d74:	e70080e7          	jalr	-400(ra) # be0 <printint>
     d78:	8b4a                	mv	s6,s2
      state = 0;
     d7a:	4981                	li	s3,0
     d7c:	bf85                	j	cec <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
     d7e:	008b0793          	addi	a5,s6,8
     d82:	f8f43423          	sd	a5,-120(s0)
     d86:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
     d8a:	03000593          	li	a1,48
     d8e:	8556                	mv	a0,s5
     d90:	00000097          	auipc	ra,0x0
     d94:	e2e080e7          	jalr	-466(ra) # bbe <putc>
  putc(fd, 'x');
     d98:	07800593          	li	a1,120
     d9c:	8556                	mv	a0,s5
     d9e:	00000097          	auipc	ra,0x0
     da2:	e20080e7          	jalr	-480(ra) # bbe <putc>
     da6:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     da8:	03c9d793          	srli	a5,s3,0x3c
     dac:	97de                	add	a5,a5,s7
     dae:	0007c583          	lbu	a1,0(a5)
     db2:	8556                	mv	a0,s5
     db4:	00000097          	auipc	ra,0x0
     db8:	e0a080e7          	jalr	-502(ra) # bbe <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     dbc:	0992                	slli	s3,s3,0x4
     dbe:	397d                	addiw	s2,s2,-1
     dc0:	fe0914e3          	bnez	s2,da8 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
     dc4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
     dc8:	4981                	li	s3,0
     dca:	b70d                	j	cec <vprintf+0x60>
        s = va_arg(ap, char *);
     dcc:	008b0913          	addi	s2,s6,8
     dd0:	000b3983          	ld	s3,0(s6)
        if (s == 0)
     dd4:	02098163          	beqz	s3,df6 <vprintf+0x16a>
        while (*s != 0)
     dd8:	0009c583          	lbu	a1,0(s3)
     ddc:	c5ad                	beqz	a1,e46 <vprintf+0x1ba>
          putc(fd, *s);
     dde:	8556                	mv	a0,s5
     de0:	00000097          	auipc	ra,0x0
     de4:	dde080e7          	jalr	-546(ra) # bbe <putc>
          s++;
     de8:	0985                	addi	s3,s3,1
        while (*s != 0)
     dea:	0009c583          	lbu	a1,0(s3)
     dee:	f9e5                	bnez	a1,dde <vprintf+0x152>
        s = va_arg(ap, char *);
     df0:	8b4a                	mv	s6,s2
      state = 0;
     df2:	4981                	li	s3,0
     df4:	bde5                	j	cec <vprintf+0x60>
          s = "(null)";
     df6:	00000997          	auipc	s3,0x0
     dfa:	2ca98993          	addi	s3,s3,714 # 10c0 <malloc+0x170>
        while (*s != 0)
     dfe:	85ee                	mv	a1,s11
     e00:	bff9                	j	dde <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
     e02:	008b0913          	addi	s2,s6,8
     e06:	000b4583          	lbu	a1,0(s6)
     e0a:	8556                	mv	a0,s5
     e0c:	00000097          	auipc	ra,0x0
     e10:	db2080e7          	jalr	-590(ra) # bbe <putc>
     e14:	8b4a                	mv	s6,s2
      state = 0;
     e16:	4981                	li	s3,0
     e18:	bdd1                	j	cec <vprintf+0x60>
        putc(fd, c);
     e1a:	85d2                	mv	a1,s4
     e1c:	8556                	mv	a0,s5
     e1e:	00000097          	auipc	ra,0x0
     e22:	da0080e7          	jalr	-608(ra) # bbe <putc>
      state = 0;
     e26:	4981                	li	s3,0
     e28:	b5d1                	j	cec <vprintf+0x60>
        putc(fd, '%');
     e2a:	85d2                	mv	a1,s4
     e2c:	8556                	mv	a0,s5
     e2e:	00000097          	auipc	ra,0x0
     e32:	d90080e7          	jalr	-624(ra) # bbe <putc>
        putc(fd, c);
     e36:	85ca                	mv	a1,s2
     e38:	8556                	mv	a0,s5
     e3a:	00000097          	auipc	ra,0x0
     e3e:	d84080e7          	jalr	-636(ra) # bbe <putc>
      state = 0;
     e42:	4981                	li	s3,0
     e44:	b565                	j	cec <vprintf+0x60>
        s = va_arg(ap, char *);
     e46:	8b4a                	mv	s6,s2
      state = 0;
     e48:	4981                	li	s3,0
     e4a:	b54d                	j	cec <vprintf+0x60>
    }
  }
}
     e4c:	70e6                	ld	ra,120(sp)
     e4e:	7446                	ld	s0,112(sp)
     e50:	74a6                	ld	s1,104(sp)
     e52:	7906                	ld	s2,96(sp)
     e54:	69e6                	ld	s3,88(sp)
     e56:	6a46                	ld	s4,80(sp)
     e58:	6aa6                	ld	s5,72(sp)
     e5a:	6b06                	ld	s6,64(sp)
     e5c:	7be2                	ld	s7,56(sp)
     e5e:	7c42                	ld	s8,48(sp)
     e60:	7ca2                	ld	s9,40(sp)
     e62:	7d02                	ld	s10,32(sp)
     e64:	6de2                	ld	s11,24(sp)
     e66:	6109                	addi	sp,sp,128
     e68:	8082                	ret

0000000000000e6a <fprintf>:

void fprintf(int fd, const char *fmt, ...)
{
     e6a:	715d                	addi	sp,sp,-80
     e6c:	ec06                	sd	ra,24(sp)
     e6e:	e822                	sd	s0,16(sp)
     e70:	1000                	addi	s0,sp,32
     e72:	e010                	sd	a2,0(s0)
     e74:	e414                	sd	a3,8(s0)
     e76:	e818                	sd	a4,16(s0)
     e78:	ec1c                	sd	a5,24(s0)
     e7a:	03043023          	sd	a6,32(s0)
     e7e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
     e82:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
     e86:	8622                	mv	a2,s0
     e88:	00000097          	auipc	ra,0x0
     e8c:	e04080e7          	jalr	-508(ra) # c8c <vprintf>
}
     e90:	60e2                	ld	ra,24(sp)
     e92:	6442                	ld	s0,16(sp)
     e94:	6161                	addi	sp,sp,80
     e96:	8082                	ret

0000000000000e98 <printf>:

void printf(const char *fmt, ...)
{
     e98:	711d                	addi	sp,sp,-96
     e9a:	ec06                	sd	ra,24(sp)
     e9c:	e822                	sd	s0,16(sp)
     e9e:	1000                	addi	s0,sp,32
     ea0:	e40c                	sd	a1,8(s0)
     ea2:	e810                	sd	a2,16(s0)
     ea4:	ec14                	sd	a3,24(s0)
     ea6:	f018                	sd	a4,32(s0)
     ea8:	f41c                	sd	a5,40(s0)
     eaa:	03043823          	sd	a6,48(s0)
     eae:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     eb2:	00840613          	addi	a2,s0,8
     eb6:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
     eba:	85aa                	mv	a1,a0
     ebc:	4505                	li	a0,1
     ebe:	00000097          	auipc	ra,0x0
     ec2:	dce080e7          	jalr	-562(ra) # c8c <vprintf>
}
     ec6:	60e2                	ld	ra,24(sp)
     ec8:	6442                	ld	s0,16(sp)
     eca:	6125                	addi	sp,sp,96
     ecc:	8082                	ret

0000000000000ece <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ece:	1141                	addi	sp,sp,-16
     ed0:	e422                	sd	s0,8(sp)
     ed2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ed4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ed8:	00001797          	auipc	a5,0x1
     edc:	1287b783          	ld	a5,296(a5) # 2000 <freep>
     ee0:	a02d                	j	f0a <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     ee2:	4618                	lw	a4,8(a2)
     ee4:	9f2d                	addw	a4,a4,a1
     ee6:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
     eea:	6398                	ld	a4,0(a5)
     eec:	6310                	ld	a2,0(a4)
     eee:	a83d                	j	f2c <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     ef0:	ff852703          	lw	a4,-8(a0)
     ef4:	9f31                	addw	a4,a4,a2
     ef6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ef8:	ff053683          	ld	a3,-16(a0)
     efc:	a091                	j	f40 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     efe:	6398                	ld	a4,0(a5)
     f00:	00e7e463          	bltu	a5,a4,f08 <free+0x3a>
     f04:	00e6ea63          	bltu	a3,a4,f18 <free+0x4a>
{
     f08:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f0a:	fed7fae3          	bgeu	a5,a3,efe <free+0x30>
     f0e:	6398                	ld	a4,0(a5)
     f10:	00e6e463          	bltu	a3,a4,f18 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f14:	fee7eae3          	bltu	a5,a4,f08 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
     f18:	ff852583          	lw	a1,-8(a0)
     f1c:	6390                	ld	a2,0(a5)
     f1e:	02059813          	slli	a6,a1,0x20
     f22:	01c85713          	srli	a4,a6,0x1c
     f26:	9736                	add	a4,a4,a3
     f28:	fae60de3          	beq	a2,a4,ee2 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
     f2c:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
     f30:	4790                	lw	a2,8(a5)
     f32:	02061593          	slli	a1,a2,0x20
     f36:	01c5d713          	srli	a4,a1,0x1c
     f3a:	973e                	add	a4,a4,a5
     f3c:	fae68ae3          	beq	a3,a4,ef0 <free+0x22>
    p->s.ptr = bp->s.ptr;
     f40:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
     f42:	00001717          	auipc	a4,0x1
     f46:	0af73f23          	sd	a5,190(a4) # 2000 <freep>
}
     f4a:	6422                	ld	s0,8(sp)
     f4c:	0141                	addi	sp,sp,16
     f4e:	8082                	ret

0000000000000f50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     f50:	7139                	addi	sp,sp,-64
     f52:	fc06                	sd	ra,56(sp)
     f54:	f822                	sd	s0,48(sp)
     f56:	f426                	sd	s1,40(sp)
     f58:	f04a                	sd	s2,32(sp)
     f5a:	ec4e                	sd	s3,24(sp)
     f5c:	e852                	sd	s4,16(sp)
     f5e:	e456                	sd	s5,8(sp)
     f60:	e05a                	sd	s6,0(sp)
     f62:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f64:	02051493          	slli	s1,a0,0x20
     f68:	9081                	srli	s1,s1,0x20
     f6a:	04bd                	addi	s1,s1,15
     f6c:	8091                	srli	s1,s1,0x4
     f6e:	0014899b          	addiw	s3,s1,1
     f72:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
     f74:	00001517          	auipc	a0,0x1
     f78:	08c53503          	ld	a0,140(a0) # 2000 <freep>
     f7c:	c515                	beqz	a0,fa8 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f7e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
     f80:	4798                	lw	a4,8(a5)
     f82:	02977f63          	bgeu	a4,s1,fc0 <malloc+0x70>
     f86:	8a4e                	mv	s4,s3
     f88:	0009871b          	sext.w	a4,s3
     f8c:	6685                	lui	a3,0x1
     f8e:	00d77363          	bgeu	a4,a3,f94 <malloc+0x44>
     f92:	6a05                	lui	s4,0x1
     f94:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
     f98:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     f9c:	00001917          	auipc	s2,0x1
     fa0:	06490913          	addi	s2,s2,100 # 2000 <freep>
  if(p == (char*)-1)
     fa4:	5afd                	li	s5,-1
     fa6:	a895                	j	101a <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
     fa8:	00001797          	auipc	a5,0x1
     fac:	06878793          	addi	a5,a5,104 # 2010 <base>
     fb0:	00001717          	auipc	a4,0x1
     fb4:	04f73823          	sd	a5,80(a4) # 2000 <freep>
     fb8:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
     fba:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
     fbe:	b7e1                	j	f86 <malloc+0x36>
      if(p->s.size == nunits)
     fc0:	02e48c63          	beq	s1,a4,ff8 <malloc+0xa8>
        p->s.size -= nunits;
     fc4:	4137073b          	subw	a4,a4,s3
     fc8:	c798                	sw	a4,8(a5)
        p += p->s.size;
     fca:	02071693          	slli	a3,a4,0x20
     fce:	01c6d713          	srli	a4,a3,0x1c
     fd2:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
     fd4:	0137a423          	sw	s3,8(a5)
      freep = prevp;
     fd8:	00001717          	auipc	a4,0x1
     fdc:	02a73423          	sd	a0,40(a4) # 2000 <freep>
      return (void*)(p + 1);
     fe0:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     fe4:	70e2                	ld	ra,56(sp)
     fe6:	7442                	ld	s0,48(sp)
     fe8:	74a2                	ld	s1,40(sp)
     fea:	7902                	ld	s2,32(sp)
     fec:	69e2                	ld	s3,24(sp)
     fee:	6a42                	ld	s4,16(sp)
     ff0:	6aa2                	ld	s5,8(sp)
     ff2:	6b02                	ld	s6,0(sp)
     ff4:	6121                	addi	sp,sp,64
     ff6:	8082                	ret
        prevp->s.ptr = p->s.ptr;
     ff8:	6398                	ld	a4,0(a5)
     ffa:	e118                	sd	a4,0(a0)
     ffc:	bff1                	j	fd8 <malloc+0x88>
  hp->s.size = nu;
     ffe:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    1002:	0541                	addi	a0,a0,16
    1004:	00000097          	auipc	ra,0x0
    1008:	eca080e7          	jalr	-310(ra) # ece <free>
  return freep;
    100c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    1010:	d971                	beqz	a0,fe4 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1012:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1014:	4798                	lw	a4,8(a5)
    1016:	fa9775e3          	bgeu	a4,s1,fc0 <malloc+0x70>
    if(p == freep)
    101a:	00093703          	ld	a4,0(s2)
    101e:	853e                	mv	a0,a5
    1020:	fef719e3          	bne	a4,a5,1012 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
    1024:	8552                	mv	a0,s4
    1026:	00000097          	auipc	ra,0x0
    102a:	b80080e7          	jalr	-1152(ra) # ba6 <sbrk>
  if(p == (char*)-1)
    102e:	fd5518e3          	bne	a0,s5,ffe <malloc+0xae>
        return 0;
    1032:	4501                	li	a0,0
    1034:	bf45                	j	fe4 <malloc+0x94>

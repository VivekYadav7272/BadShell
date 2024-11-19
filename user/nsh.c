#include "user.h"
#include "../kernel/fcntl.h"

#define MAX_CMDBLOCK_LIMIT 5
#define MAX_ARGV_LIMIT 16

typedef enum cmdtype
{
    EMPTY,
    PIPE,
    READIN,
    WRITEOUT,
    EXEC, // means a command or a filename :)
} cmdtype;

typedef struct cmdblock
{
    cmdtype type;
    int cmdstart; // indexes into the argv array
    int cmdend;   // "       "    "       "    "
} cmdblock;

void parse_into_tokens(char *buf, int bufsz, char *argv[MAX_ARGV_LIMIT]);
void run_pipe_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT]);
void run_writeout_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT]);
void run_readin_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT]);
void run_single_program(cmdblock prog1, char *argv[MAX_ARGV_LIMIT]);
void execute_cmdblocks(cmdblock blocks[MAX_CMDBLOCK_LIMIT], char *argv[MAX_ARGV_LIMIT]);
void parse_and_execute(char *buf, int bufsz);
void parse_into_cmdblocks(char *buf, int bufsz, cmdblock blocks[MAX_CMDBLOCK_LIMIT], char *argv[MAX_ARGV_LIMIT]);

int main(int argc, char *argv[])
{
    char buf[1024];
    memset(buf, 0, sizeof(buf));
    int fd;
    // Ensure 3 file descriptors are open
    while ((fd = open("console", O_RDWR)) >= 0)
    {
        if (fd >= 3)
        {
            close(fd);
            break;
        }
    }

    fprintf(1, "@ ");
    // Read and run input commands.
    while (gets(buf, sizeof(buf)) != 0)
    {
        // Find the \n and chop it off with a null.
        int i = 0;
        while (buf[i] != '\n' && buf[i] != '\0')
        {
            i++;
        }
        buf[i] = '\0';

        printf("Running parse_and_execute..\n");
        parse_and_execute(buf, sizeof(buf));

        close(0);
        close(1);
        open("console", O_RDWR);
        open("console", O_RDWR);
        fprintf(1, "@ ");
    }

    printf("nsh: EOF\n");

    exit(0);
}

void parse_and_execute(char *buf, int bufsz)
{
    cmdblock blocks[MAX_CMDBLOCK_LIMIT];
    char *argv[MAX_ARGV_LIMIT];
    memset(blocks, 0, sizeof blocks);
    memset(argv, 0, sizeof argv);
    parse_into_cmdblocks(buf, bufsz, blocks, argv);
    execute_cmdblocks(blocks, argv);
}

void parse_into_cmdblocks(char *buf, int bufsz, cmdblock blocks[MAX_CMDBLOCK_LIMIT], char *argv[MAX_ARGV_LIMIT])
{
    parse_into_tokens(buf, bufsz, argv);

    for (int i = 0; i < MAX_ARGV_LIMIT; i++)
    {
        if (argv[i] == 0)
        {
            break;
        }
        printf("argv[%d] = %s\n", i, argv[i]);
    }

    int cmdstart = 0;
    int cmdend = 0;
    int curr_cmdblock = 0;
    while (argv[cmdend] != 0 && curr_cmdblock < MAX_CMDBLOCK_LIMIT)
    {
        if (strcmp(argv[cmdend], "|") == 0)
        {
            blocks[curr_cmdblock].type = EXEC;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend - 1;
            curr_cmdblock++;
            cmdstart = cmdend;

            if (curr_cmdblock >= 4)
                break;

            blocks[curr_cmdblock].type = PIPE;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend;
            curr_cmdblock++;
            cmdstart = cmdend + 1;
        }
        else if (strcmp(argv[cmdend], "<") == 0)
        {
            blocks[curr_cmdblock].type = EXEC;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend - 1;
            curr_cmdblock++;
            cmdstart = cmdend;

            if (curr_cmdblock >= 4)
                break;

            blocks[curr_cmdblock].type = READIN;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend;
            curr_cmdblock++;
            cmdstart = cmdend + 1;
        }
        else if (strcmp(argv[cmdend], ">") == 0)
        {
            blocks[curr_cmdblock].type = EXEC;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend - 1;
            curr_cmdblock++;
            cmdstart = cmdend;

            if (curr_cmdblock >= 4)
                break;

            blocks[curr_cmdblock].type = WRITEOUT;
            blocks[curr_cmdblock].cmdstart = cmdstart;
            blocks[curr_cmdblock].cmdend = cmdend;
            curr_cmdblock++;
            cmdstart = cmdend + 1;
        }
        cmdend++;
    }

    blocks[curr_cmdblock].type = EXEC;
    blocks[curr_cmdblock].cmdstart = cmdstart;
    blocks[curr_cmdblock].cmdend = cmdend - 1;
    curr_cmdblock++;

    blocks[curr_cmdblock].type = EMPTY;

    // print out all cmdblock debug info
    for (int i = 0; i < MAX_CMDBLOCK_LIMIT; i++)
    {
        char *type_name;
        switch (blocks[i].type)
        {
        case PIPE:
            type_name = "PIPE";
            break;
        case READIN:
            type_name = "READIN";
            break;
        case WRITEOUT:
            type_name = "WRITEOUT";
            break;
        case EXEC:
            type_name = "EXEC";
            break;
        case EMPTY:
            type_name = "EMPTY";
            break;
        default:
            type_name = "UNKNOWN";
            break;
        }
        printf("blocks[%d].type = %s\n", i, type_name);
        printf("blocks[%d].cmdstart = %d\n", i, blocks[i].cmdstart);
        printf("blocks[%d].cmdend = %d\n", i, blocks[i].cmdend);
    }
}

void run_pipe_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT])
{
    int fd[2];
    pipe(fd);
    if (fork() == 0)
    {
        close(1);
        dup(fd[1]);
        close(fd[0]);
        close(fd[1]);
        char *prog_argv[MAX_ARGV_LIMIT] = {0};
        // Move into prog_argv all the arguments of this program from argv using memcpy.
        memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
        exec(argv[prog1.cmdstart], prog_argv);
        printf("exec %s failed");
    }
    else
    {
        if (fork() == 0)
        {
            close(0);
            dup(fd[0]);
            close(fd[0]);
            close(fd[1]);
            char *prog_argv[MAX_ARGV_LIMIT] = {0};
            // Move into prog_argv all the arguments of this program from argv using memcpy.
            memcpy(prog_argv, argv + prog2.cmdstart, (prog2.cmdend - prog2.cmdstart + 1) * sizeof(char *));
            exec(argv[prog2.cmdstart], prog_argv);
            printf("exec %s failed");
        }
        else
        {
            close(fd[0]);
            close(fd[1]);
            wait(0);
            wait(0);
        }
    }
}

void run_writeout_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT])
{
    close(1);
    int fd = open(argv[prog2.cmdstart], O_WRONLY | O_CREATE);
    if (fd < 0)
    {
        printf("open %s failed", argv[prog2.cmdstart]);
    }
    else
    {
        if (fork() == 0)
        {
            char *prog_argv[MAX_ARGV_LIMIT] = {0};
            // Move into prog_argv all the arguments of this program from argv using memcpy.
            memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
            exec(argv[prog1.cmdstart], prog_argv);
            printf("exec %s failed");
        }
        else
        {
            wait(0);
        }
    }
}

void run_readin_program(cmdblock prog1, cmdblock prog2, char *argv[MAX_ARGV_LIMIT])
{
    close(0);
    int fd = open(argv[prog1.cmdstart], O_RDONLY);
    if (fd < 0)
    {
        printf("open %s failed", argv[prog1.cmdstart]);
    }
    else
    {
        if (fork() == 0)
        {
            char *prog_argv[MAX_ARGV_LIMIT] = {0};
            // Move into prog_argv all the arguments of this program from argv using memcpy.
            memcpy(prog_argv, argv + prog2.cmdstart, (prog2.cmdend - prog2.cmdstart + 1) * sizeof(char *));
            exec(argv[prog2.cmdstart], prog_argv);
            printf("exec %s failed");
        }
        else
        {
            wait(0);
        }
    }
}

void run_single_program(cmdblock prog1, char *argv[MAX_ARGV_LIMIT])
{
    if (fork() == 0)
    {
        char *prog_argv[MAX_ARGV_LIMIT] = {0};
        // Move into prog_argv all the arguments of this program from argv using memcpy.
        memcpy(prog_argv, argv + prog1.cmdstart, (prog1.cmdend - prog1.cmdstart + 1) * sizeof(char *));
        exec(argv[prog1.cmdstart], prog_argv);
        printf("exec %s failed");
    }
    else
    {
        wait(0);
    }
}

void execute_cmdblocks(cmdblock blocks[MAX_CMDBLOCK_LIMIT], char *argv[MAX_ARGV_LIMIT])
{
    switch (blocks[1].type)
    {
    case PIPE:
        run_pipe_program(blocks[0], blocks[2], argv);
        break;
    case WRITEOUT:
        run_writeout_program(blocks[0], blocks[2], argv);
        break;
    case READIN:
        run_readin_program(blocks[0], blocks[2], argv);
        break;
    case EMPTY:
        run_single_program(blocks[0], argv);
        break;
    default:
        printf("Can't have two simple commands chained together", blocks[1].type);
        break;
    }
}

void parse_into_tokens(char *buf, int bufsz, char *argv[MAX_ARGV_LIMIT])
{
    // Parsing into words.
    char *procname = buf;
    int i = 0;
    while (buf[i] != ' ' && buf[i] != '\0')
    {
        i++;
    }
    buf[i++] = '\0';

    argv[0] = procname;
    int j = 1;
    while (i < bufsz && buf[i] != '\0')
    {
        // Skip spaces
        while (buf[i] == ' ' && buf[i] != '\0')
        {
            i++;
        }

        if (buf[i] == '\0')
        {
            break;
        }

        argv[j++] = buf + i;

        while (buf[i] != ' ' && buf[i] != '\0')
        {
            i++;
        }
        buf[i++] = '\0';
    }

    argv[j] = 0;

    if (strcmp(procname, "exit") == 0)
    {
        exit(0);
    }
}

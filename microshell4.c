
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

int		ft_strlen(const char *str);
void	ft_perror(const char *err_msg, const char *arg);
void	ft_execve(int i, char *argv[], char *envp[]);

int	main(int argc, char *argv[], char *envp[])
{
	int		i;
	int 	tmp_fd;
	int		pipe_fds[2];
	pid_t	pid;

	(void)argc;
	tmp_fd = dup(STDIN_FILENO);
	i = 0;
	while (argv[i] != NULL && argv[i + 1] != NULL)
	{
		argv = &argv[i + 1];
		i = 0;
		while (argv[i] != NULL && strcmp(argv[i], ";") != 0 && strcmp(argv[i], "|") != 0)
			i++;
		if (strcmp(argv[0], "cd") == 0)
		{
			if (i != 2)
				write(2, "error: cd: bad arguments\n", 25);
			else if (chdir(argv[1]) != 0)
				ft_perror("error: cd: cannot change directory to ", argv[1]);
		}
		else if (argv != &argv[i] && (argv[i] == NULL || strcmp(argv[i], ";") == 0))
		{
			pid = fork();
			if (pid == 0)
			{
				dup2(tmp_fd, STDIN_FILENO);
				close(tmp_fd);
				ft_execve(i, argv, envp);
			}
			else
			{
				close(tmp_fd);
				waitpid(-1, NULL, WUNTRACED);
				tmp_fd = dup(STDIN_FILENO);
			}
		}
		else if (argv != &argv[i] && strcmp(argv[i], "|") == 0)
		{
			pipe(pipe_fds);
			pid = fork();
			if (pid == 0)
			{
				dup2(tmp_fd, STDIN_FILENO);
				dup2(pipe_fds[1], STDOUT_FILENO);
				close(tmp_fd);
				close(pipe_fds[1]);
				close(pipe_fds[0]);
				ft_execve(i, argv, envp);
			}
			else
			{
				close(tmp_fd);
				close(pipe_fds[1]);
				waitpid(-1, NULL, WUNTRACED);
				dup2(pipe_fds[0], tmp_fd);
				close(pipe_fds[0]);
			}
		}
	}
	close(tmp_fd);
	return (0);
}

void	ft_perror(const char *err_msg, const char *arg)
{
	write(2, err_msg, ft_strlen(err_msg));
	write(2, arg, ft_strlen(arg));
	write(2, "\n", 1);
}

int	ft_strlen(const char *str)
{
	int	i;

	i = 0;
	while (str != NULL && str[i] != '\0')
		i++;
	return (i);
}

void	ft_execve(int i, char *argv[], char *envp[])
{
	argv[i] = NULL;
	execve(argv[0], argv, envp);
	ft_perror("error: cannot execute ", argv[0]);
	exit(1);
}

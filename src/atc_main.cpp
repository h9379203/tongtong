/*************************************************************************
 *   atc_main.cpp
 *************************************************************************/

#include <common.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>

void chk_chld(int signum);

/*----------------------------------------------------------------
 * Purpose   :  KATC Main Process
 * Args      :
 * Return    :
 *-----------------------------------------------------------------*/
int main(int argc, char *argv[]) {
	int		ret;
	struct sigaction sa_chld;

	memset(&sa_chld, 0, sizeof(struct sigaction));
	sa_chld.sa_handler = chk_chld;
	sigfillset(&sa_chld.sa_mask);	/* blocking signal. */
	sa_chld.sa_flags = SA_NOCLDSTOP;

	sigaction(SIGCHLD, &sa_chld, NULL);
	cout << "[MAIN] SIGNAL Handler installed" << endl;

	cout << "[MAIN] pid is " << getpid() << endl;
	switch((ret = fork())) {
		case 0:
			pause();
			exit(EXIT_SUCCESS);
		case -1:
			break;
		default:
			cout << "- Child pid = " << ret << endl;
			break;
	}
		
	while (1) {
		pause();
		cout << "[MAIN] Recv SIGNAL..." << endl;
	}
	return EXIT_SUCCESS;
}

/* Name : signal handler func about SIGCHLD
 * Desc : 
 * Argv : 
 * Ret  : None
 */
void chk_chld(int signum)
{
	pid_t	pid_child;
	int		status;

	cout << "[SIGNAL] RECV SIGCHLD signal" << endl;
	if ((pid_child = waitpid(-1, &status, WNOHANG)) > 0) {
		cout << "\t- Exit child PID(" << pid_child << ")" << endl;

	}
}

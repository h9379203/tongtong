/*************************************************************************
 *   daemon.cpp
 *************************************************************************/

#include <common.h>

class Daemon {
public :
	virtual int Fork(int cnt) = 0;
};

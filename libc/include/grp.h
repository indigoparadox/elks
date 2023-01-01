#ifndef	__GRP_H
#define	__GRP_H

#include <sys/types.h>
#include <features.h>
#include <stdio.h>

/* The group structure */
struct group
{
  char *gr_name;		/* Group name.	*/
  char *gr_passwd;		/* Password.	*/
  gid_t gr_gid;			/* Group ID.	*/
  char **gr_mem;		/* Member list.	*/
};

void setgrent(void);
void endgrent(void);
struct group * getgrent(void);

struct group * getgrgid(const gid_t gid);
struct group * getgrnam(const char * name);

struct group * fgetgrent(FILE * file);

int setgroups(size_t n, const gid_t * groups);
int initgroups(const char * user, gid_t gid);


#ifdef __LIBC__
struct group * __getgrent(int grp_fd);
#endif

#endif /* _GRP_H */




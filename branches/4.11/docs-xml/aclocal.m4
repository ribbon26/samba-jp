dnl (C) 2003-2004 Jelmer Vernooij <jelmer@samba.org>
dnl Published under the GNU GPL
dnl
dnl DOCS_DEFINE_TARGET
dnl arg1: Target that is defined
dnl arg2: Requirement
dnl arg3: Official name
dnl arg4: Makefile target name

AC_DEFUN(DOCS_DEFINE_TARGET, [
	if test "x$$1_REQUIRES" = x; then
		$1_REQUIRES="$$2_REQUIRES"
	else
		$1_REQUIRES="$$1_REQUIRES $$2_REQUIRES"
	fi

	if test x"$$1_REQUIRES" = x; then
		TARGETS="$TARGETS $4"
	else
		AC_MSG_RESULT([Building the $3 requires : $$1_REQUIRES])
	fi
])

dnl DOCS_TARGET_REQUIRE_PROGRAM
dnl arg1: program variable
dnl arg2: program executable name
dnl arg3: target that requires it

AC_DEFUN(DOCS_TARGET_REQUIRE_PROGRAM, [
	AC_CHECK_PROGS([$1], [$2])
	if test x"$$1" = x; then
		if test x"$$3_REQUIRES" = x; then
			$3_REQUIRES="$2"
		else
			$3_REQUIRES="$$3_REQUIRES $2"
		fi
	fi
])

dnl
dnl samba-ja:
dnl To specify the Samba source directory for the Japanese
dnl XML documents to build with the help of them
dnl
AC_DEFUN([AC_CHECK_SAMBA_SRCDIR],[
  AC_MSG_CHECKING([for the original Samba source directory])
  AC_ARG_WITH(sambadir,
    AS_HELP_STRING([--with-sambadir=DIR],
        [Path to the original Samba source directory]),
      [SAMBADIR="$withval"])

  if test "x${SAMBADIR}" = "x"; then
    AC_MSG_RESULT([not specified])
    AC_MSG_ERROR([Specify the Samba source directory using --with-sambadir])
  fi

  if test ! -f "${SAMBADIR}/docs-xml/build/DTD/samba.entities"; then
    AC_MSG_RESULT([not found])
    AC_MSG_ERROR([Wrong Samba source directory: $withval])
  fi

  if test ! -f "${SAMBADIR}/VERSION"; then
    AC_MSG_RESULT([not found])
    AC_MSG_ERROR([Wrong Samba source directory: $withval])
  fi

  dnl Not used; for future use
  SAMBA_VERSION_MAJOR=`grep '^SAMBA_VERSION_MAJOR=.*$' ${SAMBADIR}/VERSION | sed -e 's/^SAMBA_VERSION_MAJOR=//'`
  SAMBA_VERSION_MINOR=`grep '^SAMBA_VERSION_MINOR=.*$' ${SAMBADIR}/VERSION | sed -e 's/^SAMBA_VERSION_MINOR=//'`
  SAMBA_VERSION_RELEASE=`grep '^SAMBA_VERSION_RELEASE=.*$' ${SAMBADIR}/VERSION | sed -e 's/^SAMBA_VERSION_RELEASE=//'`

  AC_SUBST(SAMBADIR)
  AC_SUBST(SAMBA_VERSION_MAJOR)
  AC_SUBST(SAMBA_VERSION_MINOR)
  AC_SUBST(SAMBA_VERSION_RELEASE)
  AC_MSG_RESULT([found])
])

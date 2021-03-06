#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
# Copyright (c) 2018-2019 ARM Ltd. All Rights Reserved.

. tst_test.sh

# Find mountpoint to given subsystem
# get_cgroup_mountpoint SUBSYSTEM
# RETURN: 0 if mountpoint found, otherwise 1
get_cgroup_mountpoint()
{
	local subsystem=$1
	local mntpoint

	[ $# -eq 0 ] && tst_brk TBROK "get_cgroup_mountpoint: subsystem not defined"

	mntpoint=$(grep cgroup /proc/mounts | grep -w $subsystem | awk '{ print $2 }')
	[ -z "$mntpoint" ] && return 1

	echo $mntpoint
	return 0
}

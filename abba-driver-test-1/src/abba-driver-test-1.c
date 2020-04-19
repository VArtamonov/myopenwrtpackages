/*
 *  ABBA test driver
 *
 *  Copyright (C) 2020 VArtamonov <vartamonov@abba.org>
 *
 *  Based on the diag.c - GPIO interface driver for Broadcom boards
 *    Copyright (C) 2006 Mike Baker <mbm@openwrt.org>,
 *    Copyright (C) 2006-2007 Felix Fietkau <nbd@nbd.name>
 *    Copyright (C) 2008 Andy Boyett <agb@openwrt.org>
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>

#define DRV_NAME	"abba-driver-test-1"
#define DRV_DESC	"ABBA - test driver"
#define DRV_VERSION	"0.1"

static int __init abba_example_init(void)
{
	printk(KERN_INFO "ABBA test driver ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");
	printk(KERN_INFO "ABBA - Hello, World!\n");

	return 0;
}

static void __exit abba_example_exit(void)
{
	printk(KERN_INFO "ABBA test driver ... \n");
	printk(KERN_INFO "ABBA Goodbye, World!\n");
}

module_init(abba_example_init);
module_exit(abba_example_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("VArtamonov");
MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);

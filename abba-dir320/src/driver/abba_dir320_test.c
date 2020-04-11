/*
 *  ABBA DIR-320 driver
 *
 *  Copyright (C) 1971-2020
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License version 2 as published
 *  by the Free Software Foundation.
 */

#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>
#include <linux/input.h>

#include <linux/workqueue.h>
#include <linux/skbuff.h>
#include <linux/netlink.h>
#include <linux/kobject.h>

#define DRV_NAME	"abba-dir320-test"
#define DRV_VERSION	"0.0.1"
#define DRV_DESC	"ABBA DIR-320 driver"



/* -------------------------------------------------------------------------*/

static int __init abba_dir_320_init(void)
{
	int ret;

	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");
	ret = input_register_handler(&button_hotplug_handler);
	if (ret)
		BH_ERR("unable to register input handler\n");

	return ret;
}
module_init(abba_dir320_init);

static void __exit abba_dir320__exit(void)
{
	input_unregister_handler(&button_hotplug_handler);
}
module_exit(abba_dir320__exit);

MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);
MODULE_AUTHOR("ABBA");
MODULE_LICENSE("GPL v2");

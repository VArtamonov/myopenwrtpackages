/*
* hello−1.c − The simplest kernel module.
*/
#include <linux/module.h> /* Needed by all modules */
#include <linux/kernel.h> /* Needed for KERN_INFO */

#define DRV_NAME	"abba-dire320-test"
#define DRV_VERSION	"0.0.1"
#define DRV_DESC	"ABBA DIR-320 driver"


int init_module(void)
{
printk(KERN_INFO "Hello world 1.\n");
/*
* A non 0 return means init_module failed; module can't be loaded.
*/
return 0;
}

void cleanup_module(void)
{
printk(KERN_INFO "Goodbye world 1.\n");
}

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("ABBA 2020");
MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);

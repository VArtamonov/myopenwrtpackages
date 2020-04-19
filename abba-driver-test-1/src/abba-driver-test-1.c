#include <linux/module.h>
#include <linux/kernel.h>

#define DRV_NAME	"abba-driver-test-1"
#define DRV_DESC	"ABBA - test driver"
#define DRV_VERSION	"0.1"

static int __init abba_example_init(void)
{
	printk(KERN_INFO "ABBA test driver ... \n");
	printk(KERN_INFO DRV_DESC " version " DRV_VERSION "\n");
	printk(KERN_INFO “ABBA - Hello, World!\n”);

	return 0;
}

static void __exit abba_example_exit(void)
{
	printk(KERN_INFO "ABBA test driver ... \n");
	printk(KERN_INFO “ABBA Goodbye, World!\n”);
}

module_init(abba_example_init);
module_exit(abba_example_exit);

MODULE_LICENSE(“GPL”);
MODULE_AUTHOR(“VArtamonov”);
MODULE_DESCRIPTION(DRV_DESC);
MODULE_VERSION(DRV_VERSION);

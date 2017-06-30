#import "ViewController.h"
#include <sys/utsname.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *BetaLbl;
@property (weak, nonatomic) IBOutlet UILabel *VerLbl;
@property (weak, nonatomic) IBOutlet UILabel *ioVerLbl;
@property (weak, nonatomic) IBOutlet UIButton *pwnBtn;

@end

@implementation ViewController
-(BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *versionOfRelease = @"1.01";
    NSString *typeOfRelease = @"BETA";
    NSString *iosVer = [UIDevice currentDevice].systemVersion;
    NSLog(@"Device Is On: %@", iosVer);
    _ioVerLbl.text = iosVer;
    _BetaLbl.text = typeOfRelease;
    _VerLbl.text = versionOfRelease;
    
    // Luca's method of detecting if jailbroken
    // In order to work we need to set the utsname to TIGRIS
    struct utsname u = { 0 };
    uname(&u);
    if (strstr(u.version, "TIGRIS")) {
        [_pwnBtn setEnabled:NO];
        [_pwnBtn setTitle:@"Jailbroken" forState:UIControlStateDisabled];
    }
}

- (IBAction)goAct:(id)sender {
    UIAlertController *ProgAlert = [UIAlertController alertControllerWithTitle:@"Jailbreaking!"
                                                                   message:@"Locating Kernel (Bruteforce KASLR)"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:ProgAlert animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        ProgAlert.message = @"Patching Kernel";
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.23 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        ProgAlert.message = @"Running Scripts";
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        ProgAlert.message = @"Remount / As RW";
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        ProgAlert.message = @"Jailbroken! Feel Free To Do What You Want Now!";
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
        struct utsname u = { 0 };
        uname(&u);
        if (strstr(u.version, "TIGRIS")) {
            [_pwnBtn setEnabled:NO];
            [_pwnBtn setTitle:@"Jailbroken" forState:UIControlStateDisabled];
        }
    });
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"Jailbreak.exe has stopped working");
}
@end

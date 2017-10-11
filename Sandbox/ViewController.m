//
//  SQAViewController.m
//  Sandbox
//
//  Created by David Lopez Rodriguez on 11/10/2017.
//  Copyright © 2017 David López Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    // Ruta a la carpeta Caches de la Sandbox
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *url = [[fm URLsForDirectory:NSCachesDirectory
                            inDomains:NSUserDomainMask] lastObject];
    
    url = [url URLByAppendingPathComponent:@"test.txt"];
    
    // Guardar algo
    NSError *error = nil;
    BOOL rc = NO;
    rc = [@"Hola mundo" writeToURL:url
                        atomically:YES
                          encoding:NSUTF8StringEncoding
                             error:&error];
    
    if (rc == NO) {
        NSLog(@"Error al guardar: %@", error);
    }
    
    // Leemos el fichero para asegurarnos de que ha salido bien
    NSString *res = [NSString stringWithContentsOfURL:url
                                             encoding:NSUTF8StringEncoding
                                                error:&error];
    
    if (res == nil) {
        NSLog(@"Error al leer: %@", error);
    }
}

@end

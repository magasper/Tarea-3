//
//  ViewController.m
//  Circle Black
//
//  Created by pegasus on 14/09/17.
//  Copyright © 2017 pegasus. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property (strong, nonatomic) IBOutlet UISlider *rprueba;
@property (strong, nonatomic) IBOutlet UISlider *gSlider;
@property (strong, nonatomic) IBOutlet UISlider *bSlider;
@property (strong, nonatomic) IBOutlet UIView *circleView;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtTelephone;
@property (strong, nonatomic) IBOutlet UISwitch *circleSwitch;


@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rprueba.value = 0;
    self.gSlider.value = 0;
    self.bSlider.value = 0;
    
    _circleView.layer.cornerRadius = 60;
    _circleView.layer.masksToBounds = true;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sliderR:(id)sender {
    UISlider *rSlider = (UISlider *)sender;
    
    if (rSlider == _rprueba) {
        int valueR=0;
        valueR = _rprueba.value;
        self.rLabel.text =[@(valueR) stringValue];
    }else if (rSlider == _gSlider){
        int valueG = 0;
        valueG = _gSlider.value;
        self.gLabel.text =[@(valueG) stringValue];
    }else if (rSlider == _bSlider){
        int valueB = 0;
        valueB = _bSlider.value;
        self.bLabel.text = [@(valueB) stringValue];
    }
    UIColor *_color = [UIColor colorWithRed:(_rprueba.value/255.0) green:(_gSlider.value/255.0) blue:(_bSlider.value/255.0) alpha:1.0];
    
    self.circleView.backgroundColor = _color;

}

- (IBAction)hideCircle:(id)sender {
    _circleSwitch = (UISwitch *) sender;
    
    if([_circleSwitch isOn]){
        _circleView.hidden = false;
    }else{
        _circleView.hidden = true;
    }
    
}
- (IBAction)generateRandom:(id)sender {
    
    int rRandom = [self generateColor:0 to: 255];
    int gRandom = [self generateColor:0 to: 255];
    int bRandom = [self generateColor:0 to: 255];
    
    self.rLabel.text =[@(rRandom) stringValue];
    self.gLabel.text =[@(gRandom) stringValue];
    self.bLabel.text =[@(bRandom) stringValue];
    
    self.rprueba.value = rRandom;
    self.gSlider.value = gRandom;
    self.bSlider.value = bRandom;
    
    
    UIColor *_color = [UIColor colorWithRed:(_rprueba.value/255.0) green:(_gSlider.value/255.0) blue:(_bSlider.value/255.0) alpha:1.0];
    self.circleView.backgroundColor = _color;
}

- (int)generateColor:(int)min to:(int)max {
    return (int)min + arc4random() % (max-min+1);
}

- (IBAction)showAlertView:(id)sender {
    NSString *textCircle;
    
    if([_circleSwitch isOn]){
        NSString *valueConcatenate;
        int rRandom = _rprueba.value;
        int gRandom = _gSlider.value;
        int bRandom = _bSlider.value;
        
        NSString * hexStrR = [NSString stringWithFormat:@"%02lX",
                              (unsigned long)[[@(rRandom) stringValue] integerValue]];
        
        NSString * hexStrG = [NSString stringWithFormat:@"%02lX",
                              (unsigned long)[[@(gRandom) stringValue] integerValue]];
        
        NSString * hexStrB = [NSString stringWithFormat:@"%02lX",
                              (unsigned long)[[@(bRandom) stringValue] integerValue]];
        
        valueConcatenate = [NSString stringWithFormat:@"%@%@%@",hexStrR,hexStrG,hexStrB ];
        
        
        textCircle = valueConcatenate;
    }else{
        textCircle = @"No hay circulo";
    }
    
    NSString *content = [NSString stringWithFormat: @"Nombre: %@ Telefono:  %@, Color: %@",self.txtName.text,self.txtTelephone.text, textCircle];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alerta"
                                                                   message:content
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:actionOk];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

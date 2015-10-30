//
//  ARTInfoDataStore.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTInfoDataStore.h"

@implementation ARTInfoDataStore


+ (instancetype)sharedArtInfoDataStore {
    static ARTInfoDataStore *_sharedArtInfoDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedArtInfoDataStore = [[ARTInfoDataStore alloc] init];
    });
    
    return _sharedArtInfoDataStore;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _artworks = [[NSMutableArray alloc]init];
        [self generateArtInfoData];
        
    }
    return self;
}

- (void)generateArtInfoData {
    
    NSString *description =@"On December 15, 1989, the Dow Jones closed at 2739.55, 51 points behind its 1989 high. But Arturo Di Modica, a Soho-based sculptor, was feeling bullish. The previous evening he had visited Broad Street in Lower Manhattan, carefully timing the police patrols around the New York Stock Exchange. He determined that he would have a 4 1/2 minute window to deliver the largest Christmas gift the City of New York ever received: a three-and-a-half-ton, 18-foot-long, bronze “Charging Bull.” Di Modica created this piece of guerrilla art at his Crosby Street studio, ultimately spending more than two years and $350,000 to create, transport and place it under the Christmas tree in front of the exchange.\n\nDi Modica was inspired by New York’s fighting spirit in the wake of the 1987 stock market crash. From the start, “Charging Bull” seemed possessed of the same spirit. Although “it was love right away” with New Yorkers, as Di Modica observed that night, the following morning the stock exchange, itself, was less enamored. In fact, all it wanted to do was return the gift. It unsuccessfully sought to make the police do it, and then secured a private contractor to cart it to a Queens impound lot. According to the New York Times, by day’s end, the Dow Jones was off another 14.08 points. Wall Street analysts were blaming “obscure economic forces,” but New Yorkers, upset about the departure of the bull, recognized a real leading economic indicator when they saw one. Parks Commissioner Henry Stern, Mayor Ed Koch and activist Arturo Piccolo of the Bowling Green Association found a home for “Charging Bull” at Bowling Green within a few days.\n\nOfficially, its status is still under siege. The bull is on loan to the city from Di Modica, a circumstance that normally limits its display to only one year. It has only a temporary permit to stand at the Bowling Green location, which the City indicated would not be permanent. DiModica has offered it for sale to anyone willing to keep it in its current location, but so far, no takers.\n\nNon officially, it is more than capable of defending its territory. In the years sine it arrived, it has fought off copyright infringement by Walmart, by North Fork Bank, by ten other institutions who have used it in advertising, by Random House and by the Occupy Wall Street movement. It survived the biggest Christmas sweater of all time, a full-body, form fitting blue and purple crocheted creation, designed by another guerrilla artist, Oleck, mercifully torn off by a caretaker of the park.\n\nIt has weathered disasters, both natural and man-made. Nonetheless, it holds its own, day in and day out, tolerating both tourists and traders who feel bullish, literally: apparently it’s good luck to rub the bull’s testicles.";
    
    
    ARTInfo *chargingBull = [[ARTInfo alloc] initWithTitle:@"Charging Bull"
                                                    artist:@"Arturo Di Modica"
                                               yearCreated:@"1989"
                                            artDescription:description
                                                    image1:[UIImage imageNamed:@"chargingBull"]
                                                    image2:[UIImage imageNamed:@"chargingBull1"]
                                                  latitude:40.70555
                                                 longitude:-74.01344];
    
    
//    chargingBull.distanceFromUser = @"";
//    
//    
//    [ARTInfoDataStore retrieveDistanceFromUserWithBlock:^ (CLLocation *location) {
//        
//    
//        chargingBull.distanceFromUser = distance;
//        
//        
//        
//    }];
//    
//    
//    
//    [someObject someMethodThatTakesABlock:^returnType (parameters) {...}];
    
    
    
    
    
    
    

    ARTInfo *redCube = [[ARTInfo alloc] initWithTitle:@"Red Cube"
                                                    artist:@"Isamu Noguchi"
                                               yearCreated:@"1968"
                                       artDescription:@"Isamu Noguchi's 'Red Cube' is not really a cube at all. The 28-foot sculpture is a three-dimensional parallelogram; it is tilted and longer than it is wide. The sculpture's bright color creates a point of interest for the pedestrian, and the center hole acts as a viewfinder to the office building's upper floors. Noguchi, a Japanese-born American artist, studied painting and sculpture in New York and Paris. He was invovled with the artists community in Greenwich Village, his studio was in MacDougal Alley. Noguchi worked with architects and other artists throughout his life, including dancer and choreographer, Martha Graham."
                                               image1:[UIImage imageNamed:@"firstRedCube"]
                                               image2:[UIImage imageNamed:@"secondRedCube"]
                                             latitude:40.70846
                                            longitude:-74.00978];
    
    ARTInfo *groupOfFourTrees = [[ARTInfo alloc] initWithTitle:@"Group of Four Trees"
                                               artist:@"Jean Dubuffet"
                                          yearCreated:@"1968"
                                       artDescription:@"Isamu Noguchi's 'Red Cube' is not really a cube at all. The 28-foot sculpture is a three-dimensional parallelogram; it is tilted and longer than it is wide. The sculpture's bright color creates a point of interest for the pedestrian, and the center hole acts as a viewfinder to the office building's upper floors. Noguchi, a Japanese-born American artist, studied painting and sculpture in New York and Paris. He was invovled with the artists community in Greenwich Village, his studio was in MacDougal Alley. Noguchi worked with architects and other artists throughout his life, including dancer and choreographer, Martha Graham."
                                               image1:[UIImage imageNamed:@"groupOfFourTrees"]
                                               image2:[UIImage imageNamed:@"groupOfFourTrees2"]
                                                      latitude:40.70776
                                                     longitude:-74.00885];
    
    ARTInfo *meryl = [[ARTInfo alloc] initWithTitle:@"Second Self"
                                                        artist:@"Meryl McMaster"
                                                   yearCreated:@"2015"
                                                artDescription:@"Meryl McMaster (Plains Cree member of the Siksika Nation, British and Dutch) is an emerging artist from Ottawa, Ontario, whose work is comprised of visually stunning large-scale photography. This exhibition includes selections from “Second Self,” a playful but compelling series of portraits that engage with self-perception and constructed identity. This series was first exhibited in the United States in 2013 when McMaster was selected for RED: Eiteljorg Contemporary Art Fellowship, a biennial program of the Eiteljorg Museum in Indianapolis, Indiana, which honors contemporary Native American artists through an exhibition, catalog, art purchases, and cash prize."
                                                        image1:[UIImage imageNamed:@"secondSelf"]
                                                        image2:[UIImage imageNamed:@"secondSelf1"]
                                                    latitude:40.70403
                                                    longitude:-74.01375];

    
    ARTInfo *unionOfTheSenses = [[ARTInfo alloc] initWithTitle:@"ONE: Union of the Senses"
                                                        artist:@"José Parlá"
                                                   yearCreated:@"2014"
                                                artDescription:@"Titled ONE: Union of the Senses, the mural is a cacophony of colors overlaid with Parlá’s signature graffiti script, requiring eight months of studio work with an additional two weeks on location. Symbolizing the diversity of the city and country, the art piece will hopefully liven up the mornings of the 20,000 inhabitants of the tower as they come in each day. It is the largest part in a collection of seven pieces chosen for the building by New York gallery Edelman Arts as part of a strategy to exhibit art that is “unifying, instead of divisive.” Said Parlá, ”It was very important to me that this painting would reflect a massive respect to the situation and the event and the families, and a massive respect for the site.” Only time will tell the mural’s success in capturing the heavy history of the location, mingled with a celebration of New York and optimism for the future."
                                                        image1:[UIImage imageNamed:@"one-union-of-the-senses-mural-at-one-world-trade-center-1"]
                                                        image2:[UIImage imageNamed:@"thesquarefootcover-1170x429"]
                                                      latitude:40.70982
                                                     longitude:-74.01329];
    
    [self.artworks addObjectsFromArray:@[chargingBull, redCube, groupOfFourTrees, meryl, unionOfTheSenses]];
}

- (void)setupDistanceFromUserPropertyForArtwork:(ARTInfo *)art
                                   withLocation:(CLLocation *)location {
    
//#define MILE_METERS 1609.344
//#define FEET_METERS 3.28084
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = art.latitude;
    coordinate.longitude = art.longitude;
    
    CLLocation *artObjectLocation = [[CLLocation alloc] initWithCoordinate:coordinate
                                                                  altitude:0
                                                        horizontalAccuracy:0
                                                          verticalAccuracy:0
                                                                    course:0
                                                                     speed:0
                                                                 timestamp:[NSDate date]];
    
    CLLocationDistance meters = [artObjectLocation distanceFromLocation:location];
    CGFloat milesDistance = meters / 1609.344;
    NSString *distanceString = [NSString stringWithFormat:@"%.2f",milesDistance];
    
    NSLog(@"Hey, whats your deal: %@", distanceString);
    NSLog(@"Location, accureate: %@", location);
    
    art.distanceFromUser = distanceString;

}

@end

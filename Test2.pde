/* 
  CSC 545-001
  5/5/2016
  Test 2

  This program randomizes pixels within a region
  and animates them over the entire image.
  'p' to toggle fuzz
*/
PImage img, fuzzedImg;
String imgFile =  "4.2.03.jpg";
int regionSize = 20;  //dimension for fuzz
boolean fuzzOn = true;
final int MAXREGION = 50, MINREGION = 0, REGIONDELTA = 10;

void setup() {
  //Your code here to load the image and set size()
  size(400, 400);
  surface.setResizable(true);
  
  img = loadImage(imgFile);
  
  surface.setSize(img.width, img.height);
}
void draw() {
  if(!fuzzOn){
    image(img,0,0);
  }
  else{
   fuzz();
   image(fuzzedImg,0,0); 
  }
}
void fuzz() {
  fuzzedImg = createImage(img.width, img.height, RGB);
  
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      float a = 0;
      float b = 0;
      
      // Get random x value in region
      // One of the following 3 conditions will always be met.
      if(x > regionSize && x < img.width-regionSize)
        a = random(x-regionSize, x+regionSize);
      else if (x <= regionSize)
        a = random(0, x+regionSize); // get from 0 to x+region
      else if(x >= img.width-regionSize)
        a = random(x - regionSize, img.width); // get from x-region to end
        
      // Get random y value in region
      // One of the following 3 conditions will always be met.
      if(y > regionSize && y < img.height-regionSize)
        b = random(y-regionSize, y+regionSize); 
      else if (y <= regionSize)
        b = random(0, y+regionSize); // get from 0 to y+region
      else if(y >= img.height-regionSize)
        b = random(y - regionSize, img.height); // get from y-region to end
      
      // Get pixel from original image.
      color c = img.get(int(a),int(b)); 
      
      // Set pixel of fuzzed image.
      fuzzedImg.set(x,y,c);
    }
  }
}
void keyReleased() {
  if(key == 'f' || key == 'p'){
    // toggle fuzzOn
    fuzzOn = !fuzzOn;
  }
  else if(keyCode == DOWN){
    if(regionSize > MINREGION)
      regionSize -= REGIONDELTA;
  }
  else if(keyCode == UP){
    if(regionSize < MAXREGION)
      regionSize += REGIONDELTA;
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  
  if(e < 0){ // equivalent to DOWN
    if(regionSize < MAXREGION){
      regionSize += REGIONDELTA;
    }
  }
  else if(e > 0){ // equivalent to UP
    if(regionSize > MINREGION)
      regionSize -= REGIONDELTA; 
  }
}
/*
* Draws a simple bar chart with the data specified in data[]
* Users can click to reposition the chart
*
* TODO: handle negative values
* TODO: refactor barchart into a class
*/


int bar_spacing = 5;
int barchart_height = 100;
int barchart_width = 150;
int barchart_xpos = barchart_width;
int barchart_ypos = barchart_height;
int[] data = {23, 45, 80, 53, 64, 64, 12, 73};

void setup(){
  size(500, 500);
  background(255);
}

void draw(){
  // clear background if objects move/change
  background(255);
  
  barchart(data, barchart_width, barchart_height, bar_spacing);
  
  //DEBUG: show mouse positions when mouse pressed
//  if(mousePressed)
//    System.out.println("mouseX: "+mouseX+", mouseY: "+mouseY);

}



void barchart(int[] data, int barchart_width, int barchart_height, int bar_spacing){

  if(mousePressed){
    barchart_xpos = mouseX;
    barchart_ypos = mouseY;
  }

  //translates center of bar chart to specified position  
  translate(barchart_xpos-barchart_width/2, barchart_ypos-barchart_height/2);

  //draw box around entire chart
  fill(255, 255, 255);
  quad(0, barchart_height, 
        barchart_width, barchart_height, 
        barchart_width, 0, 
        0, 0);
      
  //normalize data according to barchart size and store in vals      
  float[] vals = new float[data.length];
  for(int i = 0; i < data.length; i++)
    vals[i] = barchart_height * ( data[i] - 0 ) / ( max(data)*1.05 - 0 ); // ensures small data still has some bar space; max bar is 5% less than barchart height.
    
  //alternative to above: standard normalization:
  //vals[i] =  data[i] - min(data) ) / ( max(data) - min(data) ); //
    
  //calculate space between individual bars
  float bar_width = barchart_width/vals.length - bar_spacing;
    
  //set color (use stroke or fill)
  fill(0, 125, 0);
        
  //loop to draw all bars  
  for(int i = 0; i < vals.length; i++){

    //use translate to space bars
    translate(bar_spacing, 0);
      
    //draw bar  
    quad(bar_width*i, barchart_height, 
          bar_width*(i+1), barchart_height, 
          bar_width*(i+1), barchart_height - vals[i], 
          bar_width*i, barchart_height - vals[i]);
    
  }
  
}



// ----------------------------------------------------------------------------
// ihsan Kehribar <ihsan@kehribar.me>
// ----------------------------------------------------------------------------
PImage img ;
PFont font;

int[][] matrix;
int[][] temp ;

int block_size=11; 

void setup()
{
  img = loadImage("input.jpg");
  smooth();
  int [] color_pick = new int [img.width*img.height];

  color_pick= sort(img.pixels);

  background(0);
  font= loadFont("TimesNewRomanPSMT-48.vlw");

  textFont(font, block_size*1.7);

  noStroke();

  size(img.width*3, img.height);

  image(img, 0, 0);

  matrix= new int[img.width][img.height];
  temp= new int[img.width][img.height];

  for (int i=0; i<img.width; i++)
  {
    for (int k=0;k<img.height; k++)
    {
      matrix[i][k]=img.pixels[k*img.width+i];
    }
  }


  for (int i=0;i<img.width;i=i+block_size)
  {
    for (int t=0; t<img.height;t=t+block_size)
    {
      byte temp_n = byte(random(97, 122));
      char temp_c = char(temp_n);

      for (int a=i; a<i+block_size ; a++)
      {
        for (int b=t; b<t+block_size ; b++)
        {
          if (a<img.width && b<img.height)
          {
            temp[a][b]=matrix[i][t];
            fill(color(temp[a][b]));
            text(temp_c, i+2*img.width, t);
          }
        }
      }
    }
  }

  for (int i=img.width; i<img.width*2; i++)
  {
    for (int k=0;k<img.height; k++)
    {
      int tt= temp[i-img.width][k];
      fill(color(tt));
      rect(i, k, 1, 1);
    }
  }

  save ("output.png");
}

void draw()
{
  
}


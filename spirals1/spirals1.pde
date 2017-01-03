void setup() {
  size(800, 600);
  background(0);
  fill(0,0);
}

int gcd(int a, int b) {
   if (b==0) return a;
   return gcd(b,a%b);
}

int lcm(int a, int b) {
  return a * b / gcd(a, b);
}

int outer_radius = 250;
int inner_radius = 125;
int[] mean = {400, 300};
int inner_pos = 75;
float phase_shift = 1.0;

void drawSpiral(int mean_x, int mean_y, int outer_radius, int inner_radius, int inner_pos, float phase_shift) {
  int radius2 = outer_radius - inner_radius;
  float lcm_radius = float(lcm(inner_radius, outer_radius)); 
  float max_angle = lcm_radius / float(outer_radius) * 2.0 * PI;
  float delta_angle = 0.01;

  println(max_angle, lcm_radius / outer_radius, lcm_radius / inner_radius);
  
  beginShape();
  for (float angle= 0.0; angle <= max_angle; angle += delta_angle) {
    int inner_mean_x = mean_x + int(radius2 * cos(angle));
    int inner_mean_y = mean_y + int(radius2 * sin(angle));
    float angle2 = angle * outer_radius / inner_radius + phase_shift;
    vertex(inner_mean_x + inner_pos * sin(angle2), inner_mean_y + inner_pos * cos(angle2));
  }
  endShape();
}



void draw() {
  
  // ellipseMode(RADIUS);
  // ellipse(400, 300, outer_radius, outer_radius);
  // ellipse(400, 300, radius2, radius2);
  // stroke(255, 127, 0);
  float shift = 0.0;
  for (int i = 0; i < 7; i++) {
    // stroke(200-30*i, 200-30*i, 200-30*i);
    stroke(255, 255, 255);
    drawSpiral(400, 300, 300, 125, 90 - 10 * i, shift * i);
  }
  // drawSpiral(400, 300, 300, 125, 90, 0.2);
  // drawSpiral(400, 300, 300, 125, 80, 0.4);
  // drawSpiral(400, 300, 300, 125, 70, 0.6);
  // drawSpiral(400, 300, 300, 125, 60, 0.8);
  // drawSpiral(400, 300, 300, 125, 50, 1.0);
  // drawSpiral(400, 300, 300, 125, 40, 1.2);
  // drawSpiral(400, 300, 300, 125, 30, 1.4);
  // float shift = PI / 7.0;
  // for (int i = 0; i < 7; ++i) {
  //   stroke(255, 30 * i, 30 * i);
  //   drawSpiral(400, 300 + 10 * i, 250, 100, 60 - 5 * i, i * shift);
  // }
}

void setup() {
  size(1000, 700);
  px = width/2;
  py = height/2;
}
ArrayList<Tama>t = new ArrayList<Tama>();
class Tama {
  float x, y, speed, r, R;
  color c;
  int pattern;
  Tama(float x, float y, float r, float speed, float R, color c, int pattern) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.speed = speed;
    this.R = R;
    this.c = c;
    this.pattern = pattern;
  }
  boolean delete = false;
  void move() {
    fill(c);
    stroke(0);
    strokeWeight(3);
    ellipse(x, y, R*2, R*2);
    x += speed*cos(r);
    y += speed*sin(r);
    if (x < -50 || x > width + 50 || y < -50 || y> height+50) {
      delete = true;
    }
  }
}
int px, py, pr = 15;
void draw() {
  background(155, 255, 155);
  if (w)py -= 3;
  if (s)py += 3;
  if (d)px += 3;
  if (a)px -=3;
  if (px < pr)px = pr;
  if (px > width - pr)px = width-pr;
  if (py < pr)py = pr;
  if (py > height - pr)py = height-pr;
  translate(px, py);
  strokeWeight(9);
  stroke(0);
  line(0, 0, 25*cos(atan2(mouseY-py, mouseX-px)), 25*sin(atan2(mouseY-py, mouseX-px)));
  translate(-px, -py);
  noStroke();
  fill(255, 0, 0, 255);
  ellipse(px, py, pr*2, pr*2);
  for (int i  = 0; i < t.size(); i++) {
    t.get(i).move();
    if (t.get(i).delete) {
      t.remove(i);
    }
  }
  stroke(0);
  strokeWeight(4);
  translate(px, py);
  translate(-px, -py);
}
boolean w, a, s, d;
void keyPressed() {
  if (key == 'w')w = true;
  if (key == 'a')a = true;
  if (key == 's')s = true;
  if (key == 'd')d = true;
}
void keyReleased() {
  if (key == 'w')w = false;
  if (key == 'a')a = false;
  if (key == 's')s = false;
  if (key == 'd')d = false;
}
void mouseReleased() {
  t.add(new Tama(px, py, atan2(mouseY-py, mouseX-px), 9, 8, color(255, 255, 0), 0));
}

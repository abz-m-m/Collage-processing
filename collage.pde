PImage[] images; // Array to hold the images
int cols = 5;
int rows = 6;
float squareSize = 200;
float vSpacing = 130;
float hSpacing = 170;

void setup() {
  size(1080, 1080);

  // Load all images from the "data" folder
  String[] fileList = { "image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg" , "image5.jpg", "image6.jpg", "image7.jpg", "image8.jpg", "image9.jpg",
"image10.jpg", "image11.jpg", "image12.jpg", "image13.jpg", "image14.jpg", "image15.jpg", "image16.jpg", "image17.jpg", "image18.jpg"
, "image19.jpg", "image20.jpg", "image21.jpg", "image22.jpg", "image23.jpg", "image24.jpg", "image25.jpg", "image26.jpg"
, "image27.jpg", "image28.jpg", "image29.jpg", "image30.jpg"}; // Replace with your actual image file names

  ArrayList<PImage> imgList = new ArrayList<PImage>();
  
  // Load each image from the data folder
  for (int i = 0; i < fileList.length; i++) {
    PImage img = loadImage(fileList[i]); // loadImage automatically looks in the 'data' folder
    if (img != null) {  
      imgList.add(img); // Add to list if successful
      println("Loaded image: " + fileList[i]);
    } else {
      println("Error loading image: " + fileList[i]); // Error message if image is null
    }
  }

  // Convert ArrayList to Array
  images = imgList.toArray(new PImage[imgList.size()]);

  if (images.length == 0) {
    println("No valid images found.");
    exit(); // Quit if no images are found
  } else {
    println(images.length + " images loaded successfully.");
  }
  
  noLoop(); // Stop continuous looping
}

void draw() { 
  background(#403A3A);
  
  // Scale entire drawing inside paper
  translate(width /2, height /2);
  scale(1);
  translate(-width / 2.7, -height/3.5);
  
  // Draw the grid
  noStroke();
  noFill();
  rectMode(CENTER);
  float r = 0;
  float n = 0;

  // Iterate through the grid rows and columns
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      push();
      translate(x * hSpacing, y * vSpacing); // Positioning the squares
      rotate(radians(random(-r / 2, r / 2))); // Random rotation

      // Draw the square (optional)
      square(random(-n, n), random(-n, n), squareSize);

      // Randomly select an image from the loaded images
      PImage randomImg = images[int(random(images.length))];
      
      // Draw the image, fitting it inside the square
      float imgX = (squareSize - randomImg.width) / 40; // Centering logic
      float imgY = (squareSize - randomImg.height) / 10;
      image(randomImg, imgX, imgY, squareSize, squareSize); // Draw the image scaled to square size
      
      pop();
    }
    r += 10;
  }
}

void mousePressed() {
  redraw(); // Redraw the grid with new random images
}


// Function to detect when the spacebar is pressed
void keyPressed() {
  if (key == 'b') { // Check if the spacebar is pressed
    saveFrame("Helloworld-##.png"); // Save the current frame to the sketch folder with a numbered filename
    println("Image saved to sketch folder");
  }
}

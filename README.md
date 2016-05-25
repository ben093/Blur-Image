# Blur-Image
Blur an image. Written in Processing 3. CSC 545 Test 2

Complete Test2.pde to blur an image by randomly swapping pixels within a region. For example, if the region size is 10 and the target pixel is at position (115, 312), swap the target pixel with one randomly chosen from all pixels with an x position ranging from 105 to 125 and a y position ranging from 302 to 322. For full credit, animate the effect (call the fuzz function from inside the draw loop) and process all pixels to the edges of the image—do not leave an unprocessed border. Allow the user to control the region size using hot keys or mouse wheel (implement both—the user can use either one at any given time). Set hot keys as follows: ‘f’ toggles fuzzification—if the fuzzed image is shown, show the clear, unfuzzed image; otherwise show the fuzzed image (default is fuzz on with a region size of 20). Up arrow increases the region size by a constant (REGIONDELTA); max region size is determined by another constant (MAXREGION). Moving the mouse wheel forward (away from the user) one click is equivalent to pressing up arrow one time; moving the mouse wheel backward (toward the user) one click is equivalent to pressing the down arrow one time. Down arrow decreases the region size by REGIONDELTA, with a minimum size of MINREGION. The test will be graded according to the following criteria:
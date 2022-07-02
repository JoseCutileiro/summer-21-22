// Hello world using the copilot

#include <stdio.h>
#include <stdlib.h>

// a bootle of water struct to keep info 
// of the quantity of water and the price of the bottle

typedef struct bottle {
    int quantity;
    float price;
} bottle;

// a function to print the info of a bottle
void print_bottle(bottle b) {
    printf("Bottle: %d ml, $%.2f\n", b.quantity, b.price);
}

// a function to create an empty bottle
void create_bottle(bottle *b) {
    b->quantity = 0;
    b->price = 0.0;
}
// a function to fill a bottle with water
// with a certain quantity
// each ml of water is worth $1.12
void fill_bottle(bottle *b, int quantity) {
    b->quantity = quantity;
    b->price = quantity * 1.12;
}

// On the main function create 
// two bottles of water, fill the first with 100 ml
// and the second with a random ammount of water between 0 and 100 ml
// print the info of the two bottles

int main() {
    bottle b1, b2;
    create_bottle(&b1);
    create_bottle(&b2);
    fill_bottle(&b1, 100);
    fill_bottle(&b2, rand() % 100);
    print_bottle(b1);
    print_bottle(b2);
    return 0;
}
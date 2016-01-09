// <NOTE> This is for question 16
// <NOTE> From scan file:  accu05/SCAN0030.jpg

#include "typedefs.h"

enum crop_type { barley, corn, wheat, salmon = 10000, trout, eels };
enum crop_category { cereal, fish };
enum chemicals { none = 0,
                 antibiotics = 1,
                 pesticides = 2,
                 weedkillers = 4,
                 radioactive_waste = 8 //...
               };

struct farm_owner { // as registered_farmowner
/* * */    char * surname;
/* * */    char * firstname;
/* * */    char * title;
};

struct field_location {
/* * */    double longitude;   // or could define some head of
/* * */    double latitude;    // boundry region/path, but this could
                        // be quite complex
};

struct farm_details {
/* 7 */    char * address_name;
/* 7 */    char * address_street;
/* 7 */    char * address_town;
/* 7 */    char * address_country;

/* 7 */    char * address_postal_code;
/* 7 */    char * phone_number;

/* 11 */    farm_owner * owner;
/* * */    int num_fields;
/* 12 */    field_location fields[__DUMMY_CONST];
/* 4 */    date last_inspected;
};

struct product_type {
/* * */    char * name;
/* 1 */    char * genetic_id;
/* * */    crop_type type;
/* * */    crop_category category;
};

// Separate table because will vary ave time
struct market_price {
/* * */    product_type product;
/* 3 */    date price_date;
/* 3 */    currency unit_price;
};

struct average_labour_cost {
/* * */    product_type product;
/* 15 */    date cost_date;
/* 15 */    currency cost;
};

struct crop {
/* * */    product_type * product;
/* * */    farm_details * farm;
/* * */    field_location * field;
/* 6 */    bool organic;
/* 5 */    date initiated;
/* 2 */    date harvested; // ie "killed" :(
/* 13 */    int chemical_use;   // chemicals used (see enum above) ORed together
};

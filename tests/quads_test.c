#include "quads_test.h"

int quads_test() {
    struct quad bidon = quad_bidon(42);

    print_quad(bidon, NULL);

    return 0;
}
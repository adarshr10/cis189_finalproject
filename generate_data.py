import numpy as np
from numpy.random import multinomial
import sys

def create_data(num_nurses):
    # determined by a 2021 study find that average nurse to patient ratio is 1 to 6.3
    num_patients = num_nurses * 7
    limit = 8

    # determined by how the NHS classifies patients - mild, severe, severse systemic, point of death, brain-dead
    num_types = 5

    patients_of_each_type = np.random.multinomial(num_patients, np.ones(num_types)/num_types)

    acuities = [np.random.randint(low=1, high=40, size=num_types) for _ in range(num_nurses)]

    f = open('data/hospital_data.txt', 'w+')

    with open('data/hospital_data.txt', 'w') as f:
        f.write(f'{num_nurses} {num_patients} {num_types}\n')
        f.write(f'0 {limit}\n\n')
        for i in range(len(patients_of_each_type) - 1):
            num = patients_of_each_type[i]
            f.write(f'{num} ')
        f.write(f'{patients_of_each_type[len(patients_of_each_type) - 1]}\n\n')

        for i in range(num_nurses):
            for j in range(num_types - 1):
                val = num = acuities[i][j]
                f.write(f'{val} ')
            f.write(f'{acuities[i][num_types - 1]}\n')

create_data(int(sys.argv[1]))




    
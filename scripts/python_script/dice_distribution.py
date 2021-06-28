#!/usr/bin/env python3

import argparse
import itertools
import sys

import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import BSpline

def parse_arguments():
    """
    Setup parser
    :return: parsed arguments
    """
    parser = argparse.ArgumentParser(description="Plot dice distribution")
    parser.add_argument('--dice', default=None, type=str,
                        help="Dice combination to 'roll'")
    parser.add_argument('--advantage', default=False, action="store_true")
    parser.add_argument('--disadvantage', default=False, action="store_true")
    args = parser.parse_args()
    return args


def get_dice_from_str(dice_str):
    """
    convert dice string to amount and sides
    :param dice_str (str): string to represent dice e.g. '3d6'
    :return (int, int): amount, sides
    """
    try:
        values = dice_str.split("d")
        assert len(values) == 2
        amount, sides = values
        amount = int(amount)
        sides = int(sides)
    except:
        print(f"Invalid dice string '{dice_str}' given. Needs to be of format 'XdY'")
        sys.exit(0)

    return amount, sides


def roll_dice(amount, sides, advantage=False, disadvantage=False):
    """
    roll dice
    :param amount (int): number of dice to roll (of type)
    :param sides (int): which dice / sides of each dice
    :param advantage (bool): whether advantage is given (roll twice, take higher)
    :param disadvantage (bool): whether disadvantage is given (roll twice, take lower)
    :return (np.array(int), float, float): distribution, mean, std
        distribution given by list of ints with number of times values (1, ...) are reached
    """
    max_val = amount * sides
    distribution = np.zeros((max_val,))
    
    roll_twice = advantage ^ disadvantage
    if roll_twice:
        amount *= 2

    combinations = itertools.product(range(1, sides + 1), repeat=amount)

    all_values = []
    for comb in combinations:
        if roll_twice:
            values = sorted(comb)
            take_values = amount // 2
            if advantage:
                # get highest take_values
                val = sum(values[-take_values:])
            else:
                # get lowest take_values
                val = sum(values[:take_values])
        else:
            val = sum(comb)
        distribution[val - 1] += 1
        all_values.append(val)

    return distribution, np.mean(all_values), np.std(all_values)


def plot_distribution(distribution):
    """
    Plot distribution as bar chart with curve above
    :param distribution (np.array(int)): array of number of times each value is reached (starting
        at 1)
    """
    x_values = np.linspace(1, len(distribution), len(distribution))
    plt.bar(x_values, distribution)


if __name__ == "__main__":
    args = parse_arguments()
    amount, sides = get_dice_from_str(args.dice)
    distribution, mean, std = roll_dice(amount, sides, args.advantage, args.disadvantage)
    plot_distribution(distribution)
    print(f"Mean +/- std of distribution: {mean} +/- {std}")
    plt.show()

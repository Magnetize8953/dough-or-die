import random
from collections import defaultdict


def distribute_to_batches(items, batch_sizes, batch_names=None):
    if not items or not batch_sizes or sum(batch_sizes) < len(items):
        raise ValueError(
            "Invalid input: items must not be empty, batch sizes must be positive, and their sum must accommodate all items.")

    num_batches = len(batch_sizes)
    batches = defaultdict(list)

    # Ensure every item appears at least once across the batches
    remaining_items = items[:]
    random.shuffle(remaining_items)
    for i in range(num_batches):
        while batch_sizes[i] > len(batches[i]) and remaining_items:
            batches[i].append(remaining_items.pop())

    # Distribute remaining items randomly to allow repetition
    extra_items = random.choices(items, k=sum(batch_sizes) - len(items))
    random.shuffle(extra_items)

    for i in range(num_batches):
        while batch_sizes[i] > len(batches[i]) and extra_items:
            batches[i].append(extra_items.pop())

    if batch_names and len(batch_names) == num_batches:
        return {batch_names[i]: batches[i] for i in range(num_batches)}
    return [batches[i] for i in range(num_batches)]


# Example usage
rooms = [6, 11, 12, 13, 16, 17, 21, 23] + list(range(25, 57))
batch_sizes = [5, 4, 5, 6, 3, 6, 16, 8, 5, 4, 6, 5, 4, 4, 5, 7, 5, 4]
batch_names = ["BLa", "BLb", "BMa", "BMb", "BRa", "BRb", "Ca", "Cb", "MLa", "MLb", "MRa", "MRb", "TLa", "TLb", "TMa",
               "TMb", "TRa", "TRb"]
batches = distribute_to_batches(rooms, batch_sizes, batch_names)
with open("RoomRandomBackgroundGuide.txt", "w") as f:
    for name, batch in batches.items():
        f.write(f"{name}: {batch}\n")
        print("Room assignments have been saved to RoomRandomBackgroundGuide.txt")

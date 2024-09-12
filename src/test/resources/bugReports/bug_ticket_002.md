# Bug Ticket 002: Start Location Accepts Invalid Coordinates

## Description
The hoover's starting location can accept coordinates outside the room size, including positive and negative numbers, except when `x = -1` or when `x = 5` in a 5x5 room. This behavior is inconsistent and allows invalid inputs for room boundaries.

## Steps to Reproduce
1. Define the room dimensions as 5x5.
2. Set the starting location coordinates to values outside the room dimensions, such as `(-2, 3)`, `(6, 2)`, `(-1, 0)`, or `(0, -3)`.
3. Observe that the system accepts these invalid coordinates without returning an error, except for `x = -1` and `x = 5`.

## Expected Result
The system should return an error if the starting location coordinates are outside the room's valid dimensions. For a room size of 5x5, valid coordinates should be between `0 <= x < 5` and `0 <= y < 5`.

## Actual Result
The system accepts invalid starting coordinates, except when `x = -1` or `x = 5`.

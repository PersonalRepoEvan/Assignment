# Bug Ticket 003: System Retains Deleted Dirt Patches

## Description
When dirt patches are modified or deleted after one iteration, the system incorrectly retains the original dirt patches as existing, even if they have been deleted or relocated. As a result, the hoover counts dirt patches that no longer exist in the room, leading to an incorrect total of cleaned dirt patches.

## Steps to Reproduce

1. Define room size (e.g., `5x5`).
2. Set initial dirt patches at `(1, 1)` and `(2, 2)`.
3. Provide cleaning instructions: `"NNNNEEEESSSSWWWNNNEESSWN"`, which covers the entire room.
4. Verify that all patches are cleaned.
5. Remove or relocate dirt patches (e.g., delete `(1, 1)` and `(2, 2)`, or move them).
6. Issue the same cleaning instructions: `"NNNNEEEESSSSWWWNNNEESSWN"`.
7. Observe the system counting dirt patches from step 2 and newly defined patches from step 5 in the final result.

## Expected Result
Only the dirt patches present after step 5 should be counted.

## Actual Result
The system counts dirt patches from both step 2 (deleted/relocated) and step 5.
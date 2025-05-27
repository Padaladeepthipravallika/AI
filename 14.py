import sys

def alpha_beta(depth, node_index, maximizing_player, values, alpha, beta, max_depth):
    if depth == max_depth:
        return values[node_index]

    if maximizing_player:
        max_eval = -sys.maxsize
        for i in range(2):
            eval = alpha_beta(depth + 1, node_index * 2 + i, False, values, alpha, beta, max_depth)
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)
            if beta <= alpha:
                break  # Beta cut-off
        return max_eval
    else:
        min_eval = sys.maxsize
        for i in range(2):
            eval = alpha_beta(depth + 1, node_index * 2 + i, True, values, alpha, beta, max_depth)
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)
            if beta <= alpha:
                break  # Alpha cut-off
        return min_eval

# User input
max_depth = int(input("Enter the depth of the game tree: "))
num_leaves = 2 ** max_depth
print(f"Enter {num_leaves} leaf node values (space-separated): ")
values = list(map(int, input().split()))

if len(values) != num_leaves:
    print(f"Error: Expected {num_leaves} values.")
else:
    result = alpha_beta(0, 0, True, values, -sys.maxsize, sys.maxsize, max_depth)
    print("Optimal value:", result)

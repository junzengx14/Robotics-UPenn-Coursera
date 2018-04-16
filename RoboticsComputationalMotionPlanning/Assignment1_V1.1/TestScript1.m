%
% TestScript for Assignment 1
%

%% Define a small map
map = false(10);
map (1:5, 5:8) = true;
start_coords = [6, 2];
dest_coords  = [8, 9];

%%
close all;
[route, numExpanded] = AStarGrid (map, start_coords, dest_coords);
% Uncomment following line to run Astar
% [route, numExpanded] = AStarGrid (map, start_coords, dest_coords);

%HINT: With default start and destination coordinates defined above, numExpanded for Dijkstras should be 76, numExpanded for Astar should be 23.

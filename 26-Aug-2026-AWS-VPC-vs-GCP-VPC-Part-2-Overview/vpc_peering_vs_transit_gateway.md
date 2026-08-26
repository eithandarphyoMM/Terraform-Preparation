[ VPC Peering: Full Mesh ]             [ AWS Transit Gateway: Hub & Spoke ]

   VPC A <-------> VPC B                      VPC A       VPC B
     ^  \       /  ^                            \         /
     |   \     /   |                             v       v
     |    \   /    |                          +-------------+
     |     \ /     |                          |   Transit   |
     |      X      |                          |   Gateway   |
     |     / \     |                          +-------------+
     v    /   \    v                             ^       ^
   VPC C <-------> VPC D                         /       \
                                              VPC C       VPC D
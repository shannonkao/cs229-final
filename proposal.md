#Project Proposal
##Problem
In this project, we will try to "learn" how to animate a human rig using motion capture data. We want to be able to build a human rig skeleton rig in Maya, or another animation software, and tell it to walk without having to manually animate it or get motion capture data specific to that rig. 

Our training data will be BHV files of human walk cycles. These files contain the skeleton hierarchy, with each joint assigned a parent and an offset from that parent. Usually this initial skeleton pose is the T-pose. The files also contain the relative transformations at each time point for each joint.

##Approach
We are considering this a clustering problem. Each rig will be broken down into its constituent joints (e.g. elbow, head, foot) and each joint will have a y-vector corresponding to the time-varying walk cycle transformations and a feature set consisting of its absolute position. We will apply an algorithm to cluster these joints. Then, given a new rig, we will again break it down into joints and assign each to the appropriate cluster. The end result will be a set of learned walk cycle transforms on each joint of the new rig. 

##Challenges
There will be several challenges when formatting the input data. Firstly, BVH files construct a skeleton with relative position values of the joints, which is continuous data, and the joint hierarchy, which is discrete data. We can easily transform the data into absolute position data and get rid of the hierarchy information, so we only have continuous data. This will make the learning algorithm implementation simpler, but we do not know if it will produce good results. If needed, we could add the joint hierarchy information to the joint feature set to improve our results.  

Secondly, not all bvh data have the same joint hierarchies nor the same T-pose. Our hope is that the machine learning algorithm will be able to handle that gracefully. Handling different joint hierarchies is a primary goal for our model, because we would like to be able to animate our own arbitrary skeleton rig. 

There will be smaller issues, such as different time steps and different total time length of each training sample. We can preprocess the data to make it uniform in that respect.

##System
We will implement our learning algorithm in Matlab to develop a “walk-cycle model”. Then, once we have a model, we can write a script for Maya to apply the model to skeleton rigs that we build in Maya. Our final result should be a walking skeleton rig.
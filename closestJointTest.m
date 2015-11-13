joints = getData('test_walkcycles');
testJoint = [0,0,0];

[translations, rotations] = closestJoint( joints, testJoint );
display(translations);
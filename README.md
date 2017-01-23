在 Firemonkey 在移动平台 Android & iOS 要直接在 Canvas 画出 1 点像素的线，似乎有点困难，不过利用一点小技巧，还是能达到这个要求的，首先要建立一个 Bitmap 并将大小乘以目前机子的 Scale ，再开始绘图即可。

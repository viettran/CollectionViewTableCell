# CollectionViewTableCell
UICollectionView Inside A UITableViewCell With Self Sizing

If you are looking for a way to put a collection view inside a table cell without manually calculating table row heights, you are in the right place.

If your app target is iOS 14, you might consider using UICollectionLayoutListConfiguration (https://developer.apple.com/documentation/uikit/uicollectionlayoutlistconfiguration) to construct sections of the collection view as lists like in table views. Here is a WWDC-20 video, https://developer.apple.com/videos/play/wwdc2020/10026/, showing how to do that.

This was written when iOS 14 just came out. Many apps still target iOS 13 or earlier. This method is for those apps.

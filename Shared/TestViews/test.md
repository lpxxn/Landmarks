#  <#Title#>

@State和@ObservableObject之间有一些细微的差异。这些都是很重要的，因为它们都有不同的用途。首先，@State在视图本地。值或数据在视图中本地保存。
它由框架管理，由于它存储在本地，因此它是一个值类型。但是@ObservableObject在视图外部，并且不存储在视图中。
它是一种引用类型，因为它不在本地存储，而只是具有对该值的引用。这不是由框架自动管理的，而是开发人员的责任。这最适用于外部数据，例如数据库或由代码管理的模型。

@Binding也在视图内，但是与@State区别在于@Binding用于不通视图之间的参数传递。@Binding 和@ObservedObbjecg一样都是传递引用。

@EnvironmentObject 可以理解为全局变量


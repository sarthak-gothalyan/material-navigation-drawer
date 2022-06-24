// .brightness
// .onFocus

@Component
struct Drawer {
	menu: {page: string, icon: string | Resource}[] = [
		{page: "Page 1", icon: $r('app.media.icon')},
		{page: "Page 1", icon: $r('app.media.icon')},
		{page: "Page 1", icon: $r('app.media.icon')},
	]

	@Builder
	Item(page: string, icon: string | Resource) {
		Flex({justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center}) {
			Image(icon)
				.objectFit(ImageFit.Cover)
				.width(24)
				.height(24)
				.margin({right: 20})
			Text(page)
				.fontSize(20)
				.fontColor(Color.Black)
				.flexGrow(1)
				.maxLines(1)
		}
		.padding(7)
	}

	build() {
		Column() {
			List() {
				ForEach(this.menu, (it) => {
					ListItem() {
						this.Item(it.page, it.icon)
					}
				}, (it, index) => index.toString())
			}
		}
		.width(180)
		.height('100%')
		.position({x: 0, y: 0})
		.justifyContent(FlexAlign.Center)
		.transition({ type: TransitionType.Insert, translate : {x:-180.0} })
		.transition({ type: TransitionType.Delete, translate : {x:-180.0,} })
		.backgroundColor(Color.White)
	}
}

export { Drawer }
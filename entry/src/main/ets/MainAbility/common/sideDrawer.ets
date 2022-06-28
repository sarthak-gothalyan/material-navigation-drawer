// .brightness
// .onFocus

@Component
struct SideDrawer {
	@Link vis: boolean
	menu: {
		page: string,
		path: string,
		icon: string | Resource
	}[] = [
		{ page: "Page 1", path: 'pages/p1', icon: $r('app.media.icon') },
		{ page: "Page 2", path: 'pages/p2', icon: $r('app.media.icon') },
		{ page: "Page 3", path: 'pages/p3', icon: $r('app.media.icon') },
	]

	@Builder
	Item(page: string, path: string, icon: string | Resource) {
		Navigator({target: path, type: NavigationType.Push}) {
			Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
				Image(icon)
					.objectFit(ImageFit.Cover)
					.width(24)
					.height(24)
					.margin({ right: 20 })
				Text(page)
					.fontSize(20)
					.fontColor(Color.Black)
					.flexGrow(1)
					.maxLines(1)
			}
			.padding(7)
		}
		.params({ text: 'this.Text' })
	}

	build() {
		Stack() {
			Column()
				.width('100%')
				.height('100%')
				.onClick(() => {
					animateTo({ duration: 1000 }, () => {
						this.vis = false
					})
				})
				.backgroundColor("#80dbdbdb")

			Column() {
				List() {
					ForEach(this.menu, (it) => {
						ListItem() {
							this.Item(it.page, it.path, it.icon)
						}
					}, (it, index) => index.toString())
				}
			}
			.width(180)
			.height('100%')
			.justifyContent(FlexAlign.Center)
			.position({ x: 0, y: 0 })
			.transition({ type: TransitionType.Insert, scale: { x: 0.0, centerX: 0.0 } })
			.transition({ type: TransitionType.Delete, scale: { x: 0.0, centerX: 0.0 } })
			.backgroundColor(Color.White)
		}
		.width('100%')
		.height('100%')
	}
}

export { SideDrawer }
import { MenuOption, SideDrawer } from '../common/main'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption("Page 1", 'pages/p1', $r('app.media.icon')),
		new MenuOption("Page 2", 'pages/p2', $r('app.media.icon')),
		new MenuOption("Page 3", 'pages/p3', $r('app.media.icon'))
	]
	backgroundColor: string | Color = Color.White
	model: SideDrawer.Model = new SideDrawer.Model('180vp', 100)
	menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('180vp', '24vp', '24vp')

	aboutToAppear() {

	}

	build() {
		Stack() {
			Column() {
				Button("CLick to open side drawer")
					.fontSize(20)
					.fontWeight(FontWeight.Bold)
					.onClick(() => {
						animateTo({ duration: 1000 }, () => {
							this.vis = !this.vis
							console.log(this.vis + '')
						})
					})
			}
			.justifyContent(FlexAlign.Center)
			.width('100%')
			.height('100%')
			.onClick(() => {
				animateTo({ duration: 1000 }, () => {
					if (this.vis) this.vis = !this.vis
					console.log(this.vis + '')
				})
			})

			if (this.vis) {
				SideDrawer({
					menu: this.menu,
					visible: $vis,
					model: this.model,
					menuModel: this.menuModel
				})
			}
		}
		.width('100%')
		.height('100%')
	}
}
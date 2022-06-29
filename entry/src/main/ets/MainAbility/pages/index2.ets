import { MenuItemType, MenuOption, BottomDrawer } from '../common/main'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption(MenuItemType.Subtitle, 'Pages'),
		new MenuOption(MenuItemType.Divider),
		new MenuOption(MenuItemType.Page, "Page 1", 'pages/p1', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Page 2", 'pages/p2', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Page 3", 'pages/p3', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Index 1", 'pages/index1', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Index 2", 'pages/index2', $r('app.media.icon')),
	]
	model: BottomDrawer.Model = new BottomDrawer.Model('180vp', 100)
	menuModel: BottomDrawer.MenuModel = new BottomDrawer.MenuModel('30vp', '24vp', '24vp')

	aboutToAppear() {
		this.menuModel.setActiveBackgroundColor(Color.Green)
		this.menuModel.setActiveTextColor(Color.Blue)
	}

	build() {
		Stack() {
			Column() {
				Button("Open bottom drawer")
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
				BottomDrawer({
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
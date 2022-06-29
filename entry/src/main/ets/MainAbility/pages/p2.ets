import { MenuOption, SideDrawer } from '../common/main'

@Entry
@Component
struct P2 {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption("Page 1", 'pages/p1', $r('app.media.icon')),
		new MenuOption("Page 3", 'pages/p3', $r('app.media.icon')),
		new MenuOption("Index 1", 'pages/index1', $r('app.media.icon')),
		new MenuOption("Index 2", 'pages/index2', $r('app.media.icon')),
	]
	backgroundColor: string | Color = Color.White
	model: SideDrawer.Model = new SideDrawer.Model('180vp', 100)
	menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('180vp', '24vp', '24vp')

	build() {
		Stack() {
			Column() {
				Text('Page 2').fontSize('20vp').onClick(() => {
					animateTo({ duration: 1000 }, () => {
						this.vis = !this.vis
						console.log(this.vis + '')
					})
				})

				Button('Open Drawer').onClick(() => {
					animateTo({ duration: 1000 }, () => {
						this.vis = !this.vis
						console.log(this.vis + '')
					})
				})
			}

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
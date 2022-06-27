import { SideDrawer } from '../common/sideDrawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	backgroundColor: string | Color = Color.White

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
					if(this.vis) this.vis = !this.vis
					console.log(this.vis + '')
				})
			})
			//.opacity(this.vis ? 0.5 : 1)
			//.backgroundColor(this.vis ? Color.Black : this.backgroundColor)

			if(this.vis) {
				SideDrawer({vis: $vis})
			}
		}
		.width('100%')
		.height('100%')
	}
}
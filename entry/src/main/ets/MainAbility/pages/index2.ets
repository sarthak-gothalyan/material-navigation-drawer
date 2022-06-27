import { BottomDrawer } from '../common/bottomDrawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	backgroundColor: string | Color = Color.White

	build() {
		Stack() {
			Column() {
				Button("CLick to open bottom drawer")
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
				BottomDrawer({ vis: $vis })
			}
		}
		.width('100%')
		.height('100%')
	}
}
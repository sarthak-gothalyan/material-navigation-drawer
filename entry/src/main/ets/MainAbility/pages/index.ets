import { Drawer } from '../common/drawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false

	build() {
		Stack() {
			Column() {
				Button("CLick to open drawer")
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
			.colorBlend(Color.Black)
			.contrast(0)
			.grayscale(0)
			.brightness(0)
			.saturate(0)
			.blur(1)

			if(this.vis) {
				Drawer()
			}
		}
		.width('100%')
		.height('100%')
	}
}
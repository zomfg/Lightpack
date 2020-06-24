export const name = "Breathing"

export const interval = 40 // ms

let lightnessInc = 1

export function shine(baseColor, colors)
{
	baseColor = new QColor(baseColor)
	let color = new QColor(colors[0])
	if (color.lightness() == 50 && lightnessInc == -1)
		lightnessInc = 1
	else if (color.lightness() == baseColor.lightness() && lightnessInc == 1)
		lightnessInc = -1

	color.setHsl(baseColor.hslHue(), baseColor.hslSaturation(), color.lightness() + lightnessInc)
    return colors.fill(color.rgb())
}

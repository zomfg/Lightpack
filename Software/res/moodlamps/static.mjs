export const name = "Static (default)"

// note: in static or very slow animations it's better to keep the refresh interval under 500ms to avoid bugs
export const interval = 50 // ms

export function shine(baseColor, colors)
{
	return colors.fill(baseColor)
}

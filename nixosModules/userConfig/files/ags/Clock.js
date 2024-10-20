export function Clock() {
    const date = Variable("", {
        poll: [1000, 'date "+%I:%M %p"'],
    });
    return Widget.Button({
      child: Widget.Label({ label: date.bind() }),
    });
}


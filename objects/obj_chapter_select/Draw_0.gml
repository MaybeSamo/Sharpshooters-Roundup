var chapter_titles = [
    "Chapter 1    The Beginning",
    "Chapter 2    A Cyber's World",
    "Chapter 3    Late Night",
    "Chapter 4    Prophecy"
];

var chapter_sprites = [1, 2, 4, 5]; // subimage indices

draw_set_font(fnt_main);

// draw horizontal bars
for (var i = 1; i < 8; i++) {
    draw_sprite(spr_horzBar, 0, 160, i * 30);
}

// draw chapters + icons
for (var i = 0; i < array_length(chapter_titles); i++) {
    var _y = 8 + (i * 28); // adjust spacing
    draw_text(20, _y, chapter_titles[i]);
    draw_sprite(spr_chapterIcon, chapter_sprites[i], 280, y + 7);
}

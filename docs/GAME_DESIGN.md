# Game Design

This is the foundational design reference for TeachersPet. Every gameplay, content,
and implementation decision should be checkable against this document. When a future
choice conflicts with these principles, revisit this doc before proceeding.

## Player Profile

- Player: Selah, age 8.
- Personality: creative, energetic, playful, imaginative.
- Interests: Bluey, Peppa Pig, Gabby's Dollhouse, dress-up, makeup, playful fashion,
  her cat Henry, dressing up Henry, and the song "Golden" from KPop Demon Hunters.
- Learning profile: ADHD and mild dyslexia; roughly a year behind in reading and math
  but catching up.
- Sensitivities: short attention span for traditional learning; can become frustrated
  or discouraged quickly when something feels too hard, boring, repetitive, or like
  schoolwork.
- Educational goal: improve spelling, reading confidence, and word recognition while
  genuinely wanting to play.

## Foundational Design Principles

1. Play first, learning underneath. The experience is imaginative play with Henry and
   friends. Never use the words quiz, test, lesson, or homework.
2. Tiny loops, big momentum. Activities complete in 30-90 seconds with a visible,
   near-term reward.
3. Mistakes are part of the story. Wrong answers trigger gentle in-world reactions and
   route to support, never penalty.
4. Multisensory by default. Every word is seen, heard, and acted on. Audio-first so
   reading speed never gates progress.
5. Visual calm, emotional warmth. Clean, uncluttered screens, large touch targets,
   dyslexia-friendly type, generous spacing.
6. Made-for-Selah personalization. Henry, dress-up, fashion, makeup play, magical rooms,
   and music-inspired energy are first-class content.
7. Healthy motivation, not compulsion. Use progress, collection, and surprise. Avoid
   manipulative patterns, punishing streak loss, and anxiety timers.
8. Adapts quietly. Difficulty bends invisibly. Never expose difficulty labels.
9. Effort is celebrated. Reward trying and persisting, not only correct answers.
10. A quiet window for the parent. A separate, non-gamified view for Ryan, never shown
    to Selah.

## Design Tensions (resolved direction)

- Recognition vs. production: graduate from recognition to guided production to full
  production.
- Reward density vs. pacing: deliberate reward rhythm, not reward-on-everything.
- Novelty vs. repetition: repetition wearing different costumes (same word, new
  activity, new context).
- Adaptation vs. predictability: gentle, smoothed adjustment with a stable floor.

## Core Loop Direction (agreed)

- Meta loop: Henry's Magic Room as a cozy home base and collection space.
- Primary loop: themed spelling moments with delightful in-world consequences
  (dress Henry, mix a magic potion, etc.).
- Novelty bursts: optional short "word adventures" with 3-5 words and a surprise.

## Learning Spine (agreed)

Staged spelling progression:

1. Choose the word (recognition).
2. Fill the missing letter(s) (partial production).
3. Order scrambled letters (guided production).
4. Build from a letter tray (full production).

Support practices:

- Audio-first: the target word is always hearable and replayable.
- Teach by phonics pattern, not random lists.
- Spaced repetition: missed words return sooner; mastered words return occasionally.
- Hint ladder: replay audio, show picture, reveal first letter, show ghosted word,
  build together.

## Adaptive Difficulty Model (conceptual)

- Track per-word state: new, learning, shaky, mastered.
- Adjust support level, not only word difficulty.
- Keep a stable floor: on repeated struggle, drop to recognition plus heavy support and
  rebuild confidence before pushing.
- Advance gently: raise challenge only after consistent low-support success.

## Risks to Avoid

1. Looking or feeling like school (language, UI, test framing).
2. Over-rewarding to the point of compulsion or reward fatigue.
3. Punishing mistakes or streak loss in any visible way.
4. Reading speed becoming a hidden gate (always pair text with audio).
5. Cluttered, animation-overloaded screens that overwhelm focus.
6. Adaptive logic that feels random or unfair instead of supportive.
7. Asset scope creep (dress-up/fashion) outrunning the learning core.
8. Building production-heavy spelling before recognition confidence exists.

## Starter Word List (~2nd grade, by pattern)

Tunable up or down based on performance. Grouped by pattern so the game can teach the
rule, not just the word.

- CVC: cat, dog, pig, hat, sun, bed, cup, fox, bug, net
- Blends: stop, frog, clap, spin, jump, hand, milk, nest, fast, lamp
- Digraphs: ship, fish, chin, chip, this, then, bath, with, when, wish
- Magic-e / CVCe: cake, name, bike, time, home, nose, cute, game, kite, rope
- Vowel teams: rain, play, seed, team, boat, road, snow, moon, feet, leaf
- Sight words: the, you, was, said, they, are, have, with, what, from
- Selah-themed bonus: cat, Henry, pink, star, song, play, cute, gold, dress, paw

First focus: start in CVC plus a few sight words, then introduce digraphs and magic-e as
confidence grows. Themed bonus words are good for early meaningful wins.

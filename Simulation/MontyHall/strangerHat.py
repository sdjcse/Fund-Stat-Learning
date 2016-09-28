#!/usr/bin/python3
import random

iteration = 1000

hat = ["empty","empty","prize"]

win = 0
lost = 0

# iteration for not switching
for i in range(1,iteration):
    random.shuffle(hat)
    # I pick a hat
    pick = random.randrange(3)
    # stranger picks a hat
    strangerPick = list(range(3))
    strangerPick.remove(pick)
    if hat.index("prize") in strangerPick:
        strangerPick.remove(hat.index("prize"))
        strangerPick = strangerPick[0]
    else:
        strangerPick = strangerPick[random.randrange(1)]
    if hat[pick] == "prize":
        win+=1
    else:
        lost += 1


print("Running 1000 iterations of hat selection and not switching after stranger picks his...")
print("Did not switch hat and the percentage of success is: {}".format(win/iteration))
print("percentage lost: {}".format(lost/iteration))

win = 0
lost = 0

# iteration for not switching
for i in range(1,iteration):
    random.shuffle(hat)
    # I pick a hat
    pick = random.randrange(3)
    # stranger picks a hat
    strangerPick = list(range(3))
    strangerPick.remove(pick)
    if hat.index("prize") in strangerPick:
        strangerPick.remove(hat.index("prize"))
        strangerPick = strangerPick[0]
    else:
        strangerPick = strangerPick[random.randrange(2)]
    prevPick = pick
    pick = list(range(3))
    pick.remove(prevPick)
    pick.remove(strangerPick)
    pick = pick[0]
    if hat[pick] == "prize":
        win+=1
    else:
        lost += 1

print("Running 1000 iterations of hat selection and switching after stranger picks his...")
print("Did not switch hat and the percentage of success is: {}".format(win/iteration))
print("percentage lost: {}".format(lost/iteration))

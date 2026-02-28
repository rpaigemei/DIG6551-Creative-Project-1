// variables: juliet's trust level & romeo's banishment status
VAR trust_level = 0
VAR is_banished = false

# theme: light
# author: Paige Reeves

/*
    .css
        .quote {
            font-style: italic;
        }
*/

// prologue //
Two households, both alike in dignity. #CLASS: quote
In fair Verona, where we lay our scene. #CLASS: quote
From ancient grudge break to new mutiny, #CLASS: quote
Where civil blood makes civil hands unclean. #CLASS: quote
From forth the fatal loins of these two foes #CLASS: quote
A pair of star-crossed lovers take their life. #CLASS: quote

<br/>

So says fate... But what if the stars lie? What if the stars may be undone?

Tonight, you are Romeo and the stars pause for thy choice.

// move to act I
* [Take fate into thine own hand]
    -> ACT_I

// act I: the party //
== ACT_I
Verona wakes to violence. Servants quarrel, swords ring. Benvolio cries for peace, but Tybalt cries out.

"I hate the word as I hate hell, all Montagues, and thee."

These feuds are ancient, but your unrest is newer. Rosaline's name lingers like a wound. She hath forsworn love, vowing to live chaste, while your heart, denied, twists upon itself.

"O brawling love, O loving hate," you murmur to yourself. "Feather of lead, bright smoke, cold fire, sick health."
   
Benvolio urges you to forget her. A feast is proclaimed at the Capulets' house this night. Perhaps there you may spy other beauties. Yet, a heaviness clings.

"My mind misgives some consequence yet hanging in the stars shall bitterly begin his fearful date with this night's revels..."

Still, the night calls.

/* decision point */
    // choice 1: attend the party -> move to party
    * [Attend the Capulet feast, despite your heavy heart]
        -> PARTY
    
    // choice 2: stay at home -> move to early ending
    * [Remain at home and yield to melancholy]
        -> EARLY_END

// capulet's party //
= PARTY
Music and torchlight flood the Capulet hall, while laughter drifts like perfume. You wear a mask, yet your heart lies bare.

Until you see her...

"O, she doth teach the torches to burn bright," you think. She hangs upon the cheek of night like a rich jewel.
    
You take her hand and speak as though heaven itself guides your tongue.

"If I profane with my hand this holy shrine," you say softly, "the gentle sin is this: my lips, two blushing pilgrims, ready stand to smooth that rough touch with a tender kiss."
    
She does not withdraw her hand.

"Good pilgrim," she replies gently, "you do wrong your hand too much. Saints have hands that pilgrims’ hands do touch, and palm to palm is holy palmers’ kiss."

"Have not saints lips?" you ask.

"Ay," she says, smiling, "lips that they must use in prayer."

"O then, dear saint, let lips do what hands do."

"Saints do not move," she whispers.

"Then move not, while my prayer’s effect I take."

You kiss her.

And then her name falls from the Nurse's lips... Capulet.

"Is she a Capulet?" The air leaves your lungs. "O dear account. My life is my foe's debt."

The night is no longer merely a feast. It is destiny unfolding.

// move to act II
* [Seek her again beneath the quiet of night]
    -> ACT_II

// act II: the balcony //
== ACT_II
The orchard wall is high, yet love gives wings. You climb.

Above, Juliet appears.

"But soft, what light through yonder window breaks? It is the east, and Juliet is the sun."

She speaks your name, unaware you hear.

"O Romeo, Romeo, wherefore art thou Romeo?"

/* decision point */
    // choice 1: immediately reveal yourself -> increases trust_level by 1
    * [Step forth at once and declare yourself]
        ~ trust_level += 1
        You reveal yourself, breathless, swearing to cast off your name if she but call you love.
        
        /* decision point */
            // choice 1: impulsively swears on the moon -> decreases trust_level by 1
            ** [Swear your devotion by the blessed moon above]
                ~ trust_level -= 1
                "Lady, by yonder blessed moon I swear -"
                
                She interrupts gently. "O, swear not by the moon, th' inconstant moon..."
            
            // choice 2: speak calmly -> increases trust_level by 1
            ** [Speak plainly from the constancy of your heart]
                ~ trust_level +=1
                You abandon grand oaths and speak only truth: that your love is too vast to measure.
    
    // choice 2: wait and listen -> increases trust_level by 2
    * [Remain hidden and listen to her confession]
        ~ trust_level += 2
        You linger in shadow as she pours her soul into the night.
        
        "My bounty is as boundless as the sea, my love as deep."
        
        Only then do you answer softly, telling her that stony limits cannot hold love out.

-
/* decision point */
    // choice 1: plan carefully -> increases trust_level by 1
    * [Propose a careful and secret plan]
        ~ trust_level += 1
        You urge patience, seeking counsel and stealth rather than rash delight.
        
        She smiles. "Let this bud of love grow slowly,"
    
    // only if trust_level is greater or equal to 2
    // choice 2: urge to marry immediately -> decreases trust_level by 1
    * {trust_level >= 2} [Urge that you be wed with haste, ere morning comes]
        ~ trust_level -= 1
        You press for swift union, fearing delay may undo you both.
        
        "It is too rash, too unadvised, too sudden." she warns, though she does not withdraw. <> "Let this bud of love grow slowly."

-
// conditional text based on trust_level
// if trust_level is greater or equal to 2, juliet trusts romeo
{trust_level >= 2:
    Her gaze softens fully. Trust has taken root between you, fragile yet real.
// if trust_level is less than 2, juliet does not trust romeo
- else:
    Though she loves you, uncertainty lingers in her eyes, as though the night itself warns caution.
}

"Good night, good night," she calls softly. Parting is such sweet sorrow"

// move to act III
* [Meet the coming day]
    -> ACT_III

// act III: the fight //
== ACT_III
Tybalt finds you in the street.

"Romeo, the love I bear thee can afford No better term than this: thou art a villain." 

Yet he knows not that you are newly bound to his house by secret vow.

"I do protest I never injured thee," you reply, loving him better than he can devise.

Mercutio will have none of it. "O calm, dishonourable, vile submission!" he cries, and draws his sword.
    
Steel clashes before you can prevent it. You move between them, but Tyblat's blade slips past. Mercutio falters.

"A plague o’ both your houses!" he gasps. "Ask for me tomorrow, and you shall find me a grave man."

Mercutio falls.

Now, Tybalt stands before you.

/* decision point */
    // choice 1: fight tybalt -> is_banished = true
    * [Let vengeance rule thee]
        ~ is_banished = true
        
        The world turns red.
        
        "Away to heaven, respective lenity," you cry. "Fire-eyed fury be my conduct now!"
        
        You pursue Tybalt with reckless wrath. He falls.
        
        But triumph brings you no relief, only despair. "O, I am fortune's fool!"
            
        The Prince arrives in a fury. For spilling Capulet blood, you are banished from Verona on pain of death.
        
        // move to act IV
        ** [Flee Verona to its sorrow]
            -> ACT_IV
    
    // choice 2: do not fight tybalt -> is_banished remains false
    * [Choose restraint over revenge]
        Your hand trembles upon your sword, yet you do not draw.
        
        "Mercutio's soul is but a little way above our heads," you whisper, "and stays for thine to keep him company."
            
        The watch descends upon the street before further blood may spill. Tybalt, seeing the gathering guards, retreats with curses upon his tongue.
        
        When the Prince arrives, there is mourning and fury. But there is no sentence of exile.
        
        You remain in Verona, though grief shadows every breath.
        
        // move to act IV
        ** [Step toward Juliet and let love guide thee]
            -> ACT_IV

// act IV: the plan (juliet) //
== ACT_IV
Night deepens, and sorrow spreads quietly through Verona. While you wrestle with
        // conditional text based on is_banished
        // if is_banished == true, romeo struggles with his exile
    <>  {is_banished:
            your exile
            
        // else, romeo struggles with his grief
        - else:
            grief
        }
    <>, Juliet faces a sentence of her own.

Her father commands she wed Paris. 

She refuses, "I will not marry yet; and when I do, I swear it shall be Romeo."

Desperate, she flees to Friar Lawrence, threatening death rather than betrayal. The Friar offers a fearful remedy: a vial whose liquid shall borrow from death and make her seem a lifeless corpse.

"For two and forty hours," he promises, no pulse shall give her away.
    
Alone in her chamber, Juliet gather courage and drinks to you. She falls as if dead.

Laid in the Capulet tomb, she shall wake and you shall come for her. A letter is sent to tell you all.

// move to act V
* [Await what fate dawn shall bring]
    -> ACT_V

// act V: the tomb - finale //
== ACT_V
Night wraps at the Capulet tomb in dreadful stillness. Before any letter reaches your hand, another voice finds you first.

Balthasar brings ruin in his breath, "My lord, I saw her laid low in her kindjuliet's vault." Dead. The word strikes like steel.

// conditional text based on is_banished
// if is_banished == true, the friar's letter never reached exile
{is_banished:
    No word of Friar Lawrence’s has reached you in Mantua.

// if is_banished = true, the friar's letter never reached exile
- else:
    A letter was sent, yet fate has tangled its path before it found your hand.
}

"I defy you, stars," you breath, and hasten to the Capulet tomb.
    
Within the monument Juliet lies, pale and still.

"O my love, my wife..." you whisper, with poison resting in your grasp.

The world has narrowed to this stone chamber.
    
        // conditional text based on is_banished AND trust_level
        // if is_banished == false && trust_level is greater or equal to 2, romeo notices she could just be asleep
    <>  {is_banished == false && trust_level >=2:
            Yet something in her face stays your hand. She looks not conquered, but sleeping.
            
        // else, the only choice is tragedy
        - else:
            Despair clouds your judgment; you see only death before you.
        }

/* decision point */
    // choice 1: drink the poison -> move to tragic ending
    * [Drink the poison and follow Juliet into death]
        You lift the vial of poison.
        
        "Here's to my love." The poison burns swift. "Thus with a kiss I die."
        
        -> TRAGIC_END
    
    // only if is_banished is false and trust_level is greater or equal to 2
    // choice 2: wait to see juliet wake -> move to happy ending
    * {is_banished == false && trust_level >=2} [Look closer... does she truly sleep?]
        Doubt stays you. You press trembling fingers to her wrist.
        
        A flutter. Her eyes open.
        
        "O comfortable Friar," she breathes.
            
        Footsteps echo beyond the tomb, yet you seize her hand.
        
        "Then I deny you, stars," you say.
        
        -> HAPPY_END

// early ending: romeo does not meet juliet at party //
== EARLY_END
    You remain at home.
    
    The feast passes unchallenged. Juliet weds Paris. Years soften the sharpness of youthful longing.
    
    Sometimes, in quiet hours, you wonder what light might have broken through yonder window.
    
    The stars remain untested.
    
    -> END
  
// happy ending: romeo see juliet wake, the feud dissolves, and they live happily ever after  //
== HAPPY_END
    The houses, shaken by near tragedy, behold you both alive.
    
        // conditional text based on is_banished
        // if is_banished, exile has been lifted
    <>  {is_banished:
            Your exile is lifted in mercy, for death has already brushed too near.
        
        // else, no exile to be lifted
        - else:
            Verona whispers of miracles and mercy.
        }
        
        // conditional text based on trust_level
        // if trust_level is greater or equal to 2, juliet fully trusts romeo
    <>  {trust_level >= 2:
            Juliet’s hand finds yours without hesitation.
        
        // else, juliet does not fully trusts romeo
        - else:
            Though she lives, the memory of doubt lingers faintly between you.
        }
    
    Grief turns to reconciliation and the feud dissolves.
    
    The stars, for once, have been defied.
    
    -> END

// tragic ending: the original story //
== TRAGIC_END
    Juliet wakes moments too late.
    
    "O churl," she cries, seeing the empty vial. Finding no poison left to share, she draws your dagger.
        
    "O happy dagger. This is thy sheath."
    
    Thus fall the star-crossed lovers, as once foretold.
    
    -> END

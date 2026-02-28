# Creative Project 1: ink Story

### Rewriting the Stars: An Interactive Retelling of Romeo & Juliet

This project is an interactive retelling of William Shakespeare’s *Romeo and Juliet*, developed in ink. Players step into the role of Romeo and make key decisions to fulfill or defy the stars.

The original story can be found [here](https://www.folger.edu/explore/shakespeares-works/romeo-and-juliet/read/).

Play *Rewriting the Stars: An Interactive Retelling of Romeo & Juliet* [here](https://rpaigemei.github.io/DIG6551-Creative-Project-1/).

###### Word Count: 1485
---

#### Variables

##### Juliet's Trust Level
The game tracks Juliet's trust level with Romeo, and its value is affected by decisions in Act II. This influences dialogue in the story and Romeo's ability to wait for Juliet in Act V.

`VAR trust_level = 0`

##### Romeo's Banishment
This variable monitors Romeo's banishment status. It becomes true if Romeo fights Tybalt in Act III. This affects later dialogue and whether Romeo is able to wait for Juliet in Act V.

`VAR is_banished = false`

---
#### Decision Points

##### Decision Point 1
In Act I, players have the choice to attend the Capulet's party or stay at home. If they attend the party, the story progresses and Romeo will meet Juliet. If they stay at home, the story reaches its early ending.
```
* [Attend the Capulet feast, despite your heavy heart]
	-> PARTY

* [Remain at home and yield to melancholy]
	-> EARLY_END
```
###### Lines 50-56

##### Decision Point 2
In Act II, players can decide between immediately revealing themselves to Juliet on the balcony or waiting to listen to her confession. If they immediately reveal themselves, trust_level is only increased by 1. If they wait, trust_level is increased by 2.
```
* [Step forth at once and declare yourself]
	~ trust_level += 1
	
	You reveal yourself, breathless, swearing to cast off your name if she but call you love.
	...

* [Remain hidden and listen to her confession]
	~ trust_level += 2
	
	You linger in shadow as she pours her soul into the night.
	
	"My bounty is as boundless as the sea, my love as deep."
	
	Only then do you answer softly, telling her that stony limits cannot hold love out.
```
###### Lines 109-112, 128-134

##### Decision Point 3
If players reveal themselves immediately to Juliet in Act II, players can decide to impulsively swear on the moon or speak calmy. If they swear on the moon, trust_level is decreased by 1. If they speak calmly, trust_level is increased by 1.
```
** [Swear your devotion by the blessed moon above]
	~ trust_level -= 1
	
	"Lady, by yonder blessed moon I swear -"
	
	She interrupts gently. "O, swear not by the moon, th' inconstant moon..."

** [Speak plainly from the constancy of your heart]
	~ trust_level +=1
	
	You abandon grand oaths and speak only truth: that your love is too vast to measure.
```
###### Lines 115-125

##### Decision Point 4
At the end of Act II, players choose how they approach the wedding proposal. The default option is to propose a careful plan. If trust_level is greater or equal to 2, they they will the additional option to urge to be wed immediately. If they propose a careful plan, trust_level increases by 1. If they urge for an immediate wedding, trust_level is decreased by 1.
```
* [Propose a careful and secret plan]
	~ trust_level += 1
	
	You urge patience, seeking counsel and stealth rather than rash delight.
	
	She smiles. "Let this bud of love grow slowly,"
	
* {trust_level >= 2} [Urge that you be wed with haste, ere morning comes]
	~ trust_level -= 1
	
	You press for swift union, fearing delay may undo you both.
	
	"It is too rash, too unadvised, too sudden." she warns, though she does not withdraw. <> "Let this bud of love grow slowly."
```
###### Lines 138-151

#### Decision Point 5
After Tybalt kills Mercutio in Act III, players decide to fight Tybalt or not. If they fight Tybalt, Romeo is banished. If they do not fight, Romeo is not banished.
```
* [Let vengeance rule thee]
	~ is_banished = true
	
	The world turns red.
        
	"Away to heaven, respective lenity," you cry. "Fire-eyed fury be my conduct now!"
        
	You pursue Tybalt with reckless wrath. He falls.
        
	But triumph brings you no relief, only despair. "O, I am fortune's fool!"
            
	The Prince arrives in a fury. For spilling Capulet blood, you are banished from Verona on pain of death.
	
	** [Flee Verona to its sorrow]
		-> ACT_IV

* [Choose restraint over revenge]
	Your hand trembles upon your sword, yet you do not draw.
        
	"Mercutio's soul is but a little way above our heads," you whisper, "and stays for thine to keep him company."
            
	The watch descends upon the street before further blood may spill. Tybalt, seeing the gathering guards, retreats with curses upon his tongue.
        
	When the Prince arrives, there is mourning and fury. But there is no sentence of exile.
        
	You remain in Verona, though grief shadows every breath.
	
	** [Flee Verona to its sorrow]
		-> ACT_IV
```
###### Lines 190-222

#### Decision Point 6
In Act V, Juliet has been temporarily put to rest and players meet the final decision in the story. The constant option is to drink the poision. However if Romeo is not banished and Juliet's trust level is greater or equal to 2, they can choose to look more closely at Juliet. If they drink the poison, the story ends in tragedy like the original. If they choose to look more closely, the story gets a happy ending where Romeo sees Juliet wake.
```
* [Drink the poison and follow Juliet into death]
	You lift the vial of poison.
        
	"Here's to my love." The poison burns swift. "Thus with a kiss I die."
        
	-> TRAGIC_END

* {is_banished == false && trust_level >=2} [Look closer... does she truly sleep?]
	Doubt stays you. You press trembling fingers to her wrist.
        
	A flutter. Her eyes open.
        
	"O comfortable Friar," she breathes.
            
	Footsteps echo beyond the tomb, yet you seize her hand.
        
	"Then I deny you, stars," you say.
        
	-> HAPPY_END
```
###### Lines 289-310

---
#### Endings

##### Early Ending
If the player chooses to not attend the Capulet party in Act I, they reach the early ending. Since Romeo never meets Juliet, she is forced to marry Paris and Romeo ponders on what could have been.
```
== EARLY_END
	You remain at home.
    
	The feast passes unchallenged. Juliet weds Paris. Years soften the sharpness of youthful longing.
    
	Sometimes, in quiet hours, you wonder what light might have broken through yonder window.
    
	The stars remain untested.
    
	-> END
```
###### Lines 313-322

##### Happy Ending
If the player chooses to look more closely at Juliet in Act V, they reach the happy ending where Romeo sees her wake. In this ending, the feud dissolves and they live happy ever after.
```
== HAPPY_END
	The houses, shaken by near tragedy, behold you both alive.
    
	<>  {is_banished:
				Your exile is lifted in mercy, for death has already brushed too near.
				
			- else:
				Verona whispers of miracles and mercy.
		}

    <>  {trust_level >= 2:
				Juliet’s hand finds yours without hesitation.
				
		- else:
				Though she lives, the memory of doubt lingers faintly between you.
		}
    
	Grief turns to reconciliation and the feud dissolves.
    
	The stars, for once, have been defied.
    
	-> END
```
###### Lines 325-352

##### Tragic Ending
If players drinks the poison at the end of Act V, they reach the original, tragic ending. This ending fulfills the story's destiny of the two lovers' dying for each other.
```
== TRAGIC_END
	Juliet wakes moments too late.
    
	"O churl," she cries, seeing the empty vial. Finding no poison left to share, she draws your dagger.
    
	"O happy dagger. This is thy sheath."
    
	Thus fall the star-crossed lovers, as once foretold.
    
	-> END
```
###### Lines 355-364

---
#### AI Usage Statement
In this project, I used AI to help generate the story's dialogue. I planned the narrative and developed it in ink, but prompted ChatGPT to translate my outline into second-person Shakespearean dialogue. I did this because the Shakespearean language has always been hard for me to understand, but I really wanted to match the original story.

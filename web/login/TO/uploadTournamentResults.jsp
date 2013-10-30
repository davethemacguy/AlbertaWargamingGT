<!DOCTYPE HTML>
<html>
    <head>
        <title>AWGT: Submit Tournament Results</title>

        <script>function confirmation() {
            var answer = confirm("Are you sure you wish to submit?")
            if (answer)
            {
                document.getElementById("tourneyInput").submit();
            }
        }</script>
            <%@include file="/includes/header.jsp" %>
        <script src=<%request.getContextPath();%>"/AlbertaWargaming/includes/jquery-1.8.1.min.js"></script>
    </head>
    <body>
        <div id="mainBody" style="text-align: center">
            <script>
            $(document).ready(function() {
            
                $('#createArray').click(function() {
                
                });
            
            
                $('#remove40K').click(function() {
                    var num40K = $('.clonedInputFortyK').length; // how many "duplicatable" input fields we currently have
                    $('#inputFortyK' + num40K).remove();     // remove the last element
 
                    // if only one element remains, disable the "remove" button
                    if (num40K-1 == 1)
                        $('#remove40K').attr('disabled','disabled');
                });
            
                $('#addPlayer40K').click(function() {
                    var num40K     = $('.clonedInputFortyK').length; // how many "duplicatable" input fields we currently have
                    var newNum40K  = new Number(num40K + 1);      // the numeric ID of the new input field being added
 
                    // create the new element via clone(), and manipulate it's ID using newNum value
                    var newElem = $('#inputFortyK' + num40K).clone().attr('id', 'inputFortyK' + newNum40K);
 
                    // manipulate the name/id values of the input inside the new element
                    newElem.children(':nth-child(1)').attr('id', 'firstNameFortyK' + newNum40K).attr('name', 'firstNameFortyK'+newNum40K).attr( 'value', newNum40K);
                    newElem.children(':nth-child(2)').attr('id', 'lastNameFortyK' + newNum40K).attr('name', 'lastNameFortyK' + newNum40K);
                    newElem.children(':nth-child(3)').attr('id', 'armyFortyK' + newNum40K).attr('name', 'armyFortyK' + newNum40K);
                    newElem.children(':nth-child(4)').attr('id', 'scoreFortyK' + newNum40K).attr('name', 'scoreFortyK' + newNum40K);
                    newElem.children(':nth-child(5)').attr('id', 'optOutFortyK' + newNum40K).attr('name', 'optOutFortyK' + newNum40K);
 
                    // insert the new element after the last "duplicatable" input field
                    $('#inputFortyK' + num40K).after(newElem);
                
                    // Enable remove button
                    $('#remove40K').removeAttr('disabled');
                });
            
           
        
                $('#removeFantasy').click(function() {
                    var numFantasy = $('.clonedInputFantasy').length; // how many "duplicatable" input fields we currently have
                    $('#inputFantasy' + numFantasy).remove();     // remove the last element
 
                    // if only one element remains, disable the "remove" button
                    if (numFantasy-1 == 1)
                        $('#removeFantasy').attr('disabled','disabled');
                });
            
                $('#addPlayerFantasy').click(function() {
                    var numFantasy     = $('.clonedInputFantasy').length; // how many "duplicatable" input fields we currently have
                    var newNumFantasy  = new Number(numFantasy + 1);      // the numeric ID of the new input field being added
 
                    // create the new element via clone(), and manipulate it's ID using newNum value
                    var newElem = $('#inputFantasy' + numFantasy).clone().attr('id', 'inputFantasy' + newNumFantasy);
 
                    // manipulate the name/id values of the input inside the new element
                    newElem.children(':nth-child(1)').attr('id', 'firstNameFantasy' + newNumFantasy).attr('name', 'firstNameFantasy' + newNumFantasy).attr( 'value', newNumFantasy);
                    newElem.children(':nth-child(2)').attr('id', 'lastNameFantasy' + newNumFantasy).attr('name', 'lastNameFantasy' + newNumFantasy);
                    newElem.children(':nth-child(3)').attr('id', 'armyFantasy' + newNumFantasy).attr('name', 'armyFantasy' + newNumFantasy);
                    newElem.children(':nth-child(4)').attr('id', 'scoreFantasy' + newNumFantasy).attr('name', 'scoreFantasy' + newNumFantasy);
                    newElem.children(':nth-child(5)').attr('id', 'optOutFantasy' + newNumFantasy).attr('name', 'optOutFantasy' + newNumFantasy);
                
                    // insert the new element after the last "duplicatable" input field
                    $('#inputFantasy' + numFantasy).after(newElem);
                
                    // Enable remove button
                    $('#removeFantasy').removeAttr('disabled');
                });
            
                $('#removeWarmaHordes').click(function() {
                    var numWarmaHordes = $('.clonedInputWarmaHordes').length; // how many "duplicatable" input fields we currently have
                    $('#inputWarmaHordes' + numWarmaHordes).remove();     // remove the last element
 
                    // if only one element remains, disable the "remove" button
                    if (numWarmaHordes-1 == 1)
                        $('#removeWarmaHordes').attr('disabled','disabled');
                });
            
                $('#addPlayerWarmaHordes').click(function() {
                    var numWarmaHordes     = $('.clonedInputWarmaHordes').length; // how many "duplicatable" input fields we currently have
                    var newNumWarmaHordes  = new Number(numWarmaHordes + 1);      // the numeric ID of the new input field being added
 
                    // create the new element via clone(), and manipulate it's ID using newNum value
                    var newElem = $('#inputWarmaHordes' + numWarmaHordes).clone().attr('id', 'inputWarmaHordes' + newNumWarmaHordes);
 
                    // manipulate the name/id values of the input inside the new element
                    newElem.children(':nth-child(1)').attr('id', 'firstNameWarmaHordes' + newNumWarmaHordes).attr('name', 'firstNameWarmaHordes' + newNumWarmaHordes).attr( 'value', newNumWarmaHordes);
                    newElem.children(':nth-child(2)').attr('id', 'lastNameWarmaHordes' + newNumWarmaHordes).attr('name', 'lastNameWarmaHordes' + newNumWarmaHordes);
                    newElem.children(':nth-child(3)').attr('id', 'armyWarmaHordes' + newNumWarmaHordes).attr('name', 'armyWarmaHordes' + newNumWarmaHordes);
                    newElem.children(':nth-child(4)').attr('id', 'scoreWarmaHordes' + newNumWarmaHordes).attr('name', 'scoreWarmaHordes' + newNumWarmaHordes);
                    newElem.children(':nth-child(5)').attr('id', 'optOutWarmaHordes' + newNumWarmaHordes).attr('name', 'optOutWarmaHordes' + newNumWarmaHordes);
 
                    // insert the new element after the last "duplicatable" input field
                    $('#inputWarmaHordes' + numWarmaHordes).after(newElem);
                
                    //Enable remove button
                    $('#removeWarmaHordes').removeAttr('disabled');
                });   
            
                $('#remove40K').attr('disabled','disabled');
                $('#removeFantasy').attr('disabled','disabled');
                $('#removeWarmaHordes').attr('disabled','disabled');
            });       
            </script>

            <h1>Submit Tournament Results</h1>
            <br>  
            <table>
                <tr>
                    <td>
                        <form action="/AlbertaWargaming/login/TO/uploadResults" method="post" id="tourneyInput">
                            Tournament name:<input type="text" name="tournamentName" id="tournamentName">
                            Tournament Date:<input type="date" name="tournamentDate" id="tournamentDate">(Must be exactly like "YYYY-MM-DD")
                            <br><br>
                            <label>Game System: Warhammer 40,000</label>
                            <br>
                            Best Overall:<input type="text" name="bestOverallFortyK" id ="bestOverallFortyK">
                            Best General:<input type="text" name="bestGeneralFortyK" id ="bestGeneralFortyK">
                            Best Painted:<input type="text" name="bestPaintedFortyK" id ="bestPaintedFortyK">
                            Best Sport:<input type="text" name="bestSportFortyK" id ="bestSportFortyK">
                            <br>
                            <div id="inputFortyK1" style="margin-bottom:4px;" class="clonedInputFortyK">
                                First name:<input type="text" name="firstNameFortyK1" id="firstNameFortyK1" value="1">
                                Last name:<input type="text" name="lastNameFortyK1" id="lastNameFortyK1">
                                Army:<select name="armyFortyK1" id="armyFortyK1">
                                    <option value="Blood Angels">Blood Angels</option>
                                    <option value="Chaos Daemons">Chaos Daemons</option>
                                    <option value="Chaos Space Marines">Chaos Space Marines</option>
                                    <option value="Dark Angels">Dark Angels</option>
                                    <option value="Dark Eldar">Dark Eldar</option>
                                    <option value="Eldar">Eldar</option>
                                    <option value="Grey Knights">Grey Knights</option>
                                    <option value="Imperial Guard">Imperial Guard</option>
                                    <option value="Necrons">Necrons</option>
                                    <option value="Orks">Orks</option>
                                    <option value="Sisters of Battle">Sisters of Battle</option>
                                    <option value="Space Marines">Space Marines</option>
                                    <option value="Space Wolves">Space Wolves</option>
                                    <option value="Tau Empire">Tau Empire</option>
                                    <option value="Tyranids">Tyranids</option>
                                </select>
                                Score:<input type="text" name="scoreFortyK1" id="scoreFortyK1">
                                Circuit Opt-Out:<input type="checkbox" name="optOutFortyK1" id="optOutFortyK1" value="0">
                            </div>
                            <div>
                                <input type="button" id="remove40K" value="Remove this player"/>
                                <input type="button" id="addPlayer40K" value="Add a player"/>
                            </div>
                            <br>
                            <label>Game System: Warhammer Fantasy</label>
                            <br>
                            Best Overall:<input type="text" name="bestOverallFantasy" id ="bestOverallFantasy">
                            Best General:<input type="text" name="bestGeneralFantasy" id ="bestGeneralFantasy">
                            Best Painted:<input type="text" name="bestPaintedFantasy" id ="bestPaintedFantasy">
                            Best Sport:<input type="text" name="bestSportFantasy" id ="bestSportFantasy">
                            <br>
                            <div id="inputFantasy1" style="margin-bottom:4px;" class="clonedInputFantasy">
                                First name:<input type="text" name="firstNameFantasy1" id="firstNameFantasy1" value="1">
                                Last name:<input type="text" name="lastNameFantasy1" id="lastNameFantasy1">
                                Army:<select name="armyFantasy1" id="armyFantasy1">
                                    <option value="Beastmen">Beastmen</option>
                                    <option value="Bretonnia">Bretonnia</option>
                                    <option value="Daemons of Chaos">Daemons of Chaos</option>
                                    <option value="Chaos Dwarfs">Chaos Dwarfs</option>
                                    <option value="Dark Elves">Dark Elves</option>
                                    <option value="Dwarfs">Dwarfs</option>
                                    <option value="High Elves">High Elves</option>
                                    <option value="Lizardmen">Lizardmen</option>
                                    <option value="Ogre Kingdoms">Ogre Kingdoms</option>
                                    <option value="Orcs and Goblins">Orcs and Goblins</option>
                                    <option value="Skaven">Skaven</option>
                                    <option value="The Empire">The Empire</option>
                                    <option value="Tomb Kings">Tomb Kings</option>
                                    <option value="Vampire Counts">Vampire Counts</option>
                                    <option value="Warriors of Chaos">Warriors of Chaos</option>
                                    <option value="Wood Elves">Wood Elves</option>
                                </select>
                                Score:<input type="text" name="scoreFantasy1" id="scoreFantasy1">
                                Circuit Opt-Out:<input type="checkbox" name="optOutFantasy1" id="optOutFantasy1" value="0">
                            </div>
                            <div>
                                <input type="button" id="removeFantasy" value="Remove this player"/>
                                <input type="button" id="addPlayerFantasy" value="Add a player"/>
                            </div>
                            <br>
                            <label>Game System: Warmachine/Hordes</label>
                            <br>
                            Best Overall:<input type="text" name="bestOverallWarmaHordes" id ="bestOverallWarmaHordes">
                            Best General:<input type="text" name="bestGeneralWarmaHordes" id ="bestGeneralWarmaHordes">
                            Best Painted:<input type="text" name="bestPaintedWarmaHordes" id ="bestPaintedWarmaHordes">
                            Best Sport:<input type="text" name="bestSportWarmaHordes" id ="bestSportWarmaHordes">
                            <br>
                            <div id="inputWarmaHordes1" style="margin-bottom:4px;" class="clonedInputWarmaHordes">
                                First name:<input type="text" name="firstNameWarmaHordes1" id="firstNameWarmaHordes1" value="1">
                                Last name:<input type="text" name="lastNameWarmaHordes1" id="lastNameWarmaHordes1">
                                Army:<select name="armyWarmaHordes1" id="armyWarmaHordes1">
                                    <option value="Cygnar">Cygnar</option>
                                    <option value="The Prectorate of Menoth">The Prectorate of Menoth</option>
                                    <option value="Khador">Kahdor</option>
                                    <option value="Cryx">Cryx</option>
                                    <option value="Retribution of Scyrah">Retribution of Scyrah</option>
                                    <option value="Mercenaries">Mercenaries</option>
                                    <option value="Trollbloods">Trollbloods</option>
                                    <option value="Circle Orboros">Circle Orboros</option>
                                    <option value="Skorne">Skorne</option>
                                    <option value="Legion of Everblight">Legion of Everblight</option>
                                    <option value="Minions">Minions</option>
                                </select>
                                Score:<input type="text" name="scoreWarmaHordes1" id="scoreWarmaHordes1">
                                Circuit Opt-Out:<input type="checkbox" name="optOutPublicWarmaHordes1" id="optOutWarmaHordes1" value="0">
                            </div>
                            <div>
                                <input type="button" id="removeWarmaHordes" value="Remove this player"/>
                                <input type="button" id="addPlayerWarmaHordes" value="Add a player"/>
                            </div>
                            <br>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <center><input type="submit" value="Submit" onclick="confirmation()"></center>
                    </td>
                </tr>
            </table>


            <div style="width: 1000px; text-align: left; height: 400px; overflow:-moz-scrollbars-vertical; overflow-y:auto;">
                <center><h1>README!!!</h1><h2>How to use the upload page:</h2><h1>README!!!</h1></center>
                <p>
                    The first thing to note is that this system matches on exact names. So Matt will not match Matthew and will result in two user entries. DO NOT use any spaces in the First Name: and Last Name: fields.<br><br>
                    1. Names must be of this format "John Doe". We will attempt to use the name the player's full name. This alone should avoid most issues.<br><br>
                    2. The score is the placing of the participant BEFORE bonus points are added to the final outcome. So if you have 28 players, your first place player will have 28, the second place player will have 27, etc., and the last place player will have 1 point.<br><br>
                    3. The date must be filled out as YYYY-MM-DD. The date box is a drop down date menu, however internet explorer and firefox do not support this input type.<br>
                    <b>-Resolution:</b> Get a new browser or enter the date exactly as specified.<br><br>
                    4. A player cannot play in two different systems on the same day. So if you have a participant playing Fantasy on November 1st he cannot also participate in 40,000 on the same day.<br>
                    <b>-Resolution:</b> Submit your results for the event twice. First submit the 40,000 results, then submit the results for fantasy as having taken place ONE DAY after the 40,000 results.<br><br>
                    5. If your event has fewer than 20 participants you must manually change some scores.<br>
                    <b>-Resolution:</b> DO NOT fill out a best overall for the system under 20 players. Instead add 10 points to the Best Overall Winner's score. You must still fill out the best painted, best sport and best general.<br><br>

                </p>
            </div>
        </div>
    </body>
</html>



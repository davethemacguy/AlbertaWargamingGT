<!DOCTYPE html>
<html>
    <head>
        <title>Create an Event!</title>
        <%@include file="/includes/header.jsp" %>
        <script src=<%request.getContextPath();%>"/AlbertaWargaming/includes/jquery-1.8.1.min.js"></script>
        <script>
            $(document).ready(function() {

                $('#createArray').click(function() {
                });


                $('#removeSystem').click(function() {
                    var numSystem = $('.clonedInputSystem').length; // how many "duplicatable" input fields we currently have
                    $('#inputSystem' + numSystem).remove();     // remove the last element

                    // if only one element remains, disable the "remove" button
                    if (numSystem - 1 === 1)
                        $('#removeSystem').attr('disabled', 'disabled');
                });

                $('#addSystem').click(function() {
                    var numSystem = $('.clonedInputSystem').length; // how many "duplicatable" input fields we currently have
                    var newNumSystem = new Number(numSystem + 1);      // the numeric ID of the new input field being added

                    // create the new element via clone(), and manipulate it's ID using newNum value
                    var newElem = $('#inputSystem' + numSystem).clone().attr('id', 'inputSystem' + newNumSystem);

                    // manipulate the name/id values of the input inside the new element
                    newElem.children(':nth-child(1)').attr('id', 'nameSystem' + newNumSystem).attr('name', 'nameSystem' + newNumSystem);
                    newElem.children(':nth-child(2)').attr('id', 'gameSystem' + newNumSystem).attr('name', 'system' + newNumSystem);
                    newElem.children(':nth-child(3)').attr('id', 'roundsSystem' + newNumSystem).attr('name', 'rounds' + newNumSystem);
                    newElem.children(':nth-child(4)').attr('id', 'startDateSystem' + newNumSystem).attr('name', 'startDateSystem' + newNumSystem);
                    newElem.children(':nth-child(5)').attr('id', 'endDateSystem' + newNumSystem).attr('name', 'endDateSystem' + newNumSystem);
                    newElem.children(':nth-child(6)').attr('id', 'costSystem' + newNumSystem).attr('name', 'costSystem' + newNumSystem);
                    newElem.children(':nth-child(7)').attr('id', 'scenariosSystem' + newNumSystem).attr('name', 'scenariosSystem' + newNumSystem);


                    // insert the new element after the last "duplicatable" input field
                    $('#inputSystem' + numSystem).after(newElem);

                    // Enable remove button
                    $('#removeSystem').removeAttr('disabled');
                });

                $('#removeSystem').attr('disabled', 'disabled');
            });
        </script>
    </head>

    <body>
        <div id="content">
            <form action="/AlbertaWargaming/login/TO/createEvent" method="post" id="eventInput">
                <div class='title'>Create an Event</div>
                <div class="hr"><hr /></div>
                <br/>
                Event name:<br/><input type="text" name="eventName" id="eventName"><br />
                TO Correspondence Email:<br/><input type="text" name="corresEmail" id="corresEmail"><br/>
                Event Start Date:<br/><input type="date" name="startEventDate" id="startEventDate"><br/>
                End Date:<br/><input type="date" name="endEventDate" id="endEventDate"><br/>
                Event Location:<br/><input type="text" name="eventLoc" id="eventLoc"><br/>
                Event Players Pack:<br/><input type="file" name="playersPackSystem1" id="playersPack"><br />
                
                <div id="inputSystem1" style="margin-bottom:4px;" class="clonedInputSystem">
                    <br/>
                    <div>Game System</div>
                <div class="hr"><hr /></div>
                <br/>
                    Name of System:<input type="text" name="nameSystem1" id="nameSystem1">
                    Ruleset: <select name="gameSystem1" id="gameSystem1">
                        <option value="Warhammer40K">Warhammer 40K</option>
                        <option value="WarhammerFantasy">Warhammer Fantasy</option>
                        <option value="WarmaHordes">Warmachine/Hordes</option>
                        <option value="DropZoneCommander">Drop Zone Commander</option>
                        <option value="DystopianWars">Dystopian Wars</option>
                        <option value="FirestormArmada">Firestorm Armada</option>
                        <option value="XWing">X-Wing</option>
                        <option value="AttackWing">Star Trek Attack Wing</option>
                        <option value="Malifaux">Malifaux</option>
                        <option value="Infinity">Infinity</option>
                    </select>
                    Number of rounds: <select name="roundsSystem1" id="roundsSystem1">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                    <br/>
                    Start Date for this system:<br/><input type="date" name="startDateSystem1" id="startDateSystem1"><br/>
                    End Date for this system:<br/><input type="date" name="endDateSystem1" id="endDateSystem1"><br/>
                    Cost of this system:<br/><input type="number" name="costSystem1" id="costSystem1" placeholder="Event Cost"><br/>
                    Scenarios/Players Pack for this system:<br/><input type="file" name="scenariosSystem1" id="scenariosSystem1"><br/>
                </div>
                <br/>
                <div>
                    <input type="button" id="removeSystem" value="Remove this system"/>
                    <input type="button" id="addSystem" value="Add a system"/>
                </div>
                <!--input type="button" id='authorize-button' onclick='handleAuthClick();' value='Submit'-->
                <br/><input type="submit" value="Create Event!">
            </form>
        </div>
    </body>
</html>



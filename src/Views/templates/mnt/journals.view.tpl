<h1>Gestión de Journals</h1>
<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>DATE</th>
        <th>TYPE</th>
        <th>DESCRIPTION</th>
        <th>AMOUNT</th>
        <th>CREATED AT</th>
        <th>
          {{if journals_new}}
          <button id="btnAdd">Nuevo</button>
          {{endif journals_new}}
        </th>
      </tr>
    </thead>
    <tbody>
      {{foreach journals}}
      <tr>
        <td>{{journal_id}}</td>
        <td>
          {{if ~journals_view}}
            <a href="index.php?page=mnt_journal&mode=DSP&journal_id={{journal_id}}">{{journal_date}}</a>
          {{endif ~journals_view}}
          {{ifnot ~journals_view}}
            {{journal_date}}
          {{endifnot ~journals_view}}
          
        </td>
        
        <td>{{journal_type}}</td>
        <td>{{journal_description}}</td>
        <td>{{journal_amount}}</td>
        <td>{{created_at}}</td>
        <td>
          {{if ~journals_edit}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_journal"/>
              <input type="hidden" name="mode" value="UPD" />
              <input type="hidden" name="journal_id" value={{journal_id}} />
              <button type="submit">Editar</button>
          </form>
          {{endif ~journals_edit}}
          {{if ~journals_delete}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_journal"/>
              <input type="hidden" name="mode" value="DEL" />
              <input type="hidden" name="journal_id" value={{journal_id}} />
              <button type="submit">Eliminar</button>
          </form>
          {{endif ~journals_delete}}
        </td>
      </tr>
      {{endfor journals}}
    </tbody>
  </table>
</section>
<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_journal&mode=INS&journal_id=0");
      });
    });
</script>
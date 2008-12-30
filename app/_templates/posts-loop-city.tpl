{if $is_home == 1}
<div><a href="{$BASE_URL}">&laquo; home</a></div>
{/if}
{if $no_categ != 1}
<table id="job-posts" class="job-posts" cellspacing="0">
{if !$jobs}
<div id="no-ads">
	{$translations.jobscity.no_jobs_in} <strong>{$city_name}</strong>.<br />
	<a href="{$BASE_URL}post/" title="{$translations.footer.new_job_title}">{$translations.footer.new_job}</a>
</div><!-- #no-ads -->
{/if}
{foreach item=job from=$jobs}
	<tr>
		<td>
			{if $job.type_id == $smarty.const.JOBTYPE_FULLTIME}
			<img src="{$BASE_URL}img/icon-fulltime.png" alt="full-time" />
			{elseif $job.type_id == $smarty.const.JOBTYPE_PARTTIME}
			<img src="{$BASE_URL}img/icon-parttime.png" alt="part-time" />
			{elseif $job.type_id == $smarty.const.JOBTYPE_FREELANCE}
			<img src="{$BASE_URL}img/icon-freelance.png" alt="freelance" />
			{/if}
			<a href="{$BASE_URL}job/{$job.id}/{$job.url_title}/" title="{$job.title}">{$job.title}</a> <span class="la">{$translations.homepage.at}</span> {$job.company}{if $job.location == 'Anywhere'}, {$job.location}{else} <span class="la">{$translations.homepage.in}</span> {$job.location}{/if}
		</td>
		<td class="time-posted"><img src="{$BASE_URL}img/clock.gif" alt="" /> {$job.created_on}</td>
	</tr>
{/foreach}
</table>
<br/>
{$pages}
{/if}
{literal}
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".job-posts tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
		$(".job-posts tr:odd").addClass("alt");
	});
</script>
{/literal}
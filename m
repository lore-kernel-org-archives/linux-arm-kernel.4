Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECE0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKFU3z6W;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CQOEjDJF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T0+FN9ywWvVROMEqK02xBV1d8KjqVByNFP3Q93iSrfc=; b=MKFU3z6WHgTYFx
	/2eFFNTKqyL8gvKqgIWKRWV3AoCuqzjRbpBtWkuRG2CJv6SGueMwMURXDKfOdKUULL8PHOhwrUl6h
	9UhUU29CzULsf0gFs08yhg9azWTUPnU4rvxo09+m81f3XLXKcx4uUfJwlRKGXLa/ps/0vb0wikOOM
	9xFXmo0/BGKKctYsp2XqU22ofXCgXeOGcLNumIoZAZvP9gH77MTGbAgGf+QXyXa9cMpKa4/arSxeR
	nVaYl+bWJ1Z5wbHHuEJ/Zv3H55Ne0tKDo6qXmKatHiVYBIBgBzHkoN0tfJ9NCIWIV3qnM0IZG/82o
	bTkYTBU8j/UWA4ARevlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqKN-00000006aHQ-3U7Y;
	Tue, 24 Nov 2026 13:12:55 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqKJ-00000006aH4-3zoQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:12:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=T0+FN9ywWvVROMEqK02xBV1d8KjqVByNFP3Q93iSrfc=;
	b=CQOEjDJF2t7bB2d+Aururz0E2/Lz4tcxQC1mpcTUuICM0DzXlHGq4eY40qoQX5nfqo6TUh3Y2
	yUxkxDbIP82+w/weDYT1tGLv8pFRNCeJRr2lX6DEE6awZ4vJPSGjrUC8vHhYlmKiQvdd1Q9Oh0f
	D8DznjF5WWCqeq/pd5icb0k=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jYjs71MTrzKm4B;
	Tue, 24 Nov 2026 21:12:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D04B4055B;
	Tue, 24 Nov 2026 21:12:45 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 21:12:44 +0800
Message-ID: <ef004b87-db3c-4d34-a061-f2b3034c553d@huawei.com>
Date: Tue, 24 Nov 2026 21:12:43 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/9] fs/resctrl: Allow mba_MBps with assignable MBM
 counters
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
 <20261112131255.4043381-6-ruanjinjie@huawei.com>
 <1defc561-e7bc-4864-90ad-6aa3fb6be7da@arm.com>
 <e814cf3a-61ee-466e-ae2b-6abf8db16dc0@huawei.com>
 <ba518021-4098-48cb-b59f-a07cf7a418da@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ba518021-4098-48cb-b59f-a07cf7a418da@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051252_725950_BA5433B3 
X-CRM114-Status: GOOD (  44.46  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/24 19:44, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> On 18/11/2026 03:52, Jinjie Ruan wrote:
>>
>>
>> 在 2026/11/17 19:37, Ben Horgan 写道:
>>> Hi Jinjie,
>>
>> Hi Ben,
>>
>>>
>>> On 12/11/2026 13:12, Jinjie Ruan wrote:
>>>> The controller needs a counter for the event selected by mba_MBps_event
>>>> in every monitoring group, so mba_MBps is refused when MBM counters are
>>>> assignable. On MPAM a group's monitor is assigned from a fixed pool
>>>> when the group is created, and users can otherwise only pick a
>>>> percentage of a maximum that firmware does not report.
>>>>
>>>> Allow the controller when the architecture has a fixed assignment mode
>>>> and assigns counters when a group is created. Keep mbm_assign_on_mkdir
>>>> enabled while the controller is in use, restore its previous value
>>>> when the controller is disabled, and refuse to unassign the
>>>> controller's counter meanwhile.
>>>
>>> I'm afraid there has been some miscommunication here. What I was trying
>>> to suggest is that MPAM could when using the software controller use the
>>> default mbm_assign_mode as is used in intel systems. All the counters
>>> are allocated up front and there is one of each supported type per
>>> monitor group. Using mbm_assign_on_mkdir doesn't always give you
>>
>> In this case, it is unnecessary to restrict that mbm_assign_on_mkdir
>> cannot be disabled during the soft controller is enabled
>>
>>> guaranteed assigned counters as you point out in your
>>> patch "arm_mpam: resctrl: Use the domain's counter ID". I haven't
>>
>> Yes, that patch is addressing the related issues.
>>
>>> thought through all the abi consideration but it seems plausible, what
>>> do you think?
>>
>> I like the "default mbm_assign_mode" idea which I think achieved through
>> the closid and rmid trimming discussed earlier, while
>> mbm_assign_on_mkdir is only a best-effort.
>>
>> I have a few questions as below:
>>
>> 1、Should report MPAM as the default mode only during the mba_MBps
>> mounting?
> 
> I'm not completely sure but it does seem that if we are going to the trouble of adding support for
> 'default' mode then we should make it more generally available.

However, the default mode may trim the closid and rmid, but in the
absence of mounting MBps, users may require more control groups and
monitoring groups?

> 
>>
>> In this way, when remount without "MBps", the default behavior can be
>> restored instead of permanently trimming the number of control groups
>> and monitoring groups based on the hardware's mbw counter count.
>>
>> 2、 Should the resctrl files remains unchanged in the ABI?
> 
> Yes. We don't want to change the ABI.

OK.

> 
>>
>> mbm_assign_mode is displayed as [default], and the semantics of
>> assignments/available is still "not enabled".
>>
>> And update the document about the changes in the mode and
>> num_closids/num_rmids caused by the MBps mount option.
>>
>> Whether num_mbm_cntrs should still be displayed during the default period?
> 
> Any cntrs and assign are only part of the mbm_event mode rather than default mode.

OK. Will not display them for default mode.

>>
>> Whether mpam allocates the monitor during group creation or lazily when
>> the first read occurs?
>>
>> Perhaps we only need to align with the default behavior of resctrl and
>> x86 default mode?
> 
> We should match existing x86 resctrl where possible.

I agree.

> 
> I'd like to understand how important it is to have the mba_MBps feature on MPAM platforms. Do you
> have a real platform with sufficient memory bandwidth monitors for the default mode to be useful and

Yes, We have multiple genuine servers which support MPAM. Our current
mainstream hardware supports 256, and the next generation may support
512 MBM counters, should this be sufficient for the default mode usage?

> that users want the software controller on?

This is the customer's pain point and real service requirement. The
memory specifications of the machines in the customer's equipment room
are inconsistent, and services may be scheduled on different machines.

Currently, the percentage needs to be converted and configured based on
the machine specifications. The customer hopes that the absolute value
can be used to improve usability.

For our machines, the software controller can support a smaller control
granularity than the percentage, and the control error can be reduced
through feedback adjustment.

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>>
>> Best regards,
>> Jinjie
>>
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>>
>>>> Only MPAM has this mode; other systems keep the previous behavior.
>>>>
>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> ---
>>>>  Documentation/filesystems/resctrl.rst |  7 +++++--
>>>>  fs/resctrl/monitor.c                  | 25 ++++++++++++++++++++++
>>>>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++------
>>>>  3 files changed, 54 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>>> index b52795e03303..d70aec6f7096 100644
>>>> --- a/Documentation/filesystems/resctrl.rst
>>>> +++ b/Documentation/filesystems/resctrl.rst
>>>> @@ -471,7 +471,8 @@ with the following files:
>>>>  	Determines if a counter will automatically be assigned to an RMID, MBM event
>>>>  	pair when its associated monitor group is created via mkdir. Enabled by default
>>>>  	on boot, also when switched from "default" mode to "mbm_event" counter assignment
>>>> -	mode. Users can disable this capability by writing to the interface.
>>>> +	mode. Users can disable this capability by writing to the interface. While the
>>>> +	MBA software controller is enabled, auto assignment cannot be disabled.
>>>>  
>>>>  	"0":
>>>>  		Auto assignment is disabled.
>>>> @@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
>>>>  	   mbm_total_bytes:0=e;1=e
>>>>  	   mbm_local_bytes:0=e;1=e
>>>>  
>>>> -	Assignments can be modified by writing to the interface.
>>>> +	Assignments can be modified by writing to the interface. While the
>>>> +	MBA software controller is enabled, the counter of the event the
>>>> +	controller uses cannot be unassigned.
>>>>  
>>>>  	Examples:
>>>>  
>>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>>> index 8f3b8c3e3010..5a67c8089615 100644
>>>> --- a/fs/resctrl/monitor.c
>>>> +++ b/fs/resctrl/monitor.c
>>>> @@ -1210,6 +1210,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
>>>>  		goto out_unlock;
>>>>  	}
>>>>  
>>>> +	if (!value && is_mba_sc(NULL)) {
>>>> +		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
>>>> +		ret = -EBUSY;
>>>> +		goto out_unlock;
>>>> +	}
>>>> +
>>>>  	r->mon.mbm_assign_on_mkdir = value;
>>>>  
>>>>  out_unlock:
>>>> @@ -1776,6 +1782,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
>>>>  	return NULL;
>>>>  }
>>>>  
>>>> +/*
>>>> + * Return the event the MBA software controller uses as its input for @rdtgrp.
>>>> + * A monitor group has no event of its own: its bandwidth is summed into the
>>>> + * parent control group, which is the group with the mba_MBps_event setting.
>>>> + */
>>>> +static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
>>>> +{
>>>> +	if (rdtgrp->type == RDTMON_GROUP)
>>>> +		return rdtgrp->mon.parent->mba_mbps_event;
>>>> +
>>>> +	return rdtgrp->mba_mbps_event;
>>>> +}
>>>> +
>>>>  static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
>>>>  					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>>>>  {
>>>> @@ -1789,6 +1808,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
>>>>  		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
>>>>  		break;
>>>>  	case '_':
>>>> +		if (is_mba_sc(NULL) &&
>>>> +		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
>>>> +			rdt_last_cmd_puts("Counter is in use by the software controller\n");
>>>> +			ret = -EBUSY;
>>>> +			break;
>>>> +		}
>>>>  		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
>>>>  		break;
>>>>  	default:
>>>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>>>> index b32831871f70..518d89b0c67d 100644
>>>> --- a/fs/resctrl/rdtgroup.c
>>>> +++ b/fs/resctrl/rdtgroup.c
>>>> @@ -2610,10 +2610,9 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
>>>>   * The MBA software controller is supported only if MBM is supported and MBA is
>>>>   * in linear scale, and the MBM monitor scope is the same as MBA control scope.
>>>>   *
>>>> - * The software controller cannot be supported when the MBM counters are
>>>> - * assignable.  There is no guarantee that MBM counters are assigned to the
>>>> - * event backing the software controller in all monitoring domains of all
>>>> - * monitoring groups.
>>>> + * The controller needs a counter for its event in every monitoring group.
>>>> + * With assignable counters that requires a fixed assignment mode, with
>>>> + * counters assigned automatically while the controller is in use.
>>>>   */
>>>>  static bool supports_mba_mbps(void)
>>>>  {
>>>> @@ -2623,9 +2622,13 @@ static bool supports_mba_mbps(void)
>>>>  	return (resctrl_is_mbm_enabled() &&
>>>>  		r->alloc_capable && is_mba_linear() &&
>>>>  		r->ctrl_scope == rmbm->mon_scope &&
>>>> -		!rmbm->mon.mbm_cntr_assignable);
>>>> +		(!rmbm->mon.mbm_cntr_assignable ||
>>>> +		 rmbm->mon.mbm_cntr_assign_fixed));
>>>>  }
>>>>  
>>>> +/* mbm_assign_on_mkdir before the software controller forced it on. */
>>>> +static bool mba_sc_saved_assign_on_mkdir;
>>>> +
>>>>  /*
>>>>   * Enable or disable the MBA software controller
>>>>   * which helps user specify bandwidth in MBps.
>>>> @@ -2633,6 +2636,7 @@ static bool supports_mba_mbps(void)
>>>>  static int set_mba_sc(bool mba_sc)
>>>>  {
>>>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
>>>> +	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>>  	u32 num_closid = resctrl_arch_get_num_closid(r);
>>>>  	struct rdt_ctrl_domain *d;
>>>>  	unsigned long fflags;
>>>> @@ -2643,6 +2647,20 @@ static int set_mba_sc(bool mba_sc)
>>>>  
>>>>  	r->membw.mba_sc = mba_sc;
>>>>  
>>>> +	/*
>>>> +	 * The controller needs its event counted in every monitoring group:
>>>> +	 * force automatic assignment on, and restore the user's setting when
>>>> +	 * the controller is disabled.
>>>> +	 */
>>>> +	if (rmbm->mon.mbm_cntr_assignable) {
>>>> +		if (mba_sc) {
>>>> +			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
>>>> +			rmbm->mon.mbm_assign_on_mkdir = true;
>>>> +		} else {
>>>> +			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
>>>> +		}
>>>> +	}
>>>> +
>>>>  	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
>>>>  
>>>>  	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
>>>> @@ -3352,7 +3370,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
>>>>  		ctx->enable_cdpl2 = true;
>>>>  		return 0;
>>>>  	case Opt_mba_mbps:
>>>> -		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
>>>> +		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
>>>>  		if (!supports_mba_mbps())
>>>>  			return invalfc(fc, msg);
>>>>  		ctx->enable_mba_mbps = true;
>>>
>>
> 



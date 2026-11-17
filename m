Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C555606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gj/1zyP3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V6EarTva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eIYBOu8NOjBweHBBxJRRDa0T52jYDT0KDxk8L0BX5C8=; b=Gj/1zyP3L5Ck9Q
	EWhj9q6AgTfVelLx59Ec3KwC0W9ljJ0VszMal3C6CyhTyTWpN4FGbbpBONgmpn4qBLWHY1qr/riML
	SCJwbUPJnKVOVEo01Xpj4+wevzxlDyksr8dL+T0peUs6UWbOBPsDu0XnYAYgb9v96x8BECU6YdMjY
	l8Gw7gfU1ET5nydE0ld8Cfs0fGuHlOpY4+siMGkwDM5h8EN7EZl+4VdtwsLpYPANgcAKg+6rm0ZBd
	Kwu4BNFaYUMTOPzqIZeehhbjPnKRe9Y7OvLPZ9kx2vu4ZPFTmHtlSMwuDW2JJqfu8h5ot4DGQb8f3
	pVaNVcIs6+yU9raMOMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHVn-00000005Tme-0z4T;
	Tue, 17 Nov 2026 11:38:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHVk-00000005Tl7-0KZq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 11:38:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730EE1476;
	Tue, 17 Nov 2026 03:38:00 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C27C3F763;
	Tue, 17 Nov 2026 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794915483; bh=BgAOTNAkBrQ6qkPH8d+k2fV/l3kdC26sO5jr0Y5R7A0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=V6EarTvaETOeLdQZd+aqGjlopQk+supKhGblViLgC0Wct0yYAcfhhYEVYxXZTyMKZ
	 akbmRoUdV2LV2RPvBuuelXC1MoEZhy9rqCuh5f18KmmM7ev0P0I3cPrQu8+hf9QHHm
	 3fxZZ8kCbomjDCvqRuT32if0Kw8P/Ms9ClYqrvOo=
Message-ID: <1defc561-e7bc-4864-90ad-6aa3fb6be7da@arm.com>
Date: Tue, 17 Nov 2026 11:37:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 5/9] fs/resctrl: Allow mba_MBps with assignable MBM
 counters
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, quic_jiles@quicinc.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
 <20261112131255.4043381-6-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261112131255.4043381-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_033804_217741_11801D12 
X-CRM114-Status: GOOD (  39.42  )
X-Spam-Score: -4.4 (----)
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

Hi Jinjie,

On 12/11/2026 13:12, Jinjie Ruan wrote:
> The controller needs a counter for the event selected by mba_MBps_event
> in every monitoring group, so mba_MBps is refused when MBM counters are
> assignable. On MPAM a group's monitor is assigned from a fixed pool
> when the group is created, and users can otherwise only pick a
> percentage of a maximum that firmware does not report.
> 
> Allow the controller when the architecture has a fixed assignment mode
> and assigns counters when a group is created. Keep mbm_assign_on_mkdir
> enabled while the controller is in use, restore its previous value
> when the controller is disabled, and refuse to unassign the
> controller's counter meanwhile.

I'm afraid there has been some miscommunication here. What I was trying
to suggest is that MPAM could when using the software controller use the
default mbm_assign_mode as is used in intel systems. All the counters
are allocated up front and there is one of each supported type per
monitor group. Using mbm_assign_on_mkdir doesn't always give you
guaranteed assigned counters as you point out in your
patch "arm_mpam: resctrl: Use the domain's counter ID". I haven't
thought through all the abi consideration but it seems plausible, what
do you think?

Thanks,

Ben

> 
> Only MPAM has this mode; other systems keep the previous behavior.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/filesystems/resctrl.rst |  7 +++++--
>  fs/resctrl/monitor.c                  | 25 ++++++++++++++++++++++
>  fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++------
>  3 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..d70aec6f7096 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -471,7 +471,8 @@ with the following files:
>  	Determines if a counter will automatically be assigned to an RMID, MBM event
>  	pair when its associated monitor group is created via mkdir. Enabled by default
>  	on boot, also when switched from "default" mode to "mbm_event" counter assignment
> -	mode. Users can disable this capability by writing to the interface.
> +	mode. Users can disable this capability by writing to the interface. While the
> +	MBA software controller is enabled, auto assignment cannot be disabled.
>  
>  	"0":
>  		Auto assignment is disabled.
> @@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
>  	   mbm_total_bytes:0=e;1=e
>  	   mbm_local_bytes:0=e;1=e
>  
> -	Assignments can be modified by writing to the interface.
> +	Assignments can be modified by writing to the interface. While the
> +	MBA software controller is enabled, the counter of the event the
> +	controller uses cannot be unassigned.
>  
>  	Examples:
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 8f3b8c3e3010..5a67c8089615 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1210,6 +1210,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
>  		goto out_unlock;
>  	}
>  
> +	if (!value && is_mba_sc(NULL)) {
> +		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
>  	r->mon.mbm_assign_on_mkdir = value;
>  
>  out_unlock:
> @@ -1776,6 +1782,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
>  	return NULL;
>  }
>  
> +/*
> + * Return the event the MBA software controller uses as its input for @rdtgrp.
> + * A monitor group has no event of its own: its bandwidth is summed into the
> + * parent control group, which is the group with the mba_MBps_event setting.
> + */
> +static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
> +{
> +	if (rdtgrp->type == RDTMON_GROUP)
> +		return rdtgrp->mon.parent->mba_mbps_event;
> +
> +	return rdtgrp->mba_mbps_event;
> +}
> +
>  static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
>  					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>  {
> @@ -1789,6 +1808,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
>  		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
>  		break;
>  	case '_':
> +		if (is_mba_sc(NULL) &&
> +		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
> +			rdt_last_cmd_puts("Counter is in use by the software controller\n");
> +			ret = -EBUSY;
> +			break;
> +		}
>  		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
>  		break;
>  	default:
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index b32831871f70..518d89b0c67d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2610,10 +2610,9 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
>   * The MBA software controller is supported only if MBM is supported and MBA is
>   * in linear scale, and the MBM monitor scope is the same as MBA control scope.
>   *
> - * The software controller cannot be supported when the MBM counters are
> - * assignable.  There is no guarantee that MBM counters are assigned to the
> - * event backing the software controller in all monitoring domains of all
> - * monitoring groups.
> + * The controller needs a counter for its event in every monitoring group.
> + * With assignable counters that requires a fixed assignment mode, with
> + * counters assigned automatically while the controller is in use.
>   */
>  static bool supports_mba_mbps(void)
>  {
> @@ -2623,9 +2622,13 @@ static bool supports_mba_mbps(void)
>  	return (resctrl_is_mbm_enabled() &&
>  		r->alloc_capable && is_mba_linear() &&
>  		r->ctrl_scope == rmbm->mon_scope &&
> -		!rmbm->mon.mbm_cntr_assignable);
> +		(!rmbm->mon.mbm_cntr_assignable ||
> +		 rmbm->mon.mbm_cntr_assign_fixed));
>  }
>  
> +/* mbm_assign_on_mkdir before the software controller forced it on. */
> +static bool mba_sc_saved_assign_on_mkdir;
> +
>  /*
>   * Enable or disable the MBA software controller
>   * which helps user specify bandwidth in MBps.
> @@ -2633,6 +2636,7 @@ static bool supports_mba_mbps(void)
>  static int set_mba_sc(bool mba_sc)
>  {
>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
> +	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	u32 num_closid = resctrl_arch_get_num_closid(r);
>  	struct rdt_ctrl_domain *d;
>  	unsigned long fflags;
> @@ -2643,6 +2647,20 @@ static int set_mba_sc(bool mba_sc)
>  
>  	r->membw.mba_sc = mba_sc;
>  
> +	/*
> +	 * The controller needs its event counted in every monitoring group:
> +	 * force automatic assignment on, and restore the user's setting when
> +	 * the controller is disabled.
> +	 */
> +	if (rmbm->mon.mbm_cntr_assignable) {
> +		if (mba_sc) {
> +			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
> +			rmbm->mon.mbm_assign_on_mkdir = true;
> +		} else {
> +			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
> +		}
> +	}
> +
>  	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
>  
>  	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
> @@ -3352,7 +3370,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  		ctx->enable_cdpl2 = true;
>  		return 0;
>  	case Opt_mba_mbps:
> -		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
> +		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
>  		if (!supports_mba_mbps())
>  			return invalfc(fc, msg);
>  		ctx->enable_mba_mbps = true;



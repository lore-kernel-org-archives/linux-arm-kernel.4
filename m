Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J6OfjE6t;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iEQsK1xR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bx+7bUQnz6I2D7Oz7SpSebRvvPf2hSBNvXrgjF2Tezo=; b=J6OfjE6thKYmk8
	1Egf7A86baYJ0YAxM6rwrzCyHiq+Y+3AnreDatow9nmE6wX5qaMpHu4jtexBeOZpgrnp4mdoD9sTF
	xGx8uPG/sB9f44A7CJXR9z+FVIc5KxkYgOnRss/cfA8/ThSjgz8ZkgHzElISUyQ5gdoeGkeyjgbrq
	v3GEEA5hQWeDTHrVhnt+IjNEDSiLaRN94JL8zmY2hfmiQfoQImCD+F4X/lfwikBE61ccALpqS7Id4
	684yIL1mNZcaGH3G3Gus8/HjyiFBW9ByYUgnhF14O4TLN/hLnzGZC6Hr3fREAyYIvakFxwupgc2xJ
	7oh36XDguHyhukw6omxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9W-00000009iFX-13nn;
	Wed, 18 Nov 2026 17:08:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9Q-00000009i9n-2Csd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF4E91477;
	Wed, 18 Nov 2026 09:08:48 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55293F632;
	Wed, 18 Nov 2026 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795021731; bh=yLwLKFyJIs3jWgTDF+dUIQs6dCjE/lLvFSox/OcEPFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEQsK1xRMyJvG0cJx5aLiW6PSSUsAAvaqlVOYeoXMaKt2v0sRi6/Dey2cmSiBrfeb
	 ib4zWPVS1HS+VEvRQkfXFXoWJHm66qW0c2gcRIA/hVTJ++4yiQVTe6i9HZg1shtYQS
	 RUd+S808Y5+XqbgXFx1vrSLw5i5MV75L2b3NjoJY=
Message-ID: <4245d7c1-1607-41d4-98f8-2dceaf33593f@arm.com>
Date: Wed, 18 Nov 2026 17:08:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] arm_mpam: resctrl: Split control and monitoring
 domain setup into helpers
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com, ruanjinjie@huawei.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, tan.shaopeng@fujitsu.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <cover.1794283825.git.reinette.chatre@intel.com>
 <3d67a3dddd76cdb9981d4d7e78d657c930eb2cb6.1794283825.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3d67a3dddd76cdb9981d4d7e78d657c930eb2cb6.1794283825.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090852_661774_7D26EBDE 
X-CRM114-Status: GOOD (  27.55  )
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

Hi Reinette,

On 10/11/2026 04:19, Reinette Chatre wrote:
> mpam_resctrl_alloc_domain() allocates one structure that holds both the
> control domain and the monitoring domain of a resource. It sets up
> whichever of the two domains the resource supports, with the setup of
> both open coded in the function, and undoes the control domain if
> setting up the monitoring domain fails.
> 
> Apart from the code that manages domains, every user of the structure
> accesses only one of its two domains, so the monitoring domain can be
> given a structure of its own. Doing so starts with separating its setup
> from that of the control domain.
> 
> Move the setup of each domain into its own helper in preparation for
> giving the monitoring domain its own structure as part of supporting
> multiple controls per resource. Keep the allocation and the error
> handling in mpam_resctrl_alloc_domain() so that a failure to set up the
> monitoring domain still undoes the control domain.
> 
> No functional change intended.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

> ---
> Changes since RFC v2:
> - Add Jinjie's Reviewed-by tag.
> - Add Jinjie's Tested-by tag.
> ---
>  drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index ec39f3909388..db1df6e8d8c0 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1640,13 +1640,75 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  	return NULL;
>  }
>  
> +static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
> +					  struct rdt_resource *r,
> +					  struct mpam_component *comp,
> +					  struct mpam_resctrl_dom *dom)
> +{
> +	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
> +	int err;
> +
> +	dom->ctrl_comp = comp;
> +
> +	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
> +	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +	err = resctrl_online_ctrl_domain(r, ctrl_d);
> +	if (err)
> +		return err;
> +
> +	mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
> +					 struct rdt_resource *r,
> +					 struct mpam_resctrl_dom *dom)
> +{
> +	struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
> +	struct mpam_component *any_mon_comp = NULL;
> +	enum resctrl_event_id eventid;
> +	struct mpam_resctrl_mon *mon;
> +	int err;
> +
> +	/*
> +	 * Even if the monitor domain is backed by a different
> +	 * component, the L3 component IDs need to be used... only
> +	 * there may be no ctrl_comp for the L3.
> +	 * Search each event's class list for a component with
> +	 * overlapping CPUs and set up the dom->mon_comp array.
> +	 */
> +
> +	for_each_mpam_resctrl_mon(mon, eventid) {
> +		struct mpam_component *mon_comp;
> +
> +		if (!mon->class)
> +			continue;       // dummy resource
> +
> +		mon_comp = find_component(mon->class, cpu);
> +		dom->mon_comp[eventid] = mon_comp;
> +		if (mon_comp)
> +			any_mon_comp = mon_comp;
> +	}
> +	if (WARN_ON_ONCE(!any_mon_comp))
> +		return -EFAULT;
> +
> +	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
> +	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> +	err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +	if (err)
> +		return err;
> +
> +	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
> +
> +	return 0;
> +}
> +
>  static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  				      struct mpam_resctrl_res *res)
>  {
>  	int err;
>  	struct mpam_resctrl_dom *dom;
> -	struct rdt_l3_mon_domain *mon_d;
> -	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
>  	struct mpam_component *comp;
>  	struct rdt_resource *r = &res->resctrl_res;
> @@ -1663,55 +1725,17 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  		return;
>  
>  	if (r->alloc_capable) {
> -		dom->ctrl_comp = comp;
> -
> -		ctrl_d = &dom->resctrl_ctrl_dom;
> -		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
> -		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> -		err = resctrl_online_ctrl_domain(r, ctrl_d);
> +		err = mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom);
>  		if (err)
>  			goto free_domain;
> -
> -		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
>  	} else {
>  		pr_debug("Skipped control domain online - no controls\n");
>  	}
>  
>  	if (r->mon_capable) {
> -		struct mpam_component *any_mon_comp = NULL;
> -		struct mpam_resctrl_mon *mon;
> -		enum resctrl_event_id eventid;
> -
> -		/*
> -		 * Even if the monitor domain is backed by a different
> -		 * component, the L3 component IDs need to be used... only
> -		 * there may be no ctrl_comp for the L3.
> -		 * Search each event's class list for a component with
> -		 * overlapping CPUs and set up the dom->mon_comp array.
> -		 */
> -
> -		for_each_mpam_resctrl_mon(mon, eventid) {
> -			struct mpam_component *mon_comp;
> -
> -			if (!mon->class)
> -				continue;       // dummy resource
> -
> -			mon_comp = find_component(mon->class, cpu);
> -			dom->mon_comp[eventid] = mon_comp;
> -			if (mon_comp)
> -				any_mon_comp = mon_comp;
> -		}
> -		if (WARN_ON_ONCE(!any_mon_comp))
> -			goto offline_ctrl_domain;
> -
> -		mon_d = &dom->resctrl_mon_dom;
> -		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
> -		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> -		err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +		err = mpam_resctrl_setup_mon_domain(cpu, r, dom);
>  		if (err)
>  			goto offline_ctrl_domain;
> -
> -		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
>  	} else {
>  		pr_debug("Skipped monitor domain online - no monitors\n");
>  	}
> @@ -1720,8 +1744,8 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  
>  offline_ctrl_domain:
>  	if (r->alloc_capable) {
> -		mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
> -		resctrl_offline_ctrl_domain(r, ctrl_d);
> +		mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
> +		resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
>  	}
>  free_domain:
>  	kfree(dom);



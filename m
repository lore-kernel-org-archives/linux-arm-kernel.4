Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84644606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qglb42at;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z/fhjXH4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wcgmon70XAk5Fo/0VolrEg/3YS/oGzQP4jqWgRSNGG8=; b=Qglb42at+80NuD
	jngA4D8S5NP8Db7DckPmYf+b2bUsXLx0e1g+2+7MlHVJ0MaUcZZv3KvPytRkE7sWHt+zo9xlE0CzW
	nZAvzC1bMuR+t87GJMazGtwBDAVe1rKTp1O0e25tO0f579u9LJ8bSkj1xtbg1xN9Ii2En42fnDo1f
	aNWOv9nky7d9lAgreHmo2blvMe+1VDViiwFeoKZXXBPZ+4uU3MylU6mQykiU+c7wRSHhD2ebBTDLg
	ff916uhK74Z9FeRjYfj33qubVchJwESSa1qO0HzbwFM+p+Yl+4W2v61j3k/9JjgWJYjtxtZvooa8d
	t/HVYtG3dYtCEOqHOAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvZz-00000002Jbh-0pWO;
	Mon, 16 Nov 2026 12:12:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvZv-00000002JaT-2KoS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:12:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDA81713;
	Mon, 16 Nov 2026 04:12:49 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680953F632;
	Mon, 16 Nov 2026 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794831172; bh=Rn3iFP/lgki79057m7a1NNQZy+R5XRKrQ/1Ha1Qrerc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z/fhjXH4JfuGCO3N1q9W45igR1Gfj24iupe+IrQOYy9kWgixEM4PPHpZJj4xIlWsU
	 Yv9c03l4t6KVe9LkzlNTStqcr/QUh5OqColkDxva0Q6BfYgFHFqsG+xlxpT40QwYs6
	 UYAxOGhP9/ENiYTCa0ii7NYY2OmLx/zmEFs8qWeY=
Message-ID: <f89e485b-33b0-465a-984f-fdddd60a35d4@arm.com>
Date: Mon, 16 Nov 2026 12:12:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Annotate domain list walks as RCU
 under cpus lock
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, jic23@kernel.org,
 tan.shaopeng@jp.fujitsu.com, zengheng4@huawei.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261116024834.275512-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261116024834.275512-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_041255_676813_69D9C449 
X-CRM114-Status: GOOD (  20.44  )
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

On 16/11/2026 02:48, Jinjie Ruan wrote:
> The resctrl domain lists are RCU lists which are only modified while the
> CPU hotplug write lock is held, so traversing them is protected by
> cpus_read_lock().  That is the convention the generic resctrl code
> follows.
> 
> The MPAM implementation omits the condition at three places, so lockdep
> reports a spurious violation with CONFIG_PROVE_RCU_LIST on whenever
> they run:
> 
>   WARNING: suspicious RCU usage
>   drivers/resctrl/mpam_resctrl.c:1762 RCU-list traversed in non-reader section!!
>    mpam_resctrl_get_domain_from_cpu+0x200/0x298
>    mpam_resctrl_online_cpu+0xa4/0x160
>    mpam_cpu_online+0x2b4/0x300
>    cpuhp_invoke_callback+0x304/0x700
> 
> Likewise for mpam_resctrl_get_mon_domain_from_cpu() and
> resctrl_arch_update_domains().
> 
> The lock really is held: lockdep_assert_cpus_held() is the first thing
> each of these functions does, and the warning's own lock list shows
> cpu_hotplug_lock and cpuhp_state-up taken.  Only the annotation is
> missing, so add lockdep_is_cpus_held() to all three walks.
> 
> Fixes: 9cd2b522be2c ("arm_mpam: resctrl: Implement helpers to update configuration")
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
> Cc: stable@vger.kernel.org

The patch looks good to me but the Fixes and stable Cc can be dropped. This is just providing extra
debug information to allow a debug feature under RCU_EXPERT to be used. The equivalent commit in
fs/resctrl, 11b57be8e406 ("x86,fs/resctrl: Document safe RCU list traversal"), which is needed to
make this useful was only added after MPAM support was merged and has no Fixes tag.

Thanks,

Ben

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..d25c2bac9678 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1516,7 +1516,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
>  	if (!mpam_is_enabled())
>  		return -EINVAL;
>  
> -	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
> +	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
>  		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
>  			struct resctrl_staged_config *cfg = &d->staged_config[t];
>  
> @@ -1743,7 +1743,8 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
>  	if (cache_id < 0)
>  		return NULL;
>  
> -	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
> +	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list,
> +				lockdep_is_cpus_held()) {
>  		if (dom->resctrl_mon_dom.hdr.id == cache_id)
>  			return dom;
>  	}
> @@ -1759,7 +1760,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>  
>  	lockdep_assert_cpus_held();
>  
> -	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
> +	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list,
> +				lockdep_is_cpus_held()) {
>  		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
>  			return dom;
>  	}



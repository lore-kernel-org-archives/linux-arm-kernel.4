Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A95606BFCE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YHloPL1j;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SbPs9s1z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=469C7cxwQ8pRb1askRJV+4cr7ISUSoEqexSz4jUQ/l4=; b=YHloPL1jbzmOXB
	AQCDlpa9AxbY75ChkpH8/NvmMP4ghLGW92Cg0nxYeEVYiTcuU2FSqXcFoy2SVn18wY5fZfTKWD4T1
	xHD9NOzktPXuIKnFtdgBdiOkolQLcVbBBnCcIoM/NfF5GLudPRRETUePuo7g3kC7BoQMk+C5UNrOs
	qyFFb7QQ2y0/WrUn28XlBtggBQqiBiG6lj3lN0uhOIy4gSi+vBUZQdEheKajl78RwR5taLX6xIqh3
	4D8j1HpuWNZ/LaZpYI9xAl3LwusXRGe36kwilD5mLkrpiepN/SzAn+zz/DSQn8lwjU3CBYHgllJ2s
	V1OcBQNl0px8hruAaqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlyz-000000044ds-29Pv;
	Tue, 10 Nov 2026 13:33:53 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlyv-000000044bZ-2dqf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:33:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=469C7cxwQ8pRb1askRJV+4cr7ISUSoEqexSz4jUQ/l4=;
	b=SbPs9s1zT9LKQrhQRLSyVO8ow6ONaX4jHFvE2dv2wFraSEG/vjhq4VivxIp2K6Pb0idx/eil4
	cv+Zck5YLsYYMWWjdO9JkPYJnuG/+6WF8UN08zTmbr3piifah7LJVmBAwQtPxIxcAaB6kUfNOWy
	7KqGtKbI6osxqptm19A/F/c=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jP6zs2xf8zLlTt;
	Tue, 10 Nov 2026 21:33:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DBC940565;
	Tue, 10 Nov 2026 21:33:44 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:33:32 +0800
Message-ID: <a5468087-7965-4650-87bc-71811cd4ab14@huawei.com>
Date: Tue, 10 Nov 2026 21:33:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] fs/resctrl: Report a temporary RMID shortage per
 CLOSID
To: Jinjie Ruan <ruanjinjie01@gmail.com>, <babu.moger@amd.com>,
	<ben.horgan@arm.com>, <bp@alien8.de>, <corbet@lwn.net>,
	<dave.hansen@linux.intel.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>,
	<gshan@redhat.com>, <hpa@zytor.com>, <james.morse@arm.com>,
	<jic23@kernel.org>, <mingo@redhat.com>, <rdunlap@infradead.org>,
	<reinette.chatre@intel.com>, <skhan@linuxfoundation.org>,
	<tan.shaopeng@fujitsu.com>, <tglx@kernel.org>, <tony.luck@intel.com>,
	<zengheng4@huawei.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
 <20261110132054.3702-2-ruanjinjie01@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261110132054.3702-2-ruanjinjie01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_053349_990766_B42F8986 
X-CRM114-Status: GOOD (  25.75  )
X-Spam-Score: -2.1 (--)
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

Please ignore, will resend.

在 2026/11/10 21:20, Jinjie Ruan 写道:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> An RMID that is freed is held in limbo until its cache occupancy drops
> below the threshold, after which it returns to the free list. A request
> that fails because of limbo is thus temporary and worth retrying, which
> resctrl reports to userspace as -EBUSY. A request that fails because
> every RMID is in use is permanent and reported as -ENOSPC.
> 
> Where an RMID is only meaningful together with a CLOSID, a request can
> only be satisfied by an RMID belonging to the requested CLOSID, so the
> distinction has to be drawn per CLOSID. Instead it is drawn system wide.
> -ENOSPC is reported when the free list holds no RMID for the requested
> CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
> when the free list is empty and another CLOSID has an RMID in limbo,
> even when the requested CLOSID has none. Userspace is thus told to give
> up on a shortage that may clear on its own, and to retry one that cannot
> clear until it removes a group itself.
> 
> Architectures where the RMID is independent of the CLOSID always match
> the first entry on the free list, so neither case arises there and only
> MPAM systems are affected.
> 
> Draw the distinction from the number of RMIDs the requested CLOSID has
> in limbo where the RMID depends on the CLOSID, and from the system wide
> count otherwise. Drop the separate test for an empty free list, which
> the search handles on its own.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> ---
>  fs/resctrl/monitor.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 04e4ea612b7c..b8f4e1ff4083 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -207,9 +207,6 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  	struct rmid_entry *itr;
>  	u32 itr_idx, cmp_idx;
>  
> -	if (list_empty(&rmid_free_lru))
> -		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
> -
>  	list_for_each_entry(itr, &rmid_free_lru, list) {
>  		/*
>  		 * Get the index of this free RMID, and the index it would need
> @@ -225,7 +222,17 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  			return itr;
>  	}
>  
> -	return ERR_PTR(-ENOSPC);
> +	/*
> +	 * No free RMID matched. If this CLOSID has RMIDs in limbo, return
> +	 * -EBUSY so userspace can retry. Otherwise, the CLOSID is genuinely
> +	 * out of RMIDs. When RMIDs are not per-CLOSID, any RMID in limbo
> +	 * delays the allocation.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
> +		return closid_num_dirty_rmid[closid] ? ERR_PTR(-EBUSY) :
> +						       ERR_PTR(-ENOSPC);
> +
> +	return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
>  }
>  
>  /**

-- 
Best regards,
Jinjie



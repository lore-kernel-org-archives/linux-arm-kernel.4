Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6560A6F47
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S7r7A6Ys;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LblR3Mll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mr+oYs8/abSZSj4lJ4PMIllB4JnBFwVNz1SRvIolKDk=; b=S7r7A6Ys3hYoPV
	iHN5Vb8PcH2maCsvqS1Ritxn6DSxCf/AAc18XhOmW1yL75w6+pkfPdqlV+P986U5iKFgDRIerG6DN
	lDPuN7PO8W985Jv9pzbgmTH8bZIgAK57sX3IRiprHUhqDwus+I9I41eHNdnp/JYwRBgcdR+8TLkRn
	9L/RqpgpjpemeA6zsXfu89y9KmRTPx5ZbKVqwBmQNJZM2VN2tdNByC/T2D1yNb0XSQwXfszW/E48Z
	EoQ7M5LQZkoTHlPVedvMGdxykKNmcdpssWHJj8BUwCkym/QAC8Iw4xKfsT0/g18+0SNyKLE9cUtLD
	mT4py+CIzlOt8s2vDv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjah-00000003YrC-3Y78;
	Tue, 10 Nov 2026 11:00:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjac-00000003Ypq-1boZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:00:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71D571BC0;
	Tue, 10 Nov 2026 03:00:30 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 886443F85F;
	Tue, 10 Nov 2026 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308433; bh=4ck62cy1mlRNr4GFH/FwZpJqZdKAc0N4+tB/W3NHdFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LblR3MllBiBoWbbp/bPau9MCduLwG1ZSwBtHEe+oMYAEMj36I3Mv+8I48Y6V1S/A3
	 4DiT3rjIj15YNhjEKrgjKDo60yfQpeEqhmRGrJ3k4Cstjh62Bh3F8++Y84qbc+0NJx
	 APrqPZZAwLmaPhwOrBjKvSsYJiMT9fe2+K6HTZ0o=
Message-ID: <00a1bcb7-2884-4075-8d51-b8a465e37492@arm.com>
Date: Tue, 10 Nov 2026 11:00:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] arm_mpam: resctrl: Separate MPAM domains
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com, ruanjinjie@huawei.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, tan.shaopeng@fujitsu.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <cover.1794283825.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_030034_727109_BFC44862 
X-CRM114-Status: GOOD (  16.96  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

On 10/11/2026 04:19, Reinette Chatre wrote:
> Thank you very much to Ben, Jinjie, and Shaopeng for reviewing and testing RFC v2.
> 
> Changes since RFC v2:
>   - RFC v2: https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/
>   - Patch 1 is new. It adds find_mbwu_mon_comp() to replace the duplicate
>     code found in resctrl_arch_cntr_read() and resctrl_arch_reset_cntr(),
>     as suggested by Jinjie.
>   - WARN when domain allocation fails. (Ben)
>   - Squash three patches into the patches they build on. (Ben)
>   - Move "Require a component for each monitoring event" ahead of the
>     structure split so the check it adds precedes its first user.
>   - Fix the mpam_resctrl_get_mon_domain_from_cpu() function comment that
>     still referred to the control component.
>   - Add tags from Jinjie and Ben.
>   - Please see the individual patches for their detailed changelogs.
> 
> Changes since RFC v1:
>   - RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
>   - Give each type of domain its own structure instead of duplicating the
>     shared one, set up each domain independently instead of undoing one
>     domain when setting up the other fails, add additional verification
>     checks.
> 
> The MPAM driver represents a resctrl domain with a single structure,
> struct mpam_resctrl_dom, that holds both a control domain and a
> monitoring domain. On a system that supports both allocation and
> monitoring, one instance is created for each domain and its two
> domains are added to the resource's control and monitoring domain
> lists.

Thank you for this respin.

To avoid any confusion for others I mention here that the 'MPAM domains' mentioned here are the MPAM
driver representations of resctrl domains and *not* related to the MPAM feature
FEAT_MPAM_MSC_DOMAINS. There is currently no support for FEAT_MPAM_MSC_DOMAINS in the MPAM driver.

Thanks,

Ben



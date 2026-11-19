Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9AF60A262A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wzPsndm6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvTfUc9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vAomtNjZ6UsJD1I1HKFswE1FILqWm4Za1n9fpztySms=; b=wzPsndm6nahlOazaqrnIVlFR+g
	abgTUSsQ2g8Z/+QYqt++VlZ3di3Vj5FJltKcdTX3G/92/cbVPlaIVeu+3IeV7ILL0pNoSiZ/OVcSB
	wCLXDK8UPHHNc8+23NjP28ZEtTlnpIu/B8FzX5NA6j3id98vK7VsIVOYkpPKRtiFLGzBo6XFhezWc
	HCWA4So550jsLCa6YVrzHY4DT05EgU5tEoUInZnEneeFO6I28C4/P2y6HXALTdNK/Y+UvBrNwlB5G
	v+WgXVxWjnu9wy6+KVpIFIpDjWFZpGdlrNSolS2Bvix52rLawwVjMDexw2fgG+WG5BTQnyne3FQbE
	Hlx0/EAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzEn-0000000BX5W-0rHP;
	Thu, 19 Nov 2026 10:19:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzEl-0000000BX4v-2Bj5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:19:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7602762399;
	Thu, 19 Nov 2026 10:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791E41F000C7;
	Thu, 19 Nov 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083566;
	bh=vAomtNjZ6UsJD1I1HKFswE1FILqWm4Za1n9fpztySms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dvTfUc9n1ambzTAdvzY0tsRxI9pLS2Ve75ZZ5K2gCs0nu9GFyxsdMo09xE1cYy5Qd
	 N7gi3EqiSfeTX7NTWoSX58YTpi1KAwn46Yz27NFBuK5Ihb2+a2eL8WcP0BFwE2l/mT
	 f2iDJNs45s88/Lz0RkoaB0z4k2TB6zqwSc8VW3Wd/sJjPIftIPsOyNcrDsNdVv9blO
	 YbaxkAewiSN5xorMa4zGC662YKIggku9Wlq4ETSufnB3tEwJl87lys4tvz0gm9N3oR
	 7Zaa7015rTMyIaWDnC64DZ8Xr8hwHwzQfa0FVgTy4vU0ilhlJBnB/gS7NXgx79tle1
	 S/VTuUpf7z8dw==
Date: Thu, 19 Nov 2026 11:19:21 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v3 13/14] irqchip/gic-v5: Clean a level 2 device table
 before making it valid
Message-ID: <av7NKUmQdYabpjK7@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-13-13c1859e8aa3@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-host_gicv5_fixes-v3-13-13c1859e8aa3@arm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 05:35:42PM +0000, Sascha Bischoff wrote:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
> writes the level 1 DTE that points to it with VALID set. Unlike the
> other ITS tables, the new table isn't cleaned to the PoC first. On a
> non-coherent ITS, the zeroes can still sit in the CPU caches when the
> ITS reads the table, so it can take stale memory as a valid level 2 DTE
> for a DeviceID that nothing has registered.
> 
> Clean the table before the level 1 DTE is written.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index cfa86aa68bf3c..7fff2db9ae08e 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -415,6 +415,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  	if (!l2devtab)
>  		return -ENOMEM;
>  
> +	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
> +
>  	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
>  
>  	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|
> 
> -- 
> 2.34.1
> 


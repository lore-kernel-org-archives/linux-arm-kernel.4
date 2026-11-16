Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D709606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=01T0oIPM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCkU5WYS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xV4wzEt93KKUYN4/i4GrUJiqH0YQDE0PVV6xnGic2Hc=; b=01T0oIPM9aGASSV41hFLeGrtSn
	798NkiQPoXkHwCQEmmBpG/7zx4Q9j/+R1+jpE9N4MSDk1L9nWrMQxT/YpUmx2EnpxZKU6b8TL9GQT
	p7yo5h7Z5Rkg9laBqTpPGJCPKbcQaRx9FS1GXs/WgGK6/fUEf9NwO2RIHskwUjuMEorm0rqj/VD0W
	yIOB2T+9x1cIxwFuzcocdMwM8p2SHDPLwxhM4r/q/YJJguiiDFaU5KiOgQiKlnb0d98/2+IRirIeA
	FOi4AehSLJM/Ggyz5Q1JDMTd0zbEfOA8+A7hl1hQN4TZR7pnfNq6L06/f7sJir2BNAiXC7lzMuihh
	UjnNAXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbu-00000002K4X-2LPS;
	Mon, 16 Nov 2026 12:14:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbt-00000002K44-3eme
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:14:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7F43629A5;
	Mon, 16 Nov 2026 12:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720DF1F000C7;
	Mon, 16 Nov 2026 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831296;
	bh=xV4wzEt93KKUYN4/i4GrUJiqH0YQDE0PVV6xnGic2Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCkU5WYS+CVpA91k6NmI4IHmH0jQXa0rZt5gAv5kpICvbpTT3JqzSvRYuxqmwHw3Y
	 gQtYc+enyDPbJ9lDfRZengoYn3nCHVZnjRW8mDDH6g2VSC4uYI79Rrcvn5U3vRayef
	 nQqzAD9cMQJf5XLjL4hNwxOnWpeAc+NfbiNaIf5vMbqtJ2sCevZ0pVGbLqtZontuji
	 phh1+MJdT+ixpRLI1oh74N4dumOrqQJgD2IHW4LN6m/QCXeJt/N13VzmCEB6iNTCb1
	 pWrTkt5+p0XCPzVM1wCq/XIDQSBtwvl52bhoNeMdOUD+F8FiByc1K0kK2zln/vHsHh
	 ECFM9MZiz6uMg==
Date: Mon, 16 Nov 2026 13:14:50 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host
 driver issues
Message-ID: <avrzusx1g1ZICo0Q@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112145814.853424-1-fuad.tabba@linux.dev>
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

On Thu, Nov 12, 2026 at 02:58:14PM +0000, Fuad Tabba wrote:
> Hi Sascha,
> 
> I found a couple more issues in the GICv5 host driver while looking
> into pKVM support for GICv5. Rather than explain the fixes, I thought
> I'd send you patches for two of them instead. If you think they're
> useful, please include them in v3. They apply on top of this series.
> Boot tested on the GICv5 FVP with a two-level device table.
> 
> For the third one, the thing I spotted is that if the IDLE poll after
> an IRS_MAP_L2_ISTR write times out, gicv5_irs_iste_alloc() clears the
> level 1 entry and frees the level 2 IST, but nothing cancels the map.
> The IRS can still complete it and use the freed table. Keeping the
> table isn't enough either, since the next allocation in that range
> rewrites the level 1 entry while the map may still be running
> (R_SDVFP). vgic_v5_alloc_l2_vmt() and the ITT frees after a timed-out
> invalidate have the same shape. The question is, can an IRS miss the
> poll, or is a timeout here only ever a dead IRS?

Thank you for your patches Fuad.

The latter, though freeing memory on timeout wasn't a good idea given
that there is no way to cancel the respective, pending, mapping.

> Cheers,
> /fuad
> 
> --- >8 ---
> 
> From: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: [PATCH] irqchip/gic-v5: Invalidate the level 1 DTE when registering a device
> 
> With a two-level device table, gicv5_its_device_register() makes a
> level 1 DTE valid when it allocates the level 2 table that it points
> to. However, gicv5_its_device_cache_inv() invalidates the ITS caches
> with ITS_INV_DEVICER.L1 clear, which doesn't invalidate the level 1
> DTE. An update isn't guaranteed to be visible to the ITS until a cache
> invalidation that covers it completes (R_HQFDL in the GICv5
> specification). An ITS that cached the level 1 DTE while it was invalid
> can keep dropping events for the DeviceIDs in its range.
> 
> Set ITS_INV_DEVICER.L1 on every device invalidation. It covers the
> level 2 DTE as well, and has no effect with a linear device table.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Setting L1 on every invalidation turns each registration and
>     teardown into a range invalidate, both rare paths, and keeps the
>     function simple. Setting it only when registration allocates the
>     level 2 table would miss a registration that fails after the
>     allocation, which leaves the level 1 DTE valid.

I can't follow. I agree that we have to invalidate the L1 DTE on
L2 allocation but that's a one-off, I don't understand what issues
you are pointing out in the Notes above, if you can point out please
the code paths it refers to that'd help.

Thanks,
Lorenzo

>  drivers/irqchip/irq-gic-v5-its.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 101aceec68f63..83952e30178b1 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -372,10 +372,11 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>  	u64 didr;
>  
>  	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
> +	/* L1 also covers an L1 DTE that a registration may have just made valid. */
>  	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
>  			     its_dev->itt_cfg.event_id_bits)	|
> -		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
> +		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x1);
>  
>  	guard(raw_spinlock_irqsave)(&its->inv_lock);
>  
> 
> --- >8 ---
> 
> From: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: [PATCH] irqchip/gic-v5: Clean a level 2 device table before making it valid
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
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 83952e30178b1..b2d61ba3828cb 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -416,6 +416,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  	if (!l2devtab)
>  		return -ENOMEM;
>  
> +	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
> +
>  	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
>  
>  	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|


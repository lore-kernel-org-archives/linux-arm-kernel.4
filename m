Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=naU1n7jO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2/gtZAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Kn50YQKJmadJWEKhbGZJhAnQczxOvBn+n7Uz/8fwxw=; b=naU1n7jO/ksLqNMd9l1uRhDkkV
	lfi2t7j5Di8+lCheKE+m3mbojQWhALUzmKhbnn3tKCGPtUcfLheS3NiD4U9ngZ72fNl/WhVCsQs9p
	wA4EVRIhGwCNKdPH3g4EK7QyAsNpgjR8IgRyCJyzL0OthWe06poeESBzneuEH84q7ZCgBMyuFxkY2
	WDeuQlN7bBvck98CLkqyE8yFLMGc94b+WTyQfc/ZVL6aGDjbRcSTDERtyja5ngjUPRD0Ljq/CImGO
	0VPRVgMKTQ4yZSqWbknaZXIoFE5eSf5xxDV01Y6F4V3fM+xFp+96KiYCcDpAw0Wpt1SJOKvYY7RN2
	dgd4kMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Jn-0000000C4nS-1Y9o;
	Thu, 19 Nov 2026 13:36:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Jl-0000000C4nB-15xs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:36:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B327060D51;
	Thu, 19 Nov 2026 13:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C786D1F000C4;
	Thu, 19 Nov 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095407;
	bh=9Kn50YQKJmadJWEKhbGZJhAnQczxOvBn+n7Uz/8fwxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2/gtZAq8FxEM65gZAQirIKeTd6B+cRU9ggzAoHTgpDv7aPA9RoWIxaiVrEfnNekH
	 hPKkCGciMnnNt+EFCCzAAwTOh2Cxj4nZNSwgK6KgmnBRABz6MlWuuWdBk161mCbjxU
	 S53cLOIeeVTgDP1dPH0gwhv+2wqzUlxRQvyhJI63Qy8V7KCKnaddStfbPS1lWV+6ZY
	 DR231XG1k9hiRzbBFkUkUd1bVsKN4akNR5DEEwXGgoidNUhF6cLjPv4+C97VPkBR3n
	 /flbOetOoIq+wwL3TXa5zpGn2bjefWugErqhsmvHeoqHSa0hcMTCFnbr7dhNmQuGHg
	 +y+NCR5SwcnTA==
Date: Thu, 19 Nov 2026 14:36:42 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
Message-ID: <av77avzIzIbk_KUD@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
 <av7Ly_iLyiOAXQUR@red-moon>
 <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
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

On Thu, Nov 19, 2026 at 12:32:56PM +0000, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
> >> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
> >> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
> >> +                                         u32 device_id)
> >> +{
> >> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
> >
> > I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
> > let's explicitly say so).
> 
> With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
> the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

Yep, that's what I meant, I don't want "0" to look like we are
trying to optimize anything in there because there isn't anything
to optimize; a comment would do.

Thanks,
Lorenzo

> nit: this helper has a single caller, so could you call
> __gicv5_its_device_cache_inv() directly from
> gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad


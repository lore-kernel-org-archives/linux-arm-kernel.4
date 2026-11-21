Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE133606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6x6oz/M;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=evWxxf05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kosSlO4n4eaj/l8QctRPYZS0nYWx+0xDQzEvrB+dFGg=; b=D6x6oz/MPIip6gFSfM1r1Q/y+a
	8sphk5J0OarO7gfS6TAh2tECF2SyRMSucYULFt1QdCtI0sUtC8Xzo8XXJRrX29m92uKhGXJQHhcsk
	GgrwsCAnPqH1kwWgHcPHeMxLmUeGPPrWwNBZWynfTRSxpQRMsiwYMv8fHOM5ajHiDwEYz/xrBJa/P
	SAY/ohJJrjgy/VEUpNLs2vIFaAOj1B/bcaWQSSdAZqhjq2Rv4KAbz484FRnj+pXEwqbLbQj87dFGf
	63eZ3kDJDDwhwK4SFJxetqw5eqkBr7K0AutLRgixgr5GTGr9Ntsb3YNhmNP6rhGgRQME8WYstR8bg
	h8m2WzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkkA-0000000HEcQ-1GZk;
	Sat, 21 Nov 2026 13:03:02 +0000
Received: from out-42.mta1.migadu.com ([95.215.58.42] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkk6-0000000HEbw-3z3i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 13:03:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AXPl9MSQKEVnxwBZxVz70iQ3WAgcrk7wcvSe7Ve0uwo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795266175; v=1; x=1795870975;
 b=evWxxf05XzVJt8Tiou/ooJaFuuGuIEy6pjt2YmbAgNiOxUhEf41eaNZKkg47SGXEuGOXmAyt
 3WwiAi8ByTAobCpv3Fp+93sxm2LZVZgMx5+WnZdbPDilExVU6ew6/6LAC8t6n1rEElzVU8kRIXn
 y9U/4883p+Brc6sMaiwDe+Bk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2fb3a475fbc6b1aa;
	Sat, 21 Nov 2026 13:02:54 +0000
X-Mizu-Trace-ID: 2fb3a475fbc6b1aa
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 21:02:42 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Jason Gunthorpe <jgg@ziepe.ca>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <awGWcq_nKWShC81B@fedora>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117130005.GC2606445@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_050259_151101_0689D468 
X-CRM114-Status: GOOD (  16.33  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason, and all

On Tue, Nov 17, 2026 at 09:00:05AM -0400, Jason Gunthorpe wrote:
>> 

[...]

>> I may not describe it clear in cover-letter.
>> 
>> I understand the concern. Let me explain why I believe it is justified here
>> rather than a hack.
>> 
>> On i.MX eDMA each channel has its own interrupt, its own register region,
>> and on i.MX8QM even its own power domain. Each channel may also have its
>> own Stream ID, or share one when SIDs are scarce. These are genuine
>> per-channel hardware resources, not software fiction.
>> 
>> In dmaengine each channel is already modeled as a channel device (see
>> dmaengine_chan_dev()), and this series puts those devices on a real bus
>> (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
>> describes that existing device, so its reg/interrupts/power-domains/iommus
>> are attached per channel instead of as index-matched flat lists on the
>> controller.
>
>If they are real devices then why can't they come out as platform
>devices?
>
>I think you are overstating how independent they are. Many single
>devices have per "channel" resources like MMIO and IRQs. That's
>totally normal. It doesn't make the sub resources independent devices.
>
>AFAICT what you have here is some HW designer used SID where they
>should have used SSID and you are trying to hack DT to make that
>usable because Linux does not support a SID as SSID model today.
>
>Again, since this is the 3rd - 4th case like this, it seems like a
>popular hardware choice and we should try to do better to make Linux
>support if we can.

Let's put i.MX eDMA aside, I have one general question regarding
dma channel DMA.

The below two drivers[1] has chan_dma_dev set as true which means they use
dma channel device to do dma memory allocation. And for tegra186, it
use dma channel device for iommu, the buggy part is that it forces
chan dev's bus to platform bus.

Do you think it is reasonable to have chan device(not platform device) do dma
allocation? I ask because if we allow chan device to do dma allocation, we need
to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I 
am not familar with this platform, it even has iommu-map for the dma node).

[1] drivers/dma/tegra186-gpc-dma.c
    drivers/dma/ti/k3-udma.c
    https://elixir.bootlin.com/linux/v7.4-rc1/A/ident/chan_dma_dev

Thanks
Peng

>
>Jason


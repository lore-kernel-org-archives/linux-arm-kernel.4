Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318F606A893
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bu6XIynY;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AqABhpm3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zheIQktVmbZG4c834zKCy7evdo7oC0W6fMu1Q7CHhCE=; b=Bu6XIynYnl58FfEP0R0RHHnSUq
	oSzw9txlapmUOKCqx5wlYXvy9aj3gGtyo/lF8r9ys2/nrN+qNowZDVg+NLmFX6iLSo1ceMXx89XTq
	U4ER11/CNNtlAhCOejrUhmA2kqPpoDkqbMdyMH99tdP404Bydi1dQ8tk7uKIbx2BnEpc2KIF3/yXm
	zu1lyjm3iHZvZD01NHx5cEcrLekU40cePr6KG4SO6Pv5DANVk2zLvJoOIgr22Hb6ItqCgcAEux2+W
	yUDGRRW7k5wNEaEsEcdCekGg0TOEbevMYpSy07SuYNCDccJ/SAUr36vYaUiUHIymlnkoJ6v6ED3GK
	S7f7ctPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEaS-00000004tbn-2GUU;
	Tue, 17 Nov 2026 08:30:44 +0000
Received: from out-60.mta1.migadu.com ([95.215.58.60] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEaP-00000004tat-0gu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:30:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pyWTIi2y6JoIJ6IOmHBgjnTL/Q73eud7KJwC8hfFNgY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794904239; v=1; x=1795509039;
 b=AqABhpm3NiDW2u51rSlCew3nKj/O5rKF9XyNeS2Wd+I3pWwpWLJJx9V75Bs3D697t8fZDjpr
 DN5VoTfPu1d8qxDkgOwiKg0rDUkXd2Bwedu96VqZ0VXyo+CeeekOuk8G0w75Ebi/P41KTrtSZSf
 s200mf5lcIomdgDsM3MGzbhE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 072b8882c51a40c5;
	Tue, 17 Nov 2026 08:30:29 +0000
X-Mizu-Trace-ID: 072b8882c51a40c5
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:30:15 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <avwQl18smAW4R6ec@fedora>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116193021.GB2452510@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_003041_413138_667AA97A 
X-CRM114-Status: GOOD (  14.89  )
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

On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
>On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
>> I used iommu-map for eDMA, but iommu experts rejected it:
>> "Using iommu-map to describe synthetic dma_chan_dev devices that the
>> kernel creates is the same kind of DT abuse from over here:"
>> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
>> 
>> So I followed here [2] as Krzysztof wrote for QCOM VPU:
>> "Thanks Jason for context and detailed arguments. Robin did not chime in
>> yet, but from what I understood the DT-child-node approach will be the
>> way we should go here.
>> 
>> I accept above point of view and I am fine with this, thus Vishnu and
>> Vikash - please go ahead with DT-child-node solution we had some time ago."
>> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>> 
>> This series adds per-channel DT child node support to fsl-edma and, as a
>> prerequisite, introduces a proper bus for DMA channel devices.
>
>To be fair this is discouraged too, now that I've seen 3-4 people
>trying to do exactly the same thing I'm not as positive about the
>DT-child-node hack.

I may not describe it clear in cover-letter.

I understand the concern. Let me explain why I believe it is justified here
rather than a hack.

On i.MX eDMA each channel has its own interrupt, its own register region,
and on i.MX8QM even its own power domain. Each channel may also have its
own Stream ID, or share one when SIDs are scarce. These are genuine
per-channel hardware resources, not software fiction.

In dmaengine each channel is already modeled as a channel device (see
dmaengine_chan_dev()), and this series puts those devices on a real bus
(dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
describes that existing device, so its reg/interrupts/power-domains/iommus
are attached per channel instead of as index-matched flat lists on the
controller.

Given that context, do you agree that a child node per channel is the
right description here?

Thanks,
Peng

>
>Can all of you come up with a proposal that doesn't involve hacking up
>DT just to unbundle the SIDs?
>
>Jason
>


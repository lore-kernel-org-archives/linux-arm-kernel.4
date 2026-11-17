Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AC6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHiEigNR;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gd6ZY2Up
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YGp9PC/3VbbJew7o6lt7FFNFnWRQ4swf3eWUT365kY4=; b=xHiEigNR4UmDWiq1k08rb1OSdF
	Fw5RYaercdxwTYqZsWpTc08+1FhjU4dzJuyEjh52Q9NBaA+uUIwC1le8tiGGjiXL9FfJZ2g9MQOkW
	3klDMlRBWFIKLcxNpboHqRXMA3LGg5WjlfEet8zjU4PXXStzZTRT7nSawTeDlchUkLrA3gtHHsmIv
	N88wc5loZkY1hfplEiPUDvhsvF4YWKI0K5fCAcD2NaBHcLfzF73IHmht5r1OFlLq1Bcqql3lJT8hp
	lP3a5RO5rX2Wc07yG2xPBQxkgbsBHNHXN2GhxFMjZAxKIEmVHHNyyenSolP/ZWyfmmLXwSgDAa6gZ
	aKE8LJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKk1-00000006GC5-49MO;
	Tue, 17 Nov 2026 15:05:01 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKjy-00000006G9l-3OP4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:05:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EF8PbkYJiw2SNYIbhXqCwRQsFcWPdAKgl4U2nMsfivM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794927896; v=1; x=1795532696;
 b=Gd6ZY2UpdrZJMbZpVdKAc3uir6WaMVnLKdTjum8VXcuGFY1YPLjTTyGn2Ktuoh2tal6aJY3t
 0/60LtM700/6qvKKkA2U7OEHtJl9Kz5xQtyU3g/QWrW6Zcgl7ps2kqOUXU3Ptm4TPtdYd97xYQZ
 g4KmAm0xJpKl8qE1T91IgtLA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b65b25fb13c5725a;
	Tue, 17 Nov 2026 15:04:55 +0000
X-Mizu-Trace-ID: b65b25fb13c5725a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 23:04:29 +0800
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
Message-ID: <avxs_TU6FHn7MMx8@fedora>
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
X-CRM114-CacheID: sfid-20261117_070459_232859_8750587A 
X-CRM114-Status: GOOD (  26.79  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 09:00:05AM -0400, Jason Gunthorpe wrote:
>On Tue, Nov 17, 2026 at 04:30:15PM +0800, Peng Fan wrote:
>> On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
>> >On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
>> >> I used iommu-map for eDMA, but iommu experts rejected it:
>> >> "Using iommu-map to describe synthetic dma_chan_dev devices that the
>> >> kernel creates is the same kind of DT abuse from over here:"
>> >> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
>> >> 
>> >> So I followed here [2] as Krzysztof wrote for QCOM VPU:
>> >> "Thanks Jason for context and detailed arguments. Robin did not chime in
>> >> yet, but from what I understood the DT-child-node approach will be the
>> >> way we should go here.
>> >> 
>> >> I accept above point of view and I am fine with this, thus Vishnu and
>> >> Vikash - please go ahead with DT-child-node solution we had some time ago."
>> >> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>> >> 
>> >> This series adds per-channel DT child node support to fsl-edma and, as a
>> >> prerequisite, introduces a proper bus for DMA channel devices.
>> >
>> >To be fair this is discouraged too, now that I've seen 3-4 people
>> >trying to do exactly the same thing I'm not as positive about the
>> >DT-child-node hack.
>> 
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

Thanks Jason, that clarifies the core issue.

Anyway, I agree that per-channel MMIO/IRQ/power-domains do not by themselves
make the channels independent devices. The real problem is that the eDMA could
have separate SIDs for channels that are logically part of one controller, i.e.
it uses SID where an SSID/substream would be the natural model, and Linux
does not support that today.

So I'd like to step back from the DT child-node shape and propose a
generic direction:

- Keep the DMA controller as one device and describe its channel Stream
  IDs in the controller node (ordered list, no per-channel child nodes and
  no requester-ID map).
- Add a generic dmaengine/IOMMU mechanism that assigns one of those
  Stream IDs to each dma_chan_dev, so the channel gets its own IOMMU
  context/domain without inventing a DT device.
- Use the SMMUv3 shared-SID support (still under reviewing) for channels that
  must share a SID.

This keeps DT describing real hardware (the controller's SIDs) and moves
the Linux-specific unbundling into the core instead of a per-driver
binding. Each channel occupies 64KB MMIO region and works independently.
With separate DT node, it will be easy for us to do channel device passthrough
when using Xen hypervisor. Now moving away from this, the remaining question is
how to expose a channel for Xen/per-channel passthrough without a per-channel
DT node, seems I need to add some code in Xen hypervisor to support channel
passthrough.

Would that direction be acceptable, or do you see SID-as-SSID support in
the IOMMU core as the required longer-term fix?

Vinod, Frank, from dmaengine perspective, do you have any comments?
Rob, you reviewed DT binding patch, do you have any comments?

>
>Again, since this is the 3rd - 4th case like this, it seems like a
>popular hardware choice and we should try to do better to make Linux
>support if we can.

Yeah, I saw QCOM VPU case and thought child node usage was agreed from
Krzysztof's reply. So I use same idea here.

Thanks,
Peng

>
>Jason


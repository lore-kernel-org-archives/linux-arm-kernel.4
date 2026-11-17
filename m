Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZXldXhpU;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fAlctRbX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=; b=ZXldXhpUeFc2qB7AjkPKVopmat
	IHbh5/zz1c7jpui64kc3Zb6Kepxfxa+SncH9YBfqYmnrvBHcgb6Alt52H7VyhbvFPzsRvLViK5Xa1
	074kbuG1cvwo0t+IWPVYuNOkLexnpdjaqI0cHtotKrYdfu/1Pv5/FZwJGwcZ5RdQltM/2NXXTa2TW
	sFNV2P7z2nJkMPgocXMq45ouhsoMcuRr3i4ziRZW3FHrmkxlIuBL4bYhqSVfyGk/zr7jDNgbhkEb+
	AQSk/us0jlriKK41/dBTzz7Wp22j6QNnpqUPwlNH8DQJm/vkmxgvr/gROl6cmwtu6c6UE+AssyJKJ
	t7B6gEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNjr-00000006k1n-2W40;
	Tue, 17 Nov 2026 18:17:03 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNjo-00000006k17-4Ael
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:17:02 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5364042eecfso1033621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794939420; x=1795544220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=fAlctRbXkMDt2H5+uOzGRqqzkgNuBsULdqhI1/vYFC2BY6K2FAFl9fJBmjYQNI/Ltg
         JgcbTR9+rESkXcEZr4uYBYwBd04ZYUY9qZ+3qW1yxqs8NKUJ4i9k3lK9N6B1mJ+imyqP
         kr2bOx5i1CZRDkJBRenAILr0ZCwChwLmcYcIWv3Zoc95TsETsjKigVGB0MU1TkhSXVLh
         M2JCn2l0l9FZCd72eL9YUGO9RbPTDaOkOsnM3KEYpEHHBNVT/bZEMzKj2Ab2mOzWPtMg
         gXvH5CRr61oiLUU4jHMZyFG5TFI/9lY7cTa5jmA+08yMBYJ1CZ/MKszrZKgH/hjWX/px
         ofJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939420; x=1795544220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=DIIU2hutBIXdPPiGvQbgwawUJuYBnre4n8zvS1IC8kWT2ggw7z2nDNtYVx8fYxjtV1
         rAfvuKbnc4WLUE/ItSqzhnvzCbSTjtVuIZeMTov3EEJdEfHdONwx92hofM8j8EnwLfHb
         c+VNifdqEzftfmyogjwnT/V8AjJskRJ8tvvykgOtlx9elLnT2YJTvCWj4g4neFsGh0z2
         neRTP1Qaa0nGcJRVVUmkH1RMq2QywMbIJd9ME9vFS6jxPZxO/BsNHLPvTyGacwXwPFWy
         IzhibRYeY3UJ46q2fxZmUL9SlJrJnxp+/Jqset4BjNwZw5ol8E0ZsxCtxVrJFblM+bfP
         m56A==
X-Forwarded-Encrypted: i=1; AL+hErEW5T6T0J2ljsJXSBPtQzRSG8dKgMS5yjnjgD62gVPt/0LQ++fqBrKh4rE6N625Q4uLz7mTmEXY4ByW+OS2e1pv@lists.infradead.org
X-Gm-Message-State: APuU4Z8Jl4y6UMJ3mmbYZoKmTUJ1qXJ63xIv5gvRKvg7pktEihWdEEEM
	zukipAOyqVqyKsHHXc+4dt/J6HGdc1o/rKmEVXBP+uLu1mrQ2JHxruz2wCG4O1XJXpY=
X-Gm-Gg: AYBFou1cK+0a1oStqr6RQLq/XycpbghotXAzdI0MyzA7nmUw59VQILBtyNPjes5f/gA
	PsADysDkKlmyFcfyk3xk5XakXkOYh/y7kxXmMQskvUy6PqzW0TQQGX/tj7USVIUgaGO19dSnCeg
	hm+q9xVhAzEjIrW2VWtRvr0VwP1A6N9BMYxAzP14yMUH74jzVNUloz4riHyudsYcZBTPkNcTCV+
	+QWHH7igVwlTfswpVAsYMDT4GuRJV9gotoIFiRU5aYg3O0uPLc9+XMmSv1mA/BOFJEV4W9I+M0C
	r89a44gX6h+iZo8C65D0atS68452exAVAl32Cb5MP4NVjIw7zL4vl91qdTF0taiqo7jJLaCSRSH
	ZVrV54HYldpKJ8c37doa50hlPJ74kBLaJgvAFd0bdZ+vFYNkcB5IIXjuqgdmLjuPho4N4EAp8uz
	kJ/Q2XU6BOhaqusrVxf9HiInSz9zkCV0Sb9Hkc8MFHKz2n8VmBV5N966kZ2FqxnoyHv+1HALMWF
	mRNKuA2sUh3ZoIjKcOZ0PZiq2SFJSOX2v08hwpHMJ9438tw7HPF5A21nZfv7i8Qt7vxvGw9goyT
	ilK6oA==
X-Received: by 2002:a05:622a:1b10:b0:55c:3b4b:45 with SMTP id d75a77b69052e-55d5a538613mr1980541cf.24.1794939419724;
        Tue, 17 Nov 2026 10:16:59 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907ee6dsm2590361cf.19.2026.11.17.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:16:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNjm-0000000D0qg-02mP;
	Tue, 17 Nov 2026 14:16:58 -0400
Date: Tue, 17 Nov 2026 14:16:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
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
Message-ID: <20261117181657.GF2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avxs_TU6FHn7MMx8@fedora>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avxs_TU6FHn7MMx8@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_101701_046824_8B7E6CF5 
X-CRM114-Status: GOOD (  27.29  )
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

On Tue, Nov 17, 2026 at 11:04:29PM +0800, Peng Fan wrote:

> - Keep the DMA controller as one device and describe its channel Stream
>   IDs in the controller node (ordered list, no per-channel child nodes and
>   no requester-ID map).
> - Add a generic dmaengine/IOMMU mechanism that assigns one of those
>   Stream IDs to each dma_chan_dev, so the channel gets its own IOMMU
>   context/domain without inventing a DT device.

IMHO what you really need here is some way to get the DMA API for a
"PASID" combined with some way to convert SIDs in an iommus property
into a "PASID".

How exactly that looks, I'm, not sure, but you probably do need a
struct device to do DMA with as that is integral to how the DMA API
works.

If that is a real struct device or some proxy, I don't know. Long ago
there was some work on this topic and struct device per PASID seemed
to be the direction people were interested in.

> - Use the SMMUv3 shared-SID support (still under reviewing) for channels that
>   must share a SID.

If you get struct device handles for the SID then you don't need this
at all since you'd have exactly N handles with no overlap.

You don't need to force the struct devices you want to use in the DMA
channel's model to be exactly used as the DMA device..
 
> This keeps DT describing real hardware (the controller's SIDs) and moves
> the Linux-specific unbundling into the core instead of a per-driver
> binding. Each channel occupies 64KB MMIO region and works independently.
> With separate DT node, it will be easy for us to do channel device passthrough
> when using Xen hypervisor. Now moving away from this, the remaining question is
> how to expose a channel for Xen/per-channel passthrough without a per-channel
> DT node, seems I need to add some code in Xen hypervisor to support channel
> passthrough.

Normally you'd make a VFIO driver for this, especially if you have a
"PASID". You really care about Xen? It is so weird in this area?

> >Again, since this is the 3rd - 4th case like this, it seems like a
> >popular hardware choice and we should try to do better to make Linux
> >support if we can.
> 
> Yeah, I saw QCOM VPU case and thought child node usage was agreed from
> Krzysztof's reply. So I use same idea here.

It was but at that point it was the only one. Now there are two QCOM
ones, this and maybe another I forget.

Also, IIRC, it wasn't quite like this, the DT was supposed to create
real platform devices. This kernel creates struct devices and attaches
them to DT was the first idea that was pushed back on when it became
too complicated.

Jason


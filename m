Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E2606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E08TvE3L;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=m6ZVFFN6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=; b=E08TvE3LKISA5WDKZXAK9ahkgv
	B3gFouLYGKqqJaQP2XqOpXLDalcm1tNTPc89C/QbmL9/Rykjip4FZTTNsj8mrlCZvJKeYs2v1bB+a
	ZOszLkIMhSaGbcPW4tfoJt52RBtTMvdyUyDuCTOKrUgsOa+zfflHwKZg6hkVQ3ma5O+TguPUeC09u
	NL0m5mLUbfgMQOW2KLONH7paB3KFISD0okYI+wcuZiSc+Pv6sic4DPvNk63XH+YfQ+dj6rpvISZ3Q
	ZQMtYT/qarbNDBHAjoW/wWj96+JXKkUaxKZVA5IaYb3TUfxhsdCUPFH1Kh7urJayfGNew6ba6n7Pe
	q4ikdlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2PM-00000003lNH-3AYF;
	Mon, 16 Nov 2026 19:30:28 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2PI-00000003lK2-25tc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:30:26 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-93a40a9a01aso24241385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 11:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=m6ZVFFN6Lp6zTTn02MO9C2V/5nDmK+bDr64Mo+o1qOgJ1uXfPyaa/W0LXc2tebmMIY
         P8eV7a15taJOU9psGsecYu1dvxP9jdw8fNnL8dLgLtFVYI4ubn9cHoM1urld1qraLb29
         HiS380cIWd8XxBpNjI/77NC+oudk9jrsqwJqAXJAo0DOV3yfwigAHZBgITCjKjEUS+2K
         Ix50Oyx6fW+ZXehR8OlEYA6jbDfSKsBaqEJ+rLfWimCOv6xvtr79XAF9DWv7wrG5V2Jo
         EW6+mTac/a/uGjZwFpJog5mDPPQ/YQ4V3YH+0ksADQQ0UZpR0xtZzBV1vTNylgNeQvWK
         9WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=LaCQ8rgBHl3PRb3pcqjYZf3RnIzlIuBpetlx2+hOnP4mujj0dF9prnQd4JNG41vNFl
         l/oAgm9UT1eYzBzuHWzUlMl+Q+M0nqqDyFYWWVs1LxBuTemM8Q+/XIoG5LhQcUmrQ3qa
         GTn6jv172ZFt7xJ68gk0TMOTM548nl55TwjaX7dVYPrfw6JeIahs1WZp3Rw6CuqxB63G
         EwazJNwddMI9tJuDsZ3nEjHAx9rgk+OAh1JxMdIGc58Q+gzpRKCfHB+M9fPO7GadWeCv
         EDQeA/LCynQLObcmc68M1tiRfnARHKldYcxe+Cp/unSlx0Y10e0/NmlB7W9jv9ekWpi7
         AkZQ==
X-Forwarded-Encrypted: i=1; AL+hErHbYJlVeFbIaQq+tD65DJeNQgzY/KG534/X+a9DQYUPjY3f+1+IB6hSGxy2f8v299yHsn7zYXV/U37IMdMsBBQH@lists.infradead.org
X-Gm-Message-State: APuU4Z8cX9MZbK8UBaRquY9/5ArVSWosohSu5Q+C41cDvt35xf6cReaa
	TAdLwDNWS3AEKUdFvBgmVdxthoqTVCkjNSZDGNhkqz+B+vn/Yqzs+P5JaZFULiYY4/Q=
X-Gm-Gg: AYBFou3wgmCpdlfwYTG+HFhOYgfq/5Hf9px70f9ZhBxS3AU8FUG3xSMSRWiLVR3kGay
	CA5PNHQpjYy2/HH0yxPg/MPbP8qXMXhn2bZVAnOvNRCjGO4FDIpV4pYoTWbRmMvwcN4tFQ2881i
	T6+MUom8Hp/Da8i5VCUyIrkb/G0W7992MC7zZuou6nni4tEP2IbuF0vZiC76PWB2ULZxzYydGHr
	2sMcchwwSgjjbdu5TGfJJFgwuYxiswKGr87PbIdcYMRie+NxjXQ4RCDsK6RGPylW0RmPbxd0sj6
	RlCWnUBDCaVsRjL+5or9/+h/pYvt5pWwIiPeCNekHiUkvOL/d7jfz8wAz3D/AYRV+pTEUO3zOnn
	OoDqSWV+bf13WMm+OFs9/JWaIVnvomr3/NsXv7oyyV88T5opdif5GpzoZIEHBEZmyed7bAEIgus
	DWY9kQBMcMP4YBjPmwX6lpu/bvZ+6ND7xMRy9L14PUUV6rDX48tBpGreIDykKSxqFX/hbm8R9yL
	aRTeRE5yvTriokrwmGLqeLZdyAaWWeRhd10BZO29wvwv3EBC0AeLWhqjtC3rB2yfYfMB8kEdwti
	XzUl8g==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_113024_547302_D6A8C92A 
X-CRM114-Status: GOOD (  16.77  )
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

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason


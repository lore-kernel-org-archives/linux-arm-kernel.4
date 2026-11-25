Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0BF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i0+U3N1J;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Cuwgi1Z4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=; b=i0+U3N1JD2uI17AwlTPdkCi9T6
	C9WFcJSmgBthhZryj7nIE93wH7mg0xWZf/5GVE4E8LU3dbFc7IHcjnEt5aNW9WN1tpFqocZik/Ub0
	bflIs9FwW1vXXVZkvJw90wuXqQYVTwJTUCmGPf7n0NARZFZc/XPNdzUuK9Cxei4OVyrpE8FDvsu7f
	7ON3+IrE8xCV6kOaMOaC4mCPpHNOWCqqM79I1B9KT00rqZKg3NBv7NHPQyaaykb9Dq/l+BEkMCLHH
	WNe1S3lF3RtW0En+uiTXtqKYlDpsjU3pZb90AKtHFp8g9v7MXk9RyJyZmKaYBsX2P8qJ95MAYLYok
	RzOFBskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEse-0000000ALga-0KDi;
	Wed, 25 Nov 2026 15:25:56 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEsF-0000000ALVf-389r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:25:33 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-7d2da166818so3529557137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=Cuwgi1Z4pq9lgMOMYVi4vTjTftiAA+Ys9eRMfLWT0ynzEDl+ulc4Va8FpSUrpczwPf
         f86JIcJnPvBhew96ypOC744dK3ySWTRId0UIwji4OklvVqzGOVbG8M5DvxJhQvr1JJIE
         fUGisPRgeVakqW3q3wpe+htx7vnZ55gG1SzenpYLtinUoIjmna2PU3bU8QXKk+9RBCzl
         svlZ8ugcCU1TPfJRlKgPTW4Ue4Osr1ipF/3Ze6ksgBSM9uTFxrKWLOQQPkpC/Vmox6hg
         kBKfN+d4K3x8rEmVq/WcxYB65VvS9zVCtcsp7CaFwDc9TAM+pN1kLzGk8skpf+ZbZeKW
         J29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=d4bRd53phd38GejbtdGvwmLUx4xHsBjKfulmNcT024Rc2l5dzuFQfOu+H1yt/wI7uZ
         TYFGbFmjZkTdKw6oxOlYUQYzsvcwM2mkl4hU+PEZ9LpnZrDkCb5L+Y3g5hYMkCnj0azl
         zHxLQ1//o78wUJN+rCR6sT8RrTVVeeRG36NKahlEXNIN4l7s5XNtxGE2mnv03cBIak0a
         PL2Gv4LY2WaasUgEPQg+yiKAKxt8fGHSmIjARotRbJh8bdhO0raWx3CX9+otKOtr/3du
         olbBTfskRU9xODMT6rLrUE4nAO8HP8BmG85Q6uz25tXoAuUpnsynsQpXJl0D1UQImiro
         909A==
X-Forwarded-Encrypted: i=1; AL+hErGavL7Oh+p9pna43vLVc6/OmXbU/4PlwyVav0CO26Zb4RaIVgNOkfGZ3VdMlOAKLv2bEwE2K2IZ/dcOWNBQ2nzu@lists.infradead.org
X-Gm-Message-State: APuU4Z/74PA06Wj3fawsSzzGOUtlP3++RsI1Xe3/BgKT6UsUay0br4U8
	TnH48oUrqrP4ZvBjomZL4KqRuoQURdgl6pqQLKYhK8Uv8an87XC8rff6lacz54bGf8A=
X-Gm-Gg: AZFdTZcDmkl4+ZgocQFPcOOwRFbT7ledkaCWf/h5Joo8efef0ZF7BZT7AJoOQvsmEE7
	RDsAbSFrUDRZ2974zN9i6Fb2WNsgHjhZiH542f+106YOMDfpHyfTndZjg0Mx3SRmd+9aNqhxlmy
	4jc4kc2YcGzYrtIsSFV9m4Kfu1We32gmsyt/N5+lkhf+oos9JqMLa658l3MDEG+T1JP4gUKg+zS
	48QNw9GPPCNS7PpoaKlQo8/aCgxDass5EZIfTuIu3w2n1ApYoCspxeHeWUJwoB7YbDtRWfla5wb
	zYZdpNQI5yoThhzo/nHY/+y5wbOIODg8kHzwJ8/WWbkfVDYiBYWyyfYev8+MHaKkA7r65IiJpKO
	gkCUt2pumpbQo9QIdwJFzLO33POUMZbmCH3Hq2mfj8U/MoWZD1CLJxcJwg+TG6kWKoq8B4pjwcp
	sqI9nzTTfeuPB+Q1hYpUlrHaeabPqL+/SnAJehswQoNxiyHxeLAVIjPGBnlGh5PMKOoGFZ/dBN7
	aKjIYmcoLZmdiATm3oofwIh5+nMKCGJ+zNxDA0qcb3Z61dzx17WmZ4pDIoL+UIaKWdQzbCAHVNl
	sNwp0bj+utYSnwq/F0VVH5qJeN8=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awGWcq_nKWShC81B@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072531_845678_7570225E 
X-CRM114-Status: GOOD (  18.70  )
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

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason


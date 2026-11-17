Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2971606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OriRfbPq;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jY3Qasho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=; b=OriRfbPqejyp7/au/jQcCzc2lD
	gQFFoALKdrutq22iQAFKRmu4tbvPd0K0srZbl1kszRdtFc3uCeQkb9k7wQJvL+2A+Rg08vQcSQH8+
	dlsi4SbZ5PKtDTOHpnwL7zFn91PpaUZMfc0bnzOG9SZRzorqtAF2rpH4oUidaaqSpbUYgCRG6Cqbj
	AYz9FHI4PNd5YNJnh5cTJL0J6B7LNA8GnzwandwE/7bgYJ1gJKsf2wU/arQr6HzlvQnoPUIIoauc7
	bQ30dwIeGVzzzHDTsuJpDvmrQEL7bip/0or8wlS9OSYRKqiCCNN/LWejt++MsnCvanxeA/OkwamV2
	0tb9MBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNcu-00000006j7e-3kdW;
	Tue, 17 Nov 2026 18:09:52 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNcr-00000006j7A-1ST8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:09:50 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-949680e6d83so13156185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=jY3QashoDGwu42vEpgzMChbbtlorKNy9xk9FVgMad/M6yJ64uJDvXewIATJUPTh3XE
         /aHTTVfa5ZTvvnAF8d3sIc1OtXrIUJDLM1WLTiBOWzuNnSW1uQ7ksGteyoeg+0Wzp6ha
         6Rl+fDElgf8aqVQg6UdIwabEPtCVGEy+/kMMoqZhTyKRo+FDKbaHSeBw0kpiTKQg/lVA
         In5wtelX42SRyBkxLsRldoWwH9lXACFvusjfdCpJBysBETuYN6bjSIhWDxWba9FiO6+C
         X7bLTW1FHGLnRCDeuCs1ZwxU8jmtWU3KE4XniL2u9Dt4gvWcwzrfONJkKdDVrOKs+Eas
         QTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=O/4Hv4VYQQRA+2LdkD76f9DEJij00wf4n8xbjYBIwG/zw+XCSkG2QeQYAY819uHlDk
         9Xh4ndtibmn/xOsPv3236MiIgX6LAB95VYXHxvmSrTzUCeyNwxpxZfz2svkl6DR4i7uQ
         AsG0yCglIOvQ78GdsMKEx3KYDJ0Ev4G28uXI+HyGazmu77H3ulQrYYO8tEHu8dxOOT8Q
         e5BzX2bBo+/zP/wufAQSKXUD0MYa5XOr2v7tQUnHIvnjhV5diB+h6BcR2TyA/cwMZzPT
         kMdOQucMhr9CyuCb+NmEaMKCilKLmszgsmg81ki5+8Dlt4ZlUbULbScrOKyyVBkACci5
         KqmQ==
X-Forwarded-Encrypted: i=1; AL+hErGqB583Bl8+lDLBR0czqouzwjlWOsCUX91vZzj0aQwHr9VRADy8YpmOLgmGZ3I9fyBKkdXaPSeyhsxSQDBMVgb/@lists.infradead.org
X-Gm-Message-State: APuU4Z8OwRDgiZox+hI4tl/yzYR/aWM6oXwEtRgmdTG0WpH3JhepBcwo
	NV8g9A8GvFdQWrvOU4KbLNmrSOfl1G6iuDQauM0BXO5KIqOpxLgGr/pT0RNxgTtuYwc=
X-Gm-Gg: AYBFou130TOMPQk+AbI6bpo7MKK2Oc8JqycMOac5EqB9Yn8NuAeXG3b83Xr31HcEw6F
	DpE6ThLpUEc2wpyYh4WJzBbar0UgXS3u7W2mGdN39H6AESbsOoCBxffc54n+8E/i6gSanH5RH8D
	Jo3lxaPfSq5YtaxVe1zTJ3pl4AxSIMYLXW9taYZuVNZka7z8Pc2iLxnr4bC2SavM5aaXJCtM3yu
	dnRBWzYbZzp3VtulZtrBs6M1VO6EmVLDuTMHzcH2eS9n3nV90REN8amBRHbUpyleIeflb6v0b6Q
	cD6tbKEgmjWIo/8QUA/YNZW9l3FCjEL5wUMIzG+0XvNsG//WfCJso1zwYTfMRdM96wrUwm1ZPlN
	W4GZCwXYapHPB3WqR5kPk8misqK2dCmUq8wEF5h+9WoBbTtqs5ELfHYW/CH7+5vdonVOouCSjny
	uwo6qNntzueaXaBX/MJnlGwvXg/7xqzSV8w3HJ5zMG/J2y4hNdy2IDZvb2N6Jk8v/oJqVU61zOP
	zo6K0fLquoLyQrtL5d97Jaja6IlyPdNynZ4gjOTfJVkFnXISxTebDiDe8gB0KtCNnyb0iYgtZYk
	JwjcSYo=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_100949_441903_7C0BD6B2 
X-CRM114-Status: GOOD (  24.98  )
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

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason


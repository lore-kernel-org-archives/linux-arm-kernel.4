Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZYqtizJ;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iLp9SEy2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=; b=iZYqtizJv5Qc76zx43EDCJBJ4K
	aLR9cQRZB3GdsUYSmEQ+f22AzY5YH7qDO5yTCcWLuc9UXji1zSERXSTUxgjU2psHpQmOAnqFBORMM
	VJT+wkU7arytVGb7EfYOm5XVSnP9/HyXiuf80auo9MAoeVbpBBn2XGeSVDRHjJxO1peO2KXnCfMUR
	HdDjoNadDlS2g5zPURiPHkg5TrWu5VtVYe+bBfNf8Dax3xFcydrAc6T0kqNm3QKcp0ULua53H60Vs
	0YZBWYM367f7CfEbqfHIA4w2IK+E36Yx0ABRnlJZKzJv9WCXYh+ao9BUKf4114NWpCyfr8E0ZXYpU
	j5TLVLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInI-00000005nGn-0rLV;
	Tue, 17 Nov 2026 13:00:16 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInC-00000005nE7-0qLG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:00:14 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91e7af9a67fso30532096d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794920409; x=1795525209; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=iLp9SEy2Cra+VGVlc69jwNUY/VZRqWqKO8b308tiDnDxHhQWkM02xXUoMYdMG2wF+I
         0RkDTVr/y0VKxncE4o0hO+2k/hSQazxMq9ecsqISkXJKddNzBysuQ5LloE46bKbRCxaW
         kEvqfpUVzYIXmwm38P3kZgXe6YTMtsPhXCh52N/7dVamT86W5ytmbZa8SvU8Ex5MprMU
         70mZO8xnLI51ECYrZiTavynImuILcogco6uUVTt9Z+UTZ7PoWywhjzCAdl83n8IoFLyR
         K8WIyrogl1kd2u3ElyQDuh1KK4nqhEwQzRyLDUTqttQcK3bzqd9VviLip/SgZCuujmUf
         eWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920409; x=1795525209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=DUoqr5OlBmWD4G7pL5FtetUdcz/eHvmgZrHtfDl/3TKw3rKQetXa+CcqbZXt7VrafT
         gy80cl5qncLPmd4BPkXFAB4fl4OZ0oxNvpc58KQhhkj50h0hvGpVXgmgGXP3b0hGG9SR
         +yT3o3BduZd2jA3+jYC24lRHgzffj4CprRvn7AZNBIw7sTmV8LxBjlrqzDPM4lj8kJPb
         wRrZeP1d+K5ifknaYLAHe0Hv+Yjn5EjhazcNTu4NMPK7P7tPyw63TLtg2dPjSTuaGbWC
         2Rswy9KZ4EfG6C0MCrlTUD7biUo/jXaK6TmMQIqsuY0asrqufiTgoqQiM+7QUZs1lovt
         AhFg==
X-Forwarded-Encrypted: i=1; AL+hErH5Lz1YtX8vAmLa/f3yjQ2qQWjD/Pg0H95vVNB35RZxoT1eZWTg1WZUmdCQWYV1RItCusqLMFB5tGdF+m0sPEwY@lists.infradead.org
X-Gm-Message-State: APuU4Z/QTtFHHC+j5XC+WSHwCwawIK+TyWw1Kp6Q6KcDa1FHfXYdlIgm
	0AWk6ASH4PICk82Q/chYwFMweFyX+Sn0IruqrEUT7t8vUI6DUQVR3PplKO7rNf7EfTA=
X-Gm-Gg: AYBFou1+EG8u3/2ep3/P7X0WkmG8wqLy0PrI5IByp29C6ecGNXI8skvHrVECdH58FF4
	k9WYKCkMPDTigrgWJQorvd32idriSpqPUKCn8n+NYHH4LBx30OdpzWlaRutHyH/kDmtH6l40tBQ
	hbe6FqbSiVcJsOSma9/3zmnKRGzhoVQ1hHihgjK0HJsW09AtbkAykavrisd9XNcvmFSRuJe1tDa
	ocugmr6MH7siVjshRihwVg+pRfbpmPmLbEI8sR7rtEtBsJhFt1xxGRlgGyIBddcjyAOwTfsUWg0
	ufBSdYhBt/tKYIp/rYsB06T56+aUm+ci7pFb8MFpDcpdrs/GNAO3T2RDcnR043Z+jL6kNvfWLJF
	+W+rT0MwlfczURLJectPRlfSf3REp/hidnG3+F7V1PMkdKdVmBS0SrY8iZFtIl5147FcNVISHpz
	xQ3y+EckQpbFzc4IUTvE/WFeekfyiZCZYNj2/qdm6vbaG1inrd4jLvQ1dA5v1YSk/ui6cppFKrv
	n0SkyMV4xLJXVLoZHROeg7TO80dY4CkPk7KKdz+OsYhZYBLXMQA0bhQAaQQgvMLK+Ku8FxHZi0P
	4/zkY2HF3IILU/BqqJQy3xApXmE=
X-Received: by 2002:a05:620a:a208:b0:949:5c62:e775 with SMTP id af79cd13be357-9495c62ea7emr1501690585a.15.1794920408653;
        Tue, 17 Nov 2026 05:00:08 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803abbsm1067907885a.7.2026.11.17.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTIn7-0000000CJGS-3fNi;
	Tue, 17 Nov 2026 09:00:05 -0400
Date: Tue, 17 Nov 2026 09:00:05 -0400
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
Message-ID: <20261117130005.GC2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avwQl18smAW4R6ec@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050010_300688_F941149E 
X-CRM114-Status: GOOD (  27.85  )
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

On Tue, Nov 17, 2026 at 04:30:15PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
> >On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> >> I used iommu-map for eDMA, but iommu experts rejected it:
> >> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> >> kernel creates is the same kind of DT abuse from over here:"
> >> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> >> 
> >> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> >> "Thanks Jason for context and detailed arguments. Robin did not chime in
> >> yet, but from what I understood the DT-child-node approach will be the
> >> way we should go here.
> >> 
> >> I accept above point of view and I am fine with this, thus Vishnu and
> >> Vikash - please go ahead with DT-child-node solution we had some time ago."
> >> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> >> 
> >> This series adds per-channel DT child node support to fsl-edma and, as a
> >> prerequisite, introduces a proper bus for DMA channel devices.
> >
> >To be fair this is discouraged too, now that I've seen 3-4 people
> >trying to do exactly the same thing I'm not as positive about the
> >DT-child-node hack.
> 
> I may not describe it clear in cover-letter.
> 
> I understand the concern. Let me explain why I believe it is justified here
> rather than a hack.
> 
> On i.MX eDMA each channel has its own interrupt, its own register region,
> and on i.MX8QM even its own power domain. Each channel may also have its
> own Stream ID, or share one when SIDs are scarce. These are genuine
> per-channel hardware resources, not software fiction.
> 
> In dmaengine each channel is already modeled as a channel device (see
> dmaengine_chan_dev()), and this series puts those devices on a real bus
> (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> describes that existing device, so its reg/interrupts/power-domains/iommus
> are attached per channel instead of as index-matched flat lists on the
> controller.

If they are real devices then why can't they come out as platform
devices?

I think you are overstating how independent they are. Many single
devices have per "channel" resources like MMIO and IRQs. That's
totally normal. It doesn't make the sub resources independent devices.

AFAICT what you have here is some HW designer used SID where they
should have used SSID and you are trying to hack DT to make that
usable because Linux does not support a SID as SSID model today.

Again, since this is the 3rd - 4th case like this, it seems like a
popular hardware choice and we should try to do better to make Linux
support if we can.

Jason


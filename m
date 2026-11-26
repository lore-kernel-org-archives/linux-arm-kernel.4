Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA816606A688
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ESsu1YxO;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKyaI8Ve
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=; b=ESsu1YxOLN1O3juFksGfbbQLgO
	a+c4LbWsts7dQGcWM2qwrbCrqDcYBxqq8sEUJwK+Ngf8Rtigt8JJa6J60+SzXdLea70LqXyU4licu
	PILnE/kKmBuworeYREzQAdUDELm0Y35Q4IpipbBtJEqwxBpcg1OsCpRqk1L0Vlur/NZu4qKGrczM9
	A3I67I9dYuN9ab+qual6VyRzHdN6NeqrmA+hiOkkCVV0UziYjhSgMX8BFeOCKhrkQYz86EO4zukgR
	rnuSnjXmpJEXuyYVAtqCL68eCQgWtdmwJQyc7eanvLqXc3wIZW6ItRB1jO2nF5WCeDoJSwjSvLMJ0
	zyORUogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaUk-0000000DYgR-16Vc;
	Thu, 26 Nov 2026 14:30:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaUh-0000000DYeX-02IF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:30:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso38287375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703437; x=1796308237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=HKyaI8VeYbLvwxzh5lOL30dJNjM8e0mxILHBeQqud0ordSTnOZY+byZf0Dz8LxcvlW
         bTaSa4a3OG4LSghzCXgMtBWQElV6iUg/hRCDeAkc+55hPvtEpgwWbNqf1Oci11b2GQnW
         QVmRvU76XUE53e8odt87w9/kHASIxmOAArshz8AcSB2UN40UqoU/UWBi+nNqDbnQ80fl
         dB2Xf127txmEFRd65p4egKUkyk7p8zHaQzTGLfVunNX4VRaM4BDiDE7plypyYsIuAJ1O
         KJjymECAyvNqxnvukxgVAAjEY52qv3uJ7iZUdgEgrM3xP2+jLOg0dJtK1IEziR0Xq9LK
         xugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703437; x=1796308237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABzoEq0m6vsFJk565MhCiGTGEviQ8pU/lDbym6z/Ado=;
        b=c47Vko185i2cCaOjuE0zL9vhE5FbHOUPSfpVOJcUiCPPnZYugNCiz3+KzuqBjL9gas
         4bHFX8CUVXwGPD2s+YyDIAvuXQOZsNRQ3yCQKZRoVSmQHnMt6FEqWok8c3cOzlgS/5c4
         YwMGxUb/gDiBD2pUrw9BERYW2b75RUEXvTRQVt84q9vZ2o9mC1JzBuX6n/ZEHfRUYXfg
         RYqz5ijqBnaW91nSC+NlVvWdxMFFhcRg67AR/oa21YOoucRPNcemU9Syu56cV/HQvKjN
         wGGktTT6PCu40z/jG18OWOlA6ESi6prCoFIYp29lBEGIhY+ce6MO6tf53AgDw0zq3ZIz
         aDLQ==
X-Forwarded-Encrypted: i=1; AL+hErEy3+2ezIGEWL4ddhbFi4gVZh2/QZI4dljO9zl1NsEmCgOoqk+lc6oghM6ETpwH/xeuWfiIcTDrsU2aCuFnesTx@lists.infradead.org
X-Gm-Message-State: APuU4Z8uN3OvB1D9B261E8c9nSohw6i3w3qD3CVPdPPYHaUsD7P5pyjw
	LNaKbqVzc5JkdSLs/llu+5M5YUbFgz0vknrx2R24rs0n5idmt15ym78XhTbxv5DJLWY=
X-Gm-Gg: AZFdTZd0GWU3VD5aaKkmAPiJSsoKJnW8AyFss3LTRsQlclzYCv/oORdj9KytLE6xZAW
	NDXFXz5w8aGRN5UvqmblHVETNFgEKSriFZSmqynUd/Ak+JyKTWE0uUohwVnSb2eQUrX2Lk0o4MZ
	3TQd8ViEjmQCahD42O3bpIrxlWDvqWyWrT76qdaQwRr1YUq2WWQDInvhie8aP48Ae7nWV43nsYp
	jif0NMFMt22vu175hBdK0AZn3+02mqXXyFAC1BHYImE4eWgksraSLKV3h+9EbxxFJYVnuM7WmKD
	baN4HSKvo0h+54TPjCzZirK2H2PeHCG/P40Z+50z3gMGbP5lA6/Erte0B9GlpWZXblr/SWMrvD5
	oBMci2tiO7MouBIiNnUakBv7Ibue3TqRPTQzArrErOncXstaTyqZMQo1s3bRUbg88Cj/D3uFjHr
	q6Jplrq6gFOWIeE7ng9gU4hqNJ1VkknAM5/HLfLce0ME8FymQZEHuSsrRGtTdgOmeChvw/jrHkl
	hZ8xHXexuWucc41F2tXraTvU0nFMHd5s9PGUTmL40dIXnRtejjnYv3xLPE5J2PEgbeUz7AFWFTH
	Gh3STrsOpKgWrF5k7ITya9X68yyh
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr403770795e9.11.1795703436933;
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340532965e9.0.2026.11.26.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:30:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:34:36 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for
 multi-beat burst
Message-ID: <awhDfF1HNkPPgRbR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-5-andrea.porta@suse.com>
 <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_063039_066326_3E5488E6 
X-CRM114-Status: GOOD (  17.56  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On 14:30 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:42PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Add a control bit to enable a multi-beat burst on a DMA.
> > This improves DMA performance and is required for HDMI audio.
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 118ba2f71dc8..063e1b2aabe3 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,7 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)
> 
> Use FIELD_GET()

Ack.

Thanks,
Andrea

> 
> Frank
> 


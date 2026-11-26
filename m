Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A947606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abvSb2es;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LDJ90U6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=; b=abvSb2esdol1MlbkNHR9Yjp7Ei
	LTv/fOlMAUEyyK7S9W4jvI7EirHkTEk8uYCOW8CazZbYGAOkiwAQMY8DiBEHRYZ9RI0PgjyOGDXNM
	uIxCaYOSnxhYd8MF371lRkff3SsXaKna8+3mjp/runlyG6yeF9XDNE5QW6pvN4Mfzao8gU00qQ19l
	ofWFj4c4E6P2E0ngfsJCd9xMWEoX0b9pnqV4ynhvL11EvNYNXGDU5wtIGrUu0mM1B4FC6/0vxQPB1
	aby0FJ3fYLDP2Itsqmxm1ksonyM7oHKcIPaKFgTVtUl/lyZRvbeIeROU8pfBOUUmsn5VgydPuHOVO
	qsUzNALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWad6-0000000DafH-0IwD;
	Thu, 26 Nov 2026 14:39:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWad2-0000000Dae6-2wKF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:39:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so58739525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703955; x=1796308755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=LDJ90U6/+sbZl2LMx5JbjtzyUseC4W9PWnFIC96lshNtzhqnU+X3OBKRpJQmM3YmJ6
         GOKcZNlcFZR+2PzPPw/3+ubivciG1M1Lvcxng9iZbc91U+59MBoSFLWwdzVFaxH2UC1P
         S7ulHN+i2kbeFmddSFdWiYurK8BfSTqFc/4qqtxU2bRTHQsIYvUcYhOlNHIK56qSW0jU
         7IIvKq4FeAMzrYBF+d3d12kQG50EgOQYEyfHCJZdtkw4bwaWYaMtkrk6vy/lPXG7QGkA
         kj8gluWRLw3oV7aYtTQMEcXGYZ5enVjRbMzNGBxr9F4+32EomwDzQIX8zX7Ztc5ugfGu
         TklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703955; x=1796308755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=L8Pan83Qim5yIEkEbPDJpu2nkA8A/5Sk8wQd5Z2siFZUsKL4mUX4RmiC2+uyJTz3Gc
         ua/V/JpcLTF0oXUnFEhznRp0IA9HqP2AHAUcdLada/C9febevyEpESZIY+wojysKabix
         VEp5fDokUCIKLlqx3OFFpHUWpKhdBjeLu/AXddV8XsurO+ZKGlMHTQby+xl20bNgIt15
         zjfXhggC/HNGuWzDuAW3RajEHwTJm8qjnxDlbaqHSx3cf/ClneniXpJ+AiRhvOASjmAH
         jipA6VeCh65VgDlk/cnBfGEw1aLjMQp+Z4TyLdvc5YhPRFEdJ3vSJ9G1JFDzFzg4rfsy
         gRMQ==
X-Forwarded-Encrypted: i=1; AL+hErHcszsMbRFPerDnfehY+u4zRHEOtacJXKLiP2Leg+adp5ZMzcmOxJJW1Lu6uQqDoxTKm1g7Ug9qlR7Fm5pcKCk4@lists.infradead.org
X-Gm-Message-State: APuU4Z+Cl+aEct1xWFG+iZWUblLzcOKDx8Gi715Q7o/C+9VH4b5uY32a
	Qinfl2I230ehknCgLa9QSWKjmkO5DYnmr3I/lzga6uH9DQpeiwrpFMaFrY7AA/uegdc=
X-Gm-Gg: AZFdTZe0/CABy6eZt6AFxjHMWmS0qPy9Qe6kRrfrSrJmKEcxY2ZI18GVTkULz6mHiT/
	+q2WaGnLWBg5cSFLSBJiwlAnYvaAHF4B0b+99XRpm8Py66VVidNSMTU5hFDnRlLxUB9zGMYoxtH
	fONBleQDTfEQNMooDdtUec6Gh33OmMazA+eAHhKh6gtmzf1YhogedhpzQFZ0gXfcKyrQM9LY+Yn
	E+h11RSbcur8eBNozQx5i2PxdxWBUDMoLPErEaUdSeycwioeo+AJb61R9yOQ6ZS1ESWfgTfKDtz
	fkKTq3DX/3RhuBzc+Xe7KhHRQeX2MqGSgo/zJBV3KXG/0RYit4tL37M75QyS42gj3zQBk9zRrSO
	ZBK6CFXPX0K0dCGbOAUI518lFgSCdMwDnRQs2z7+K8Pl6PU85Qqxsm4uNpPSZiIhZLQwWdCfi6b
	qb59A8385cgmXxX5kWvT7op0l04M1kQcBdLZD2VM4ertBIpw3wIPDJ67H4QWJnoDno8A5tsYGaG
	tVCQACbMQjFbj5ZPi2geZdRbWJqvntrgLwev5ynhiAqL4dqAG3JMYduK+8Iu8tQZZKFqLlqn4do
	MBlbobJ1tR22i8DEkc9aFBrLeOvd
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr428700785e9.1.1795703954785;
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm712460975e9.11.2026.11.26.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:43:14 +0100
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
Subject: Re: [PATCH v3 07/28] dmaengine: bcm2835: Support common
 dma-channel-mask
Message-ID: <awhFghuBMy8IzMSs@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-8-andrea.porta@suse.com>
 <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_063916_755014_EB606E62 
X-CRM114-Status: GOOD (  23.91  )
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

On 14:39 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:45PM +0100, Andrea della Porta wrote:
> > Nowadays there is a generic property for dma-channel-mask in the DMA
> > controller binding. So prefer this one instead of the old vendor specific
> > one. Print a warning in case the old one is used. Btw use the result of
> > of_property_read_u32() as return code in error case.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 51e3a40dbaec..1087157fb242 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
> >  	}
> >
> >  	/* Request DMA channel mask from device tree */
> > -	if (of_property_read_u32(pdev->dev.of_node,
> > -				 "brcm,dma-channel-mask",
> > -				 &chans_available)) {
> > -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> > -		rc = -EINVAL;
> > -		goto err_no_dma;
> > +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> > +				  &chans_available);
> > +
> > +	if (rc) {
> > +		/* Try deprecated property */
> > +		if (of_property_read_u32(pdev->dev.of_node,
> > +					 "brcm,dma-channel-mask",
> > +					 &chans_available)) {
> > +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> > +			goto err_no_dma;
> > +		}
> > +
> > +		dev_warn(&pdev->dev, "Please update DT blob\n");
> 
> "Please update DT by replace brcm,dma-channel-mask with dma-channel-mask\n"

Ack.

Cheers,
Andrea

> 
> Frank
> >  	}
> >
> >  	/* get irqs for each channel that we support */
> > --
> > 2.51.0
> >


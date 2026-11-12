Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQPKa1Wf;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=D7HcLpg6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ydDXOxFBj0SVycf8TwirFfYbpVr31/wQtaeKtsEhMo=; b=KQPKa1WfvlLwSl
	AV0cx5iRlb9VtfoNVRsnM7q0pDEqYp1C1ad1rQoxgUx7FWbGBPS93NrP5mTZy9wzhM30quII+hcst
	B7N6DTFcafwS3Bx0ear/rpxKXpB7r2chpXJAAu30nK3Kizjpyx1ZKX9BdJKByOT6CgifzKk+KcGvd
	1nvd0QYoM5dfde3GDtRFez9V7vqwbnL7O30rqH0RPJLLqWHTJDfZKQchCSwoKLurQBdp2QJyefGZw
	Ye63k0NuvXAvYp9kxbmsQz8D1/kcb5gKQkTrvRyKDrqKBUxbqdjOLbtvDdkx02e0w/rXe96jCsGcM
	wPNuQuptXF1ot7nlDMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUEA-00000009vFv-1nHt;
	Thu, 12 Nov 2026 12:48:30 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUE8-00000009vFC-1wdl;
	Thu, 12 Nov 2026 12:48:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49B8BA1563;
	Thu, 12 Nov 2026 13:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794487705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ydDXOxFBj0SVycf8TwirFfYbpVr31/wQtaeKtsEhMo=;
	b=D7HcLpg63LrjbttMO0pxYYrV4lPsjGVL0AmomQUy6vklnuvaQd47hBSSw4M9yWYO0IvDS7
	EVJQkjzDstRV1nWS5gxD9evSHMU00LKFV2Uzinb5em+0lDA7Pv3vUfuE1n02P9x7z2s8AL
	udl0MFHopqM+m2nkP2W7T3sJtdIog6KxIRdIsNS1gCUOPuQXJhis4QC2AkFRo6aQKBUfGc
	kC50mM3sfe5RaXlFC85b7EaySfN3e/FHI1IoNH9JX1HzYioAuS/YdW44UO6AA3UPtA++Jk
	qFmO1Wp7Uy3WXtCFl4AojrHhJbA82rGMQDAnvR5sBbBMlpea4W8bxk5/tz98vg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 13:48:24 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Lunn <andrew@lunn.ch>, Stefan Wahren <wahrenst@gmx.net>, Phil Elwell
 <phil@raspberrypi.com>, netdev@vger.kernel.org, James Clark <jjc@jclark.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
In-Reply-To: <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
 <6125aa53-4fad-46ed-b627-e0fce7df7b84@broadcom.com>
Message-ID: <c00ede37512d46c8155647eed7e39450@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_044828_669601_630B4591 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Florian

On 20.10.2026 17:40, Florian Fainelli wrote:
> On 10/20/26 07:58, Nicolai Buchwitz wrote:
>> The MDC of the GENET MDIO controller comes from the GISB clock.
>> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
>> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
>> can put bounds on when an MDIO write completes for PTP.
>> 
>> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

sorry for ignorance, but I'm not familiar with how the ordering between
these trees is usually handled. Patches 1+1 are in clk-next now 
(af7994af5228,
ab94dbf30233), and the last one for your dt tree needs the define from 
the first patch

Do you take the dt patch for devicetree/next, or should I wait until the 
rest lands
in mainline? Thanks!

Nicolai


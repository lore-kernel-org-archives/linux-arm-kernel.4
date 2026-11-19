Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B07606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2iLPmMqi;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uP4KQJVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WfFh9jMGZpN2Zx5ZJjyviQRI8RDYFWhI65HAjYk9vXw=; b=2iLPmMqiIFPOH2
	YTlEDLPA19wy7p1/ebsqK9TPJpAQ7Mpu4PKynp8DUjMsnAhI/uKwyg8cbasUzqqOCx0aRs+gf7pgQ
	fuDNfqJnYWCQ/XGRK0gUKrydYKtHQnENof4yEnd6Bbx1MQ8JqgnThvrIXH0D1IJ6gvBeUeA5Za8SZ
	+4dxRYfq+jGp+nRJJWEuqXgeVnt3pB9mYP1UVfconlTrjdfyhsNe8QVIEnT+A3AFtWgZYJ8cCANxU
	lkCJXqMLOEDjDy3qP/0YMyxCvMNFTIYb+sZ7Rvn8z7acvehpn68Ax35NkQqByzVlvJ2stpQL7ng36
	m6HXU2opwQQ+qqgHwE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0HI-0000000BhFK-0dTQ;
	Thu, 19 Nov 2026 11:26:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0HF-0000000BhEu-0p0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:26:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 428A3C4CBEF;
	Thu, 19 Nov 2026 11:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06A3E60237;
	Thu, 19 Nov 2026 11:26:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 457F811BC1166;
	Thu, 19 Nov 2026 12:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795087556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WfFh9jMGZpN2Zx5ZJjyviQRI8RDYFWhI65HAjYk9vXw=;
	b=uP4KQJVLqzcetO1Nt/Nag/D9GG5LyfYd8vOtrrXeecJXr60KF6SUtzR/p46WPm8Vs0Tnrh
	anOu9uQ0I8uR4vZKEc/sjoQme9YSqbDUQIjjDouQrGDQqKTQGPFPoPDvniW3YtOrEU7/hX
	vZACI033wbhJeTczucp/030kpVDyq7wJDdbsuvnK9Kq7/HY3K2oqd79CAMs8+MjjyFwBF9
	ab+J8VJQN3bvmbwZcU0SdbICRzxDViegRD+rZMppdYrCK0l8HcsnCOHilDszRiBaTmYGT8
	7lR8I9gfO+qWBlkaMDT1CVxX1vlzo2xr5xAooPnXGiWO00cCMypiPlWtpMP+iA==
Date: Thu, 19 Nov 2026 12:25:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kalle Niemi <kaleposti@gmail.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold
 <johan@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v10 0/5] lan966x pci device: Add support for SFPs,
 simple-bus part
Message-ID: <20261119122544.72e793f0@bootlin.com>
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_032605_407201_D3838EFD 
X-CRM114-Status: GOOD (  21.39  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

Please ignore the series, I've mentioned a wrong commit in Fixes tag available in
patch 5/5.

I fix that and send a new iteration soon.

Sorry about that :(

Best regards,
Hervé

On Thu, 19 Nov 2026 12:00:06 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> Previously, I sent a big picture series adding support for SFP ports
> available on the LAN966x PCI device [0].
> 
> In this series patches touch several parts and sub-system in the kernel.
> Reviews have be done and it makes sense to split the series and send
> parts separately.
> 
> This current series is the extraction of patches related to the
> simple-bus driver. It has to be seen as a continuation of the big
> picture series but related to this specific simple-bus part.
> 
> Patch 1 fixes an already existing issue reported by Sashiko.
> Patch 2 removes the no more useful remove() function.
> 
> Patch 3 depopulates devices populated at probe() when the driver is
> unbound.
> 
> Patch 4 prepares TI OMAP bus-only devices to be populated by the
> simple-pm-bus probe().
> 
> Patch 5 makes the simple-bus driver compatible with fw_devlink
> expectation consisting in creating its child devices at probe.
> 
> [0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/
> 
> Best regards,
> Hervé
> 
> Changes:
> 
> v9 -> v10
>   v9: https://lore.kernel.org/all/20261109140916.90625-1-herve.codina@bootlin.com/
> 
>   - Patches 1..3
>     No change
> 
>   - Patch 4 (new patch in v10)
>     Prepares TI OMAP bus-only devices to be populated by the
>     simple-pm-bus probe(). This fixes an issue reported by Sashiko
>     related auxdata lookup table dropped in simple_pm_bus_probe().
> 
>   - Patch 5 (patch 4 in v9)
>     Use of_platform_default_populate() instead of of_platform_populate()
>     for bus-only devices to fix the 'unpopulated grandchildren in
>     simple_pm_bus_populate()' issue reported by Sashiko.
>     Add Fixes tag.
> 


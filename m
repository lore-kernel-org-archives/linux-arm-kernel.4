Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pshv7f6g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bS64h1/A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6sRevr2xT+LuyoIF335Qd8qzVJOfC1tRYDG7VWVmjQ8=; b=pshv7f6gJtUGFpc8EM/6iVETb5
	cWnayAkPDB1tyMFw68ANt64/g94uEu766D+nD04XNvMwNoektRHKWIaGFU9Zg56i+G6/m1eW3yYv8
	nKB603e5lmKCb+nl9b0mCuApZUQe44Kl4ujHuHEfoTFwuNs1dhtBLwUrabBGPt6NiSnYO4omge93m
	YXpr+5NMo329V3JNYYEXHO2SK5wemFvTh4hXRA3HobxuXo+wAkOM2kur4FGT22Lbomgmj+m2ZWWeS
	J9iNPhFglJGJl+cDx3DP33+mG75ZVSVV6jwK0ZgWz3Yuwcq4YPRCaddBVDOzl22bqIr3zP9WOcYN/
	Yo9g6hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUno1-0000000HTnE-2zaO;
	Sat, 21 Nov 2026 16:19:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnnz-0000000HTn3-293c;
	Sat, 21 Nov 2026 16:19:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED4F7609ED;
	Sat, 21 Nov 2026 16:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811131F000C0;
	Sat, 21 Nov 2026 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795277950;
	bh=6sRevr2xT+LuyoIF335Qd8qzVJOfC1tRYDG7VWVmjQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bS64h1/AfN9Y13uTYNtXYdH9QsSq9BtdwLzIa2UgMNjsrlnxmdVRtvyjEYUT6jZFI
	 bJygeLsCIu6f7RLKdr8bMJHbR2k5qMb17lJnUuvTjsvixUiMVZdDHwydbYralGYqp6
	 lTDdgW+Xg69sywWrDd7itszC1P4LhYF0Im/UBf8U3tfUPjw9GFkBmp0OfeY6qEutwr
	 5HWWHSX6XiS0uj/sdJ88xh4eaJw0I66AL0iSyme2ANbHUJFWMC5+s5qhx1pdCOGB8Y
	 c2PeTg2XUmsOxCN3N7i2OVWFrcf3V/6FIj1G2cZIeAVyMSKEdYA8Jrpo8PJfpTjE5h
	 EBNSVu7RgYmYQ==
Date: Sat, 21 Nov 2026 17:19:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yuti Amonkar <yamonkar@cadence.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>, 
	Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
	Abhash Kumar Jha <a-kumar2@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Swapnil Jakhade <sjakhade@cadence.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: cadence-torrent: drop
 cdns,num-lanes default value
Message-ID: <20261121-favorite-turtle-of-penetration-c3157f@quoll>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-2-da2db7125cd7@bootlin.com>
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

On Fri, Nov 20, 2026 at 01:55:50PM +0100, Benjamin Robin wrote:
> The driver treats cdns,num-lanes as mandatory and refuses to probe a PHY
> sub-node that does not provide it, logging:
> 
>   No "cdns,num-lanes"-property.
> 
> A default value in the schema wrongly suggests that the property is
> optional, which it is not since it is listed as required. Remove the
> "default: 4" so the binding reflects the actual driver behavior and the
> mandatory nature of the property.

No, that's a bug in the driver introduced in 2020. You ignored the
background and history of this driver and DT bindings.

Best regards,
Krzysztof



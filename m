Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A63606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n61tjZZ+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=osh0+YvU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bQB57YHJuSU7y+p9K3IgANjz1Zr9QyTIdR3LXMCxl28=; b=n61tjZZ+bMhLvh
	pyTB5CA3hTRsksa8UV/UtGKyZzJIDyANtW2QOAFqjbLPsUnvfluzSqpU35QG+PM0oI/CHH0pg32Ka
	kActp6kmQQhMGfc177Jta9n9vT9lIEwySlUU9KdaeoWBAbUMan5eFQRJ9OYmcKFX7dnhRbdCHkoJf
	zJhFsGn6e90wwxYDyVaPOxaz10kakINeYaPEko6EL3xMLmNyf/jyW4qbrk+jWbiAyCz4KA92uH3YJ
	dns1M6WA3CkTsMhHY8nB5RUZBkmqbjF4yOpahlzojG1aObsGVuzPhz5O5H6dzRkC/StgJgtW4Ls8u
	LyoGj9kNeY6EssNoMnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWZh-000000048O6-2vfx;
	Mon, 23 Nov 2026 16:07:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWYm-0000000486V-0Ff5;
	Mon, 23 Nov 2026 16:06:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D96F62350;
	Mon, 23 Nov 2026 16:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A86C1F000CF;
	Mon, 23 Nov 2026 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449987;
	bh=bQB57YHJuSU7y+p9K3IgANjz1Zr9QyTIdR3LXMCxl28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=osh0+YvU9TjNyTg/rCIIiY47awwTryiBiPfiPhJ7yBp0aITc/OY4s9NpodGHJMHVx
	 TiovNZvUBm9uiBc0c9KMuW/uR+KGQ3fbjrJkw5LHXPqOER5wM/ZruS1rd9gGPs8bzE
	 JxqlOU+vhs1lAAXwVo1X4juPOn/u/yMnFKOH2YzdgY5mepPKJRmTLbUbjMJfodAuT2
	 viw1ovmG3R0qdfguGnGHGVZzIoeblEm1ZnMQb9ron9NUNf5s04LzrVhAOWbCGyTiUd
	 ZhNUgG2KbnIU7XbR1DHf1q+F1nMjGjn0+CrGS0NKowYbxRlbYjDbTxI6Ff86uQnEH6
	 U9hMcQFyuYjIg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
Message-Id: <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:21 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
> which was broken due to a number of things:
> 
> - the SATA PHY assumed separate PCB windows when a shared one is used
>   for this generation of SoCs
> - the clock/reset (IDM) was not being configured by the driver which
>   meant that depending upon what the boot loader did, or did not, we
>   could have had the AHCI controller still in reset by then
> - on some reference boards, the AHCI controller is not DMA coherent,
>   assuming so leads to all sorts of timeouts, data corruption, etc.
> 
> [...]

Applied, thanks!

[1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
      commit: 2a27baf6e203af422db2d84f9f382153612679a9

Best regards,
-- 
~Vinod




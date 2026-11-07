Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D07C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jUhYbAdw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asZGQ3aT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CiL1HQxfgsOcvm9vKFk1DVPeae6fGl4/cDDijU+Teks=; b=jUhYbAdwq7+Wm+
	TwA8iX484/MpHpmODhopiZWU4XZId6yXE9Xa59LtiDOV6KQwlw8GX+HPpScnuW8ZHAizIyuPafZz3
	4YZMeiwyZFRvCjKeepF2Bk+YFzvNRN0ET1SqUNgSA0L52snO3MAyviwsUiA+/l+SBmLbRjjABIt6i
	yIw2cGiEzbzz7E4Qkr9CgZhD0mKqkEiI6aqx9oeO6pY8Oeom1qjiAP+r5YEcHiCpcbpQCkBwxHgnF
	p2Bs8c2jF0pgBNGKwgGE+7ohEC6CYfP3o5u84mcWFuIW+F4nt8FD8i2W7ZTuGIcQ9Z8p3mWX/qJKy
	fdgyJ4s0Xm8OzDIXVlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfo0-0000000EgqS-1ur2;
	Sat, 07 Nov 2026 12:46:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfnz-0000000EgqE-00Bx;
	Sat, 07 Nov 2026 12:45:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A97760145;
	Sat,  7 Nov 2026 12:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9201F0089F;
	Sat,  7 Nov 2026 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794055557;
	bh=CiL1HQxfgsOcvm9vKFk1DVPeae6fGl4/cDDijU+Teks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=asZGQ3aTW9/wx50mVmL+G2Ag83l/u/ystE8ygXlcryWvsuZcC5vngRH9EwK7E6gWq
	 7u5dCW5hg+lyGKdAkG/Vx+ZZOJCG3IB8oUXTChL8zXvM9zQOE4CTyxvES7CS6qNNZ/
	 oxiYbI1Nn3ZxDOhRqe0FbX3oJir7kmjAPTpFV3SlufjiKH0yvxCYnfBvfePpyPbeil
	 iT6Q2T3Lu/39C+0VJBYOWcnkNzynnLjVaXzQ3f5tv8eH3qlJ2FYGjbHLoYX2q1N3Hk
	 NE/Fkka48M/NpXxRVeiZBQxlSuEsgYs/HDqfbQMO17wKvLpHGtuPT9VLQSMW847JgJ
	 kTefC58ivt7lg==
From: Niklas Cassel <cassel@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
Message-Id: <179405555432.938034.8271032337892944854.b4-ty@kernel.org>
Date: Sat, 07 Nov 2026 13:45:54 +0100
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
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

Applied to libata/linux.git (for-7.5), thanks!

[2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
      https://git.kernel.org/libata/linux/c/262e3bbc
[3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
      https://git.kernel.org/libata/linux/c/14d30246

Kind regards,
Niklas



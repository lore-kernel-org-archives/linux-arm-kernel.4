Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o2s8/ERf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXwCWIOS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9vEVpcc+CMjPgfA3K0RKV7gMn4uccMUmcMiY9r1X7ek=; b=o2s8/ERfGzkUBD
	aNEgdN+iFB9FLAbfxftm/OteYkIaijSqtrXVOhn8DqRPwuOAZ1Y7A8w1ZcAMMeY77CWQcKaLQNDBd
	I0j8J+w/2a/tT5tV3bNHpsNQzdkN1s2YUSUfNlHddrwHQ0zsJl1oabCOmljsT7xBCMyNE+o7OGZaq
	RW3vUV4XtDeSnxwieYfAJ7WX6UOp6Dj6ypEu3wY5jueYlqoyZb0gT+8rrkcctG+8eCG2Nu7elaO08
	z0h9T0Z0jz+mGH7KBV+LpDZLeQZ9FHz+4gdQyS0QYT8uYio0mpYYnDTtG05YdiWWKtfE7/t4RPH5z
	2e359sZG9ax9FKBxac7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Tb-00000009LEp-0Amy;
	Wed, 25 Nov 2026 09:39:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9TZ-00000009LEK-30ni
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:39:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3070C61F47;
	Wed, 25 Nov 2026 09:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F236C1F000C6;
	Wed, 25 Nov 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599580;
	bh=9vEVpcc+CMjPgfA3K0RKV7gMn4uccMUmcMiY9r1X7ek=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UXwCWIOS01qGj+UIsssVHI7bhbXNBlUz78diSCRTRB2X0+YFEwgSvXuGXCQ7f7uWj
	 wSo4QsKsnEQl3CbR+ymgxRB7cQBer07myWtCJMjYl+DX/o2QIfVOGz7fpnHzO6KsFi
	 ZZHbR19gM2cWLYBHUzTDBBM/QLmpf5AjJs5/3nIe+v22rpR/w6mcD48BMfaHV3oPUl
	 UhjFZ1/blieuU77eC7AlOwCb8l0Bqu31W2BkUb+qumTBsz6PqoFfOt6SDsx0ZHXpld
	 qa91Wp7YeKbow0kLLLYnS5Ygkn9joLA7r804Q24RjFks/VeZD0MYY2M3+U98WC78Qb
	 NJkljj6AB03rw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/4] dt-bindings: arm: sunxi: Add KickPi K5C
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261120-k5c-dt-v1-v1-2-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
 <20261120-k5c-dt-v1-v1-2-d9681df67bc0@gmail.com>
Date: Wed, 25 Nov 2026 10:39:37 +0100
Message-Id: <179559957767.14607.11625854653378888.b4-reply@b4>
X-Mailer: b4 0.17-dev
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

On 2026-11-20 01:22 -0600, Rajan Yadav wrote:
> The KickPi K5C is a single board computer with an Allwinner A133 SoC,
> 2 GB of DDR3 DRAM, eMMC, an SD card slot, Gigabit Ethernet, a Wi-Fi/BT
> module, USB host ports and a USB-C OTG port.
> 
> Add its compatible. Like the Teclast P80, it names the SoC as
> allwinner,sun50i-a133.
> 
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it and checked it with dt_binding_check.

Drop


Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>


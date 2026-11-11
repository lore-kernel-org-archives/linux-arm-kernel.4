Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBC606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 00:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkOOGMwZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLsL/HDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TXETTPPRVF+HNiL1JDfhK3+Odg9X5L0s6YqExft/M58=; b=TkOOGMwZOa2QlH
	1KrV0ysJp3kj2SrBt7AND5oUW8k1gXEPvTWdiVgo2fx/9T60oRVFEPEgmLqy88zhPVs2A5GV+fYka
	NCjOk/mFssrbdxvBOlqoeC44XpnoPEpumgWYRXFhdFCHScwN6aI60ftFuAwOISmtrvr3HTFdCxFi2
	R6+q5PylZ2qV8Jnc6ihNYNHkL5PuQQJRJ5gBx08Kr7DpOytN1mOrnuYxS7fIS8tJkmXzDyJJF5U58
	E2j448JOIcp3p9//55WW2N8JiZ8wXuLaGoy9A0e5BE/35T40IufoeS4oJwmTTMkYaO5VuENgvtBX6
	HNtFI/KwhWPWnTJPMYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwXa-00000005LHT-1gKO;
	Wed, 11 Nov 2026 00:50:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwXY-00000005LHI-1nF4;
	Wed, 11 Nov 2026 00:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B6AF639F5;
	Wed, 11 Nov 2026 00:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3141F0093C;
	Wed, 11 Nov 2026 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794358214;
	bh=TXETTPPRVF+HNiL1JDfhK3+Odg9X5L0s6YqExft/M58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aLsL/HDIZvha5C4UASbyS/8/oVMaiH7y+qfKFJsCXtFfgjRBqu3k2mhnpw7CSVusn
	 DTLKMNvUdumkNdWSdIPTi19z3ZAdWJn8gnmMxSSzO+4tuHGlP6VnlMU92IQYtu8Wz4
	 o5PRmVcXER7KBkqzTmNj8ZMUgxv5RXbL6NFLEhj8IWyg3FaMA5gBMU6F4QhTFHkgpo
	 du8WqP2QFNMfCCzPxMFSFja8O3s/U4IsCxTJ0xLjd9I2KvTdZKWCEy0maVEaYMhcw2
	 AxESCG0UX5+WvHOh1Ms2i8fjr2djtyyLYDiu3SZ+XUG7dnTZfdUuVumad1sLn+jJwP
	 wjZY5as0LwZrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2108E39E8A55;
	Wed, 11 Nov 2026 00:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: add Realtek RTL8125 PCIe
 Ethernet
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179435821267.142717.8246984206000823163.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 00:50:12 +0000
References: <20261109-dt-bindings-net-realtek-rtl8125-v1-1-cff4b8a8be66@pardini.net>
In-Reply-To: <20261109-dt-bindings-net-realtek-rtl8125-v1-1-cff4b8a8be66@pardini.net>
To: Ricardo Pardini <ricardo@pardini.net>
Cc: hkallweit1@gmail.com, nic_swsd@realtek.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Nov 2026 02:53:47 +0100 you wrote:
> From: Ricardo Pardini <ricardo@pardini.net>
> 
> Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
> controller. As a PCIe device, its "pci10ec,8125" compatible is the
> Open Firmware spelling auto-derived from its PCI-SIG vendor/device IDs
> and is already covered by the generic dtschema pci-device.yaml. The
> compatible itself therefore needs no binding to be valid.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: add Realtek RTL8125 PCIe Ethernet
    https://git.kernel.org/netdev/net-next/c/711c458f6f34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




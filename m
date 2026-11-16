Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED7606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OT6ZynFb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knE7eJe9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2d1/C/muKygY+FB1LWBPJCvJTWV1hknbYasTXckto7A=; b=OT6ZynFbOz9Z5z
	hpJyZwzAVFP71msqvUn2ugHaI0wDs8q6ZC7RweVany1D4FzHvlnsOy5iJZJK/S7qtR95izwfCcoY7
	2fkEkSUEfLdMQ/uoNMMSYWmLGNurh53adbIb9P1ONUCL7OcMjV07h+WjR3FVqCkbG3MWTOZZn4a71
	65VDWnMq34j3vEWUfkEQktr+jwoiR1vkz8vzdOqW2DxfRhlnzaCv3FR+R/Uadc817YHRrwf2qKF2D
	ZXzM2o2mCH0XyLxXKUbobmbhyLe4R913uPX0dTqc3C4sMTJSvgqgdWe71LX9vzbrBbPSZeilLOHQ3
	d/cFep8ZvRXzPY7W3o3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT69J-00000004AjF-0e9k;
	Mon, 16 Nov 2026 23:30:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT69H-00000004Aj8-0ffz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A621B43AE4;
	Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DEB1F000C4;
	Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871806;
	bh=2d1/C/muKygY+FB1LWBPJCvJTWV1hknbYasTXckto7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=knE7eJe9I0iOVOUhqHP/z70JwloTPbFPr+PeZsASX/9e8algTjzVmBFMd+grjW9De
	 IFeGDrj9vjHKzagyDi3YNIsKsPWGXIFSjib7Z5UHWLJLevcTYpExDYRL08dBafZEK4
	 U3/oApXPIQaUtNPk1amyJ5jUyoI1Ns53DkOOWhmqmni2jwCP5dKwXn7cOeoRVj1qRj
	 tZgnL8KpgTQmT2ocU8qZpOpXFh/4R1ZxEU5DAW2QwbpnFUie+0z5mF40lZy8ZlJ1jx
	 ZacE9AXRvaDowfRwJA/Yfp1fq+K7hwwpnHyZ313WE4wbJX1QvAS8Wapr5hI6CvP/VU
	 1sHWjAmrSAJCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77434391B059;
	Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179487180503.238365.3162953495840081408.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:30:05 +0000
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
In-Reply-To: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 10:54:27 +0100 you wrote:
> stmmac_set_time() initializes the PTP clock through
> stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> takes est_lock nor disables and re-bases EST around the step, unlike
> stmmac_adjust_time(), which performs TSUPDT through
> stmmac_adjust_systime() under est_lock.
> 
> Both operations change the PHC system time, so both invalidate the
> absolute EST base time.  With settime64, a concurrent
> tc_taprio_configure() can read the pre-step clock through gettimex64()
> and program EST with a base time that is already stale once TSINIT
> lands.  Separately, a taprio offload installed before the clock_settime()
> is never re-based and keeps running with its old base time until taprio
> is reconfigured.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: re-base EST after PTP settime64
    https://git.kernel.org/netdev/net/c/4cad287cb13c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




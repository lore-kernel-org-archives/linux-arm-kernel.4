Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F6606DA92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mR5Widnz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUAEMr8b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9vkjXGj8E1tCNlK6OgtPkP9eLc/ViU7DdLFLKuqN8to=; b=mR5WidnzIulYS+
	cr2heauL1kOdH+5Prjnbx4HH8n3fSy1O2kvWI/7Qs1h9hUcyl59VPibmKQ/KjLmZ6XIZ6PSs+wkAT
	gIvn6skDsAt8jstZUL53elk2yjd4N4J+M7vlGwCE/P0YZTw/pKhNHQVXf5FxxZdfQ6N6IaT9SaZK/
	A8N26vXO4uvI/oOgtep8uASjMKEkn3TYIv6KJ3jNhYsZYZbAsQcxkk2LdDeOoBtyg1JfW3oM83XdD
	d7kxWZ7ZSNASak8wnaKuP45uL5i9eQQ5Bj5+AmQP1Ban+l2GIWje3yE8+o759BytQV3GweBYh3ptn
	e77JnOhHoN+8Qgnumgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc16-00000002DGt-0bod;
	Tue, 10 Nov 2026 02:55:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc0v-00000002DFG-2Ea7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:55:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CA0D4607D;
	Tue, 10 Nov 2026 02:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFAF1F008A1;
	Tue, 10 Nov 2026 02:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279313;
	bh=9vkjXGj8E1tCNlK6OgtPkP9eLc/ViU7DdLFLKuqN8to=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cUAEMr8b64rh70D72PomBwr2MzTeqij9ATCHIUOQjtCMakmsEPqsJM0WwmXG4SyhW
	 76okAytmrvxTZ5H1/sbDr2i+KgoJyCHoamNjilRivfJt+RbbBvdIS8jff+2e/vF6S0
	 +BJw2XZavkKKfC6zTcMWq2iUGAbN57m1untgackBKVzNugZQUMhQqUZb9S0ShLF8LX
	 k88qaIGyJsyj1lYsO0CKNzGFukK8ZV6oEwkysiNx15pnWDCyHAaaKOyu6a8Ns6xpBm
	 dtFG21iX4HH4rHatekH06i19kwG1/UHR2HqMPpd8xj705XJCGIv3qpjfXyPw8gUX/A
	 Abj5vR7+p+4KQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 21110391AFCB;
	Tue, 10 Nov 2026 02:55:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: keep est_lock across PTP clock
 adjustment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179427931167.3612825.9963746260177679514.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 02:55:11 +0000
References: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
In-Reply-To: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 02 Nov 2026 18:37:56 +0100 you wrote:
> stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
> and then reacquires the lock to reprogram EST using a base time computed
> from the new clock value.
> 
> That leaves a window where a concurrent tc_taprio_configure() can program
> EST enabled with a base time derived from the pre-step clock.  The gate
> schedule then runs across the PTP step with a stale base time until
> stmmac_adjust_time() reprograms it.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: keep est_lock across PTP clock adjustment
    https://git.kernel.org/netdev/net-next/c/b0816917a4f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




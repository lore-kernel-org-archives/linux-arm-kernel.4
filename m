Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF28606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t287SUP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPkH2Y0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9jVPwgFepzrO5B1dhh6/eEaFVKQZKqWzI0TGHjI56c=; b=0t287SUPjj+/iW
	YkModt/hmZb5ZAw3f/70PWs6pggvtfrSFXwJFrggpLjfiTMiaZkXDUlDKPODsfGKHmQnt0J/BNqlC
	xucgrPvScxUkpNTw2K2OkoL5Xyd4wxXKSnt6gv1tEoYwcU1OFs+of6sh5oxWjV9ErrPN9HUZAfGK6
	3ZAItzIwZPFLlkoaj0yMR11DgjBoos2xU3kCG+hMZ0b0SDHR7Knh6F0R6bAJMSWULZ7YzranFreTS
	jiAsWlOEEUSDRw80ZwO70w7HF2L2ZfjANq9MQdlHjyfot4cfnZyjrIyL365RbQXwf3mdQtsSYKtDb
	8oTrA7bFmcUASw4rtkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rl-0000000HRkT-203q;
	Fri, 27 Nov 2026 18:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rO-0000000HRZ8-36Ng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30952620D4;
	Fri, 27 Nov 2026 18:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3741F02EC2;
	Fri, 27 Nov 2026 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804789;
	bh=S9jVPwgFepzrO5B1dhh6/eEaFVKQZKqWzI0TGHjI56c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPkH2Y0ihg4rmhOwGPiPiT8Djr/sMYUEUqWdi0JlboxWoigSrpXpGPeSy45CfC8S6
	 qkXifzbA8Km9ye9b+wm7zTuCqR3JlcftWEnHRCp+jYpR/KbA2aA/D4SXpv3mqo8PI9
	 MruzK7otx+SCqlByzZ25/JHFgqUfVjgbFBXll2zrL1lW7gZAtgdIm1tqIBVst1gm4h
	 7X/zpAccLeOYJdBmP9X8YqCNvmEWkeCW7/YMJcfjgYLgjIlscHTUit3vLiN3+69Wfw
	 K/yOHbngcAMs5YXhdZt/bsywmYZCeySE4c8NO6CDkv4q8pess73x3n3wkLWefS16K2
	 mFOJ+kKTmuZIQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: [PATCH v3 0/8] arm64: arch_timer: Improve errata handling
Date: Fri, 27 Nov 2026 18:39:16 +0000
Message-ID: <179579367840.1286378.13094933579176079407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 02 Aug 2026 17:53:19 +0100, Marc Zyngier wrote:
> This is the third version of this series addressing a couple of
> embarrassing bugs in the prolific arm64 timer errata handling
> department. See below for the changes since v2.
> 
> Time is hard. Timers are harder. As a consequence, we have plenty of
> broken counter/timer implementations in the wild, and an
> infrastructure to deal with them.
> 
> [...]

Applied PMU fix to arm64 (for-next/perf), thanks!

[1/8] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
      https://git.kernel.org/arm64/c/71c11e8be95d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


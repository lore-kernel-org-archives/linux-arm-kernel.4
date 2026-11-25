Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3938606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UolvZWEL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcuxFppJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qj4x1lyEyj7Jumg5qZ4XSpZg2qWinCAOR8115B3hQs4=; b=UolvZWELvQiK3+gaiKKH8+6zH2
	ah8J++KHJ6dQv9DEdvYsNAW79TRy96ayiOnlnHb4yP4p93aipceIpMl4SB/j+ez+R9GkjguknmWUq
	jKB3g5CHr50OWjlWPgSxFxtV8lN8bdq1rUSKRniB4qkHUAdmdAbPvGRsc6i1ln3tlH4BJKlE9+0WP
	B92CwWq/DoAZemdtwzak9PhfdaWpMrL775B2aL3loCxg880okYA1G/tQN7HXiL2n5c+3H+HW395vc
	80Zjx94XRfSRZjxoNFbiLYgzZOHecHfyVbgfdGNPdPp4uZ7BcQVBCV5CSgUKXx/KhTPgzf5nvdB99
	R4GgQV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSi-0000000BZ80-0GoD;
	Wed, 25 Nov 2026 23:31:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSd-0000000BZ2z-3Yoe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 447624033A;
	Wed, 25 Nov 2026 23:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092361F000C0;
	Wed, 25 Nov 2026 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795649495;
	bh=Qj4x1lyEyj7Jumg5qZ4XSpZg2qWinCAOR8115B3hQs4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kcuxFppJ1c3gQ4ZZBXRsozye25l0hGpu+svUvyBJmMYkX3I9nGqrqTL4eGRw8on4p
	 a5noIIoWasEbPAQR+TkUxrxnHLXKtx81vBWmgK8CAnWfA2yUwT4Ec7rGFZ2+bOJF5N
	 ek0PU0F6a0gNudXBXzj66+II4Btsbifh8uRCT7HpIrRAZK7KqWDudpc1tDJolU/CfI
	 bOgjv1b7luyk5i+tPbSEwIJym2O9nMqD4Xy4k4STnDIFyeasATRgFc/tGkZ+Y+45Xq
	 3NrvJjv89HDckFxN7oRmdCXwjO5rs2gc/8BnigKqCkdUYtHwGPpXznXqXluUKwU2Rs
	 iD7z5ejEFnIxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BD3809A29;
	Wed, 25 Nov 2026 23:31:34 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
References: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <53b178d5-27b2-4718-8630-16f83a736227@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-7.4
X-PR-Tracked-Commit-Id: 30275e284469c6f8bb2e1bf7a666b065a81b46c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
Message-Id: <179564949376.1391833.10675768396938450994.pr-tracker-bot@kernel.org>
Date: Wed, 25 Nov 2026 23:31:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Wed, 25 Nov 2026 11:40:08 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebb7a8dc1e74c705daffe11c2faf38ec2628f838

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


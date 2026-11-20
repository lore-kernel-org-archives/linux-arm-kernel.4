Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzhKw86l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrYGeKSS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O3z/YjNRpS5G8mbWaqpg0u1Kze4tP3LKxONUNxMarIE=; b=WzhKw86lvK9wIJB/B9Nvf7ROId
	mC4PspM22bHL/h8z367N2zxOFbj89o46J7mW1Wc7FeOJ0HSc1I6ycOdIPzhyf7yeY4PMl9Fu5JrNw
	9r5465j9kFbA5evhn+jKQ6WflxzU4C6NflD+6o5fq/osNQCHdedYgu9dTt5438l2k6g5gexJuWKG7
	kRlLr+UXN5OIX3CW1jhXU/pvhjcnIIcER2xIDMmT1/2zHS7nqkBsr4GFKf6xMkYcPXEThqyiAGRQ7
	+cCri6N0hzuvPloeLmDaBx9QauHlSBbptWcXG2zwmn6AYyPAMQbY86O6hsz0DJgwGjHaKx1t0uuct
	g4a44Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURov-0000000Fatc-3sWZ;
	Fri, 20 Nov 2026 16:50:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURoo-0000000Farc-1uK1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:50:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BD8A62343;
	Fri, 20 Nov 2026 16:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D121F000D0;
	Fri, 20 Nov 2026 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193433;
	bh=O3z/YjNRpS5G8mbWaqpg0u1Kze4tP3LKxONUNxMarIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=KrYGeKSSQantiK69vhzz1FHjutGUcYszeC1SCkSTXxvDJs0FNp3pninW7zhb27SZI
	 rbHHOTn+CIiSP4anzXQYLRrIXHNM7PrxlcgQ5Amxihdnhub6dIInRmU9Ta5U8oiUFI
	 Fs2C6mmHjZfKyroa4kEwYByG4fqc+z5chhLA5YvOEtDsTOmSHJlOhhPlxYxhRhehnf
	 mdcr6ZUbHrgzhWlBDSbizXxnZn6pnYB0QBSf0tsVspjUAswZvdB75RGidn32XOliAE
	 mhSi4pK27uHt1iHBW9hCisfcxp7qQc/b70wAUWUMWo4ozrZP7My7gRcqjZEYKrpJ+J
	 8lZniAVc8xFZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F420B3809A88;
	Fri, 20 Nov 2026 16:50:32 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awAkCf3K4x8CtoKf@arm.com>
References: <awAkCf3K4x8CtoKf@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <awAkCf3K4x8CtoKf@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: a041bdbe1f3a8efa8a527a89c84d3771232b4942
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0f871bfb831705d9f55479f5b2b40f636ea7b16
Message-Id: <179519343151.239574.13635395153686926411.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 16:50:31 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
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

The pull request you sent on Fri, 20 Nov 2026 10:42:17 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0f871bfb831705d9f55479f5b2b40f636ea7b16

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


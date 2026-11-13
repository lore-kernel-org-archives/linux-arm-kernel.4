Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5M6xKUN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBuuaWh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jFj0VLgjgN2A/4dBU4nmmeXTXZ1XJNsGKVLOTIazsgw=; b=h5M6xKUNmei+rG/x14X2+XsgyB
	LkKIs23H+bYITAE5xcaVpyyyJetIOmGRjtmE5w/W5eY4mtfYhV07iY56j7RzOulLXmGyiZyjPOmVM
	pBkePes00FKSRClzSzgu3fRo6a4feY/9unBcVpAMfHLYYaXFYPdnGP2hm5xPsN4pEl82pTIR3d6jJ
	4vjddcpPr9t5DUiJBgM2ea0/022FyBvAywhn+F5GEVUANNgMWfH8fuQshOXpInqjmiKJGKfR9o7KQ
	Bk9tfp8gl7cIkOK60771x9yOzmB8NHTGvcJ/1ce2t2mxKu9NiNqrOzbMLgovvn64jsJ3hASHM7eja
	E9Gn+1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzND-0000000EeTv-2tYR;
	Fri, 13 Nov 2026 22:03:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzNB-0000000EeTY-3YXc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 22:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2564F40D58;
	Fri, 13 Nov 2026 22:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0865D1F000C4;
	Fri, 13 Nov 2026 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794607433;
	bh=jFj0VLgjgN2A/4dBU4nmmeXTXZ1XJNsGKVLOTIazsgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WBuuaWh75WI2O1PBsZM/Ux0tyeqbDWespwZ+IOUytWa65um/27l/IOneiStPewhtW
	 dBoL5EXOE9EL1ihyCV2W8oVCCBufZ9ZtlT2kRLgUgnovRAEzoaQ+e8baT6vZNpppI2
	 IHkSQbKuhWnbZRUP5UxWZnjLMB9sYuhUQt5GrsowmnMmaBRDGNkIoBhsvO1vjquBF8
	 C1VWSPui+8g/lsYbzpvlMY3zkhWYStJ4WtTZf5LnLbW7HeSKCvJ17V603n0FhQ3MHH
	 K2rEqcaaRiSc2dlgGhnczvrR/SPAIpUIxSnPwTnPnZtuvykzkEJ36mECwAlR0AvFjK
	 1J+IkgIOX4myQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16D0380821F;
	Fri, 13 Nov 2026 22:03:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261113185244.3798402-1-catalin.marinas@arm.com>
References: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261113185244.3798402-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: ad3fc05c7e65009355effeea06aa629a687acef2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97d73c8251226cf27cc6656b4c542869bb8c69fa
Message-Id: <179460743154.1865235.10495301897269785737.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2026 22:03:51 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 13 Nov 2026 18:52:41 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97d73c8251226cf27cc6656b4c542869bb8c69fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


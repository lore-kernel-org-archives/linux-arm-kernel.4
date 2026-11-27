Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GzMSde3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzoxtWJA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gy/r35+5JEtOtSHxIpzplhZdK/32CUJxIe81/3GxOy8=; b=2GzMSde3TGtUoQoizdG5L2jflt
	lcSE68oUhZPFFZq6sLSsJ2KNSjNS7GYbjDgOr74SN9ERmWXu/yY3V7tjZGGrULG87orm+Rx/E9BLr
	uH7JE/eMvIZSzWD6rkxtZCf69fIE3JZ3MQjv+lsEgEMq8K1w3qj8ZKu8EbQnjtW4l3aTSmbZ8tvtn
	KT/1dnWQL8EcVRIe/KjaQ++wwUp+mbqnah4cvUqSbThUM6bZgkuD4OxXi77kajmTT8pGvc057M9D4
	zr/qcjE13qWshvPbYYZEZ107Uv457cw6jFfnvaGr9Zbxjps4smDF1a1wxRNeGExRnUeYqKUBDHbMx
	sYuKx0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Qg-0000000HNa7-2M8b;
	Fri, 27 Nov 2026 18:12:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Qf-0000000HNZz-3VcQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39E5F40980;
	Fri, 27 Nov 2026 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B785B1F000C1;
	Fri, 27 Nov 2026 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803132;
	bh=Gy/r35+5JEtOtSHxIpzplhZdK/32CUJxIe81/3GxOy8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QzoxtWJAQqU6sp1dcNoVnq4QhKj78g3moCbvKrAZJNoCRzyhlNkDmwvGO7v2GIfwf
	 g3lizhljOESyUI0rW9EAMxcqoDbcX286GwjN9gaKjxcOTvRXc0K4ngWi5F3ZX/t9lp
	 +UHne3go9xcVjrIsyxAvwewtisuqeuQ5u9ScskLOrcTsE3wIyky2ejIzxsGlpqknBI
	 DQf9M4nfFElaFlV3AB0Lhmq/dYbQKIw/0q1wFk6OogO0v5PXjBnl2oKTalHa+LalcE
	 pGX6Gi8Ewrr+3tRSwqm4oOedkSde9ITn18+vtpHs6XFxtoESz+Nl/E1SUODN06nTal
	 cHBPsihlmE+lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE906392704F;
	Fri, 27 Nov 2026 18:12:12 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <awm_2b5a-TzetyOj@arm.com>
References: <awm_2b5a-TzetyOj@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <awm_2b5a-TzetyOj@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 18817028301de963a3a25f6d7d652d1d3b79f570
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 822ba3a89c7896b26e4beb70e2ebffb881924dfe
Message-Id: <179580313150.1619291.17779977413302110781.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 18:12:11 +0000
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

The pull request you sent on Fri, 27 Nov 2026 17:37:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/822ba3a89c7896b26e4beb70e2ebffb881924dfe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


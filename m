Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E0F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUtr9rBU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJKOOBUC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oiz7UPOUvMRqWSpS0TxVagOV6ysYEy5Uin7A9yXyBy0=; b=DUtr9rBUUN4QxSmyZfDeyClGMC
	5URtTiutB23iF3ouUH7/fkPVq/geeKLm+dJCPY1DFu9JroA+ddmfo1w5LIl23Dv9BEIan7RhjOMiY
	5aj4gI6DjVTxfslBqv6+waToO7YopotpnBQYRuduWETaIXNOjY82bzvFVLGRAr+F3T84q22HdIARN
	htbd9D9qehmRigjAUZ4M+VwQYiU6CFSFM3fdwVO2pUR7UG5ncTmqtJSwTTdA5MKvHJ9TWNrMI4lvZ
	8Q1gqQJEo71uO2d2wdsR/XW8SkEOdqxapsfovnSUMipW0m3QD6LfGHT/puC3sZ2AGi+vKCrxgKo+8
	GSECGYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRms-0000000Djjc-33PH;
	Fri, 06 Nov 2026 21:47:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRmr-0000000DjjT-2ZNX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C353F43DF8;
	Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BE71F008A1;
	Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001672;
	bh=oiz7UPOUvMRqWSpS0TxVagOV6ysYEy5Uin7A9yXyBy0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FJKOOBUCTjMp8e3xy+3HBZp888Zat9vze3Ttvu+0emXwb41MgA5+F1rgK2CG95QSI
	 xfLujSAGgnE4ZCcZU7gPYWyNDf5EJp4cPVP3h+vVm4JtpdBEI/Jr41EGbnpLTEzW/4
	 t9+mlA6fvNIg5gF1ngE/yyC3fKe7JG77lsixfCVVPn6TeYCwsUCMVuSrdIDgTsf6CV
	 RdOcRBNu43TyMZ+rkj4KHnryCEAiQcz5QCXdG8k5uZYTfyEti3npItZMc2XvIyuEHO
	 n61QGkaao40gkXHsW4N8PLNNBpdyf9eHfgzc7jGIBX3xCMYMtLVu+fjKvPC3R7kw8P
	 63V+YX/IAgOpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B1E83A549B8;
	Fri,  6 Nov 2026 21:47:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <au4yDc-l14h7hwMI@arm.com>
References: <au4yDc-l14h7hwMI@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <au4yDc-l14h7hwMI@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 58c1eb84e97701c583605ba2fd553b69afba2245
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d48723711bae9b8cdc56719c448ba42fef28cbee
Message-Id: <179400167130.891032.9381456460991019522.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 21:47:51 +0000
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

The pull request you sent on Fri, 6 Nov 2026 20:01:17 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d48723711bae9b8cdc56719c448ba42fef28cbee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


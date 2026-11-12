Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ciSfeK6/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dr7lfaXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TDilRXmeoxSYY8jkfX8dDP7Escz54QuAh7M2Ulo9+Cs=; b=ciSfeK6/BDbVnX
	V8A55i8IIKKvwOL+6tw+9TR/DwVprR6aPja0l3Q4z2qAm0XeTvIItqfQyNs2uR3oRgEeF9odMFhXv
	qaX3YXzGvoQct/UlB03vL3nz2xohxcpZ0J9PaLPnOIHE2n/pMLRnpDGGz1/HmFebfx9OTqmI/NON5
	EDMYNs49zGmbWdBpt7R8s/0nU/bsje0wAbNu5psj5uhURjZetNq5wpS9ih/P4BHu7qOuTFPCCIPg8
	EyQjBt2yHeSm20O26VPk88su4f30fJdavswX6tTwmHIooG/WKFRKunaWTW/QxtRnn6Y7ALE6K71a1
	FbppVrzuECpUowdbcUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfy-00000009cir-102D;
	Thu, 12 Nov 2026 11:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfP-00000009cc0-3lS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:08:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id BD83645EC7;
	Thu, 12 Nov 2026 11:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 26B1D1F00A05;
	Thu, 12 Nov 2026 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481710;
	bh=TDilRXmeoxSYY8jkfX8dDP7Escz54QuAh7M2Ulo9+Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dr7lfaXeRCNPoJ94w6Skhx/lyd5atzlFhP1aiBAmmZABVuwE9Sk9p1dZ9OQGqRWqf
	 PMUmiShRp81N9U1hz2nygO3HkGjoyK7IiattZX20nMVxSrNoeGQcaWW+XH1Y+t/dzJ
	 KWJlnmCziTgbV63d2FGFkXHWo44m9HCPS3tlGOYwaIXkppDCoSCwpno5pmRvY+MbOr
	 a35G0/0Y+Hq1Zm4tY7xOhIaicb0PkctrLPPpm9C5RixYgr0zX/7upQodCiMA3apNTa
	 H8IM2b1pDp5rHBv/m2fGjjeWtmrSE0SkveOaRXrhoe5aP206Z5XztDhRqdiqRcnlqe
	 50GhF+Ef5jPAg==
From: Nicolas Schier <nsc@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to test-kprobes-arm.ko
Date: Thu, 12 Nov 2026 12:08:23 +0100
Message-ID: <179448168647.2348885.1879119670707585702.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
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

On Mon, 09 Nov 2026 01:46:42 -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> 
>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] ARM: kprobes: Rename test-kprobes.ko to test-kprobes-arm.ko
      https://git.kernel.org/kbuild/c/73d83cea

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas



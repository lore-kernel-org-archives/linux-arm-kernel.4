Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CD60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2bVQsO/s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdN7/wBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yC0aXwOTd+FhK1Q6mDWG08cia12ERl2ciqVd/c7hjyk=; b=2bVQsO/sjrkVxL
	NNTbYraW4QmQygX/WLs69KAXMvE9G+lrWLICwcpdk+JqavEEdvFQkBIqnqOcf2YIL4c4Bf3VDsfmW
	X1DAeuseCj5TAdjmH3LcW3BdWRzYr2Ot7H7qAahysCSyy7NnKkBnDUe4utJUovpPAejON9c5lXNGH
	z8Ym5TcKnPfwyGwvzEelt16Q5dsaS8vOoVDfkieAGOauwrbB1oUC7yBlqvv+oBplCPBSSAYmFF9ka
	/so+up1oMc2oIDJ6Em0TQV2HoZ2WncY4YsiFi3+o667Q6LBfo44mWpvRxj5Ac81+rolPHLdjlKtQt
	mHuliClLc9C3VqKYSucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rD-0000000HRSo-2VH1;
	Fri, 27 Nov 2026 18:39:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0r4-0000000HRQt-40mQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68B98618FF;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A6C1F00919;
	Fri, 27 Nov 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804770;
	bh=yC0aXwOTd+FhK1Q6mDWG08cia12ERl2ciqVd/c7hjyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bdN7/wBzcDrucfd7TsOuPsTvOHjlUs5ykqoshVl9HDOnPlac6QixoLQ65tO89fkA5
	 xFkBQ5l6VC31RqxHWSneCg5eA1jWXUTVQ0PHfwTlPOmCQYoqbJK+RqK6BBWcwEsqN2
	 Ro3nV5sEAGdxeETvJuRxAXZOY7tALzjdOgaIQ/Ti1wP8KuX8TMPTFzQ5AAWxBVw3M5
	 PA3+eOuhCiaJhmAjkXzlVjrKr1lcyrmKeK9K4J//2+97CPYwWixd1HrdeY8kvcePJl
	 u3xcGcu83/uxRkKqnTDpTQIc/7AxNVvLxMENUbkenNXSn+Ty79EaBoci4JFUXoT2fY
	 ItQ/Ss5ees2Zw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 0/2] kselftest/arm64: vec-syscfg exit status and VL inheritance coverage
Date: Fri, 27 Nov 2026 18:39:09 +0000
Message-ID: <179579943738.1439845.14609418363972418388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
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

On Sat, 17 Oct 2026 12:24:52 -0600, Abdalla Eldoumani wrote:
> Two small changes to the vector length configuration test.
> 
> The first makes vec-syscfg report failures through its exit status. It
> currently always exits 0, so a kernel that fails its checks still shows
> as passing in the kselftest runner.
> 
> The second implements the "Test PR_SVE_VL_INHERIT after a double fork"
> item from the fp TODO list by also checking the VL in a grandchild, two
> fork() and exec() generations down.
> 
> [...]

Applied first patch to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Report test failures in vec-syscfg's exit status
      https://git.kernel.org/arm64/c/e5c438c92dff

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


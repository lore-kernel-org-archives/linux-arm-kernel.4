Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D6606B567
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=my25BV9z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0/fkeri
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wOHj1d0LLsR4NEXioV3U1dxoAjIfm4PZ/x3fQDWazaA=; b=my25BV9zlk4FCiNHOyRdLHBqU7
	UOtwDA+ttLbpcfTUxP5Wn3wVQuhIWA7PjmL/40OcBj01dt5dKebWZOOzl0U0p0elMe9Sp13yZqwXq
	NfBgxavFuTs0gLeTduJ3sD18K/+nKK1NPsJBa7uPYdCBkxrT7Q7J8hZl2ejdFczIpLvTSbthaVznH
	wLU3B6F5AqHY7a7l8bDBBAy8FKOwxIzz8rlI8oR4aZXKuwl79nWm9MBZUGO/PtJgN+VcaOEtNFF5P
	VPOjsuu8xpTpB5MT5aDet3iSzN63VuuGTtdAhPw5O/pg/ygAyJT7zFGOWCvbMTlhJp+NwanKvDjjp
	oByI5+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxNv-0000000EJ9a-0W9S;
	Fri, 13 Nov 2026 19:56:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxNt-0000000EJ8Y-27dk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:56:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 923DB63463;
	Fri, 13 Nov 2026 19:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA91F000C4;
	Fri, 13 Nov 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794599788;
	bh=wOHj1d0LLsR4NEXioV3U1dxoAjIfm4PZ/x3fQDWazaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d0/fkeriZVr4S0U16bHjr9wAHrjQGekFc1etjF922zDxmBP45mK5cT2rhJplps2+J
	 B1Wk3Uy0J+DoRvzwpKZ9D/enebWIyqxC8DqqHR/8rCB+LCLxjRnhXlldBdaoH+gGwA
	 ugjF1+lvbvUj8pa4UNuwthS59HFo+CVD55OjRKfWdXDEzSYg2y5amNhp9GpddPK4UA
	 1HdI963jNwx7BHhP4LqN7aebUd45OMGNPo99VFkSR4E9ghG+lMLdgqDEWNeZg4D8ob
	 g1nQtI/Pc6YMpEbVc69l/fURbgFg51KzcrR2NtOnDE8avclEZ8G5aXm+9fl62u9nVm
	 bKwb98g30Bd2A==
Date: Fri, 13 Nov 2026 14:56:25 -0500
From: Brian Masney <masneyb@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: samsung: fixes for v7.4
Message-ID: <avdraUOapLKvCUTS@x1g10>
References: <20261113071818.14923-2-krzk@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113071818.14923-2-krzk@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 08:18:18AM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.4
> 
> for you to fetch changes up to 5fbe2d229bd3738ed63c7c9177466ad6bc130f18:
> 
>   clk: samsung: exynos5-subcmu: Defer probe until power domains are available (2026-11-02 13:24:59 +0100)
> 
> ----------------------------------------------------------------
> Samsung clock drivers fixes for v7.4
> 
> 1. Properly handle deferred probe of the Exynos AudioSubsystem clock
>    controller.
> 2. Fix integration of clock controller and power domains on Exynos5250
>    and Exynos5420: be sure device runtime resumed before proceeding with
>    probe and defer probe till the power domain is available.
> 
> ----------------------------------------------------------------
> Marek Szyprowski (3):
>       clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
>       clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
>       clk: samsung: exynos5-subcmu: Defer probe until power domains are available
> 
>  drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++++++++---------
>  drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++++++++----
>  2 files changed, 47 insertions(+), 13 deletions(-)

Merged into clk-fixes

Brian


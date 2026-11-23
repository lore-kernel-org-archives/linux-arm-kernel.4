Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LOkCKde9;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KaLHmeY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KAB2BKt918TC8J1Io05dleoIknVU5q1NI2MsEwZVMss=; b=LOkCKde9r4LO1h
	GpM9/sS3A0Ue6XFkRfTpX/oqpJ6Qi1YFLpqNqullPPhtSUJ983deHRW1KzyNJZf2TZel/BqKJYzV2
	B+0oAWuM50oXbvEVhDM6furmWq/n2TC3HfcBbWHt6VwlCsghJKiiJTGqmR/1+8nLIpkZE2Rs93AW2
	bv/leHfXTfFov6XlDuPtyn0/o6wd0/VVE+ZQmHRdXQflsa1Wpb0R5uXYVmTMOAuX4I8xVsv/WVP0V
	XAxcJIwM8lU1dgfoecJCWxojXuwDBLd39NTvQiCiOX+5ejaETrA8eUVsvPyFdEGKAlFKWGhZkgmr1
	pj2GCz5bTXrOaApu+ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYEu-00000004RB3-311O;
	Mon, 23 Nov 2026 17:54:04 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYEr-00000004R9F-0jpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:54:03 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261123175357euoutp02d321b0afcc2590ba381801c39dc5c573~qvh4KUwxu0652506525euoutp02L
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:53:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261123175357euoutp02d321b0afcc2590ba381801c39dc5c573~qvh4KUwxu0652506525euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795456437;
	bh=KAB2BKt918TC8J1Io05dleoIknVU5q1NI2MsEwZVMss=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KaLHmeY/H5/6luOM3bVkacedBNGp4qFGJ/QLKxD9En+nFjUF5oST4IhTspYpfAUoo
	 +Js8gOjXitDE24uNSHz9PV3JDQ/OWZ/IuT4sobCQh9OVCo221IgqmSuvS3sjQIjjTm
	 WzSNQ4plLTKCpO1lLKZF+smGvCmLACEWFffNiNnw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261123175357eucas1p2cc191475e27a19aa757b67113f059dff~qvh3zUySr2536125361eucas1p2Y;
	Mon, 23 Nov 2026 17:53:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261123175356eusmtip2b9af5e8e9756c7efec6eca2def375a43~qvh2tRfpt1373213732eusmtip2Q;
	Mon, 23 Nov 2026 17:53:56 +0000 (GMT)
Message-ID: <d0bf2242-d9ad-4a7e-a1cb-ef32e50f34f9@samsung.com>
Date: Mon, 23 Nov 2026 18:53:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain
 attach
To: y-asai.0816@docomonet.jp, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261123175357eucas1p2cc191475e27a19aa757b67113f059dff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261123141844eucas1p221c650882789ccab239e57ee458c02a1
X-EPHeader: CA
X-CMS-RootMailID: 20261123141844eucas1p221c650882789ccab239e57ee458c02a1
References: <CGME20261123141844eucas1p221c650882789ccab239e57ee458c02a1@eucas1p2.samsung.com>
	<20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_095401_650300_09DE9BD5 
X-CRM114-Status: GOOD (  23.87  )
X-Spam-Score: -2.8 (--)
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

On 23.11.2026 15:18, Shigeaki Asai via B4 Relay wrote:
> Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
> platform driver"), the exynos-pd platform driver registers the power
> domains too late for exynos5-subcmu, so the sub-CMUs are not attached to
> them and their clock setup is not restored. On ODROID-XU4 this drops the
> GPU performance badly (about 3.5 fps in the Kodi menu, with repeated
> panfrost "gpu sched timeout").
>
> This series fixes it as follows:
> - Make the exynos5-clock probe wait until the power domains are
>   registered, so the sub-CMUs are attached to them.
> - Also make audss wait for pll_in. As a side effect of making the
>   sub-CMUs wait, audss would otherwise probe before pll_in exists and
>   generate audio from the 24 MHz pll_ref, which causes audio stuttering.
>
> However, this relies on deferred probe, which conflicts with the move 
> towards platform_driver_probe(), and the sub-CMU clock data is
> __initconst, so the deferred probe has to finish before init memory is
> freed. So I would like to discuss the preferred way to fix it.
>
> This may also explain the oopses seen in the RFC series "clk: samsung:
> Use platform_driver_probe() to avoid __refdata". Krzysztof saw them
> when converting exynos5-subcmu, and Stephen pointed out that
> platform_driver_probe() is incompatible with deferred probe. The
> sub-CMUs have to wait for their power domains, so exynos5-subcmu
> probably cannot use platform_driver_probe() as long as exynos-pd is a
> regular platform driver.
> https://lore.kernel.org/all/20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org/
>
> Testing:
> - Tested on ODROID-XU4 with a Linux 7.3 based LibreELEC kernel:
>   every power domain now has an exynos5-subcmu device attached in
>   pm_genpd_summary, the Kodi menu went from about 3.5 fps to 25-30 fps,
>   "gpu sched timeout" went from 17 to 0, and there is no audio
>   stuttering.
> - On next/clk, only build-tested (exynos_defconfig, W=1) and checked
>   with checkpatch. I have not booted next/clk on the hardware.
> - These patches are already carried in LibreELEC.
>
> I investigated the root cause and wrote these patches and the commit
> messages with the help of Claude (claude-opus-5-5). I reviewed the
> changes and tested them on the hardware as described above.

https://lore.kernel.org/all/20261030075325.517182-1-m.szyprowski@samsung.com/

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5fbe2d229bd3738ed63c7c9177466ad6bc130f18

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



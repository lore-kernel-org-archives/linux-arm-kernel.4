Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411860A381C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFR+gwej;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPw1udGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rt6jiCTme7Bu2nT6G9JfCElWruKPjrStlWbVNDTGPVs=; b=CFR+gwejIRIw1c
	5tccPSZPeISqxUXGu3JvYswDYb203iSf0tmava7NH6SaHYhyl/pW66gUl8fjy0WiBOt8G3TKsb/fT
	UTevBXV73TYF8JBaKigZe/5hfMW0VukZrO8wMbQPSxpyZK/GR2I3RK96h8kzT9Uzs4lVvzzNNUOmY
	DeE3d9LkweNEcxTUDY09AxQniaSCyaM0TqjpUmE+QwPi+uDIxnpfUw13T7Hr88W062DCEZhQsafAj
	jk7ctHcFkyk5pZmvLjmH8muoJ86TAKWyIlxlq92esoMNbShIuxFbEXNX4gSHYHVCc5Dg6fDa4xHN3
	2WS+1iF9pwqOi5377lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0r4-0000000HRQj-274f;
	Fri, 27 Nov 2026 18:39:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0r2-0000000HRQW-1tnF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A05FE61499;
	Fri, 27 Nov 2026 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D481F00899;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804767;
	bh=Rt6jiCTme7Bu2nT6G9JfCElWruKPjrStlWbVNDTGPVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mPw1udGByHOkvYuKQAQ87MgyOrR7sxpDEx3MmpSWzNP09dJ6oT/srKGMAtdkGFONa
	 aaot8wwukbYvGSj33IGSjnfmuoCnwM7t3wRDBxPT0y3gKx9b8B9dtEMgduFDV0Sufp
	 RpMBrACcuraNUJJWYUbIjya0s2ErClv68YiXcchoJFVi5yczjMQbNGrLyEVDsQl72f
	 E7qgDiyh8qBex3aboLodbn1TmMruvjkdtlAyDb/BJYh1lJ1Mw1VbTCgPj6rDY/a7ZI
	 PtI5Q9FU71G7psdaCTxutG+iTdvg41GcxCE39GLPr9z9dkchNirsXVYtHUtON1ntO5
	 HQq4OVu3WZpFA==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	Yingjie Wang <1075151112@qq.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbhushan2@marvell.com,
	gakula@marvell.com,
	gthiagarajan@marvell.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf: marvell: Fix DDR PMU polling period unit
Date: Fri, 27 Nov 2026 18:39:08 +0000
Message-ID: <179580037668.1449191.1672332199405896029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_592E3D2D89322E934E28FE593E67826AAC09@qq.com>
References: <tencent_592E3D2D89322E934E28FE593E67826AAC09@qq.com>
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

On Tue, 27 Oct 2026 11:22:44 +0800, Yingjie Wang wrote:
> The poll_period_sec parameter specifies the overflow polling interval in
> seconds, but cn10k_ddr_pmu_timer_period() multiplies it by USEC_PER_SEC
> before passing it to ms_to_ktime(). This makes the interval 1000 times
> longer than requested: the default of 100 seconds becomes 100,000 seconds.
> 
> The driver relies on polling to handle counter overflows. Delaying those
> checks can leave programmable counters frozen at their maximum value and
> lose events until they are restarted.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf: marvell: Fix DDR PMU polling period unit
      https://git.kernel.org/arm64/c/caee2c799f89

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


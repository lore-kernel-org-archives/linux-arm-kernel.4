Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44952606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GU/gLbqg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzQCQe2K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=; b=GU/gLbqgqatZSIqGDpYlHKYZOX
	CiDAeCgaZuxsalz/tVFn7J3Z5YrrPFLK88CpuT/V0XW2h3XamunQjoQK+YBPhwx5ZZnOeQstAl6gE
	8WCWEaXZO4QjJAQ9r7Zmq7Tw9dsHe5SvDtbJ4EKMfKZeXGGhYJundiD9OqTxrSKQkNZBMq+WGg7Q9
	BUUWtmxuyf9TowHTFx2r/PZtPteJW1Uk5JnspvctEhJGAtCyYzTn0BfLzQ7pQfjfaiBjoRXJ8mxKR
	zXiCXW2jnoknMQYDmM/Oq43mf0fgPW5/pf2BTq/TyUtVlJuQjZXr5wWVgpZxX0YpGitqeTNTja1UC
	fpeLzZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUsL-00000003hfC-2lAr;
	Mon, 23 Nov 2026 14:18:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUsK-00000003heo-1ktr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF305418F3;
	Mon, 23 Nov 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795443511;
	b=nohEL4wH59/hQb78zNVpixLTz88KVIUEkCItcxK+NUT+z528sD41/vJwlyO5ER89OodP
	 iD8LOYsi3e64/GBgyDfshpGR4NCv3YHgLyMVVAG8+01d8oGnRMsrPNjSAk/u4dlVUxFpQ
	 E20XJWtgEgPQjbkoaUX8WLL/aCLXs5tLE/SN1X3TKsR/ntYC3V57oOM3F5gnHHMw5JR4V
	 0uLBJbtZYctvjWbXO0TdP4HgZ9Az1UYASVg+/LDGPllAgbXtFua5/5ittRQbt2TCkZVfj
	 2Uqd3e7KIqukooUW/k6vXgdvXVx+vzw2GAlIsR0BvurtgjX0ZexPtuMOoMVYfZykK3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795443511;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=;
	b=hJ1Of2ZS/4LrORbmx9T4ssokg2+GWtkdi4TXvKyxeRSRaYL8UVpOuDSMANcVmVT32GQC
	 2B1wWEgbLL7BW7w/y7MVi6Vk9FNJc56a53nYdrBrsIR6e24EFMB58WZZ75LPzFWOYgZuO
	 yCOHAczEU0Kw3UQK1KDBAZdSipO8MH8tQAi3fwvw6wVgRDE5wDV31b/UW2jbyC5ooR4Bb
	 5Cymm8FcEWRa/IpxJeqRXFrAysp96nJhqhK7IFh+eU4P3dmzxLlJAUkZqTkd1EJRepA/k
	 CTP53eLlgHldkvMm7CdMaekho/se1o9deSOwF0b53Q1fLn3nsqeyLD9MvOnJ7FhcLxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05DCC1F00A3C;
	Mon, 23 Nov 2026 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443511;
	bh=p038IxcP1LIpPQwiIMGTCY2lVaAX4hwB1WZdznpqdbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kzQCQe2KC6EFuSGrhtQLNA2bqn8lhkd9AK/8GJhC2lJLL5O0pyeZxcYwSGC05k9f+
	 y49BmKI03nf0bqQvwbgvw+q0JHDRMLEmQjJu16bWtKnKwbLwDMHPi0uTF49kRVK73X
	 2pBg0xtkQEMUHdCxB4VXvTB7mbyWCzPL35xgmV0zt3aFMak6FiVT+ct9nUqdKOeFqe
	 8m6US2biNdlPdiyS5PaIEI9ziPQyuqPVH3M7jYt4gFnCKJ8pQiUN79oStxmDEf7uTq
	 0Ijp9bJb4aInyDdqLXuWXUDReOMuMV87ZOcLPpEghIPBEUaN44ADe3Ll7mVlv/3Xp7
	 wpH193M4h/z+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9045A4C4CC;
	Mon, 23 Nov 2026 14:18:25 +0000 (UTC)
From: Shigeaki Asai via B4 Relay <devnull+y-asai.0816.docomonet.jp@kernel.org>
Date: Mon, 23 Nov 2026 23:18:23 +0900
Subject: [PATCH RFC 1/2] clk: samsung: exynos-audss: defer probe until
 pll_in is available
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-exynos5-subcmu-defer-v1-1-43aef47d4f2b@docomonet.jp>
References: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
In-Reply-To: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795443504; l=1456;
 i=y-asai.0816@docomonet.jp; s=20261004; h=from:subject:message-id;
 bh=0WAaBWSTBR/BaFm9s6nACS8IfkOWalo+FbjaB+ytfE0=;
 b=ojdX6lEvfEj1MUJHgjI6r7HyjtQLZpgqI5HQW1eBkBLcHCNLBocqjpoWJlXr0HFqQp4hJI2QZ
 O/BlN2Pwov+CIyNi8aS4+xZmIwXyf2TU4dDIhFaVg2uQoiU88ETYC6S
X-Developer-Key: i=y-asai.0816@docomonet.jp; a=ed25519;
 pk=jkd95ViSn8i/X3oPMHYG1A8mae8IOwOKGE64kzLqC5c=
X-Endpoint-Received: by B4 Relay for y-asai.0816@docomonet.jp/20261004 with
 auth_id=1110
X-Original-From: Shigeaki Asai <y-asai.0816@docomonet.jp>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: y-asai.0816@docomonet.jp
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shigeaki Asai <y-asai.0816@docomonet.jp>

The "pll_in" clock is optional, so a failed devm_clk_get() is silently
ignored and mout_audss is registered with pll_ref as its only parent.

On Exynos5800 (and Exynos5422) "pll_in" is CLK_MAU_EPLL, a gate clock
of the MAU sub-CMU. If the sub-CMU registration is deferred until the
power domains are available, this clock is not registered yet when the
audss clock controller probes. Audio then runs from the 24 MHz pll_ref
and 48 kHz playback is about twice as fast as it should be
("failed to reparent mout_audss to mau_epll: -22").

Defer the probe when "pll_in" returns -EPROBE_DEFER.

This patch was written with the help of Claude (claude-opus-5-5).

Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
 drivers/clk/samsung/clk-exynos-audss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e11ac67819ef..7c06350111ed 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -153,6 +153,9 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 
 	pll_ref = devm_clk_get(dev, "pll_ref");
 	pll_in = devm_clk_get(dev, "pll_in");
+	if (pll_in == ERR_PTR(-EPROBE_DEFER))
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "pll_in clock not ready\n");
 	if (!IS_ERR(pll_ref))
 		mout_audss_p[0] = __clk_get_name(pll_ref);
 	if (!IS_ERR(pll_in)) {

-- 
2.43.0




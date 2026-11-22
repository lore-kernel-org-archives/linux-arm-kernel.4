Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC8606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VM7iO5oQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jtml9c5E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=; b=VM7iO5oQNoRGq/
	Uy0owO1mxgT90ug3wzCMFTP2TyWN/6Bw6ZOIdAcAxmQCxmxV4K38xX+jinUQHmXNMmWL4/Bj6/50H
	T87biZBghHeCoAscGKAM0SntuYnYF+qf7tED21j0d3G9tOzLO2s8EkHyV+fbj1kDRsrUBfCA8zfEy
	ZDxkpCy4Vae4+ZPPwVH4R4W4SPBMZ/vrmlchXkKPUrga0kWNNwvsByem+X1d/ZTiWr041AFOOb4d8
	EL3MHEFasXcXJHjubwnVA+B8IapQXPltltlBRe7uGIDOWBfcqHxgItdXICFsBUhqry/Fh3i8mEsLD
	+xw0stTCMrFwnm/YEjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AY-00000001392-0U8X;
	Sun, 22 Nov 2026 11:55:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AP-0000000137k-3A1h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83C1444F5E;
	Sun, 22 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795348533;
	b=I6QIRkZUPdPyTq3CvVfbcFXogDSwlZusGqmFDXJoDkDlns9bJjgJ/AT5L6GfTqixV2Kb
	 ADGwuuY5Sf5GoRislouDijvai1+bK0ETS6K9x4jTYjjBAWPyVPA2gVd+ZmuSFfy0VCT4C
	 2KLHz0I7uIUWrLrFMSPF3ElbcngkCLX9arXQIi+jDRta5D/pbkrD2ePv0mVM9BGjdjIE/
	 SQGZe3OEwE8+fPxmWA4xRt6AIjhZLDtrC/r1FQrd4UIMjxFFQqnAZDGtu/+jhYxMON1vE
	 mZu5aE6Yk5/Gb+7xV8PTXUSb0xNMpfd5igLi/SSjcuICsIOaKR2+Br1zVZmIv5PigVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795348533;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=;
	b=FfU2I3C1xF4MyuBXHaAdfUnM24vydTjlIjrZdwr/zZhfJIQLjE8CHQdF48qE8o047RCb
	 rhE0EKDD6qLWsh4ykg2iyj9JXSNUe7g1BgCmBcjOFkVXI6FVMoelTTPeAtcJQVuVaSTAE
	 ON4stS7jJjR9SgL8WUKdeWf2g22ggkm7v+bnWFy+RouwTB6t0vljsFZfiHR+wIHB4UnTV
	 Mc3VaNBAKrG6gKRU0nRA+wzVtgAvUdNEvu1CPheiTc8auOXau3+tuUU95O3BAx1uyENeY
	 YhKZf67NZGw+ADxsGEIOoGurlInxEYq1e6qoEwWUg0NE2Us/ciqBaMtrMZ7BCyUxMCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52C161F000D8;
	Sun, 22 Nov 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348533;
	bh=XsPczLgMwqRcGehK0Y36BZv739K0cQRsYfBty9hj0p0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jtml9c5ECFeQ+BGhVAkIvLpEWS6e8lklEYwrT5PTndBPMMOj1eyGSp6xAhDQzHviU
	 umoGE/ME6HaHuqpfv200XsRjY9qzmVOuPJYILLBTIMN9nA2CpwlxqEpeJpQCDKgKgv
	 0DL/TL7Q2xLfxumgQabfmQTbnZh4xr+Cs8fTECGTVVkuaWjqB/q4KU8mNWorhn5GG2
	 zsorp153Mc1r7IcMHsYPZpxdeh2BEb3oH9PCJt72ksbUuenCnPfJg64oARXOrYIukQ
	 ZdXQtXo1+Xzx5UTQK/IJMDhU4YoEJla6YSl7NwO8NJsL/gNDumUZob1uay0d05j938
	 72X1RSVW45o+A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D00A34C01F;
	Sun, 22 Nov 2026 11:55:27 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:55:27 +0000
Subject: [PATCH 2/3] cpufreq: kirkwood: Put clocks on error and in remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, krzk@kernel.org, 
 peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795348526; l=2983;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=skKpKTVz2FV0rjzQ/HU+MrfER9ugcIz07303IiHkuCA=;
 b=0efWSpMpBy+Kwg3RseZTMMzQXoPPCXFeJhXVmatgvsOBKi5JFwCEgzHwH8uKjbTB/HwfBHtQK
 C3De9J/sEVcA4JgERWuHneJbyfb1bPAC2aE2NUFMg2x9KdOHD6yrodU
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

kirkwood_cpufreq_probe() gets three clocks with of_clk_get_by_name():
cpu_clk, ddrclk and powersave. None of them is ever released with
clk_put(). The error paths only disable and unprepare the clocks, and
kirkwood_cpufreq_remove() does the same. So the clock references leak
when probe fails (for example on -EPROBE_DEFER) and on every unbind.

Add the missing clk_put() calls to the error paths and to remove. The
"Unable to prepare" paths now jump to new labels that only put the clock
that failed to enable.

Found with a static analysis tool and checked by hand.

Fixes: 2a4bd9f0db24 ("cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs")
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index 24b285cbeb8d..e85658081c07 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -125,7 +125,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.cpu_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare cpuclk\n");
-		goto out_node;
+		goto out_put_cpu;
 	}
 
 	kirkwood_freq_table[0].frequency = clk_get_rate(priv.cpu_clk) / 1000;
@@ -140,7 +140,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.ddr_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare ddrclk\n");
-		goto out_cpu;
+		goto out_put_ddr;
 	}
 	kirkwood_freq_table[1].frequency = clk_get_rate(priv.ddr_clk) / 1000;
 
@@ -153,7 +153,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 	err = clk_prepare_enable(priv.powersave_clk);
 	if (err) {
 		dev_err(priv.dev, "Unable to prepare powersave clk\n");
-		goto out_ddr;
+		goto out_put_powersave;
 	}
 
 	err = cpufreq_register_driver(&kirkwood_cpufreq_driver);
@@ -167,10 +167,16 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 
 out_powersave:
 	clk_disable_unprepare(priv.powersave_clk);
+out_put_powersave:
+	clk_put(priv.powersave_clk);
 out_ddr:
 	clk_disable_unprepare(priv.ddr_clk);
+out_put_ddr:
+	clk_put(priv.ddr_clk);
 out_cpu:
 	clk_disable_unprepare(priv.cpu_clk);
+out_put_cpu:
+	clk_put(priv.cpu_clk);
 out_node:
 	of_node_put(np);
 
@@ -182,8 +188,11 @@ static void kirkwood_cpufreq_remove(struct platform_device *pdev)
 	cpufreq_unregister_driver(&kirkwood_cpufreq_driver);
 
 	clk_disable_unprepare(priv.powersave_clk);
+	clk_put(priv.powersave_clk);
 	clk_disable_unprepare(priv.ddr_clk);
+	clk_put(priv.ddr_clk);
 	clk_disable_unprepare(priv.cpu_clk);
+	clk_put(priv.cpu_clk);
 }
 
 static struct platform_driver kirkwood_cpufreq_platform_driver = {

-- 
2.34.1




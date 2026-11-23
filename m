Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB13606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VGesHlDD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCpy4COh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VCAHJAZ8lG0qePrCTaZNQY2oEqKkFnjfl6hdH6oURSQ=; b=VGesHlDDX0JFrB
	amSXG4Xuy9rYNZ9+zITUBKNdJPYlwPja8XIbcxErCGGsEARnE8X/BZuS2NcuRPcWYXfeyd0IRAGQp
	sZJ1ddFU4VNsZ59Knm4ImEFegE/++3zvZG7Uld5esLfIr3r8SqkrEfYDG0pbRaFpxuOOETe33ypxL
	fS+m8qitLgf6tm0iesqF9529J81dsgi5YVDZJF0SAGKtffpb5BDoIqaxnInzhI/632oWSXhvm+FM/
	hCcxo/xMimNRM0bCe0fZLvlvf2lRUEvsfXtjUlImmXlUO7+iQNtnJm6z/cYRZua01phJo5PgCqRTV
	z605jVw7fdGWxwYx+XFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUf-00000002IT7-3X7D;
	Mon, 23 Nov 2026 05:21:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUd-00000002ISD-3efG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:21:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4895042DA8;
	Mon, 23 Nov 2026 05:21:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795411291;
	b=Ses+Jr/CnTaEt12tnbKRfUUY0i+lQvM2Pr8EsUswzEDa6WEcRHMSq6BBX3QOzSwX8xpw
	 3J7dfKUFVuJJQ3CCQkLOajyBiNrLbeBl5uEWxmIvw2XTD/XWDYWTAfdkPYXBv2XkMgOMM
	 52+c2WESCO5IA0IRy+R9opc8IzelW0NzadxZbdnHZa2e9R5tH3t5pzOhEaDOPUwCW//CR
	 45kpFrcoONLhsvRkXLl9UMaTb4hn+KP1AtTxvaUuRuFnlbcNOT6AMcFPIfLRvfowzA4ct
	 qV04E3b3dF0wS3loIH1aJ4hMvnJoq2xohUEubke6TEubz+BWEuQinCi3xaP2AWNOuQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795411291;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VCAHJAZ8lG0qePrCTaZNQY2oEqKkFnjfl6hdH6oURSQ=;
	b=L0xZu4FByZmyQQSSNuQcz8V0wY0AiX493VaY+vHZVLj1Vs8FtxfDJNPW/wK4ANeov8+l
	 XzJjynXLn/yfQDxEH+ez3rZwQriC0vQziha+4xkI18i4JXd1GH1/tqu4OWsI2GVdDH6XG
	 iYebiHQitrZS0sY0FixuLc7OOkrC8Hjo9qCz5uFyhR2De/RgVTYT9DoXW837vUo/XKpUo
	 XOGXljk2B77bJnJhvjCt6N5/lULQmAuQPk7XCtm4au+yy2XdcByx+J/GyK6sdipzcleUf
	 fp6/U5KPN3QrNxJVQR9FgaxxCLiwpA481FiyT9YhcuTcdfjYnb0R0uAoDr2fxvvJTdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E8C1F000CF;
	Mon, 23 Nov 2026 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411291;
	bh=VCAHJAZ8lG0qePrCTaZNQY2oEqKkFnjfl6hdH6oURSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UCpy4COhhyPYYlWblKOzUDckedsWxFzQzPHkDIAQIQvNkcsFDZlQZJXYTIT4AOwsG
	 Cruvgwph8Bg1RTl+igoRycVD3zffJRfr4lvBXd6xsu9nCHm7g8WeYHxWfn9AfUn9on
	 4wJZKdnEVCRDs0bDjo2L7+4xVcmugmumzhEseVUugDkTwz74/flU2/yRTY6laexPrj
	 DN0ZTF5sGfHq/gQFROpnV6ZZ9mIWCThAUmu3euIx+Yj77zrColnW1Pc71Sbd7DdC9W
	 JG0cJJHONU0zuWHDhWOBIygcWdzq1KXrY0VHe6KOTKQiaJhaDSvqsrLg6/EyoMosFF
	 CzyfyBDfyFTdA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A65604C36D;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 05:21:20 +0000
Subject: [PATCH v2 3/3] cpufreq: s5pv210: Fix resource leaks on probe error
 paths
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-cpufreq-leaks-v2-3-29277f2f0ddd@gmail.com>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
To: rafael@kernel.org, peter.griffin@linaro.org, viresh.kumar@linaro.org, 
 krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411278; l=2668;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=FvOlF8UNPCa6Xw/nvECVgrxkLK8Otjxui0GXRXiNPfI=;
 b=WIwqOW5wacTIg5maPfMnSat7qTxeqJQ5eiKOaWgfV0O+DsxXO/GkN0lQrdRtLIwKhLmkrdDbf
 jz/JTb0LVt0CzirEWV1U+/JX0KCzFhBgEIupei91H3GetPDeT0JfyAL
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

s5pv210_cpufreq_probe() returns the result of cpufreq_register_driver()
directly:

	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);

	return cpufreq_register_driver(&s5pv210_driver);

If the registration fails, for example because s5pv210_cpu_init()
fails, the resources taken by the probe itself are leaked: the two
regulators and the clock and DMC register mappings. The reboot notifier
also stays registered. (s5pv210_cpu_init() releases its own clocks on
its error paths, and the cpufreq core tears down its own state.)

Also, when a DMC node has a bad alias, the code jumps to err_clk_base
and skips unmapping DMC registers that were already mapped for an
earlier node.

Unregister the reboot notifier and go through the existing unwind code
when cpufreq_register_driver() fails, and jump to err_dmc on the alias
error. The err_clk_base label has no users after this, so drop it.

Found with a static analysis tool and checked by hand.

Fixes: e8b4c1986efb ("[CPUFREQ] S5PV210: Add arm/int voltage control support")
Fixes: fe7f1bcbff91 ("[CPUFREQ] S5PV210: Add reboot notifier to prevent system hang")
Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/cpufreq/s5pv210-cpufreq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index e64e84e1ee79..29b1c5d71a8b 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -634,7 +634,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
 			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
-			goto err_clk_base;
+			goto err_dmc;
 		}
 
 		dmc_base[id] = of_iomap(dmc, 0);
@@ -655,7 +655,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 
 	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
 
-	return cpufreq_register_driver(&s5pv210_driver);
+	result = cpufreq_register_driver(&s5pv210_driver);
+	if (result)
+		goto err_reboot_notifier;
+
+	return 0;
+
+err_reboot_notifier:
+	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
 
 err_dmc:
 	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
@@ -664,7 +671,6 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 			dmc_base[id] = NULL;
 		}
 
-err_clk_base:
 	iounmap(clk_base);
 
 err_clock:

-- 
2.34.1




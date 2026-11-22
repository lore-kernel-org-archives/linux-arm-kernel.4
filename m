Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B891606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3eXTsliy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nyVhlKcq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xWLCRl31use0Fw2SVtV1S3RdawAt/eTZFqjV9KHlaWs=; b=3eXTsliyju2NvZ
	ByEWIHmruYriWbrGejvSfotHjaPQ7wpNdALZX1wUgwpArWQpbizi069bPvVtarNWeBecsS9ICBfPw
	jZUaDSr6lHdU3TSkpnG86vQRXbtxvO2kZQOwEhdV0FKgaGa+CU/jn4jM3a/+qCylUdgFJi8ns0QYO
	idozelzbgqM0FOT5Xwiaa2tPVmUpwUPevBIvRLynPyWBzURh3Ed6uPcILDMZ7sxqFVK13auCdXlYV
	AwBR359+YDUk7wm3NEomCmohlKvr2H8CLsDmDWxOJkYKTYa9tI8Ej306NS5xEJgIu6apAgPmJYKLT
	yrELhSw4ep0y7mwB4KEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AY-0000000139T-1SSO;
	Sun, 22 Nov 2026 11:55:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6AU-0000000138i-3LI2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:55:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E56343923;
	Sun, 22 Nov 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795348538;
	b=eeSMl/6xo/MVuiGWHidHeJlDFLtg4AWkQvqHhXOj4Pvf4WeDiOcHhLRJiB4r8lXNkRy1
	 FQObkAY7FU0hLg3Xh1gsI0Q33tU9rh6bYYKaL42KKYr+qe2yD64Q/OMGqfiYqC5VF3mSi
	 BZsUvwSrmpKiDMzUA4gfNtrG6vpRA0RCyvYvylhr34kjIY+9pY2nTuvQWqBfN+TjdTVaH
	 SSgVH2iXuyqb4i9s/1OXEFpxcuthaJ2NRPa/sEPil3ivkafY9PUxtPC2or1RQQQbtUeNZ
	 KBsHNOHnPhH/+Lo2c+2iYXWhWXOOdNOh/CLewWyo16vvSuX6rIdtksCtTRKpZUUt3cw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795348538;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xWLCRl31use0Fw2SVtV1S3RdawAt/eTZFqjV9KHlaWs=;
	b=uPznE3LwzFWF4JNwkiN8RI+EXGvU9WsNJvufZ5EP6+may3nFmCEVSX44aeYbm3BMRwfr
	 LloiZzTjZMawXWqPogaUhrekwGLwydpq7P0GiM8EQQyYU8SzSy6IbQWb3SPzhcDEUOyMK
	 OE1XUpk38ZcOUZ9itA3IRNtvuZxvFAUTToGLhli2VM8CaVdt/VX/gqYRKED8BNfd0/UPa
	 xjQeNHVDO0gihzvBuhbm6jozkZglDHa2SZdGfzh4eFSGNwsI1HKfz5Vays1LoyL7kIPqK
	 ttPnRJR1E4iPQjdR+GTXxpjj2u3TLQ5oWdZp21zkvL56NbRQZGoXFIwCQZVx3stIRZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F8A91F000E0;
	Sun, 22 Nov 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348538;
	bh=xWLCRl31use0Fw2SVtV1S3RdawAt/eTZFqjV9KHlaWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nyVhlKcqa23VbZ3Q2TF00cL6oulYecYVBjjdmH3zJoPXo3+c53A2+CqTC0dtCbPSa
	 5UPQGpZ/Zxu5azwYGqriREmv6zS+BTA0UpbVU3CSkioj+VfFj2fVg/SNtl7JmqpERh
	 EFCQyz3YgeYRoLLMRpwfbuCmBtYrzQHeulmTQZPwzmb3F9JiWwuG6hF/Wmj+SLSgpW
	 I8qAOMhrwt1X5e58se2vZbsK6F5+AgZXFmvxrYAJtbwqAFdRDbmGasOB60XuTEUOE/
	 i6xbZ2Lhv8ne0VBxXaddzE8zH+wuZB1nW9NoP96Yy7bHJgW5wNyu/vUbF558PqpEgi
	 gTWGoFz/v0Vcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EC1214C023;
	Sun, 22 Nov 2026 11:55:27 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 11:55:28 +0000
Subject: [PATCH 3/3] cpufreq: s5pv210: Fix resource leaks on probe error
 paths
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-cpufreq-leaks-v1-3-96fc17ff7339@gmail.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, krzk@kernel.org, 
 peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795348526; l=2583;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=u26GdNff9h8VDqjlemiKXHAuftopncbeRgVHJ/CpuKU=;
 b=CrzgHHiglo92NWgPpcnitjmDoIyGezX87Do2D12VT7kp6fyLOS0r3fq5gaaTll/JBZKRugRX3
 f5B2+44sqakD6BU6xI6LbdUulZpWYly5wOr4asrOv6uJ/lgLavdA7fG
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

Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
Fixes: e0e5b2b4f427 ("cpufreq: s5pv210: Defer probe if getting regulators fail")
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




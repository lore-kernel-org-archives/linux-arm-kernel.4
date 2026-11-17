Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DC606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zj/aOgHQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzA6bje4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=; b=zj/aOgHQLdNRb6
	BNS3hswVEOODnZ6TlD52MELqKKX/BEYH6srCS7xsc/KXXhPv7PSqs+hmu6KYqqO5DSTCCG8lvMKGb
	UNTnfJE2eAEJcZP1d824YqMkcRBxr3X+/u6XgSw0P4Cos6g2w478vhLKpGaOj6YgdorIihAn+b9rC
	iDlMkfX+aUNJ/5FPVQdnkCZcVkLzBnno9p6JLkcrc9X38N/fpNUa4wWNaXDwgWiKcJtCgTuqf/lzT
	dhLQvhVxqPVzjHBG4HeB81YL1vCD1zKgfbWLFtEqCDkqBK3RSTafLAYfB6gsiiuhO5uolMWSoSJI3
	buaxBSDpH6SIk58JWZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKf-00000004dlG-07Nt;
	Tue, 17 Nov 2026 06:06:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTCKX-00000004diH-3gr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 06:06:11 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so4007853b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 22:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895569; x=1795500369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=PzA6bje4hEWlzhqnbCJ25lXE3S+c98H+UE3Cn/+RxK4bKjeIkI/lGf9cygbELMKn31
         ZVi3AmQscvB7QpfepzDOkSBi7Y1asQbrM/SCoWPGYWs8a+9hM2y0nXhTKm59+cgTIRzv
         jtY5Llsjwa+t2YEjLQnnJR6LLrzkvMsRQBizEKL6/70V2kpymhAMukcK04oYUaM7dJ1n
         CQvMTPWangZ0jQJNKxOQjigM5kZGoX9hIbhn5zoE0My/4FgIGAoTwgoSbugccaEjnLtU
         PUol3bc0RWu3Ym8yg3aOzc02pKv8G9QW3YxBTSKWBDhlLjUG7zhjgZaeNFuXHw5L48yD
         gHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895569; x=1795500369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=BgXS7odSQVwQhWwlATGSqZUG8JZ2xnw5CAT+v5x6ZHQbBFGvOsk7Tj3IuClXi3/jQ4
         Sr+B7ur+cv0iaQ3WNJGgIbAzzD8ls1Ln/DCLMH3WOtSgigR0B3+qjzeCgwj8Lu9GRo1h
         2fUvIBankgcBDRsUDgAmqLTR0s72444hFN3wFUWIU2Y4E5Pz5buzT24Z46CwhdEqmlT6
         EyVBujGq8Tm6RN3145ce1hs8HQO1vIvStpu0+oZ0sRXXtKz6V7/o69VV8/U5ysT3Bicx
         t3BqkvNkut5OPd1PFEsWw8cvwiiXwtXjCFdldZv4ZQs8avZ7oBh+M5zadnvJ01WkPSYD
         7tSw==
X-Forwarded-Encrypted: i=1; AL+hErEpWLsl5CUf09/QxwL1Q1mKWZKU+N5YZ3gjc3LWgRABgxLadErlpc6J6GtDnRYQcHE7jha5JxLjg4+1cfN1cNuz@lists.infradead.org
X-Gm-Message-State: APuU4Z+5M77VoensQ9IiU++Xt1IJnPCyHTuBmUe63TRe1HLyZ2Y+ZLg/
	7WsOnYtG3lzHdYtPrRpReh7EzQMxLVGjH7b1W/u5vMgwoUx9EGEaelPA
X-Gm-Gg: AYBFou3IcfXJNzu7dUT1Yzb2dhWNenV0dNH5+TE43EjsLdA4mbFlcGLtfyB6y93K5Pe
	duQM25wGVQt/SGElls49KGlvkcoVEzJXjG7oh51r+5zzgqbwpMdwZRxmUrh0DIMcjyIljWrG7ZG
	cFLcIH/WMgndTZ8esbIjKU8qYBufALCtm/tASxk/xOG52VbF4HJNOer6XwhA+oXT6D4jkHGB9Mi
	5zexro1B7tPecwvQg8oK/7J9s3qi3EzEStJTYNk6jHTOq+quMwsuQcHyrjbY1BWJZyaOobgWkvn
	A5uiaKQhqQGlIqWMVkB4yP5T+5hXGXF/waEpUwg0kgV1H/pUwBbjlwCFc8KY7HtD005Q1tbuV8O
	IHPfldcGdxavDbTpi00Q2igGM6G7Js+JoQMk+j0NEP6Tf9SBhu70xU4E9hSCOa3zlSYJ8qFAmDO
	0qYTuOZruRDPMj+Hy6SiViHak8S36w5evYbWRhPVN2swFSnd8Sc+eD29Jc5mXRibgQkwu8jvbF8
	gcWOCzdyZCXbVw0gIKfTe1/PPeQMcHR1AD9iS397tDDflgPY5bnd6bvvCtePsgpZb/t/vMA42Zw
	LL4mI6cUBf6eBzCXAzlq6wrtrmJ7cjltEHGaQVL8coMpL7Q/PGGTB/R31AGYsDsN62rJ/ZHZfAN
	+yQ/dVHO3jbU=
X-Received: by 2002:a05:6a20:a79a:b0:3f9:3f64:9bad with SMTP id adf61e73a8af0-3f93f649df2mr5801702637.4.1794895568851;
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 2/4] reset: ma35d1: Register auxiliary device for the temperature sensor
Date: Tue, 17 Nov 2026 14:04:59 +0800
Message-Id: <20261117060501.2611071-3-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_220609_923851_BC403092 
X-CRM114-Status: GOOD (  18.07  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The on-chip temperature sensor is controlled through a register of the
SYS block, which is already bound to this driver. Create an auxiliary
device so that a thermal driver can bind to it without a separate
devicetree node.

Failing to create the auxiliary device only affects temperature
reporting, so warn and continue.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/reset/Kconfig        |  1 +
 drivers/reset/reset-ma35d1.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..cf42fd6f7a3c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -220,6 +220,7 @@ config RESET_NUVOTON_MA35D1
 	bool "Nuvoton MA35D1 Reset Driver"
 	depends on ARCH_MA35 || COMPILE_TEST
 	default ARCH_MA35
+	select AUXILIARY_BUS
 	help
 	  This enables the reset controller driver for Nuvoton MA35D1 SoC.
 
diff --git a/drivers/reset/reset-ma35d1.c b/drivers/reset/reset-ma35d1.c
index d2962c0c80be..8c82175d7466 100644
--- a/drivers/reset/reset-ma35d1.c
+++ b/drivers/reset/reset-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -218,7 +219,15 @@ static int ma35d1_reset_probe(struct platform_device *pdev)
 	if (err)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-	return devm_reset_controller_register(dev, &reset_data->rcdev);
+	err = devm_reset_controller_register(dev, &reset_data->rcdev);
+	if (err)
+		return err;
+
+	/* The temperature sensor is also controlled through the SYS block */
+	if (!devm_auxiliary_device_create(dev, "thermal", NULL))
+		dev_warn(dev, "failed to create thermal auxiliary device\n");
+
+	return 0;
 }
 
 static struct platform_driver ma35d1_reset_driver = {
-- 
2.34.1



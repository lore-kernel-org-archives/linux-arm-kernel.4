Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC909606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pgtIkj87;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJGk9hmf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=; b=pgtIkj87x3mvrS
	/46kkt69GY2ZnsjhXrwg+NKE3qC2mTmxmB5cf3MbW13WVPrpwWyJl1BPjBW/Fpyi65zeQiB8CfCdl
	70+kPiL+9oActBD1TBBM/lpxVfLtksX6jSMWMSxCOlf+5SrHXVN7Yy8LzyS6tSSUgZrC1mOy1Rbm5
	rjKCGcp5NCFQVz8S1TVK7+01svn7ShZzMwRgWpiZ7x8TDYfKVqgX+FsGzstclpQilJd0FdHkBIlfN
	D9QOTPgFTCRBpP8+POSf7wBzl6qFez8bCouV+oLex37adn/wKfhru0cplVGNYhUa5zLfYTnIY1OWR
	dV2xH2NDo1Jjj1mgQUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4jS-00000000xzq-1GlK;
	Sun, 22 Nov 2026 10:23:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4jP-00000000xyO-1XU3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:23:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso912829a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343014; x=1795947814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=;
        b=CJGk9hmf3ZYyb29Yg6hJ7/vhoGRhlKaIRWJm3wdsYbC7RYuwTS7X0nK3rP45pFG1ow
         5v+EKkbUJw6hlo0dIak95KYwtRsie6TrKj6UDyWUGteyDcHLSm0KTjZEcM+NELduAK4R
         0OlcDt9ZyxEeuqwb2IWadFA2R6LzJFf3r9rohaRHaOlO2gmDoNjmV2V2QAWUGRv2lJwz
         56jZLXwCItxERWVA+r7DU45bJTNp70CVRLnFYNO1S0a/kmJFcgaw23QawXrQEC9Ybk1n
         1mDrVHCIB5xvGgmrYMKnML8SXxbUSCRr50y6cEbacFTU8FbiDxpN/rWzw5G/FVsZ2hsh
         iKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343014; x=1795947814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=;
        b=v48Df6vjl6Inxv4DCECOOMiFuB11OaTh5u/dU4Hn60xXzAPzdZYQJm047k8fh2Voab
         rW3s5j+uKTR+9Fy2mjxWnD2T2gitYyTBcTEIGb+usShWulaUDCkXfwqOYqbWJCQSLSyl
         onoZjSnmjbJ5THksV+UnXivIJAAZEdipVAAqGDfnRteD3fcnPHSj6vL3LUiJQPFPNAwH
         diMn/PQ+qO8mZZc7Ip+Yg5cZ8+xME3gH34xtC8n/yAPcQO0fFUewjsDfWIfkAJRgsngm
         cNH2+/NYXusl2orj4EFyswmnfNCsoEbVnw7do1EKbt03d6dMVpDwl0ISmzWWq5yJ9q8q
         W4hw==
X-Forwarded-Encrypted: i=1; AL+hErG36/tWiraCAOo0vV3nPNOs6waBOq2ogG6PpMK2oKP2LsPFzWcUNzUr9EKt1IS2wH6irGMiHRV/bIkdyXinCcka@lists.infradead.org
X-Gm-Message-State: APuU4Z/dv/cUBs2mJ48xYy680KgKof9NHv0DvlYu4rZvTvLirchtY0xR
	hYRgH9pa3zq1ZeayEj1BNbrw/kBBFGnAEbrp3Ah86EBGQc82mwsDlc//
X-Gm-Gg: AZFdTZflgOOa78Od9BzZWtgWDdXJfB7QGjqkpHFjMtM4Q/Ub4b/gAUk5UJ/hX03h5W7
	3ayiN7mGYzrgywFv32UHklRpneBb5EFVLVe8vkaSEefAjJSa19s8vCuB9MOjWowlC1zlRobkLlj
	3J6qf2prcc81pODrQkaa+WAzszWYyCYzXwQJa8DB/ztUnyffNL5/1BG8aYQZ39YyRaQtHK9HLjy
	GS5lQW0ezdIR0WjGZZTe3Vf/RMKXsZbdet6O27XgqTkB+rQJZtDrSBd4yhIbhZN0K1c3S02DyeV
	xhmHVEdHk2a5MGcCt9jA1UvfoDE8imYtm680aB8wiC+BSWii1KBVbC+Wud3jOZCk3Hdap48DBek
	GcDyN0pjgM9+7W25JX4E7WVO35bjOyXbVMKmMUGydj4sClpbaP5BwRr8ln0u7wYJ3dboGNqSu7i
	ihG+RPx6PCa8XYgILongy9OHYxZGZKy3XL+Q48qiJ+8195B148LjdcqIcLfMRGcNOrDHatiAkCP
	/Bl91ZwFUbrPGZqUftWxFVVki2onz9LEVOk7tfTQCM+O9lFUAPrY4Mxe9Npu5gift555aTxQZ2x
	ADWRTRRUAN3BFE7oy4j5ae79aFKnH6Nd83xGzB1qg/G+Racw/ug=
X-Received: by 2002:a17:90b:4a48:b0:3b3:b5b4:e4a9 with SMTP id 98e67ed59e1d1-3b41c7ac07amr7895999a91.3.1795343014416;
        Sun, 22 Nov 2026 02:23:34 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm12098095a91.0.2026.11.22.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:23:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux@roeck-us.net
Cc: artem122novak@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	wim@linux-watchdog.org
Subject: [PATCH v2] watchdog: bcm2835: add newline to dev_info message
Date: Sun, 22 Nov 2026 04:23:28 -0600
Message-ID: <20261122102328.207524-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122082943.173681-1-artem122novak@gmail.com>
References: <20261122082943.173681-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_022335_427388_1A65A754 
X-CRM114-Status: GOOD (  12.37  )
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

Add a newline to the watchdog timer initialization message so that
the message is properly terminated in the kernel log.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/watchdog/bcm2835_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index 755954cbadee..df08236d2689 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -213,7 +213,7 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 					      SYS_OFF_PRIO_DEFAULT,
 					      bcm2835_power_off, wdt);
 
-	dev_info(dev, "Broadcom BCM2835 watchdog timer");
+	dev_info(dev, "Broadcom BCM2835 watchdog timer\n");
 	return 0;
 }
 
-- 
2.56.1



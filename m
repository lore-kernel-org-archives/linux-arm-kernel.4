Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sUDpRF5n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PODfl5h5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=; b=sUDpRF5nJVE1j8tFSTxq6ICoau
	m0bZ1lZgAeQ0uPSICCn6TuyX2UBac7isThJB6ir0wKJN7EzN5jRXqQ2VrGc+zDRmiqRAuxoS6dnBA
	PRLGpXUH1x8+HXL/dhj6mw3tmjIZpdXn6vBE+QgJe/C/vFTybpYCLgOYfwYYyT9EqJq+BBqqRPEcz
	+dKnnA36FwhaFTOFQVqGyuypcT5zIKmsTLz09YdRj+5HwE7+XEZLi6qYA9kg9TJAYl6lUKOy6bFBV
	7lF0ct8lRAqFMcCjcngLLFE9ZZ5UbVVcm5jtIJHkKfWPj5mdCwH8JUCtILydQDIhbs3wbj0aB2iv0
	TrgQ6vZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2xM-00000000s0y-0WBd;
	Sun, 22 Nov 2026 08:29:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2xI-00000000rzl-3MJ9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:29:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b413997581so1997748a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336188; x=1795940988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=;
        b=PODfl5h5U90cu9Fn/DGCBcKi/jzDCQ/DU3nloupthZ2rLQJT11rf0RSn+8ZIP3JWy1
         eGAvhwEDc5P0H41+aiWAUeAuq7oez4fuilbhM2lkTFKZGmITBCs5VqhJ0SvUASqXjwxY
         eAu5RLwzSBko3Cga77ad9u0Nv/bPFSfJulZYc+a0ILVjQKgiI1KqssentbOHlk7GDcVl
         fhCkWdWSoFKf47bPM/jvf5kg5ljz5uslEUJyzgPnU82IxWops28znA9nAA7HALGKRemF
         SXxbKgcMQ47mkITStSub82AP/cHHyyyqh/TvIJtBzAKLmQKnK3sMT/4xhrnkw4Wi9cas
         oFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336188; x=1795940988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDSvzl1Gx/Aqp+Qnd4iIo4LN86WJizYkgXEiZnnjt7k=;
        b=sdHE31anXnINGm7I+B69DiUO3Q7V7ApiFTgkhWW4ZYI4IJW9LxTiSMxR4Hu3+kywoi
         vbKB/IBmjLz30ZIUObK6NYrpVLfEdKrwTHIUy/8hU7d1o3It/QVqbjY9PNtjrenJU77y
         Ze436Y6Wol/yPoIyIEYHwkEHlSojThoUc+LwvbmSnLCOJFGLE8W1fPtM8FW4hnq4bsnz
         WWiB7GiFTTAD2/BOJ3Q0HFtFsxtxbZ/zfDH3IUrduOfMusuJ6HkCC0/R+oxWzqXWC96R
         Ogt/ZDH0Wyy8vpdam3H6nVWVHzHPLTKpPE2OsvPf+QAhVcptIspF9V+uKc/7OK/WHoqz
         ewhQ==
X-Forwarded-Encrypted: i=1; AL+hErEAKcwb0oDLik4rXibWMajw3HjemNDLWdD4bQR6LWm6drYA/TJMzJNdqSJkRwLs70xLMmGOJ8a+eRkNN44v5All@lists.infradead.org
X-Gm-Message-State: APuU4Z+u8tYYejD49q6fLk12cRRRtBWsx2fLLkfbUBIuh3qQg74pT/B/
	/pb1VYnpSAcIzGFSD1G5287wK/STzdeI1VXKTmJer7jo4j+NXSgHdmTX
X-Gm-Gg: AZFdTZc5ckwzXrNg8qmrqV4DLEFvUPCS9kq1aSVmj+NlCJYl6eIIyE1MLVQKj++zgNu
	iFtkzSTV9e3vnBUofy1nOSP0MTWg3uMoK8jXlg7Y5eKv/KOL4zD8Ij6NOLPqnUpQTbv+KCW+4Bt
	lE7Iiv/fqRtxmzqurF9IMQE34SVfUUX/M1JKGfEi2Dbqa2KVtWeMwX6ORjzaf5ZPv2Y6X23jdtK
	TE9SKxpxjKMyOIHgV5x/usefuWa63i0beDWE/TGSFKUKvv7wBeGTB4DOOBlVDm0cERi/Sk2mKa8
	qROhwGd9/Ct+XCUTYmb1eBzScpYIcn8yYmhUUH5Uiatg11gPU4jV3WbkAz6jGWc9fncnhISxxps
	QB5eyBYDKa/bOGYdimPIk/feWKE5adN0bXTBNRW7xbV23aNkqLyVk0/GvrTaNasK75QESiqaS+k
	C2N7Qcwiw0hndUTLHTlhdRQBtnLhcwzHngtywDb/TBWsu3Z5XLduWeRmqyNpByPWTDxd1koJAVP
	YSdnP2+Y2FircmcRUWvnH++7fSkFGo+Okvxc0KzmWKXJdjbcS/3IsmATX+bqf8Rdf7/Fa6N/3wT
	wWEUX6JLeRjRphRR+aRJl25PSwgC7x4EihOdI+7CBtQppTFHh0Q=
X-Received: by 2002:a17:90b:5407:b0:3b3:c998:6d6e with SMTP id 98e67ed59e1d1-3b41c961528mr6953366a91.37.1795336187924;
        Sun, 22 Nov 2026 00:29:47 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm12957455a91.5.2026.11.22.00.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:29:47 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-watchdog@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] watchdog: bcm2835: add newline to dev_info message
Date: Sun, 22 Nov 2026 02:29:43 -0600
Message-ID: <20261122082943.173681-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_002948_864024_583E5945 
X-CRM114-Status: GOOD (  10.38  )
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



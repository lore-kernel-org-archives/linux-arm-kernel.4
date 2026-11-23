Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D06606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3lZRc1x;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SKG4uQkI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=; b=B3lZRc1xxv+0gR
	Mp95evcrPluQ+pvDb2ouG2H416Pzs3v64p9tw1dVWxVzLB2c/A/DsOQlok/kzgXEKMvZ6qyeuWr40
	GN0qs5KKsnDjUbEcJmc2xCSQlkL/m7hLWqW8UOyYjTUikNdqoTe+ZUyFyKcIsHjXjAZJM12T66Ndo
	2o3XQ3uGHRPRwVJzScsrBbfMPSGBzj/LhIM02n4U9I5mj71mArInpyW3VgzFzU8s0nDJSMqp5V+pg
	9ftbArpJMCy5HzLUMInNWVSFXrRxgkGEDqm7xkpsvmiB6DhPsGx+sq+4ofksoeVdjv4VSZHEOzibu
	f8O4k79n8s+Z83N87QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4p-000000036qu-3G1B;
	Mon, 23 Nov 2026 11:19:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4c-000000036dQ-3QiU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4aa5833c263so2993888f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432741; x=1796037541; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=SKG4uQkIJ8oyF8lSqOmujWpF4Ya3aQtVGdz1u8FaiTfQi0upGY7eJbNBBwIzMAFtLb
         ZL9ku7lHl7s8WQEeOU4V3YJamr5P2MpSXEe8NIqhqBBo1ohUl3xqVWWCTAKkm9YChEjz
         Vd7cbAf4C/tcHmpx45NqcZMTN7yt/ldarKJ3nHN69BjcJhk2v+xzXC1KlU6lkPLw7OTg
         n8Fs5oCVlTeKHBEprmTJ7Ktn5yB9xAnYV+5ImPWp/10TcfiarqFY6Smg5A7i7+77XMsM
         dUcOxqxfXFvgE+CjWnJVduZT6P/Kjs9Kr2063fgnRjIoXnnISj4rTqTuGXflYaIOrJCB
         yFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=Rnm1TrzM8Mcx7SBgFNQnqdgNDRx7z9aqYV2eN4EXa4JgtSHaXAqg3ldSqS76he1uxm
         fCYTH/gNXHRi+x0/hWzQOl4W5tV59iNV5ZTmy23H4X3OYCfiAIIc2q3Y8aVwb9kHNjs0
         fc51p7CbG6/2fKU4g78dDzI9aCocW9lpWqzqs4k5tRQ1imKlQA++F0VW6RFcNo5j/npc
         CYl2q3HBHoMf+a9mlIcO4kSFBPfXJt58EUkLusZrbk8BeXbUFpwcwZUpGo1boIDXHUJy
         3KOptFxJEE+kEW4X354mtJ6hsjqGXkRH+O43LAOasdC8p1V8/I0/nmJiinOrr4JAi8No
         e4VA==
X-Forwarded-Encrypted: i=1; AL+hErH4Z6eU+eWBTbdmoPUnM4jSLsNuG/TySYPefF/y+edZfWQDqOdsTwgj3OZ0qGuFUjabSXoJhjzx6FdYXhrHCqkW@lists.infradead.org
X-Gm-Message-State: APuU4Z9qa35pTDNKs0LC9W5B1oDatbjSZbVtzKeDyV624oJ7HKB5gVYP
	6lHrMuXVrcLKalwpsjlNVtVnoluKnai2agdFh2VB6HX3NHQhjfqw/42po30L3742q6E=
X-Gm-Gg: AZFdTZeMafbkzMONBcQQGc08DPQ6Tq+bQzrY/aFwYECD4NJvpO1Wng1srKBQfkINs2w
	00VZ46bznAiLp072U9/lhLkIX0LgrXOxs2wrub91UmVoHsqwSHEiE7mRw/gR7X0sEzvqI5x9oDj
	kZziA+QgXZiIdpqQKEBcwkiQFTCe6GtXmbOeqGfE/PXaROEIpMWoTQPqlixd31uIIKzClJ9Dj0B
	dqqcqt5tD2Dz9gTagSotJHLq5cTjLpSUPM9R94eRDjNm77nE51K71+0ctiQAVzrATVEn2hgD3aE
	IliO4WQLSfNQCO4W/ZJQPx/g9e70Grs++iw+3Wc/qFFhOEzg7c5+TEgRqJZSoiSBzp1pEY86o4R
	4WQ4NfxIRmNX3LZ81lf/g1QAB4vze4xYwU4P8DXiltrQ8WyC9LLR6znzdRDN0lAmXPARjwBzJY6
	enK2T/ZT5I1Af+unwXGR9r9SpkkqI2tPtes/T+/dbP/FFJ16T3we8cb1qOccwCd4U5arzkxolCM
	rEdlxP8Yke/qW7VybTmlXoEAMwVrBxm9/7AAZIKKUCfi8Hnhc5gbxJnrlICbrTlcHxJ9iu+1L8r
	K3pp2Bi+S8Pi74mysmXtNP9arIkGfPqV3pQN5mZ9t0FXLKru6UUqh5Y7mKIQwxdKcB9Zx8XNQcD
	mpo0a8MifedDLMB/i
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr230949095e9.25.1795432740837;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm451761005e9.0.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 02/17] mfd: bcm2835-pm: Drop unused header
Date: Mon, 23 Nov 2026 12:18:00 +0100
Message-ID: <a9189a77d973c1de0919e677b3aa2356987cd189.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NEe9YBbMZXMEbXYJMX3Yb/1ndoZ/Dmuud2fnIKbLu4s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDsN9DaGbH4sRvm1kmMVMoZQoYD+THO7sMJq c5fvKlpPEWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg7AAKCRCPgPtYfRL+ TohNCACV8HRlC7pWjZBnU0TL84vAdSWAfOva9050R6uNV8ih8XuaoI0NfZEX0PGyUeuRt8bs4dM v2XA5PW6cc1tr1+JGiM70igioPAzQU7KobIh0gdtSGT2PiITyNZY7ZlAwcDS69V/EIqrOPvUJ8G iXXu2csZXsOmU//uNaOz/GnDIqoJjl4hQkzXnvBiIwRbv453hOVxYR1Gv3GQCRSZ0160OxLIjPr JsbSXt4Vu2XINOJwlB4uDWvQRb7Hb1Q5aTPXdXUYm6IGCcKVhFBLGLPzGyBKCC7KbQofxcwzj0W 0zirKNJvCxvPazYCUkPlfQT0E7koHud2EKIx+tnvDU4Fke5i
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031902_969922_16E203E6 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.47.3



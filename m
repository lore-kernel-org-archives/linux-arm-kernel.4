Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9919606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZTnSJuf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGBAZWOR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=; b=aZTnSJufZk3P6Woe2o59UxMYFh
	mw11TgzfTDa9jaMzWugeg+/SZw5uNaS5Hdj8tSycK/JOBdIh0DYA3qRE6+MeZbz278NjtqoFQh5cy
	SBbnbOhdAnutuV1KLy8kvZyZlmtLaPnZ4pSNCCvIKlDd/IvYCS1+ldhxpOCxfxGQbBLxUYylfqd7o
	KoTvYLV5doAEPWyScicPvkfcgIVimw22QTxcngky/GV1ZktupVbYV5Wr/wRobBfq3O/Fh2WZXITOz
	VpN3R/HOrqAZ92V8iX+FF8GJ7JV1cUjZZcd6GWE0Hox+zj9MQGD05zz04PEkRfLDuE/f3IYxRHPQx
	+HIUL0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz58-0000000BUgw-2OYu;
	Thu, 19 Nov 2026 10:09:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz55-0000000BUgH-3Aqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:09:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1782674f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082965; x=1795687765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=;
        b=xGBAZWORGwt5HQ2/4d7nfiWPmiFTJZN2xjOza8/JWwvpVhExsLzp4i3ERFwn3TtbJJ
         inwQx+bosQH2ECHT4LSgBoYrOJF4nfPVIptGAinZQ+VudbqKvHWjxXpV24iQ8fFm6pYz
         56oZIPMmZ68xBQXKT8t4VaKUX84qOjX2Mq4k32opy+gcOMXuRAc9lVUPKggJ57qIfL5c
         4qxJh6oGNAC/nS5MX2eQNQ6Xq/sw8fTcmV/ms54iNXs4wPcfZ39M3/dyjvBLvGK4kM/a
         9Sv3XxCuCf5XqkYaeg4Knfetroo4InTK/j62+lENcmjVhedBnUoVy12e5a7g952ma2eM
         G5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082965; x=1795687765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSisANTIhE4dpBJJKLY3N8wKQ2oTvA7ICY+7hm22yN4=;
        b=ptr5/MqQ7IzbEnsR/FHsmGXwHYHQ0HUt4bVf/cYBELZFpit/m7sf2sh1omleQbwJh3
         IM3MP3LGlZt2/7xxMNlOS3Rx8AOFTkVtcm5MZBNW5M6kf6eocfCTWmRo8EA33IR1G9W9
         YNxqFueTNNrWHC9YJrvP8+4+loVBjN/hB5C8fIh9/JZBfaIhJyedi/Jh+nlf+88HqP/Y
         +4QFQFW8+9vCKSyWfzZdXthbZ7zawE69BXgqRvgf3XJfVKGgXQkQeQsXdjM9Ifpw/ZA9
         vGWV5IogZkj8IIjmnTJmfCJuWlZIEoeHcVJPO7GZmd3jIvxYOnL4D7VjMEh7EZSbDGdf
         ZZpw==
X-Gm-Message-State: APuU4Z8/OT1OX3hIufEyHDPzmqV1Fi2PruDy4NSl9eydredmDx7jMqBA
	bhHOKHbOAU6dSU8aNJZTpSpfkJeheDWPUagZjnx0mzW06en9d4B7Jt0/
X-Gm-Gg: AZFdTZeHh1+4L/EibYBbLcIGHeQ9S/XMoBxtu9VWkSIJW7vv+o05/SFTdu8dWX9urrM
	rgUlGom0vPJYoI5LgOXkFhaEvf0/l0N9kFW/kvlcqODkdLRqMsbbsTJi7aKI2gZi1ZIs0/9Prpw
	3GCBCHn+c3dcgcfB0LEhrlRVw43bS/EChpYNJQWA6D6hGOKLHlnvudtL6JKw1OfHeI6R5k6BfVe
	GPFGjtsP75R3OLXndzWJjyZxQRNZZf0Q0vwFJVIhPaqyvDBNmKXwTrQs0xibj58xVXknq7O7Ozb
	SJbDOimSfpNVd2Z9Y7N/wlVOSKjlXybf6sgM0beCNk6sDCV+WJ+A5qE5krDh/b7wavEl+hF2Skg
	3OzLFDf7opqMdIycf+bJkWEg7+u9J95bGvM8ZByRHcyI/I5b7ZzKykppq1/M038yArCgDKeK548
	XQ+2AcSp+34xTA/l90TdMwVZCZu//CCNX7ronubf2b9t9m38Vt/N/clzgxBWxG9XwOoBVk4ORkk
	7Br9zuAiVNabuid2ReMf7T+6lLhaMWf/DZ/I92wHpLKV6vIONPKeeTmfSLTCoOP72DOnNjhrY5w
	dHgbDIV5D4/KKC/TqACan1AumPLPLPVY+4bjJgM=
X-Received: by 2002:a05:6000:4201:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-4a63a1e0266mr12948878f8f.11.1795082964502;
        Thu, 19 Nov 2026 02:09:24 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm10097076f8f.43.2026.11.19.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:09:23 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 19 Nov 2026 11:09:22 +0100
Message-Id: <20261119100922.2722103-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_020927_848896_AA194EF6 
X-CRM114-Status: GOOD (  15.46  )
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

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c):
leave a disabled node alone.  The firmware is responsible for leaving
the cache disabled in that case; the kernel does not check.  No in-tree
L2 cache node is disabled, so nothing changes for existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.

Assisted-by: LLM
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Navid Ghahremani <ghahramani.navid@gmail.com>
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
Changes in v3:
- drop the binding note, a disabled node is not touched anyway (Rob)
- of_node_put() the node on the disabled path
- add Navid's Tested-by
v2: https://lore.kernel.org/r/20261112072953.989664-1-isasmendi.agus@gmail.com

 arch/arm/mm/cache-l2x0.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..44eb61481693 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1772,6 +1772,12 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		pr_info("L2C: disabled by the device tree\n");
+		of_node_put(np);
+		return -ENODEV;
+	}
+
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
 

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2



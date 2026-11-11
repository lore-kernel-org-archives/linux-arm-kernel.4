Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LahzM+wL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhQfWmjo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=; b=LahzM+wLmQTkG0
	m5p6LpPxsgKRTsWtc8kbSkPZU2+X1G+w7n3zc9At+c3kfzUuWkg5GYwdYb6/BWwigvxaQSm7xibXC
	F9xfBAsZdONVuVNzHTtskSRwI+wC549CwFHffTUMQHa45G8ecKFxgVnCuSLJu5+aSDrUXvfg2Ju4C
	NmZshWL++Cm9EPw1vRjaKPb9Hog1yQgfxRuj1yNKr8ZHRRZrlN9bNaqzHugmtePGK97xfOzh2fpE3
	cYg4AUpwYuRn7/l86/5Mi0+ECG3q0WY+EaNbIRH/FJOMZSNxqGyrwkCmysJTjAjphgg/OzwfqwELK
	EMX48+x+kSFpKEVHxlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8YA-00000006qFb-3IXU;
	Wed, 11 Nov 2026 13:39:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Y5-00000006qDD-2G5i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:39:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19214765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404375; x=1795009175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=;
        b=hhQfWmjoa9u6zPwsbaBOEDMtYaK5o7c6CXkO+jQYA6xAOCkXNCGUIDbr+JcL4r4jEk
         woqt+YeyildqK+XsQdFf6hGKf8uJk4VbC4f9YWgRPK/l73saNKrtaC2jAy8vS0xQ2cIk
         pHIowFR39MFFjjMoCvYiibYkW+zVw3C9x6ML9kOietEqFP6vkYqKqCCNpbKGa7Gib5vo
         odskdR/91274wHzFlMV8i1B9vBB3CyHYYC9enY3xD4F/9Vc+MIbHTbhb08T4wYo6UsuI
         xZKl2mLbadwg0HxYEDedaMrzgpLO7Qs2squT7YPosa1RLPCdd0iB4S8Bofl1HjGt5spL
         c+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404375; x=1795009175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=;
        b=MT+Cl1e1yOGFZ+enzFDnWDbGCkt0O5KUjijBfyNjRgiRbts4svaMeZ313tn9UwM1oW
         w6wDdF3rkig1gibGieo0oW6piWrTAdGKsQLKEW4PK0qcrk9w3zRRXaQ1s331XCabboy4
         e4iWBB1hrybZiqh097V54+LlzFaK2V0tD5dQTyXRXXwsbrdn4gylkPoDDbSxm19+iM4M
         rw89CGMi4yBabzeYyV0pM8EELEwKurqUK7jBH2iiqlpJ1346jn4G1RSCx+Ws+XCrbgFP
         dbO8ImqSS8s5u+HEYJiVIPowA0siZ2ELNPkhJ7nciUM15XdeYTZBWwMzH2LGHbrmdkg/
         b0wA==
X-Gm-Message-State: APuU4Z+w9bVbboWnCDNEf8pH7uWbc5Sy1l9lYUTnuwlSNhzMNbcZZIow
	yZ/a6FHm20PFoIRwfhCVV5+S5iZ8hjqSf9lAZo8k9tyfwbKWPutbNqyC
X-Gm-Gg: AYBFou34FZL1HxLIvhjxmh+hNeG4j3kWccNgphzh221APc+qlsrRqG5IiSe2ZSxuNUJ
	c3EsAyB1XZ3xjOsgwgQX4GeBPTwwnqISzuuK6S3RmeQ8GbiWN2gss0LDH2KbDYCzX6rwgw7cv2f
	W7a2fYtSMi9hF0Uki/Z+1CnLpbrrjWjHJSQzf4woti2y5SQ+ayZc9H2VcE/Ku90XDmfRcmLx8DC
	zyY6Y6kYTV7B+nxb97PJg/N6ddpbu6J4GbocyeAk2znCVJ5QD0HGMBSDxjKiibBCHujaSH7FzC3
	fe1dfRSmdLK0qA6K0CcNGeS/VHQUtGit0ketUoJi7SSgN92tLDPRpGP+0QWMmH04vrA4jhyUT01
	vzZCZ4J1NGSfnZteN5tjq7KSkVjxlJnRzTcfM+rkdRgmYNxwocVHMa2AukGtV3vUFYucDoJz9d1
	NHASu6ptN5mLaKTrJoZy8PCu2AEG0TQWMgER5WTYY1yYBGE1vOxIPwwMDg3VQk1oGXLaGI0H2N8
	/oFY/JwpHd/xVm7D/3TXfumW5n+hHWUqkuCbhtbmSPKvA1/skozq1DvgBsuD8E5HhjBX/Zbo6mw
	gKPqaGAeqZLw4/W3X9L4v8nNOT6qPkGmUxs=
X-Received: by 2002:a05:600c:3486:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ba093b981fmr42016525e9.20.1794404375439;
        Wed, 11 Nov 2026 05:39:35 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:34 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 14:39:30 +0100
Message-Id: <20261111133930.3665251-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053937_593462_A41F953F 
X-CRM114-Status: GOOD (  17.06  )
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
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c).
If the firmware left the cache enabled, it cannot simply be ignored,
since nothing would maintain it: clean, invalidate and disable it
instead.  No in-tree L2 cache node is disabled, so nothing changes for
existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.  The firmware-enabled path was exercised with a test-only
change that enables the cache before the check.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index eaa1fb44886e..0687e5a6ad10 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1757,6 +1757,34 @@ static const struct of_device_id l2x0_ids[] __initconst = {
 	{}
 };
 
+/*
+ * The device tree marks the cache as disabled.  Leave it off; if the
+ * firmware enabled it, clean, invalidate and disable it rather than leave
+ * it running without any cache maintenance.
+ */
+static void __init l2c_of_disabled(void __iomem *base)
+{
+	u32 cache_id, aux;
+	unsigned int sync;
+
+	if (!(readl_relaxed(base + L2X0_CTRL) & L2X0_CTRL_EN)) {
+		pr_info("L2C: disabled by the device tree\n");
+		return;
+	}
+
+	pr_warn("L2C: disabled by the device tree but enabled by the firmware, disabling it\n");
+	cache_id = readl_relaxed(base + L2X0_CACHE_ID);
+	aux = readl_relaxed(base + L2X0_AUX_CTRL);
+	sync = (cache_id & L2X0_CACHE_ID_PART_MASK) == AURORA_CACHE_ID ?
+		AURORA_SYNC_REG : L2X0_CACHE_SYNC;
+	l2x0_way_mask = (1 << l2c_num_ways(cache_id, aux)) - 1;
+	__l2c_op_way(base + L2X0_CLEAN_INV_WAY);
+	writel_relaxed(0, base + sync);
+	l2c_wait_mask(base + sync, 1);
+	l2c_write_sec(0, base, L2X0_CTRL);
+	dsb(st);
+}
+
 int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 {
 	const struct l2c_init_data *data;
@@ -1779,6 +1807,13 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 
 	l2x0_saved_regs.phy_base = res.start;
 
+	if (!of_device_is_available(np)) {
+		l2c_of_disabled(l2x0_base);
+		iounmap(l2x0_base);
+		l2x0_base = NULL;
+		return -ENODEV;
+	}
+
 	data = of_match_node(l2x0_ids, np)->data;
 
 	if (of_device_is_compatible(np, "arm,pl310-cache") &&
-- 
2.30.2



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A63606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IkWKiiL2;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jLKO367G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=; b=IkWKiiL2Wwao3d
	4ItuszzzXG2RbKjnTIOrfp35lJdWokg+ErK3gTdQlPZeUtRCSVkL0j1w0z7BCUhKAr1b16JaH9Rs/
	sStphpS/lVHflQiC9G7gSKFG45KQKyrK5Gw+aVvKT8gU3AVyAoeQ5I6thhmo/mmEVNoJKiSt5xZQ2
	IKYGbwnBQwJYEfv8ze0SY5Fltv5uHAxtaVcTL8BavFw9TBBLNKGdPluZX63aPCtSIfhu/pvC1kvh1
	dr5iR+GiFPZG1bKQsCHhQuU7kYJFnStxpc1lMOM2jXK4nroiFQVBS10hTPHzeXKv/BZmC330DNxdI
	vjmxlDHPurMNraUoXBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrk-0000000EajS-1ZAv;
	Fri, 13 Nov 2026 21:31:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrd-0000000EagY-1VlV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:31:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23748645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605475; x=1795210275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=jLKO367G72jZN0MdITXP098difIJLlqEbUDg9tj1XxB+SOTaJ87fuSOYYd0ZwHQy5v
         ntYtuKq1/7tEFtZ4yOBx+atihZdKzDE0nQ6BYxgVMIcW3T6BMSmzkwF20Dmepmlin/kl
         67s2uUqonKrHhxIXJ4QJKYp1FqniOLoSCIXKeGbdRj0609gLkMIADJI/wTW37r3C8R/h
         8Cmz7YLQ00MTeop1xdMSB4A6/aHgGGbeBwqeb4WWua5vjVHEXTIBFCmdMM533TYI9m5l
         d2L+VDawIR6FabVMm5K3yT4QD58s5sgCfgsKrIw7zZS+BFzQ8DT8x+p03X0jkN0LzVon
         czMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605475; x=1795210275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=AgVplu3uEagTpbaudtUlr7SXZWmiIwPwyuLSiTG9f03DUq1+035n1gu8kmK+3PKcaw
         F8iH1KFJvgXBuTSgHQIQlj6hduxoqRaHW8SWbmjCd0g9wD+pIvWqOwMLOzHbsTVYYhuQ
         HDxsgDoatEXzeSYUHo2VAjAgzrwSXB/I5ZVlbsqvPSMDRwznnTbG0yoVsmVnTfqt4J+C
         zjjYbs9tZE8Ydeyzuf8NCKVfP9cLPuWa0+mAMR1qtVLWonWq9hksilSp1RRpwl2BFtHi
         vH+/bmXDMPiay6x7SgMa8GIN7jIACgrNi4hBXJTNLp758UmHU8C6eXOUbnexFTX9QB4L
         RL0w==
X-Forwarded-Encrypted: i=1; AL+hErH9PzIfUz9AQyEECfD8kBSSLm3yg85lLFJAiKwtUEVnCKAVPppY0dRf4NMAiTt8GPHmnfoeiDxHQGx2ar5XX5ak@lists.infradead.org
X-Gm-Message-State: APuU4Z8Nfk1JJkKYZyUQTV91OAZIr3/mscvmTcwK6WkHd6XQxt1jDpjY
	BO8lYIYPyalc0xb/ej2/dcUDWuC/sZm9pPjVrAKlHfxjglH/sUqKqEtFlI/hU51098M=
X-Gm-Gg: AYBFou2ZJaSgmdfjoff1bvPL+CMfPXmbofdWts2fYW/ghROjQumfZ8oSPXA4N5yT8k6
	H6TPZPf1CPdFjw6n7cQ5RRAhkWKV6l/XX2KOBi/y8VtOlBS5HzG9OB63wKz0C4k+SOXG7PHv1Vb
	kq9dUISEnzJRc54hI+TCvvYIOSu12+StVD4G40PBRWHfFWXept142J0zX0DospoM+ClQ3nK/uhS
	mQpGZ3oFc6wzYItP/8TuTMHLZ95XvHdHt9zGGyPiDcaExDnO+ruCJKt7gjOuo1QiBvgKSfz32Fm
	R9AOBhE7Rj4uED64sVWynweyjslhf/KQy0jc947giCCyJ6aWi4P6Ym2O5BpauQ+vVc3XKBtxoc5
	bPj1RSWa6+7uomDcdl1N61ovBli6b6lubjdsnNVYovn8G58XOoi5MxiJpYdvCXj+EuAg2pi556A
	nEeLf1N0BXoqmyJRFqKjhCdRbzcFHsAQVOG6OMNeb4/FNbz33E7a7g9LzhzFW6QiJdwMTCPFVvc
	wu4FnZG1o9HaP5zL/O67UGxLuXh92aVhHN9GF7ma52srH+t9UDejMC8ovJ0VHAqC7CP/BkU7y5F
	Qo6P87sdlSX1KErjZ/PZ8ErYD+/Ku387Vp/TkmzAE4V+Nbbg2VW2MMuLm+BJeT248Eagzw3P28k
	ecaSYosNnQj3khZhBXj+E/igDFQ==
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr84563715e9.17.1794605475200;
        Fri, 13 Nov 2026 13:31:15 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:14 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:47 +0100
Subject: [PATCH v3 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-1-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2570;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=FcaXkSbmbLoEIeujNjI02i1V62uXoYWuhvh7robgIBw=;
 b=yLzZpIemdaez6TzWeagpbhxQd2QIPUczwuLxkq3FTp3SnHfFkFs2ln3YalKRTVg4zPqtLR4Zq
 gaAXhu0n3+tB3801Yk1hXh8pMvLRuRWqQDG22Hw4QL2NW+kQgCF34IM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133117_437018_F7A3E1EE 
X-CRM114-Status: GOOD (  15.81  )
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

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. Otherwise, the clock hierarchy would
look like this:

        main_pll_clk1       <--- main PLL should be parent of other PLLs.
           sysclk1_ck
           main_pll_clk7
                    ...
           main_pll_clk6
                    ...
           main_pll_clk5
                    ...
           main_pll_clk4
                    ...

Reverting to not using `ti_dt_clk_name()` solves this problem, assigning
the correct parent.  This change do not affect other SoCs as the only
consumer is DM816x.

Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")
Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index e54b1df3436e..ae2f6fed10f6 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
-#include "clock.h"
-
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -541,7 +539,6 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
-	const char *name;
 	int i;
 
 	fd = kzalloc_obj(*fd);
@@ -559,8 +556,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	name = ti_dt_clk_name(node);
-	init->name = name;
+	init->name = node->name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -592,7 +588,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = name;
+	fd->name = node->name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -639,7 +635,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, name, pll_clk);
+						 output_name, node->name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 

-- 
2.56.1



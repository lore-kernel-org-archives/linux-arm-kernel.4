Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20F606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fPS6eV6I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq5kwh8b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=; b=fPS6eV6IIVDEg/
	YL+Mx0qhZGlYVS7CHkVP32QBUu8yBIEGTIeggY2zUaGD6sg2iEnJ5eV82nkpY5aPlEV/HeEHwVCJ3
	QNE1Em0NFEx7fpMNnJO+irfDf45y13csCJOWrkD2RaA6PXm5EVWejxyMHTEtDpKVecC66dYdibXfc
	6zJXuqLEFPtjFdfECttrIdwwOuoXHsip+f+Mp3t8TWU0noVUoNDS4NUTHAYMXWgA4m2Ig7jOqQBjF
	fUmv9hLFsQ1vQ/FB9fpXPJGeC39ha6tl/M+o6GXJDwybnGEYwn4oYue64EyBVeakHFb00GC0/arYf
	M6+GRv2cka25k7MJDIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8YA-00000006qFH-2jZz;
	Wed, 11 Nov 2026 13:39:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Y4-00000006qDA-2mv9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:39:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso24571595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404374; x=1795009174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=;
        b=Nq5kwh8bVjkdOUwra3Z2zRho6iz2Kc+WRhiavtzpQ2raTyGBtMdYBOWgikN+2cRbDQ
         loTcIwb7I5EJl9VYDynHHvh3DvRNClSWQ+zEf5/LgO/PQXN6ZkerU6SSgkjSC32LuKmj
         iyeAupepfl29vLC1DoIjB3/PB5Yao6i7TmZH4mid/wp0L88NAtu0YTYSAHedPRxEwpvr
         hu4P2WxELBKhlACRnMoVJVPM+CjWnvZyx0J1cc6ioA+4n0MYzDuO09PauMXQECVDcFnx
         e0o3bVYIuLXYK9Fm6BDKJrLoNYLRgKcq1gYVszSHjxTB4hEIZo6nTZcVSXXppLaUGpa0
         +3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404375; x=1795009175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=;
        b=lVw+PgJwBBoOzjpHDk+jjA4bTyIM3mpF7xXNu28Bot0iaUmbIctvuY1Kwl+eBtYxWg
         AgKZN8BhHcFjjYE2yCCu3U/H/B67O5izs5DNlFo/c2BgxU5D7ggbTRftC5Fw69uAzz4N
         P5PDL3afJYKfvWyZftkTYEiqtwokfozGYm+yuoenYeF094wEn3arEjuOgjn8Ijei65bc
         2qh33WFg0Bc2W3a2EaHgx3G7qa5ra6msskR5atbbwRexJqVHS61PEopToj6S3MWXZbNT
         u/mplwzT3SQgqL+Zc5raxdrk7aoVQEaJLMzbjb2GkjZNqMb8c9RZ8L7kwzsNvEivoGpU
         5NGA==
X-Gm-Message-State: APuU4Z9/6r0hfgi33Au9DGn3KpKsmLXJ/WistS4vK3VP6sLqz/PdhWdr
	sASrruv5djLBivNag+BWtiunTw5QwkTvLnSpA5OiQKJPeiUFSpCLTGff
X-Gm-Gg: AYBFou1luor1ezWo2vD0a/aotRuKOBjcsP6mGSKaUhxfLcz0NcGnvG7fRfCizc1cT6s
	nMzO4+Cv+zeVfkxh+jn2XMO+8BSI4QFImXz3KK/QApVGUVHYhBUH/dMKEwUnfP9wlqA1ZCj0zKE
	u0hsTan4KPy4ewIr6HdsT7STVnF8nIsNs0Mnw1K7rXkP23JoIG5CJaHIGamymidvY6DJ6QZZRdt
	x1yocfOauRYnLKlq43AyrPpGyUPmAxB9t+k815QEUPPDcM5ir0ti836IbeD5WsCIHJFUZW46KRh
	OMdLetn4guANfJ1yGp1UM7nE8YGU3bAoRN2ssTzw9uplWVZkxPC9v/UZXolUnhYjcEv5Jrwx3eH
	bwXciCxNSUjKh+SLDvcSb2MV+axzAq1+Y7rbdaNJN+RCGY1ahlkTO3bDkRovLeSIT9LexMmmCz3
	VCJj/GCMGIrd6kVaRajcCuFxnuJJ5DSSaZvILHpVmLMmDRMqd/n5au0hcf60ERr67qFq/loo3x/
	jpfvlrDSvslJFv3rV89kKcey6UXHqrGvYV62LV3bIc/RwQRQgAUvhpPcq510Rp+PiwBW6pfMouX
	g7Qa3dpTPm3k4EPfdvtp3Yqrm15lFKo81hg=
X-Received: by 2002:a05:600c:1e04:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ba093b8f23mr42257385e9.35.1794404374505;
        Wed, 11 Nov 2026 05:39:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:33 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: l2c: factor out the number of ways
Date: Wed, 11 Nov 2026 14:39:29 +0100
Message-Id: <20261111133930.3665251-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053936_724684_1BB803A7 
X-CRM114-Status: GOOD (  15.14  )
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

__l2c_init() derives the number of ways from the cache ID and the
auxiliary control register.  Move that into l2c_num_ways() so that the
next patch can use it before the cache is initialised.  No functional
change.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 50 +++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..eaa1fb44886e 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -778,6 +778,26 @@ static const struct l2c_init_data l2c310_init_fns __initconst = {
 	},
 };
 
+/* Number of ways, from the cache ID and the auxiliary control register */
+static unsigned int __init l2c_num_ways(u32 cache_id, u32 aux)
+{
+	switch (cache_id & L2X0_CACHE_ID_PART_MASK) {
+	case L2X0_CACHE_ID_PART_L310:
+		return aux & L310_AUX_CTRL_ASSOCIATIVITY_16 ? 16 : 8;
+
+	case L2X0_CACHE_ID_PART_L210:
+	case L2X0_CACHE_ID_PART_L220:
+		return (aux >> 13) & 0xf;
+
+	case AURORA_CACHE_ID:
+		return 2 << ((((aux >> 13) & 0xf) + 1) >> 2);
+
+	default:
+		/* Assume unknown chips have 8 ways */
+		return 8;
+	}
+}
+
 static int __init __l2c_init(const struct l2c_init_data *data,
 			     u32 aux_val, u32 aux_mask, u32 cache_id, bool nosync)
 {
@@ -809,33 +829,11 @@ static int __init __l2c_init(const struct l2c_init_data *data,
 		pr_warn("L2C: DT/platform modifies aux control register: 0x%08x -> 0x%08x\n",
 		        old_aux, aux);
 
-	/* Determine the number of ways */
-	switch (cache_id & L2X0_CACHE_ID_PART_MASK) {
-	case L2X0_CACHE_ID_PART_L310:
-		if ((aux_val | ~aux_mask) & (L2C_AUX_CTRL_WAY_SIZE_MASK | L310_AUX_CTRL_ASSOCIATIVITY_16))
-			pr_warn("L2C: DT/platform tries to modify or specify cache size\n");
-		if (aux & (1 << 16))
-			ways = 16;
-		else
-			ways = 8;
-		break;
-
-	case L2X0_CACHE_ID_PART_L210:
-	case L2X0_CACHE_ID_PART_L220:
-		ways = (aux >> 13) & 0xf;
-		break;
-
-	case AURORA_CACHE_ID:
-		ways = (aux >> 13) & 0xf;
-		ways = 2 << ((ways + 1) >> 2);
-		break;
-
-	default:
-		/* Assume unknown chips have 8 ways */
-		ways = 8;
-		break;
-	}
+	if ((cache_id & L2X0_CACHE_ID_PART_MASK) == L2X0_CACHE_ID_PART_L310 &&
+	    (aux_val | ~aux_mask) & (L2C_AUX_CTRL_WAY_SIZE_MASK | L310_AUX_CTRL_ASSOCIATIVITY_16))
+		pr_warn("L2C: DT/platform tries to modify or specify cache size\n");
 
+	ways = l2c_num_ways(cache_id, aux);
 	l2x0_way_mask = (1 << ways) - 1;
 
 	/*
-- 
2.30.2



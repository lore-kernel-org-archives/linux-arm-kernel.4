Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C860A2612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HA9tTo+4;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HRquOm2a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=; b=HA9tTo+46FGpsG
	6jSEZ5VjReHULFoecHObKBQ1SCiyb+6j0PI6OsNFuw0Dj+FSi1AyBLvC7KwRpFhejVg4xajGHOECa
	OHjJ7dYKOunMr45fp5p0ZNHfLJ+CfD8asyvyESY5qYIQlMbteHhZFvkPQX4biSqC9goNYF4cRc0S0
	fSntqcAK70sGEgTxs/UYQGDcJwoVmQzhIkSomT+3N5qLQZnq1V8JS3tk0zCpzldV+CYiY20VtE7zQ
	UcsM5YKvdXkIXytql8nSA8FPvC/oKsRVxKpBJa07CpJIlK8BtDfYtCFG9gWMHO1Qo91Xh1AcG5Zv9
	k6blllxRr86KlXONXKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrk-0000000Eajm-216m;
	Fri, 13 Nov 2026 21:31:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyre-0000000Eago-1Ytv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:31:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1856516f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605476; x=1795210276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=HRquOm2azLQMyJGINQxV9kh1wPliXpEfGTncdyHmNYdELZzY1Txu+3TUkLbmEae95t
         ln+eT7cva4+z7kNnunqef5m8bZlfLOEo0+6DIXEg2O3yd3xL++3RpIMrfH/1ApV4ikIM
         u2Yiqcf6ombJXWxjnVUtJhwoMG5SiHc/TFXJ2/S3c92l0aFsVMFZVxvYFVMkKj1lGHPY
         D/9cDmg20qSWqpggd0VYrTOSyDYhksIqi7uCNhJ9liJuBRcsGbCmoFQW4YL+V23ceBp8
         ZH1HsFzfcKQ3G8CzakS6OFiu5ZsiThNmQx5SQyS68RVToYrb+OW6CDZ4mBgqLnrcqcUq
         raPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605476; x=1795210276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCUvXIZvqOm8ho7sU9D0qEAEFBADRjTaWHmUzHD39VM=;
        b=rLPnmsYbGOcyFnPpYtX2vE/cjZS7ygCH5CNlZa9kn9lV3gxnT4hXAhpkaWNu0nPxxS
         zVkIwpzKjamp+ZlKIjUdL4ULsof/TOAfQIPtuPYr9aVa5iqydPwTsPX/CozVUhicVqOC
         1XZIMUrOfO4s6+8MOiYy5wry9OmGXyIKF+dJN87xdkxL4h97ergdxpcHXukX7fU6WH2E
         hCHIHbgvs91WLiP8CaTPPHNNckcgpSzd40iGSn90VEtQ/95PHcqJGIJKXB7pWYS3M4tT
         CWq82YSQfp83DlofbexVOVfRul6EiqWMWH54SmFxRCbJDJHvQ4j1bYqGtI4H3tE3mq3u
         nMcQ==
X-Forwarded-Encrypted: i=1; AL+hErG3Mle2hjkMDbazmjaGuxT3OGS1rYgPkplBRVIIl9UeCNnecqv1j3uDbvN4sV6Nf66GdbpfbB6IA0M5I6IecpW5@lists.infradead.org
X-Gm-Message-State: APuU4Z+8N2lziNysvceUBpacg7s9ssixPzNPPIpjK3FxJ+RUaMTAJKGY
	+x8FF/DRnpQ7OIMLbZ5abf537lXfm4mAvXeb5Ho6JgugUoNLCKYIWpgOd5p1VWA1xlA=
X-Gm-Gg: AYBFou3dNWQ3ifDWyQgBxMUN8lzb6dAGefbUW3lvM6iKp/IxaMd9Hv3iYgz+ScyrC6c
	EoFUfbj4OMirVDr1P7QwKRAJ4SGf98mbJ6DuV7YcxXqFXWeWS3tVMuerIRy4sWo41U02EKO8MYK
	pOKYSVjhkfHWm8Mc3bXeHFAwliiTzyWWAbZhPPBjSf7b/faxFmSTL6LzrJFopvHUtGBC/UEDqsU
	xHwOWl4iLBKvP+qwK+NfCwUPmlZ4DMsVEuXcgtSJ7KlXakWw8we0MpRXQM6RReO8KJl72sCmTa8
	+Qo7Bg4Ya+Sb26boyem/60M6HzhLGFUZzI0/95mF4w4OAffWju0YgQEH5NSDV612P5AJ/eAM4oG
	y0na/MAa+Cm4pJjqNK0iJhZk8HCoRce0SYGV62pSCnJeTluEeITEedUiGByLQpN7BidcC14627i
	kfEm0wPKbl8TTHaRB3NuG/m2XJrFOC1XZSRDrzMaUCar+lg0LDLOPxgeM04+OGJdyR0E3Y79jU0
	BiMP4UoZg3DzyL2gxPhAdRfWD7Wn82XN/ynWHzCRN3RVcNgPHxOqlBKPCixAmNL6XCo9UOX7Z7D
	Wqrg1XUrv9rV/qh0JdOTQ5QoDW8P3zT0IFhfycrlUtRAtWVlNTnprhmPafdAzGC243Q0wXWScTF
	9YAYmgOXp9apDQBAogOvIBwQ5iyGamWPsd+ilbdFFgx1IWr0=
X-Received: by 2002:a5d:5d86:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-49c712ac267mr8339076f8f.23.1794605476337;
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:16 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:48 +0100
Subject: [PATCH v3 2/4] clk: ti: fapll: Fix clock speed calculation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-2-a42cd1edc5f3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2057;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=bJxNSt/zFq6q9Q5K6PZzIH2KeHUpZXrPEV90BgzuB40=;
 b=ub/Fkko/9cdU1xB2SS84DwJW77+/KJo6ucHf9cDfX6Hu7I0tGYXyJkBRy7PAiK87L6mzAvsmP
 eiiq7z63229A76yfsrbOWWdpzecTrq3XfZ7QxxNMvWHOTF9rv11QNs2
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133118_450291_1608478B 
X-CRM114-Status: GOOD (  13.83  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The fractional part of the divider was being treated as 1/10000000
whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
speeds being reported when a fractional divider was in use. Correct it.
As well as fixing the clock speed calculation when read, also update the
calculation on set in a similar manner.

Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f6..bb9986508578 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -54,6 +54,9 @@
 #define SYNTH_MAX_INT_DIV	0xf
 #define SYNTH_MAX_DIV_M		0xff
 
+#define SYNTH_FRAC_DIV_BITS	24
+#define SYNTH_FRAC_DIV_SCALE	BIT(SYNTH_FRAC_DIV_BITS)
+
 struct fapll_data {
 	struct clk_hw hw;
 	void __iomem *base;
@@ -336,8 +339,9 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
 		v = readl_relaxed(synth->freq);
 		synth_int_div = (v >> 24) & 0xf;
 		synth_frac_div = v & 0xffffff;
-		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
-		rate *= 10000000;
+		synth_div_freq = (synth_int_div * SYNTH_FRAC_DIV_SCALE)
+				  + synth_frac_div;
+		rate *= SYNTH_FRAC_DIV_SCALE;
 		do_div(rate, synth_div_freq);
 		rate *= SYNTH_PHASE_K;
 	}
@@ -378,10 +382,10 @@ static u32 ti_fapll_synth_set_frac_rate(struct fapll_synth *synth,
 	for (; post_div_m < SYNTH_MAX_DIV_M; post_div_m++) {
 		synth_int_div = DIV_ROUND_UP_ULL((u64)parent_rate *
 						 SYNTH_PHASE_K *
-						 10000000,
+						 SYNTH_FRAC_DIV_SCALE,
 						 rate * post_div_m);
-		synth_frac_div = synth_int_div % 10000000;
-		synth_int_div /= 10000000;
+		synth_frac_div = synth_int_div % SYNTH_FRAC_DIV_SCALE;
+		synth_int_div /= SYNTH_FRAC_DIV_SCALE;
 
 		if (synth_int_div <= SYNTH_MAX_INT_DIV)
 			break;

-- 
2.56.1



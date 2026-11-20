Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4w5xgw/b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLDo5i1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=; b=4w5xgw/bXtDjHA
	Z/MzonfqGDECLynMqlB7S8a2lFrx4okSqiAYhzuITHu3aTsGm/lTd6qQNjjGJdtooLoAQ/o8qHegt
	DKv4MToCheFhTbKuS2qAS8ZP/h0DIm+ocr5/gKzjeMXiG3OuDkelgigR1grdi6awenGZWEsnAA2OO
	POGEn1rVH+p6qj1gR6hH2QMfD6VdOEqUcoLdu0+E4KHfvSo5Y3M1MhHNFJD3BVkDr3DjRcvMFbTEU
	cbl9j21zkTmndbHal/aAHg7LnBK0GtPnJAA21ItZTTjsykTWYnWiSFernsYvR737uvD8S2H3hCXZZ
	OINAjIQwEMac5H5E4jzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM9K-0000000Ee4C-3lsW;
	Fri, 20 Nov 2026 10:47:22 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM99-0000000EdxT-0z3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:47:18 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so899007c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171630; x=1795776430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=JLDo5i1O9wW54VCt58frr/ipU89d/pQQvDAwIvmDhf62m//Q97S1pOKz3bTElpTrf9
         J0VmF0HeL1NniTibK2IKjP0UdFeQN4+SGAhhpaEKOk4x/gsbuMtDhoT7V9wTZKkPA/8v
         vOOFEq3oxF0WBPajLEINuCPW5RthF3Wre/eejeVwpESzoN6KpJRocpoucaeqsQBcSXTd
         5ZLGUvt5JiGjD03ODPlqSAALGj5e/iH5Thw4+e3Wy29tbmwyTkMT/Ayn16X1gPsUbiZv
         WBBcUhufH5QSmIodFaUOgjvnIGzLDZ1Wo6fCNUzWbdYjzzbBmb4O0KjdPdMfn89uSk2K
         0APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171630; x=1795776430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=A3VuDbOl3n5BbOvpAPJaD9LEDBRHNkp7Uxplj9nIxg6HPCC42Markkn0W6Vs2clCEO
         /apUwhJj2v3PHmMsY9I4YGY1ULlxPQBmi+hrhd87jiGsNHXtOcGawlz8RwKbPlSDj6eD
         4ffg7p30LBwu86Q+eFTrTr3ZU+PThWHRoUNPpTb61O1Xh2ovMrtTtqjXh6+Q076VLnwW
         SCSEkzaUaoHqNehFNfMUFPlfA2bPcm22NIlI+3qBcs7TLqurNPMNXway7pHbkHQpx4Uq
         hhitqYy6inOX8jXfLNGnSsoadNisfsOaIjWRxXSt3l84s1rZcGsonGaPO7tMszNwSUG1
         6BbA==
X-Forwarded-Encrypted: i=1; AL+hErFXfv1binuEvoskfXM+Z4PwYZIyoMG4XnLJT07tDXcTc0YXgsNKuhbysdWD054DpH+wbBmZNKd+Gh3QiJ9aWjuu@lists.infradead.org
X-Gm-Message-State: APuU4Z9PEFIecOLr4YBxiud70AyZHlOqSZA2EI1nFNB2ya5NLRYyeMx5
	RY2hAnXKehTW66X6EiYOdWeMOV/RgTXpyzKBaics4uRIjwjv7PYdsW3p
X-Gm-Gg: AYBFou3XkBttbD+0fFGp40CgIZW6Nhu3JmndC43rMFBxRrNfNlBeI0nHuI3PNp40TOq
	YfaSnAIJ2LStPGjSEO/+6cDD130lewHtDQ0m1FUdAcjNw4mKGDyO6BODbKHB1M5YRgfGKniaUQd
	8PFXUsjJBeC44vbB4C9QsEJyrQGpMlk0yz3LqH3/4pW9/ai2cfB9+idlMED3B70Tg61vCjBRKwV
	Zc6FYu1DuLx0/PFFx0O2RO0B1Hg+J4x9UCnEzzFYMnr0T9NaQlatsB6BA66xEaxn2BYtDmXU++/
	PLeqM1bopfx8yzFR24A64jTOMviBb8t3TOa7+ooskg5LIGafKNCgrjg5xBsToNmmdihji0R78ax
	UNI/ZsrMhpu20Qn0fIyI2prVYQV17MgdoVaWBNon79bWjLSJRhtz5qzt7j0NnDo5TxnMoOK8Y/s
	HPw37e9FwfAQzVIIfiYvvA30HH2ITS5kWuX4QhWkjsd0yY2VNmmg9t926Z1hes28+0o1bfmDSDL
	gnv7DfBMMYTRD9XuhrVIOYtnKxmaaZFnXIltORcrBMKrcGdKfTCX8/oxZQdH/dUrtQnl3LRhOi3
	YcediNo/gi+tTe27276s75+LO3K0eGCfzagKoGuBCW7VNvVfvMDvyQGPaCqT0qMic+Oa1R768Fj
	5onLt+PRrJQCRkrSKPAHu39DGaVCT5Xd+WSaFUcNGv2+7tQ==
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr2432306c88.36.1795171630011;
        Fri, 20 Nov 2026 02:47:10 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:09 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:30 +0700
Message-ID: <20261120104630.10240-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024711_298189_47E86D37 
X-CRM114-Status: GOOD (  11.15  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. Neither register is marked as volatile, causing regmap
to return cached values instead of reading the hardware.

Add a volatile_reg callback marking IMR and ISR as volatile.

Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 658ff667439c..0406a11caf7d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -165,6 +165,17 @@ static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_spdiftx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -173,6 +184,7 @@ static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.readable_reg = mchp_spdiftx_readable_reg,
 	.writeable_reg = mchp_spdiftx_writeable_reg,
 	.precious_reg = mchp_spdiftx_precious_reg,
+	.volatile_reg = mchp_spdiftx_volatile_reg,
 	.cache_type = REGCACHE_FLAT,
 };
 
-- 
2.43.0



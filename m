Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QacoNiUl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyajyh/Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=; b=QacoNiUlL+fTA7
	poc7IsJU0MnKO7Adrbg8iBRQBe3BhhhNhlvq8YidjvnU8iXQOjOW1TouoekPg7zHbYCjzZsfWU+V/
	E5z7S2OBlESTttkGcx+n7Uis/WzRFONjEaFaPP++lAr7FBxoudd5s150K2wpWm2fuxCFq+j72ZK+R
	bHJJ0BNvX2EJs6HEVq+2aeBa7IoGOjD7cstSIbVlGoiiZQ/0Gf6HhesoBYTLedLXYxpQAMmY0lVlM
	rMWbVOa2Yx9vIhlFm8gUD3QJ+8JVcEfAXoV6m8tfAStu6ONA2iCG+I1VvpEbwJXQ6t/+18UbXovyE
	StwM/BylaKTZiCBY3+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzX-0000000ER92-2bAq;
	Fri, 13 Nov 2026 20:35:23 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxzQ-0000000ER33-2GRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:35:18 +0000
Received: by mail-oi1-x242.google.com with SMTP id 5614622812f47-4e4a4d77e5bso2264461b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602115; x=1795206915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=zyajyh/ZEBA9JkEfnztK+f2/oe9eMHITyjG9t8XX8pgVf0AVEFI2/2me/8CuLzDxAm
         JLu/n47lptwGoiG3sGZugXQSQfLoH/Dki0OiJcyKMSorKvV9rzoe9vReJ+rgb1DCx+dC
         4P2Et10GpP0bI7nguveX1WOQX+fdTsGcQMgQQXIeFT0ApBXcttDfcUqltJBT3cERL9lq
         VE2oxGswRDh8p4xZK2Zghuw4bXrTPRJOKTtMXrp4wtQ9ahD28MZ+RSgxAJ4p8zid+9sA
         Yn0rv+NEBjfcVeopUtK/VBWvOIN/xglEtYWtOslPnE38AXnGYNq7fS/Wa5Ok9cxQwJNa
         e6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602115; x=1795206915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=UUNXMl+358lM4kdaOkRcvs0mVzsymxZc4EiELMkwYbd4RtgSNiae/vHSXh4UUQtb42
         wigfc9Axu9YJTe9NIuof/W08B3iROdlQ7z3/FKILdcovJBuUwWKh7TTnSji2NoATwCqS
         UfP57fLhtnvDcC5MTDAAtJbw9QM6X9pqADwHjfYYRT1WZ8uDrGSbnvomR3WmHjjf2TLB
         tDwWMkHZKjxh2wxs+M67J2J39fl28JVhR0hRdMjdtcXsJsIVGMI+4alVGeGaEo3sazrN
         9oMGvMjobNvML/Ge0LaxdDN7gTvcP0tissXYkiER8RmkJYQ9fEv4eJvVEAlH01C+ngjo
         MFFw==
X-Forwarded-Encrypted: i=1; AL+hErGu699j9DPTDcbWHWwfYv9GgPRaBkgQvYhDhmO+MYUB8E8Kv06fMnAd2EzapkMBL67dqCzjuEpZXP5pky0sI76P@lists.infradead.org
X-Gm-Message-State: APuU4Z+rnD5+wrpGGoS40oB+KTUNaZIyI6B6FkrMZZJ6Kwo2fmRNEjm4
	4d0u+3ScptOM3U9Gs5N75fl+uoKzzUQYHlQT2tAnXrzRPHOgWfUzrQVU
X-Gm-Gg: AYBFou3Nhkrnsc7W+IvPyhHMQuOs7Cz57216HvcgkgoVmTywTEgc1nVhU0jY5vNQHC1
	m24pu/qXKY8SeRzZYpv6WgC3nr60ZWzuHxF4GhwwH+/KCaMAleH9tr0T2f3qVkT5csW/2n92R3v
	h7lp43Xzo9usicXRRYGprqiBwIhCLgeUyDz0SBYQfT8OewsYzcsu7yB4u43KlUWT0ocGmncs5lQ
	fT+XLwdIFbYVT+PMHjkg+tfQomTmb/pfz/qrjvTFJezpBwx9sQNQX0+9T33Ll90JrSoUZeEsNJV
	gt1l71YZuZrvrWePyP8lSxxl74zo1TETOwmkwczMnoITL6VbzePQVOC3hE8hoi2HZdQR7GULB12
	w4NbXwvtnsXyc1gJixtI8BzoLVXn9ir2dbcvh9omJyTIpZVcpeedoSRoHvLvSLzq4jphAGuyG5N
	//cVE6QlJsm18GjbJQda1GNyuCK7GjhGmPNc5C8BkG/O16B3I6Y3NZhsFWiTAGnj5J9rFw57j6H
	GhwNo0P3GkSGJED5yerFjdeMiGTAFxqPXgJWS45zA9Vo/XBZ80DhpqAlGnH8W7d+4fyaS+uHyYa
	ZCMh4+eMi2sRuPq8P2Gze5dcBJ3o20+9o+6rXk2ZB1kNf95J2S89xjcMGxTO3YoCfotazaKjQ0N
	+R6EWQQVxXSPXyOepYc8=
X-Received: by 2002:a05:6808:1691:b0:4d6:9133:cfea with SMTP id 5614622812f47-56cd8ed24a4mr4376780b6e.47.1794602115430;
        Fri, 13 Nov 2026 12:35:15 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:14 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:56 -0600
Subject: [PATCH RESEND 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask
 width
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-2-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1505;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6k5SPDasHR10JbeQ/goG0GjfXjoojCF7pZ/1g9TWB+w=;
 b=GGeJS8jm21rjpv1QyTbpsKBtZCTmbEes2ARBh8p1OfaWD0t2XZ4J3BHySxW23bkyOdUv48ruh
 PRoIkzSIg1UAt0oRD1ii2tTNNj083KeKa67msj2r1YTGbGXjFo0ryOP
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_123516_731717_86D5B8B2 
X-CRM114-Status: GOOD (  13.72  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0



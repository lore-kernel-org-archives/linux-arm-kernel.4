Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600BF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2U6r+ojI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0vfiFJX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=; b=2U6r+ojIrswNMK
	31I7qq0gOCs9CQlbblhy0LdBYatykTqsOZ/rDdiBPx9yUSXJlv2xa6lHv9RaJRXU95x3IFmjcNTyz
	ByL2Fl0WCieZEZcGuyFjLlOWQSMQ1VxFhm0uv89tSflJHh92pS2vvKVcMgRyNc/YMBj3c+ofIhfj9
	N/HYohS3NYka6ConzLretXNKICPmA1ZyWSeriMnxwTqlWoVuI6b1kjDzbz7+WkcwSIeDcuXWuR+z7
	am80i58dg16XKyfOOmjMn6e4f6lVwV+JtLxJmCzl9CXJfk0D7qhz48KHGkn9aT98jHA0s2X/zRiPM
	R/FO9iCjvaGVOQ9Sk3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULU5-0000000EYtS-0HcN;
	Fri, 20 Nov 2026 10:04:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULTy-0000000EYpy-0eKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:04:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f020d0169eso3574755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169077; x=1795773877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=X0vfiFJX4o+E1TB1Eqm1EABIWNrO8dKhjs5nUGf9iZNHWrDTg7EGwJERFcLy1TmIZ7
         q1BYzPYrrxGX4FT/La7IjxrLQ6ia0J/TSIfDNRPe3c6+Ma/2MU/QKc1SgGMxpJEOJDjB
         z8Cg/b2R7AmREADaEnX0R+tzZJAs7DkchxQdxrWgBR6ZifMeUiq1pjv6P8+TkwOSVApi
         lSCVm8m/I9aEB6ql/0cC2kGbcP4ONlGBc97oipRbz1mNg8lUKjPfEv3sljVc0vkJOINE
         FJ51xrOWHQ+Nodr6pTzRJePYc8T35B/hybB1Gnr7nffBKeRvWE3V+APUpGwqwJKc76Fm
         OIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169077; x=1795773877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=EnEqRWc3CajDts3bJFDyUZKQkXqwI5ZKrsb3iI7S4TKnxNCTuz3fNzD7EWkXPMkyC/
         ci3JDGn7KEd7cPP2k5F8TdHOWrHKeitQ2SPG5WxX/r0QXySljn8iCsfIOA4AjNQGrjmg
         5nPcDZrOADgnfBqzCWYhJa0W9B6siJ2a+0+Yz7XK8rVjDuPtd0c65oVnay+keJWBELR9
         Y54ZtEHSEnFuCxeK9K3G/WPXJWQ7JivDZXH1CaLWTUqOziX8hIg4cx5ldF/6iLk5Y5vw
         6lVO3lgDsJIJMoQ0IGoCAA+8mWZkFPQZoP0J1OQwh+x9G8PxuDP+GVOejuGtOlu0UuGN
         VuKA==
X-Forwarded-Encrypted: i=1; AL+hErF2okkGc2GBCDVNAyrfxvpgZv57+ExhDRwz4r4AvWKVn440xbT6KbLgq6MZUS1NE5T9IsFnM223r6J9+k4DdvRm@lists.infradead.org
X-Gm-Message-State: APuU4Z/TPAGwnnP3M5n27MIJe2QyfONiE/AXK3haRZyU0iXmbnYa9/aT
	Btu+AJI3ydybwYH/zwZH80tBNu2E75ak4Q4FHNr77/iOsbQDTXjn4ZGPUeVIUg==
X-Gm-Gg: AZFdTZfu8DejsetqsMpqLORpEwtLEmv+wgVlH+fyA0vz5ZUVu7o1AKhDa+yx6qqhA4/
	RZ5tEyuGgQzQeojtyph8LRiGDJZc5OWHXrlD63L7dy7iHgHGB9910WkS/c2Zer1xKJw9bsCSW8u
	NpDiJQtIDwxeJaMvH/A0vf6ix2MN/4tRbKYm+twAiuUFMFXfyJ6LvrT3055ngTvXzEEi4pVp0u9
	S63yXYrDPlSq7xWwb36FCQeP2p+h9qZMmGBlNQ9/F2qyHQQ4HKxOazWlnvKLsj9gqLjj/9bs7FR
	FCRcnevbLfjjY4H+xweL8gdLuaz8YOySZ1hGxVXUosSdcinDuUqUrrwoSi2fIL/2S0MB9OgCA46
	91+DnE28lBjDzH3UcLxP02nyDTgJBhWTHbJTngSJBdO8W0pcmYfHc62Pn9p/mWx7OYZ+0tqnhXF
	fqUOorv2Z+4HsnoSJf70xAZmYds0lbwulHGhbOzCT9PUbOwBSXGeFwfCxSA0tgMpJlt0soP9W+R
	+vY80IHOdxi4+Ffp/Fi5A9o4h18n3bXKU4APUJuslnyjCRFwMf0DFZr47B+ktu9YRjO7WMBQUXU
	jIe0J9FuN+4+677SXA3iNVfZhdMkyRUhF5QSD8wYGARTc0JbjBIcLphgWoCzUONYItS94wiL/R7
	oTdBBwvBis/Kd6h7n3Idls1hj8L0TRsxGxbqvG5WFpv8DHYY8EBjOM0ntz4wJQ/QbOU0=
X-Received: by 2002:a17:903:2c50:b0:2ef:e20f:3edf with SMTP id d9443c01a7336-2f03f17d2b4mr25759775ad.13.1795169077039;
        Fri, 20 Nov 2026 02:04:37 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:36 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:08 +0700
Message-ID: <20261120100408.8053-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020438_240057_BD8A5F8A 
X-CRM114-Status: GOOD (  11.10  )
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

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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



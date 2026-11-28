Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB25B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 03:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m3RNf3Be;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnpDQACx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=; b=m3RNf3Be8G8rOP
	xDz/33RsM+UtGHga3S7bhm7BXe4M+ApSdDHKg7uPUAUpf9hUsBMnnnJBU1kZRZyy04UCtlX7wrA8A
	8VlElxQEJVEeUOSWDlWyl7ZuXC2ptQEuTpLQ7ojllBVEA9BIb8a5/PwndEQ0FohB4a41YEaF85tmU
	wNm7C7e1TM4U4eXYecKs5JEmf0bhY3uWNC/6yuS88UzsCTFXnMZDB8atLtFNWr0YiWZk3P8AcseCy
	apIt2q4tTWe3R/RsaFwZcaeWHnnsZcbf9GxozEFm9jGz80rxTvirxNGQdOxu/TQcxGzSr/0zQbRwm
	odXnQMAcnMkiCFBIQCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9X6-00000000M8A-0HPr;
	Sat, 28 Nov 2026 03:55:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX9Wz-00000000M6e-3qa1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 03:55:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f037bc348dso68693935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 19:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838121; x=1796442921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=ZnpDQACxAr5CHsnktUsBYvgSGGMtBKB+fcSe3/t+QQWW+rFu5odmr+HnAHqy9MDhuW
         chjyyVtL6Ymz3FzXyEeTSacYz+qNxl0qrsQJo2y/DmnBjUVIsUBtbh/zC1snXT5TEvgN
         Ey/4H3zdq7ru4uDkVaLVKM9l+Is5VR4f236gWT/YdFgfLmgpMO6y6yE5ALcDZSNAtvFF
         E8PNCuf/CLrmIpPD7cONcMTyLxl2h+oFQGOw95PmB/nM+8LIs+dA7yPrRC1G5GwUpVlH
         /WZaVXumto67LOSA4EsYGH7nanYxe9/fDwB/zFwD62onH7H6x43rJ+vqIzzKxBTjW00P
         Bfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838121; x=1796442921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=C4/LyEUtJo4DbulZgR6XtoQ1rpm1/C0zOeg4OaQLZv/vUbr28IFM4tDw9yngJ9WTae
         VeaK30DZb5dCYu8YSzmMco0cqujbUoQ/RbXDAGvY+Xp3/dNqRHqrDB/GFDD6GPgreXdS
         fxzFzk5Vv5pu8qDfw2ZbpdzAb3B0MhbtPu80NzsEbyQK6OmoaIbViyNob15fKXBpsnkK
         6gxX2d5QG6ZiEY7TuFHQ+7tJd/j8nO4SYrfVS952hNJY/gaa+xdsGOw/Gc2owttdygr5
         ynq8+CRhnq84v4K77BVbAc3dDQARWpHeDtUfi7FikdcHXAowyLsSAkW7LYvrbkxpxBH3
         bwGg==
X-Forwarded-Encrypted: i=1; AL+hErGkVilauGaUIpIakti33cEAOsOgqfdPA/JXOejsatuezy9+Opya0w8jW1slWON1o/AADS5hUESkn/VlszVCAkIC@lists.infradead.org
X-Gm-Message-State: APuU4Z8lba4+1FNBJRN/Is210jKFI5CD1YTVsTxVGPUM2/+uwUPjY3mr
	f34Z9tTUsahRLn2ZCb/C5z4qqc1LYv8oqYMBCmUdZr/zmzKXi1M3+DjT
X-Gm-Gg: AZFdTZfPvIQwIqI8aO6DgN4sr5ZAUxmYHmShQFzeqBn91iBV1FU1yrSB7O4Sa/TVvRd
	Q+Q5PPT8vBf/MvivBnOi8Uv+ywFi5cCfRdaq+mPz5pBxGOaIDSwnAlWCbiQJXAuylb5mp5P9OZw
	o8g++wMGpLnL8JqTUapBAcuzR+7hqvt17/7HA3q5eNREaq451YKgY0hti5j64zz6BpaySsK+yjP
	rckd53xR7cqdFcNAUUqr0lDBKL4M8hZuoSqTIERUjNvhuH2vCbFog1Mej2oUnmEzGUPVzd23reW
	7vHvO+EKA+2xm9qRlUfNflGPiH/HhCA98vkrBqg/mDtSxaZ8x+LBNMUP6Jzju4Zo4mbH1GmAbpq
	3cT5cfWvR4nuvZ21pC+DgpKlUqo496+SVZ7MiMr/0mr0cJZcu3sznyiGQ9tBaThD02fADzZFBm0
	axxiG9y/fl7vKucZo8mDXBfOPmc4JR58TU1dIVD0q0J+ypoBj9rgc5ue7Rcks1hbRn03XCKVUf7
	UWpmV/HDuxMriE9feK2rw9pSLJb7Df2dKIs6tguiz1Lzt1E2oJlKHF81h3WT+UiFzyAQeN1yC29
	3o6fDiiZTmpY6nI3tNvO06NFtnk=
X-Received: by 2002:a17:903:4586:b0:2f0:1f25:a4f1 with SMTP id d9443c01a7336-2f03f1cf6f1mr284743595ad.15.1795838120840;
        Fri, 27 Nov 2026 19:55:20 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:19 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 3/3] perf: arm_pmuv3: add Phytium FTC310 and FTC664 PMU support
Date: Sat, 28 Nov 2026 11:55:04 +0800
Message-ID: <20261128035504.760778-3-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261128035504.760778-1-idleassetsd@gmail.com>
References: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_195521_977574_E21E9E54 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add PMUv3 device table entries and event mapping initializers for the
Phytium FTC310 and FTC664 ARMv8 cores.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e0783..42f043444c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1559,6 +1559,9 @@ PMUV3_INIT_SIMPLE(armv8_rainier)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc310)
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc664)
+
 PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
 
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
@@ -1613,6 +1616,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_cavium_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
+	{.compatible = "phytium,ftc310-pmu",	.data = armv8_phytium_ftc310_pmu_init},
+	{.compatible = "phytium,ftc664-pmu",	.data = armv8_phytium_ftc664_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
 	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
-- 
2.47.3


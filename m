Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061860A2621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TIvexOm2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ri8gtrTd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=; b=TIvexOm2dc/jEF
	n4eIlJzu2H0Nbinb3DoNa7eJYqyQQdPwAGaVd+u1UFDBHsKQbX+gbflKh5sDPbqIe1CgQ9ib/pJcr
	DGz9L0Ym/dIkerKCI7P9RWyxSPLPNJ723yAvYh0f1c0si6TzBVCQ8cCAhN4ygqCJIOaHP4jeQCE6L
	y2oR/MEXroh9ttD6iWcmFlXlBKDFvv3d1wpMOnf02Nc/FqI5MAjVP7pOcPAAcOCMZkqvnuLIu/mlr
	i4MZtt3KDf5Zxk23atjtgRPTUb+MzwRHg5gGnxwgTvpiPXNx9Iat/h88phBzv8v5Om+cGgTyh9oKt
	tLFpTYxsYr9sAR0QBlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTU-0000000BZ74-2xh7;
	Thu, 19 Nov 2026 10:34:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTP-0000000BZ58-3tjD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:34:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2efdbab4e03so9414295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084475; x=1795689275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=Ri8gtrTd99893rV83LkJtlWqUAJ8AS2FIUGPn90BAyAivnHDj6Ryn7z6GgOtHcAu1l
         0KQqBurwa5e8f821NiDOwhbbGDm0s8WXHbx+j0+eF+h9sJoq6z48cFcI/rO8PWkv8MWr
         c0NFc1+6c6jXKuuJwDnlZRrUGpWc8aDIbZdOLooJcPElt5+R3hXuylS2t4OLFAvTrznS
         vtMGwjYRGTX0+hfO8MdVUhbO7B2bVcgoW21EChvSxhjr3S8p09hM8zW/rtTqtultr+st
         Ak1xvCXKpOzalGYmdvTUpyre5Sc9g6/VjEzV5OKOK46/lQEJUfFROXlR2afihiiANZ0k
         EpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084475; x=1795689275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwBH+eIxP99lWtxI1I1+C/1djt449J2HrlK8pIk4vKY=;
        b=FVEPfFicwMdOGen/fdlU3jLSPYR9+4eFF1J2kZEKCh2knx4OnPw5FUggWP74df8PGi
         YHeyzD7HMy0IX4dJ1UJGvd2xP2DDzXkaXqUm+GRK8WbtsMAkMNpQ5UDHP+Qc2rJxmEgo
         srRGDBALD28FZT3wP1WdKPxiAzarVeaKW7PTE72ornzsNWSF6f2jqmU1F9qg6f9o8g+5
         iTm20IlD/mzy05j7cWXRAXj5qVUeoOqjN2qQ1dYlUWCZ+q4DW1QdbZafBBeZ3pfC7SzT
         BcX7/OJQRQxTziO+vT0uxn7bngiHaOexAvcy7YsWtH3NKYkszYUQlgXrllUTnofllz6o
         nYKA==
X-Forwarded-Encrypted: i=1; AL+hErGyrrnz3eshgif+ZSdXvnZ/nli/XCFSFtOfiuktbr0gqiHzVwAHptTZErn8eQeOtGKSPea6xIpSMNFpB7jPbaj3@lists.infradead.org
X-Gm-Message-State: APuU4Z87KbYDVTT3QzuHbYPAF0LjomMpqBbUa473FuZ48Lwu2SozbFu4
	C66/ftr5qDTO0bc9LsRcUv4sDDXgr7+IVJq99V47MEsG/zyb4mnq9Mht
X-Gm-Gg: AZFdTZebOW806AkhQSbvcYcsu6W6UMwhcXLva3aOzg1wuQLgFh2760olZ1fCpnlKXky
	sejs+tWZ/cP2NeEdL+czmTfMIGfOwS4G3J+XnRPq6FmNcHM7GOlhOzcxWR9vyKpxZyprXHMWKIv
	ETLAmHy/odH/IEb2qd13FpmGlBVfhP5ReeNSqVRBbNsTQCQySP9LAzLvcSRLuj9WDREJYqbFi7g
	LqSS/6vpT3cFhgR+OIPJzjY2DQ888P0rbf7xqMvL1rC/9Vf2g4KXBI3TatbeVXr2KYpc6Qwf6mK
	nY+iGQ7U01ce0GQJ2Jm34MpSJpwYKQBkg+k8t+ZFDZJEzX0L42dLsnFgnwaiyLrvYMZ4I//KOl1
	ngqsP+0g10splM6lEeGMVHObZKcN1lfpXYuV3Lf3wq5YCogMLcbVmutSteD21kSiQdJ4HjNxvCn
	dqAp0PL3c+B76rZSjPyVTgbEaKYVyy58kIZxxQGljZx+KA/Byy8q4wuvceVb5DlCpkjzghVVr0p
	TQL+RqsFxCw/d+03i38VPIgafvlsoq8rku1YzpGFaDZ36LgBw/myFIG7rJY5ZZfgc88KFHpYyed
	XF5SPVgXHXkvH/6+y2fxA4OXq1zsUL5xp0gLRloEN651rwKXnTS+XVblsbpa8Mbz09EfidtpzRX
	MU/0j4C1gL9GnkVZl95xJkxN33+eHwDbAY5Irl0VX4XFqvhGcrVtOKVbqfKzRwHveFQ==
X-Received: by 2002:a17:902:e94f:b0:2e9:5714:608b with SMTP id d9443c01a7336-2eff74230d4mr56015135ad.34.1795084475267;
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:35 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: atmel: mchp-spdifrx: Improve probe error handling
Date: Thu, 19 Nov 2026 17:34:10 +0700
Message-ID: <20261119103413.31729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023435_977208_C63811B1 
X-CRM114-Status: GOOD (  11.82  )
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 63089ac3ebdc..7d80f35576cd 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1116,21 +1116,15 @@ static int mchp_spdifrx_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev, "failed to get the peripheral clock: %d\n",
-			err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get the generated clock */
 	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		err = PTR_ERR(dev->gclk);
-		dev_err(&pdev->dev,
-			"failed to get the PMC generated clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the PMC generated clock\n");
 
 	/*
 	 * Signal control need a valid rate on gclk. hw_params() configures
-- 
2.43.0



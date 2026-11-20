Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G4ih7JGt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ4sA4nu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=; b=G4ih7JGtbM3nKP
	653902uRFkl/GX2QsqyyUktrdCe1hpv+sf754Ig4QMvyPP8pTtWxY5MCuGwZK+XhxKifdEM9VBahc
	9S6G1Xop94bnw+bVBH/cVsiza6CJ0+TpV+fwIOSn2G04rxgXbsbYo+RtAM0jq3tijE/74uvt1PIRU
	6i7iBdrHzSwCXb2rIEo8CD9DmiDIx1SDJCeCLzTth6FWemRgAty4sMt/bPOHWfhuwdT58eZefTmLC
	Wpp+GeOOsDRoXt542t36n52OAW7BCQmvZrcDTv1TX3gDvPrgBOuxYufQGtlGmXIji4UBSD6CHyIxr
	sB7QQWmMqLElepcklI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM9K-0000000Ee41-36SE;
	Fri, 20 Nov 2026 10:47:22 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM94-0000000EdvY-1yjI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:47:08 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-15ea896ddc8so1280873c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171625; x=1795776425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=eZ4sA4nubY7PdaP0C/0WGg4kBxR+/qgyPnMAG6n88+ZnFbPS1+bPh8FAQU1K0eqJKb
         4u6sJPoVZhbgSS5v5DSyq1mK8olDDW41CcRuJiVl6Dy01Vqr5XhjZEVE9xjLsWOM1Btj
         rBa8YvZi0hn2JbV1Z1W7mGkqcG/XHiWoXK3Bdh8Er5DrXS7ExFXZTv34kwJ0wU+NNEsE
         yGT91mPDyJLuSEVSR6Au271ug0j6wn+73d5IFiWwzkKRmSSOmmPLeM8wnGEvOqAqc2MM
         YOz8GsEmETJ37Dy+Nk12tNN3UZCZui8OMGd68YrYi9E+wn3G1NT/CS2vuI/yd90BlDyg
         iqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171625; x=1795776425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=XH2AP/4drdLeEeG/3EvQGELOEJixo8IdMWcBj7JzAOzHAlVwFh/AAD/K8gCb5CPy2t
         fesxa14CFsoPqof8oRkVWzj+qahFp3Z59kjwiFmFaj3v4Y4JHhQbfF8U9yRI6HIMrWrV
         nStG1GCjV74b+H52PuQBNwVTVEzkbxV2haJ4garcshf9VmN3gtbisn9pQVVyqBEkbtcj
         qawXLmEoS84R/3y3/kuvbU817Fu4OJwK8DSgX7EFwEIyPIVh13mKdo3DCLhk13jSfsnw
         oxODl1qw1JUxRiTZDpFFW8mbSUqc0cCfuAetuwsforDixH845yHRlPN/R5LSAzCTm+h6
         7Vww==
X-Forwarded-Encrypted: i=1; AL+hErGufwAguvv3D2G25gk5VrMXND4nORInDCu2X4UC/tWpMIH4H/ut7P+uAsqFntBYxghw0ZL/YeFN4fT7yh+RM3J+@lists.infradead.org
X-Gm-Message-State: APuU4Z85Crsp+l2gqZNWwwV7KI6kyvDkx9nyvMeeqZ6iF6gVS0g1mYqe
	DiOkbtjjDbjqbcqGlqbTdI4lttI0n3NW/r2IvId2v6+GzLgpenQrJkws
X-Gm-Gg: AZFdTZfmMGZHaoHgPNlP1Gf81gDWRUS1wZAy7duKn83IdQcRKa2tARFQm6zfOXTWlhx
	IM3CGkiewc3zElTJcckgkVXH3hGi/Jo0t/wiAk+680TfxyUs3FXc0kiN50rD4oJZPLMK9oFSSP0
	2mD/LjgThjmtGOQ4JTR8UoaOJAYALCKnpxm7l6Ax8/PE4j1Mgp91JShXxv9XyRGjixgtyreSDO1
	BymG+jBo+BvQO15bGR0gfoWn6+KLyNXrLclTP+OzXGCkLTFG/3Nnz0zPTqDOfyK/QEqoSNaNlJK
	vHq3nL1/9gOoSIn+rCg9J+WnARezSU8Z+1+NPkd9NAa/2yBnvRFqd9IxcASqTPTpMiuntFHBCmj
	mvJjQDLMvFs8CQuIGuTRXsXd1RoFYAv7WiMQKZ3kEsIvojzLiUAf2QNd5+YcLYsye1q94Mh/ucP
	flrqTDC3BMoj/VcX6UHjiH2WYNLyrVtwDlsg9o2k2+LRxqCeT5naSF1ubncVS0bUJWJCQVpX7ae
	+Ok/CpmMxqmJUYBs4kf3j8+xYUwcYKWTz2YSTWdE3aMENDAdWD3BDIINMugyK8HF9x6oBt6HEXe
	w5hdeMJXXmQLg4/cMBR+v+kvN3XQAs6CovVWWP4iqtcfkQOYjKCwMi6fhL9bxVhbqBjRxPaXSuf
	EArR8bVdc5/nbiR2cLJVkI8yy3iTc6JRYiT6ZJjIn8DW5
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr2179350eec.16.1795171625369;
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
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
Subject: [PATCH v2 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:46:29 +0700
Message-ID: <20261120104630.10240-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024706_952545_AD03F88E 
X-CRM114-Status: GOOD (  10.42  )
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
are pending. While ISR is marked as volatile, IMR is not, causing
regmap to return its cached value instead of reading the hardware.

Add IMR to the volatile registers.

Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
Fixes: e8c8e9de4ee3 ("ASoC: mchp-pdmc: use runtime pm for clock power saving")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 8b55d864f3d5..4b380dc8b6cf 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -842,6 +842,7 @@ static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_RHR:
 		return true;
 	default:
-- 
2.43.0



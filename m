Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D222F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNcj1CXp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4QcmK4A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=; b=HNcj1CXpHdxGO7
	grWLaFV33BRUvS2v766aKInGxN1uU/1nsqJ171LlWFcOj/pACON9Z/aBjRBWZAM5MhZSjpq+ECv0K
	2+HLl+Vq336ybFbQ3Jk1kuCt+Evu0SphcgB52WCE2ZC3EPaBDt/alUKcgMx7Yt/PQAfQMiDT1wlun
	eIEBfJyykiKJqyePiat32M23xnWOnc43u8CAX4VJI19pcIoLmjA2zKH2EuMr37KNSOq0ocUZWK5IL
	cxLlivWUUusSwkOqIezcTFmXsdWcejRf0ITFSP1XaMK8wZcgq+XeZQlM7k+GZ1thkQ2vLsl4lbM68
	tZL1KdynCOCT4HYuPVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTq-0000000BZJX-1TZg;
	Thu, 19 Nov 2026 10:35:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzTf-0000000BZEB-2bxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:34:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2efd659464aso8481225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084491; x=1795689291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=C4QcmK4A4L4Ac3/xB6XLydqasDKyd6Gvgxl/IVPlYpSwblDugQRRb6kmM8RamVjCRa
         ejWJBz/df1+fKsTc62z3vlJhuboqlbA9cqwmm4aWabfvbCgvVClNp+A0NXX7N/la6r0D
         SOxYxY13WdGKNgEL8SOEdFrLQrgTaMZ0natXt1b/lWO35cQKnAFgPw80W1PtJ7Wpc4/j
         xHROOc6Rd2xZh/DKQnG2cIEFqbvNFSRNEvzkaLxWiUByx7qNfdhlL1f2GFvBnO2UU35+
         lAEbakARrWdN9fAOXF8FVvFPulkGxZQuZDBXeUd10Dq1fF+BqUpyB0Jx8xvXH2x9ePi+
         WwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084491; x=1795689291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=l32F3yWOMYXD+jmm4OH9LAlaDlLu1hJzFOVqXOd+o2eYqlbmhFJsT/ToZ2fu7m4C2z
         EAvhOs4F+jm22UAoLw2Bn+8Hhdcc6W/FQ6AgrV2yY3VwZILMOm2ej+U8fxyleoIUzznw
         RCSOuyQLUHEXtc2h0UdCS4BytcnpsN0hQxZED4D28Ur56oE0/brEywfSwYdZtdAXEk3I
         oiUWDJhLqXx2IEwDNSOpK3GfTL9sY523gAD1KagY/crt3QkQMRpBb1mpNWdQv65qh/op
         rU4SNd8X/x6X+nP+WD2GcoOi2P+EQnui3ibF+1ysnjcKVjWLyYiRb8l/mKQp75CBxZ8w
         9oJg==
X-Forwarded-Encrypted: i=1; AL+hErHlPRLx3/u6tUUIi4NWJtoscp4lB1uDH38orPEgR6Frhr2vERBn6h7C094idWUZEwxY0lvC1A5LPt0vFqQ/SaFY@lists.infradead.org
X-Gm-Message-State: APuU4Z9pL1zbXENkDumNkRuKGtGn/ckXJ9gruGpClenIuLXdYorkejLT
	JUh+2pHeBkmtAqEf1X4hOPSMlJ2oXxMpORHw8xsHB5w6x1YxWZhbaXwH
X-Gm-Gg: AZFdTZd7jWruZ1TmwdcdbQjy/OjPZTTrIyBoJevs9ZpWDIgdPYp14pe5XRIG18JWxqm
	AU7uoXo+lCrZXZrJrDZG4eJY53/WKlRgs6rFBVqD6J4j1QlLGoxv4KnCF2Tn2ivVmBPYgfKXG62
	YrqTbCdt2MVzOr/CwfeS3962BbDVjb1XJqKSac67GOQGnMo6PYSdIH8GXFtgsnADaXhU9SSDMrh
	q6LATAC3evO7cUgYeWFaJafpEO/JCIEYo5Rsyj+kgvFyOzvJ4vi9IMZ63hin5rDTnQpUaWvJ0rR
	4mfO1BdngwMpnz14SY6TfKvcxOoNDHCaXB8wLXM4zDfAB29OWkCrRYiYJl6qGld1VNt0eE7SS7F
	y5ZnhAHDTdoN6oxSc30qsNY02pM6+9lctSVYKPKcFjjwrBE8O/Fx0Wit/J/wKauQ375gvVRnx7f
	lWMC4ssebvudDnGZEMrvwso+IexDWienOKGdp0rGFv89aVM76CPTOWreC0rSHwMePuDx+GtsGYL
	cexExkTNdubI/wYEKw853iQvsCipnB0d0WGQxGCI/mht1S4hOL9dZgflswU8KwfUn62LNxqaVUl
	sHFpa7kTyQKlEdEeMcdCfiIcdfoINGgt9XAMw9Zg0QcEh1C0z7axny22H/LbhM8p7g/NtIe8V4u
	2iN0H0wL3F2sZNGp9prSTwokhb53cN+PSYopO6GtUwelE
X-Received: by 2002:a17:903:3d0f:b0:2ed:379:1592 with SMTP id d9443c01a7336-2eff740b594mr54610445ad.26.1795084490872;
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get
Date: Thu, 19 Nov 2026 17:34:13 +0700
Message-ID: <20261119103413.31729-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023451_677873_04093AEA 
X-CRM114-Status: GOOD (  11.41  )
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

Return the result of pm_runtime_resume_and_get() instead of
comparing the old and current ulock values.

This ensures runtime PM errors are propagated to the caller.

Fixes: c7db2a594389 ("ASoC: mchp-spdifrx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 41c65e835765..632da8d7bc81 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -709,7 +709,6 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
 	u32 val;
 	int ret;
-	bool ulock_old = ctrl->ulock;
 
 	mutex_lock(&dev->mlock);
 
@@ -735,7 +734,7 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 unlock:
 	mutex_unlock(&dev->mlock);
 
-	return ulock_old != ctrl->ulock;
+	return ret;
 }
 
 static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
-- 
2.43.0



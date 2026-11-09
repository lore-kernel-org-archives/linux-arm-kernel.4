Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37466606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mJTuCfji;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHWN9+cf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=; b=mJTuCfjilBSIAiv2aeFMIDOK80
	owru8jm+M8aiYatxDz78GM07mbnk3zpzOkeJAwjok/v/edh0sp5D1+naXyLM6toLSsCqw6STgGITC
	ndFuxDxETu70OeVwKWzf4d03Whlk+KS280e4joygux9Hqr2tSkI40IwkvcPBvik9tfiypgfAYqMIQ
	mohLZVfdhJ76+pBWD2dojzXBLmPbMkNy/f2o2B1N+W/B+gWwtFxmPSwzNcRPjUKa6QBDZqymW3DmY
	naa05alhWADNfRN7VittOGwc6DvN0IgqtK6IftXFRsLWRL8nDza6lWTrhke7oEnb2YqfnpR3BM/kG
	1nivZmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVL-000000013Fh-3BC7;
	Mon, 09 Nov 2026 15:41:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV7-0000000137n-2NU5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so11294605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238899; x=1794843699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=CHWN9+cfeKiCA6/s677rO1OCod0OGDGy4NnnVQW3J6QqAUpvJmNqjpkeMvemvL2Wk6
         N/rhdTJCcEUia/GwwFN9TtiXPwCS77b/eaYlZQ4hBfHR1ms/oIogUeTFFuvNO9QrbnF/
         4fGdeoRm5b7jltp3IEAF65Wtc9HYXAZYXvFHiiFzj4SqXVA5y+aoZLLeEzZCaBSbv789
         LjZxtFel80vvE8PC2V23yKI0MFeuj0U9Y7hyl/bvX0GX0w4eftU4tO24ALd7nDujsnkD
         B8fmBk4Ixpz566/9f30BcokRJqHAnDLOfUE9eGxLjK+JNCsNdoby3y2iFv9GOZG9+ugR
         JgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238899; x=1794843699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=xvO4IYjkDFPa6cU2bjaJAR5myVfABERiv9RWRkl1p8fIyuaozXMl2lisnhA7lVq8J+
         4py3laXqbRXLy3aMPrswgdXF6K2TmDi3YbhT24Y/1E9HrSme4ibC9n30BJPE1kmS9h2z
         K78LsoXV8qxCNHsr6rwG5NXFZ31QdCVXlq8yWrSij/5hFgddERrLtu4lhqDGWiSWtZDw
         XYXifCn9cFPLDN5qqM8WGF+HnfDLN4sWrQEkKU7LYfuH9AD5ml+5g5Y0WakYUCK0DaZH
         bvBiDAc3rmTh3GvF4VikU95XTSQk5+9SwuB2aTNDeFI7NWJXAAinzanEiS3emo8NJqv4
         o01g==
X-Forwarded-Encrypted: i=1; AL+hErGEMC509oW5c1nV5Ut3Msiy4d8bm2wM1Qb6/thf+QZ2miXd40VYTaZTpobVl9fbcXKa6pOwGTNCIDfL/3rcy16p@lists.infradead.org
X-Gm-Message-State: APuU4Z/F1JdLoye9UIN8YhBJXwH2EX6Og5+9nJeJPZCODeQiWUs9gE1m
	kdeeZcEtI0Xn4sW8KKB8zkwQ4ZyvzSU54uOXEWLTe8TQOEKMCIswuGX5
X-Gm-Gg: AYBFou22Uelw8QCgqtQTiL26fFMCJkqZTMs10AIZCiCQcoczdvrlKcHqZbHVOFMRHXF
	4BrpR2uoMFwZQt0A6Q0KRicfrf/cWGioMCR60jio9Q2bi6UOlGtkAnmAsfJz3bYWYGvMh0QhGuv
	Y/TvT0e/4FCbJe79jWS5FY/H9ndziFwgCxekPvgeL5FlJsugjKz6Xc/ehJoulo1l1K9u2F+ieMa
	G1tOmCjxMwBVf/WIuCxHOqADChB8+wl7TDriLm0lvmprLNkWvFD5OOPHZO0bga2rwJlW0VKyykj
	QvHTTlGgOh9SL6O7AMD0lZvWUeWjHoajcq4yMbZsdHhK0F0v/GkL2ZT5Q6heNYbaS26vtohV7FW
	REn19cCt3zB1wRNmsD0dcZvFw/fq49ce15ndhRCetKaEqFicKwp9SAq4qetuhxkrU7u4PFjQk7Y
	ORrHgrPEWeVyMfwyspnGljUWxBPVgDRLpGRbVatgm0V+I/umyc9wR1+ajWXT1k8DLrY09L5y0Z8
	hX3zcM1eNPnRwrrJk4g/XKE4Uy3EOJbZcZb1fBaIFORO9Gy+HFnW1rGeYQuqGDK5o/pPEq2bhOB
	yh9YosWCghatAr8Lw77NCTZy5FYLuiPXMFR6n8u91dZP7Zsl7BAIIu9Fi6emrYQ+A+/FfMJsgG+
	mlA==
X-Received: by 2002:a05:600d:19:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba00a5b92fmr12877165e9.16.1794238899088;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:38 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Mon,  9 Nov 2026 16:41:16 +0100
Message-ID: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074142_017057_070410AF 
X-CRM114-Status: GOOD (  10.87  )
X-Spam-Score: -1.9 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

v2: Patch 2/4 opened with "These three do not" without saying 
    which three it meant. That sentence predated the aiu patch, 
    and the context was only in the cover letter, which git am 
    leaves out. As a result, the commit message didn't make 
    sense on its own. Reported by sashiko-bot. No functional 
    change: all four Kconfig diffs are byte-for-byte identical 
    to v1.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0



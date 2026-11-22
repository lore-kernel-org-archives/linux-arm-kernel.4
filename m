Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534C606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I3LaUXc3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY8bJMfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=; b=I3LaUXc3kYkLSCoZVvw0oKrcr6
	OV4gM+T5ozhSEwQm+mgWeZJwSAm09HrSv149/qF7J8LvECcpXK4RlAb5Rvd1oYgCGulEed/Ekm8MV
	Mj6RI9vQWWyGZzxUGmaC79u7MaMRBqoycCLxfpfD3Fe1ZBNNnHgiGWrYabgb182EoN5TacAtUwHuC
	qOzta1jV9xjNFExNHb28wMbkSNU1JSHjjwEzHInBVc8wx0bcN4+YzxGEVvcFc1VGwnJcF4OxA+tXH
	hZMhM+XNmEG0KVdzUJpHDbSDjkUn2gJw94aMsOs7Y1mKR/JRmfalSZP/aYE/ayAFbNYbl7jGElCip
	RNNb/AoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1WM-00000000nxi-09fY;
	Sun, 22 Nov 2026 06:57:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1WK-00000000nxL-0itn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:57:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2f052ae3c86so9604835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 22:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330671; x=1795935471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=MY8bJMfJAZZEgH8aJ5kmbTRFVXnGS25GTERWZ8tEaO9Jhzy1i+dNVz4VXL1cah7KJm
         wcRFoMR2YBaN//KdXtCpRmOsuFSUIzEAoOtWkLWXjex0icS3h64X3FciPI4KTs/QmHMM
         TRrbt8d1zU2+lEEgibGutN+1LopAyI1ALNNqR+pGrcRNiQ/Ve4v5vfRA/AMSFhvMDm9W
         At358a562yJNewXF1+6THkY7rEQmi2UrAoSonWHe08ufD7zHdtQiMpPGxZmvbY6VH9uW
         I6E7tmAopcFbVh2hkXP4htb2gGotfBzCnNnkJ93XmOA1YempwAW68Xeux3f8CjyM55uY
         18mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330671; x=1795935471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=TiPvWg9mwbRwZfhJMGhcShbSWZ479aB6NLlOn26p77CTfbE9ndYSju+tT5zsf4fcVy
         nHQzLcIw3BWZBga9cfBxJedSuFRLEo4IOONt1jyOBHeJsMNTbdM8zMp3TSXwhndnvoHM
         f1RK/uwlem5TaYdFg+LjdTCN9CV7bsPrxsh1lBTv/p08TbXcMgUHy3pa+dWRedOfJ2K4
         uvWZtRG3sPTwSPOkDScyg1OKBBK+Cwz2ZckO4vBcNvStPo3cJCT0v4hDBEd6PNzNDd6F
         257pgFES0VqVO56qWtwu+Uyhs/EJY9TrqvhnyiJvKE0qX96/XLJ3Btpo8tjv87oCXuB4
         sq5A==
X-Forwarded-Encrypted: i=1; AL+hErFvTg1gK7wLY89eZ5OQgsxLL3pFTiMKoVjq32NBGz6iTDz513ZUClYM8YmzLu9AmZWYlwHx81Fa591EjmTbkBlC@lists.infradead.org
X-Gm-Message-State: APuU4Z8z2QENDdMGG1mlOOX3BLMcOMbP8iEcVRYAlzqJLB4fehGVTFE4
	HlEfIck43BwlOPK8bbZ04NLGyc4eJH/VIJ564ePabk+gm99gP8S7ZH7C
X-Gm-Gg: AZFdTZfpfdy+5seVETlKVYnrGjyAjKLiykN0t3Vu4lvdrCwRZUTJt/9OnRhYHf6/7vM
	8d43qQokjv2/ZZX8BrgQx281BiqO/a10xNyRNWjjWFbP3/VHdba5s8vNQRp+qU9GuQt23Z+L32a
	eboT58uOVGPaFaaxdWKKk8zqQACx/aOAV8qCS1hhqAQfdkPfQGILPcuzmAozPbnuAjaRGvOJ0TI
	pTb3zKRQxPY+WBnLjPpcp5pcdEvIvHOmbGZVAZ+yve94b78DOv2+xHQmbnRxk99dX3urIBPLAGN
	Lg1BXRulCAQnj1gPUv0Cz4Dq3Us0WI4AeK41wbBhDH5/CLQqm82okndWNQuh/dtB+ZoyR4wjS/O
	BXayYzHPNINOiIOBCnfcaYESfZhdTrW1/4Jmfi/n6UsFH/qPHdlmakCI5edQNWei4gHQDc/Dy2+
	7dwUken0NYD63C32J6N7iLlGd/3lpfSyPkojffHhBfJ8qTU++mzoI9CxU8Fe99kQNL5qEiWSuEv
	d9ITRK2ZmaMwrzxOFK2PClT0uFHEw2wE0mdxK+3H027HiSabbyy+Uvlu9YHoo5uFzbNn4qb2+LF
	TF6NMCsgMvQLswchCqyVlS0UD2obTxtgIy2udUvrvoIytfaCIwDY
X-Received: by 2002:a17:902:da48:b0:2ef:ddd6:716d with SMTP id d9443c01a7336-2f03f18fcf8mr80685675ad.24.1795330670778;
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Sun, 22 Nov 2026 14:55:19 +0800
Message-ID: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_225752_216648_A79FD965 
X-CRM114-Status: GOOD (  10.52  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver for this controller.

David Yang (4):
  dt-bindings: watchdog: Add HiSilicon STB watchdog binding
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  54 ++++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 287 ++++++++++++++++++
 6 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0



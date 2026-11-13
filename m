Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6350606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQNsx2QS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhKYADaF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=; b=OQNsx2QSKn/P11UWi6qetvo7OJ
	OMgEsQCn3F5yaPV/XmGdgH50+/xxwZM9E/3OmnksKBoJHY54qbUPNYEBPJmPp39aeEdr41AOUQJ8r
	63/X7wrc7ImH+3u/6EKAQI9vwjBrOH65eQ/346xH+3JRa0EcAkJf6+plqAn+m1rPxMND7QpCStWjr
	zrgE2GFfLNUkwuwxX9W6lMVWiukjy3UOnpe6ypbmzextSmb/F5Bxok70MoZf8wx/KCUStrIIFxjya
	DQBS6f4ytrG8MdF4pmugr4pFowFWnbv3GDoUIougQuYF//aZFQ28qqyl3f7G/uol+BG4qC8HtJxyy
	3pXMqc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiBh-0000000Bb3Y-3K0T;
	Fri, 13 Nov 2026 03:42:53 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiBc-0000000Bb2r-2kvA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 03:42:49 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36f6295304dso422579eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 19:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541367; x=1795146167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=;
        b=UhKYADaFic9qUvLS7ZzEy6HXB+EOmKtJuEF4uvglfvJPfl1h0zyP5JmCD84FJ2fFah
         hZDgzQR+NyGITJYv6DS9hQl2ubHDA6rrdUZ2IOtJMnyGHBzUXTUPmL4AnnloFky/NLRg
         dJcEp87r+I3CYcw2TMXzzSXh+gkmEbpntBCUrVzih3J4QO6xnJP5KKyawB63wQh556sd
         +Nw1bhRAfdMO3EAV9Curjag6QgC+Q4Img1IU6yUToMZ5bfvXYOcgYUtmRk65F7RN7d+T
         EjMx8NQxbcH9Ga/9ZoMPnVR2K01/tr5lCs77jGe1DSoQJobNlW7MpcjcOtv58m5PIHID
         hXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541367; x=1795146167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=;
        b=O3AhbfAcs7cHg0gTnoSSiXDc9mtuUuio9YgjI+KrWXlTlUrCInM3Afsa690IjxmSKx
         5iYpIsuIW93S1nAvWUGD+5EvX79//LTx9xF6lneS6b66Bjue5/sIKEQ22FrT6odNEVIq
         isSRxq/vigmD0f6YSKlfpV2tN04lCNJ4Avql5VeKTcVizMw5GsG/Wczsr4nitUdRUvvO
         ZzwUKPwK/9lYkH+soiiHxKM7NhTdGLGKibYElOqbXHG/hwlWOetgOdStL/BnvC6khCmx
         nZS/BJZyzRIGPJqugt4+u6SZUsnYjLssS7/njIqjZSoh6IG6v5niWy6TVHbO/gC10BYT
         dRyA==
X-Forwarded-Encrypted: i=1; AL+hErGLvXlkpoB41fHJ5IENOUBLL1jKFnMU4T09b1Juy8youJkN1IZdicOW4B/mt6Irgyb8qqA/Gw5m6yZrJr9ZsigV@lists.infradead.org
X-Gm-Message-State: APuU4Z+EaZHlObjd2Rx76NUuoRRb6a0ssJ/lNw/KXwZtDyIgKRHMNvSi
	XgeCyVymy2D4FuB/0EwsYEp6uJ3XBwQGJ21pGipk0Fc4io7a6bsUefWQ
X-Gm-Gg: AYBFou210eighgIo0XuTDmnbnJZ4m37580pPIFFXTjNGdB9i+Q9N8uPVkpGQq6JPYM+
	N03tEteCP8PObDvyqK0aY0aDZP+trpFKZ34U3V+VJD7AOACHe/1qyHynqNJqmeSig6vRbg5HX41
	3GsZdMGsBzSA1wkJ4d3ZS/jNOSVvwApDs1tZ+EKYH1t2K5SaFXMasr6gI9Ck/fZWpxztbcF/Rws
	JS64tj6/J3wbnz6x9QNPE9KDHkZmA0ODtp6xytSfgr7ub0Zyc/h0RyBeCeZR6bcR3TEOto0rV6M
	/BLdryZe1Dk2SLl0A5XpHRIJf02Ti4rTHIIY8PSCptKv93jFtT3B1YHD10e4WSkGi7oS6ts1Nax
	GzJ6bZEARTsYatXrXfL2itNQjKrxgbwQRU/2E7stcBdGGhE9PV9j3M0Z8rWUyaUTyIHzEHNEJdb
	oQfWKt79Tdvd+d0nYfzeZelUUcHVHymmkKxVCjiS910FibF8MohxT+1qGaUk5WQx9Pe/p8jlSBf
	oydFQIwzFpNkhEbbXp9HOaGlXuum6DoZE9U7YGtY3qLUrnJLyjMQ7NTNeAFeeNTF5StBijp4Xzm
	HGLHrSEi3Svtl8GrOQNy5IjQ+9MiTSum0Xs4EO6r0cfR
X-Received: by 2002:a05:7301:540d:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-3796721cfcdmr1081571eec.30.1794541367340;
        Thu, 12 Nov 2026 19:42:47 -0800 (PST)
Received: from debian.prasanth ([114.79.136.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2999565eec.15.2026.11.12.19.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:42:46 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v1 0/1] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 13 Nov 2026 09:12:12 +0530
Message-ID: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_194248_694591_CEA2ADA3 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a root-only, read-only NVMEM provider for AST2600 OTP, with serialized
controller access, bounded polling and configured secure-prefix checks.
The driver adapts ASPEED's downstream read sequence and preserves its
attribution.

Tested on ASRock Rack B650D4U (AST2600 A3), OpenBMC Linux 6.18.24:
- Repeated, paired and cross-pair reads matched.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched a separate vendor-derived reader.
- Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.

Host fault-injection tests also passed all 42 polling-timeout cases using
simulated registers and virtual time.

Prasanth Kumar Padarthi (1):
  nvmem: aspeed: Add read-only AST2600 OTP support

 MAINTAINERS                 |   1 +
 drivers/nvmem/Kconfig       |  12 ++
 drivers/nvmem/Makefile      |   1 +
 drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/nvmem/ast2600-otp.c


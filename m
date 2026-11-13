Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V73VBgrK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxB9IQQe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=; b=V73VBgrKK9547E
	8QvjD384C7C9FDCafH+GFWCPE3xe50BNgpIb6hhOSoGR97wvRX55yMeHR7CJ2+LmT2Fc3kR8Ux0Lh
	UyYZYnAPBQZ8GA/P1gPWitSj63qIOVP0UQoKvAkdFz0Teqcu2UYtFt3t6vT6MsTpYA73D9+31yj81
	RI5YlxeTkLBcdVUujV7/Ggs0T9FbQHgqU1DB3ZIL44VBSV+ou22o8p/GkmKmukKyz2sLzMCwsWix+
	letFt5LLQKT/ChOaJ/jbWwoZ+9IXpbKTnHORPU4mRJ4Ad79BUgi+NuxH4WopG+o6B8jnd55hyzPqh
	nnVx0eiJerV6RJcAA24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp5x-0000000CShT-0Dc6;
	Fri, 13 Nov 2026 11:05:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp5s-0000000CSg4-29zE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:05:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8068305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567918; x=1795172718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=QxB9IQQe+7jq6U6BsFAG/sNngG8sXL3SuRvf3dsLZmZzbi59xPo42Oj3fIvG0AdLUw
         3+8SmkpYZOGI+x3fc0sac30aD+4PjX0V40oTopKGVV8d31lNnjK2dZ7l6bgEDnpDf8w3
         UWwwHl1+pMoB7jmUobwreLZG0OA96lVdQCpvztqnh1XlfLqFxkha/mcGbW32xhf8DdUt
         AvKDxldNX4G0CpJ5Dqr5nJC1FJMbYN+DSE3qwk22uFJrkDrimg+b6PocgccBL+xW0jIM
         ZNaaRA4TVJjUqvgSxGT4AyiUHlNDWNTXX7qZIWVCln9e5Sgzq/QoksCTlzoGqHkw6RhZ
         lNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567918; x=1795172718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=wux5v5VGBzK/YL+4qx9n8fg9uF8KAVa9pCCsXqCQMt2DTSlcwXe+C4MSq1aHI+9Lhi
         UjWDld02GPFE0hvtPdszC2NEiZaga1pmRSBMBdN62KYlz9FvLn09mIcaMV3GOSkI2VoM
         yir5qg/yUkDmdXnurnv0RIg9vEp9OP6jsGRMTrOLtHO+SlwqMp0J7QtD11MQhoUCR9ka
         nib5Xi4QjnkHLTcrMdlWpQiY7mDPGvA6IeBFEErFkBEykjMo5fpUsZJVXrwSRzCUlLCj
         MJAuJ19qQCk3N58uLRazIHbOygxlbbj7HfR9VYrHfH5R7zitW9dc3HI2hYxzkp2Nk89Y
         /syw==
X-Forwarded-Encrypted: i=1; AL+hErGmtsjzLttjucQauc+WS13BlNCT9eaLhOTxRIqDuntKsiydm5tyfBI7zEnCTRjFCOBQ6QqepL0YVLNRwIq69X+1@lists.infradead.org
X-Gm-Message-State: APuU4Z9G8wt+xWlMxYoAoHSWVerNv+L/GT70JFQzVfIUHUAOkcPnyZEe
	2JL6Q3X1MLvNFtWPJj75lXhKBO/gdwNJAXPpuZs4TEWGYfqbyLZUb04ulh6EiWAV
X-Gm-Gg: AYBFou0LK3JWFZq29fSq4fVMQPBtHvm1crSs/ZpIUOCCclsx6LnJ9ruIqLLPsExN57V
	qIsIkpYXGRtL9lUi+c7lnn7SCISo/kf4qqdZgjWqEzMVCR1MNj9FDgCR6Kkb0DXa1tZU8uwizFu
	gQNShcu7MazV/2ACDQ5KOWqMVQyIMNiUL9OBf9l8ClwPWFqPX8/5Kd4sdtG5EBKkK4eC3TcMKdH
	0BWAqru1Tnd2FH94fKynMZFr9j/0+nHgosnWmggQPt9dOthCs5/tCySBq5l9/QASQFakCOCAPg0
	Ql4QNmnqY7ZZT0+qbkDr8YL1pyu2GP5LTgReGrLqenJYYRXtJ6Ziczf0ibkbmwH0YWguRZBR39T
	ojZHch+bkM63qndgeZVtDCWFlHmm6sOKLEhDKqzNal+br4gLDUWtEAbtpvrUFrRVphpkFxBJmso
	vkzc430AOHE6W0oVG+l7R0IrdmY9JmhYk8ehLOqeCzv7s0BM/IP8YTLAi0W/Q0pNrKnybFb9NrW
	aMBZE6D6MPQVwVcdjg4lp2gVxGA1AtbEdmZDt5uPLIXujZSunCUz3kfLPxBP+m9OCoxt1oUVxfl
	xsxjSfoa4+79x8JwjWPwArcP8JK3x4YRO0g=
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr46200125e9.4.1794567918385;
        Fri, 13 Nov 2026 03:05:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm4788105f8f.39.2026.11.13.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 12:05:16 +0100
Message-ID: <20261113110517.1142293-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-3-mehmet.fide@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030520_567364_07A0A57F 
X-CRM114-Status: UNSURE (   8.75  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please do not apply this patch as it is. Sashiko is right on both
points: the new -ENXIO path leaves the DMA buffer mapped, as the timeout
path does today, and a NACK of the last byte the DMA writes can be
missed. v2 fixes both. Patch 1/2 is not affected.

The block_data remark on patch 1/2 is a separate bug; I have sent a
patch for it on its own.


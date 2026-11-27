Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24ED606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mdky3E9F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFzccvPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=; b=mdky3E9FFUFZH6
	7P09xQCP8WZiccItuiWiS6xkPjXlnrTY/bm9MfBYMTCMvTe/v+EbF/F7lhfZdfqRZMGSP2KvY0taS
	vqZm0qOgat4SYj4qECvQl8FrydVrscPfWrJQ4+Y617xkjKNpMGshDYGbfPf8cseSfwC1d6yF0JZFN
	Fee34XPLHm/BvF/RgsDNQ/ImEBV0PU8ihQ/hkDYSfb1Ttn+FXjvaxGJoBO4as7zqWiIWO8hxC0KOy
	KNjsQUGVcpjJ2fMOZhxAqfIi/aTEIBooHYyi0VgCb5p64wYyGSOtkEOEBO6f4VeDo1qqGjMy8U2i1
	33DBRwr9SLwlF6Ggkn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWprq-0000000F5Gm-3fij;
	Fri, 27 Nov 2026 06:55:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpro-0000000F5G2-2mKu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:55:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso71732395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762531; x=1796367331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=BFzccvPQ0M8IqCEj5l6MB6TdjT6lslIVf7qpZMxqLE4noYwE3ihTlO1eMslX25pgQ7
         dXmkOqoykyHfQDvY+ix6MD/STvUmcu0FKc8DqjcF9/4rT0MVJgOJ/Q2hsS0e0AJhxVLT
         GL1P++0B1gbNHNbWFTeO9VYR82Bww8e07UZBptJX+C/MalXg6lXAmtEGIiaC0aKfsP34
         S6DL75FHZdeyd7gAK9beX/CY/O4YPwV2RgLb0OOrBk+Cu64u0bIM9SVk1X3E6cclXKNt
         73xPG8ljmV7I05WN6XjIo1/zLbbQNT0fRPg758g3KhqVlt8VVU9a4vGAkXPeXNzT7OIs
         nhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762531; x=1796367331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=X9ft3e5bDYwdpQsuHg5SCT7cy4YqngW2YHRSOLHkihMAHn6pfMHZcEvfllbZO0qTmF
         jJ3FEsZU5tLgydFG7i3Vgu7XwJQVYQx7FdKHbaxtwQSy0AvH5c741wXvahku5L0KLTyi
         mMaLq3FHTlLQq9bxJCpno3mKkbGJH2OqwVw7RUeU9FBGi3mtHKYgcH/Sc0Oc3fDTFDqG
         E4WX41z8XfptMoOaHDgYqkIr+BIejCHXH1mCjq25ZzCem1QvB3UaLQvylKtnAARWtSFy
         sdtKI871zHfJr4FP4XCrXp21DBTR5UXeTAC8v9167EZgA0Y+2YNTb29cKrvdozZY59cV
         aZQQ==
X-Forwarded-Encrypted: i=1; AL+hErERckW4818b29dQvtbwRrR4jXVqD3ITf1/jXUjkYQl7Otn2X1R0RvcXUc+Mwf72SknvRFTmUSOuSF4NusMKMTaZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/V45ANse6lTNAKe55NPM61Fg3W5P7vQK2zmagYLjpnD+riq3Wq
	KIE5Dyga1x8MyEi+4cYqXX/LrwUQHTVCAu2EWYZL3gsjmKoHlZbDQc4y
X-Gm-Gg: AZFdTZdEWP7dAf44UreioVuM7eQykZNvOAlETBTOo8vX7GjMvtuRpRQURr/AXYwRdKR
	JEV1YrkKNSV6EgL5KuvTRfyXaACCFY70Wx05m3mZUtnuzR4vtCylQiKrjnC3ZdWRQoCOYIO8aYU
	CbJAgZgVhIuKATdSKrjN4MqIaAHwQ0AXg6dgz/CS0wbxyI9knta2/n/Oi+Q63jAfNWsLvKQ9Pno
	+jrgHbM4PZ5k9wVo+wHsB+HWU9cnrjArqwQoB2mDV3hJ91Lb3W48nv3j1cWzlwqoX1VSYIQb5EL
	S3Yj83PczfM/8pVobCNwPeCYgGH5JeHrjIKUuioJVKiip8kRee+hD6X3ozkEkPX0tAr9/cwAPiq
	PYLM9kXBFQVfr8birav2U8h4OGnK1MozOImPCYKhUJ8Af7nxUIxASQUcBk0ZsghlOmHlrI+/GqA
	zm8ecXzWq6Z4tjzNVUHssre0N1XLmbG0P0kov+obh6yDYhJgEbYq8q+ywn74up4WogAWmVMpk2i
	ttuZXdCwMEkPFG2GqBdLwdNzkBNv4bMNj3NmQbo/NwnRv2rspeUp2q8wuv6MPOVV0Mmd9z1U5j4
	VM27k3ecsMRQ4ryCaOMmZNE2f+jgQt7kNWWt+gyFQZJw8y+WsR5ZDEO2dySGGo7JDDoOV1AkrKv
	2BSUub6OJK2B9AaB5G9ad2cfknPcxeP7oE6iypbN65T7k/iEC5XyFZOLP7fACoYofb3g8ONqQr7
	b46hIPUqzLZN4l1mDBPa9j2iIzTcMhGUS6n+P46OZln9r1kSIItyFG3GEp3UBXYg8FTYSKDPfxe
	wN2VzqBA9YFY3ZOpG4OdPuRKofUBQnJuf2Gpu2tOCUI4dDQj1ZSZ+7fMCFK5s8=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr542353575e9.14.1795762530660;
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/3] staging: media: cedrus: take the output line stride from the capture format
Date: Fri, 27 Nov 2026 07:55:21 +0100
Message-ID: <20261127065523.3685726-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225532_717300_5FDF2FB2 
X-CRM114-Status: GOOD (  14.50  )
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

cedrus_dst_format_set() programs the line stride of the untiled output
formats as the width aligned to 16, which is the bytesperline that
cedrus_prepare_format() gives these formats. Program bytesperline
itself instead, so that a decoder can use a larger stride, and so that
the stride is the one of the buffer when a decoder sets the format up
for a frame smaller than it.

Likewise, take the height as it is: cedrus_prepare_format() already
aligns it to 16 for these formats.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b66d855daaf8..7e742cbb1cdd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -84,7 +84,7 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
-	unsigned int width = fmt->width;
+	unsigned int bytesperline = fmt->bytesperline;
 	unsigned int height = fmt->height;
 	u32 chroma_size;
 	u32 reg;
@@ -94,7 +94,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
+		chroma_size = bytesperline * height / 2;
 
 		switch (fmt->pixelformat) {
 		case V4L2_PIX_FMT_NV12:
@@ -116,8 +116,8 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(bytesperline) |
+		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(bytesperline / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
 
 		break;
-- 
2.43.0



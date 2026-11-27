Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18EA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EkqlWvUL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hv3mCaCy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=; b=EkqlWvULa/o6BE
	q89gugprBiabBSU2joEdmwzGlzM0ORgxIg0/yRng4BIHYlW2JD4Jp11EXBdfUxTaTJ9yl3IcMcaKU
	6ekqomjQCfBjwxY+QDUkRAzrGsLjw1W8ROc/45uPqE9LENS52pNAluFiRR9UTn8I6e9cqJ46bFVK7
	I3c511/PMCxoS10x3ifC6DHvtg+fIh/2cKC8Q8JCA+ua4Y5DKgP+f8uKICSQ0U+RGmG74D5flsVtS
	at4UUesQUh/8rsHfJH5Vt9QEudl7AhVO+6lzdD3DblLml53hI8vkirV9tcaaFPEkuvxaxOrBAKjrP
	3uTatRXy+meeFdDav0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWps7-0000000F5L8-49o3;
	Fri, 27 Nov 2026 06:55:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWprq-0000000F5GH-1yUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:55:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5493443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762533; x=1796367333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=Hv3mCaCy8zf8oqrks3PNVz9HNruU2k/6WmkXsY9ZzsdrknGOWM4TMqhL2MTruTgz/q
         G2xWuvoGRsctwSsgaUWuC/xE3oF7llA2LC6sOlgzDfApSFcat2y+EllErjHP0Kgisy13
         KNx8jhnCgKdnzhWOTd1VCMG0k6LetB48ftXn+CubAJOxYoKvc/0ogvIjvkkEcmIqM8d5
         9Yl7d/G9FFUfWDxHtTuZKOhxO5OSLmcER1aCeQ+/j5+FKripEjn3/j8FqZV2tEhAoXk+
         sxzxEEeLl2YxJzg1ZevIK8wOKIN59uPBLqyQh6luPz0dbpgCB/CylW3EwSMOiVslnOT7
         JF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762533; x=1796367333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=to1cFq5QMXQNZ27g10beYSmTtu/6fNiCZKh+Doo2qJTDneEbejZbL4U/etheRf6NiZ
         0ad5M5TPh+Gf08NBYUaAvoXY/wubAMGkMGs1ttXUdGOUHmMPb6EkenL/eou/9Ny0lj7U
         M79T6LB8T8HRFEKW362jAHVcasK+x1/pGOmvTuZRkgbOEt7/Cr/gjDc8ehX3bykMz7l0
         dSP0yMgkpGvk+tZ8EiVCDOdPZt1ef0WTgw/mJvdNUke0ghdiXGrZttOW218p+GqMrZmv
         IqAeopk0WZY9gW27fQjPJW41Ep80Fdoz03w7qh9o3Ji1ibNzDFDr8qY6ZeIZsheGG/ra
         nz0g==
X-Forwarded-Encrypted: i=1; AL+hErHaIojoNEcaPlsFiJjcuHoMQw9l8yjXfmO8oaogcXjFhsVWUrJVtl2Vj6ByLKnvl2l2pNfR8tO6h8zWrJigrWBo@lists.infradead.org
X-Gm-Message-State: APuU4Z8EKJ/bJngb4TwkX5I9p1OKYB05v4jaWrR584CMm811cwDZDwRz
	iTtUbWnZ7MJDfAaFRFzKMAjzIwlyN3c7b7rVWkDnQxF2ZZ3lTobDunC3
X-Gm-Gg: AZFdTZd2eCirj6ZtU3HdegCci7hWRuZZlnr+zP/qUmagpflXVUQ50VjR5oFkXuDUNh9
	PSMdvdB9VikFrc8kDaoOWJ1DIt7ojZU2BD2EaOEEWQ6HB8RfWOQU2HbmlVddhynni8aIc0KTAxj
	cRNlMMVJe7ztospBggfzoIkP1sckchp30YmHiz4Wt2uBc/P1h8h7LdaJUYwY5m/xkAZ/kfqZua3
	ZkXD3jvygO97HBkX9i293lYI1iXOA3UGv6k3ulX8xWVDRwxKUdY4JBAlH4HVmvabxKede2EjA2K
	Agg1EEv5bDdB4asqsrOwWDNWyBRuIKL1mqeKE5Dsq1WYIWLWi0nI2bWRjLq9XNyX3jr+h04si6P
	esJupJEALxirN5xw1hD0o2th8pikF11/sCfncMVh12GZ9tPHkFkCR5Xr/f6+9KUkNqPcTS7ICai
	cArIQHIX5mUvDpwmQ8Hn6RnYmg3g/s0CS0fYQfhm8zuf0V5wnXQvMK4BvEs5qJP+/6gmXuinugd
	CT4UusLytiVbJr6cghYwpThkQ5topuXPKr2+/IXA+WOEMKz9GCt7gYo2PRFmhDyIvvPy97N458A
	2tNbrLczSgHsegg8VJ8SdwMNA1BION1tZLotcgSZl5oGJI7Uls0MP5EhB7AhDoIUkoynUDRJSN2
	XKyIi0AJDwHRQu0AL4L3fQk6bDXct99bivp0SImj3pTpJi5SKRZaKX/yV/MijXlKrhyDmVFboys
	+FJ/9YELSGsyjv2AhZDib4EgFv4P6ToVkC1dIhHUJCbIZdaYEuuuQbKGD7Lq3UAFalhkYSs1lG3
	CwkNIncLcL8hxbf6TmOf4NDztDW77rw6ooqQcUCp+U=
X-Received: by 2002:a5d:5f86:0:b0:4a5:ba8b:e00e with SMTP id ffacd0b85a97d-4abb4f5a324mr44654273f8f.45.1795762532450;
        Thu, 26 Nov 2026 22:55:32 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:31 -0800 (PST)
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
Subject: [PATCH 2/3] staging: media: cedrus: factor out the format check
Date: Fri, 27 Nov 2026 07:55:22 +0100
Message-ID: <20261127065523.3685726-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225534_542636_35E1CEFA 
X-CRM114-Status: GOOD (  14.79  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cedrus_find_format() and cedrus_enum_fmt() check the capabilities and
the direction of a format in the same way. Move the check into a
helper, so that the VP9 decoder, added later, can exclude formats in
one place.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 2521315abdb7..a46820a90d87 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -78,6 +78,17 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
+static bool cedrus_check_format(struct cedrus_ctx *ctx,
+				const struct cedrus_format *fmt,
+				u32 directions)
+{
+	if (!cedrus_is_capable(ctx, fmt->capabilities) ||
+	    !(fmt->directions & directions))
+		return false;
+
+	return true;
+}
+
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {
@@ -88,8 +99,7 @@ static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
-		    !(fmt->directions & directions))
+		if (!cedrus_check_format(ctx, fmt, directions))
 			continue;
 
 		if (fmt->pixelformat == pixelformat)
@@ -191,10 +201,7 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
-			continue;
-
-		if (!(cedrus_formats[i].directions & direction))
+		if (!cedrus_check_format(ctx, &cedrus_formats[i], direction))
 			continue;
 
 		if (index == f->index)
-- 
2.43.0



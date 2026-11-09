Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC6606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7QV3iW6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZk3Ng9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=; b=E7QV3iW6XBt3sW
	vRz2wbnUIEtnFn+1cvYZkzfKlknhpzjIAhZecJ3eLekZXlJ2iBXifLOoQL/zTZs4Oc8PqAVDFtM/m
	Ibk17uJn6LIRAnrXSV27g7fB9XIF//nJAzKKFxVwPXQtGNUF458XY8xP8DUhLkRF7R5+EoItjfZkL
	gr7Lih2rgiohxancYj9Nih0xNeSsNnKUwbqg+o/sPVJe0ibyH5oUsVSVKHF2ez5T438clnusd9r3B
	l+a7jota30lKv9eyENCNRAEgnVhCIedhNT0DPgGEsSr5SDRgBIL+wWC8dHn3dqjayp2ERoOOFtppq
	C4560kBOFLpGSXdZtpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWi-00000001Oax-1Arp;
	Mon, 09 Nov 2026 17:51:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OKe-0X8J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-492f0a1b685so803412f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246671; x=1794851471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=EZk3Ng9l6ISqJOtAVd9R/600ovf76HOEXbIyJVUyLfoONPajCBLMzKmta8fYV7Mknr
         3/oZhXWeKtmlqN3XHe4xaTMVAe99cV34oOciK9lIm3J5ONdERTtsgkBsrHq4fFFosIBg
         2rY6GjaBRtd0FJtKX6UmN54wOCKwCayv0E4acvutmEpxp95gFoSEkIqHlnFIuyk3UGCf
         rwcP2N21Pjfrj5xGtZPWDHDH0Q0X4nt9hn2DdMhYt+YGFvritZcgSHA8k/aYAajVbRd6
         GcR1Vo5c6rPHRj5Wbp7NjNZ9yOTtQlu2XePfObUz+nyNCb5pIV7qfFTnCFMDf+6b2C5q
         g+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246671; x=1794851471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=GFeVcmb5kZ5+vCCr67teEAtFu4k0LeD/tSt8jovGLNuOFcg2Nxzi/0o9p+cGsOD621
         eXWtWhHsx6zf0tw7Y1UThCqiVlBLZNgIF3EZWYRn3ICC4OOylqr6QjPI72RslPgNIu74
         t2hdVz6WH//ye7Uf0QJBwwlIeUA99/BLyt6rZcQuxBBPm365NxvMhumYHcmppwfcGvZN
         vrcu29zGbRNGaYjFw8xuzm8Au533E7jxc8pao4t/TpqSUKosU2ihjYC5blD7SHqgFXFY
         18FqNTUYwA+UTVk4QT4cyooa+sLSvq/Ot0AmwZ4eqyFJMPOh3H9/U9MoNTdAVUQ0syHB
         gHSA==
X-Forwarded-Encrypted: i=1; AL+hErE3hieo8+EDJYy3DXfHa0A7CxA1/VrIW5MpAoghWxirdCQ41FcEzp7V03lmsLh/CYCaS1hp78X3w6OlI+gKa16q@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ujm6waLBepT8YNGHMX9WyEHrHRGfs3h1i74UtPaO3R49q/wga
	4BrhRcl6jRNuTTj8iwjbiWtn0Z7CobyfBcdyGLLNbHrHpLTR1p9VBpzM
X-Gm-Gg: AYBFou26B6Fg5rKqYE7FPsC11azxxG2z+ba8x8WAtqek/05RwJ1/ETwctDIoTqIkIz1
	6D7f3QPeBmFSAupBh2KkLs8V/DUO84ilh1usR+/iddxbJeeiUypJVQSl+VBINYguqro2M86OSDF
	b8NqT+cUHxjl8HRR8z0vJE8Hl4bbbc1xVHVm3r9KQA3FsqRDtPKTCuavhmbq0V3nLTyj1MVPFpb
	EQLNczZljnZETfhe9V/4gvTu7shx/1I/0lCMvUwYBYiHyGkz4Bo3UTwACTl0U17peCt2ibKq771
	zsfsliSRTIkMnOJVEZnFzfea2a2pLaOKZOizJuNwm/IjN4fO9tiAoK1mXRRijXAstcLiTKbrUpF
	2TTcN1Krzry67xkcjXnzkdO/hoe/AcHk0KC/wJOMgLAim9fln9ZlVP/DfZPW47xJjWJo53HJ89v
	4MFUgZiVUTnyo82L3d9mq+7Jm+rHtrgTQxWCE3ZUiBndhrL3mYrm/s+Z1elpd+6R6rEij0LY77u
	uIfx9gQJIJtnQc4l/G+TZKEEFPf8uO1M6BP6rioKNmkEwMFUz80i9tL3vMI68zgC0/IAIN4D9k2
	hmkzAqZREfaSDOSGyRnMjF/QtTu1fn8oYYwUB6G/IszrUDNLZK7VsJLSc4j/z8U83lzVIj8veLl
	ibggBEIHUC12XuESsygDfyh0vW8pqmUleJNtD2QfSftpF4/yLl+oNX7amc8jKMTJgHpz2zan9Ln
	iULK6vDscGjkr2SsS/oOYtJCMmBvp1p5X5wKZB0h1jFF+lCbo71Nn5J73n1M8vFPAMsQJXM+1fD
	Pu5OIhJIZ6UJ3RZLORlZnYIYAcEpNZIbEagNadyitGo56InquM=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4982ecf64f9mr225642f8f.17.1794246670969;
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
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
Subject: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  9 Nov 2026 18:50:09 +0100
Message-ID: <20261109175016.42061-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095113_292678_DDCEF88B 
X-CRM114-Status: GOOD (  14.54  )
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does. Like the vendor library, halve the boundary height after
aligning it to whole macroblocks, so that the boundary of a 1080 line
picture covers all 544 decoded lines of a field.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..8252a47994aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height, the
+	 * latter aligned to whole macroblocks.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
+			ALIGN(ctx->src_fmt.height, 16) / 2 :
+			ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0



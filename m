Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A4606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKUIRGA8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edR5xeY1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=; b=kKUIRGA8DW6z32
	seQIebd4RiClaW5dgpyTT9vxihXfJTTuE6EjyXCO6NbDW+wt2Z0cE+yokRndIpZwtCBEthct1epNd
	MV8s7oTYc4ibSjrgRutPU/Mkrx1Tou9vv69RXgOwe2K/iXJbN2X5jtRkr1wUmWu3k3ojOCx1V2vXW
	xHIZ3fIv1FiRV47+gDyBVib7jeM+1jAb1Y6VFl1cRe2VxDPk03WZ6rBN+TYyvHop/MzcgRfQbwhk+
	+tAWvqidSnKRnEo2E0a4NMBTXUZU67R896zFDJZNrPsDw8xVVYluzmXdctPBkoUmuqylAFYZvv7S0
	XC7+invF+arcU6uNxPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWj-00000001Oct-0qOV;
	Mon, 09 Nov 2026 17:51:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWY-00000001OR5-0n98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491aaed7565so739122f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246676; x=1794851476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=edR5xeY1H/Nd/qTCEpqTgeO7ko3PaEUUsE+Xi8g75Y3g4iUSDKC4AL83VA5njfkU5D
         FnDQzX/N/vhmLHMlS3y86fxSgDhpnz71wRdJ2EKIFbqbUdC43tYRtVLUvBiShmq00LMC
         qoXOY+DhJOj9dq5zJ2fbXUNGLr3Vu8jOt8CYx9m7g97bRb/cKsLePsKNXAsEiND1v0v5
         VU00DMK8PAtPGx98IDPW040q7SYn3EcE8IIPZk+nnMegFIp0omubAq34bRZMY6VvOnFv
         Ktcny6NGsGzLXskajSzzMa2td15XfGuvgDlveE8wA/K/5nuFXKzWVidmUXxHK9dU3h+I
         bfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246676; x=1794851476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=J2y+0TcEvkaCJONGEn2AIIjxrWzmCnc2YdSRFNm2y1OcAlmGy8QGL/mfjNr+gsszgB
         /BVI8cMq9asH0W7PegN4kflRKkGdStveTXIiq4Ujskir2z65Ig7OfUd81kTMb87UF99W
         il/1MkUer1ukkuk8037BG56FKjMpQ2uiV6f0XBuUe/hRtF4ru48+3H9xLmnlGkhY9suN
         tyDU3sYHTSwbLH7N3JRhmbE00pItzkq9jzJv0/SXen0RICP0XbsQKPs/J2EZ9KMjrhqV
         ADOO0U5u5byLdNqVPnj8B424ABM1bBparUaNzClFmYHdAM9u9H1rrEdaXI64w6OTiMlI
         PRUA==
X-Forwarded-Encrypted: i=1; AL+hErGpvvLjN2MIz8C63T2DGo69hunrXk6JjUJS90x/mkcnPZbD1WkLO0Lvt9nj6RpCJ6/QUFeOOAzTrY2tV/LdkIZ4@lists.infradead.org
X-Gm-Message-State: APuU4Z/5qAl0mhjTbVXXyiX5ec1Wqf/PH872pNzotCBLdbibC4DS/rCm
	IMnF1+uX445RA4o0gosUsoMWV6HSyyGfuOe307JgM6Y68RsOZG9dWeP/
X-Gm-Gg: AYBFou3mf4M20OZIxboJxUaialDDVVDL5XgfwYSQm0iAz8+HgB/vE5ISxwuozimJTnE
	6z/nmP2ew84iATuAnISe1jiDwwC3wSI+hi2L4RAfZTjgh8RmyiFTzDJ8qg6on3zLzlHiXBtdqeq
	Pz3OqMuOwcv4y+HoC+vhxdSD6RZCuqwFa2a0qVa/l/zRT/KLR5fk5UTIP5/i3KZ3tuK324JMsTu
	npOFwB4Bu4GV3/HIeQ06biE/N3QfTbhYGPfgGE332aVBgnSailFxGKr+w8LhkRlBJZpa+PNWAS5
	91imJbkmJ0hIgnukwAfMWmbRpHf5kSJABUTgI3S6Vap6J2rOB2zKRP5ymCSzukSw1jGDu537XkB
	w4WDwiw+AwJTkB2rkwIXfS5m5n6mIN2+odjO+mGUFX8Ys67VIbYg8oYOmhNszr0wZBVsqD2JZGP
	QCLS60vbWa/NIUDsGn77LhR6ceNdiNXSGEXOhHV7dnQ7pAlDsQ1WTzibSlgbKKdRXlwMr50tRmB
	IXrDz913W+6afpR9L9PS0agyDEQKN/HW0MsTJJeEpyzM1FHPQSAKaSOnuEX1S5EwD9CJL2WD0n5
	XTX5+YIBdJP7H91NRwQrLqgxK4vYcXpWsIIU2gMIt/Qz/NuvJ9HS/zOw2Bdy5WLXwqnjGywUq5B
	4C53X8ZdC34ghGyTf9naf0eheXovesKdSiwy4hvgNJkwFq/Pf5TvIczFkwoOzM0Ltha2EDUHnUu
	rtJyiCxND+3CAqTKdVnx6Vqb14cBTI7inqaFlr1AlINsV30sLlQB1VsRvW6czN/q5JfjwhiF9As
	lKv7ByfU1I/erSVsW7xBLNWAu8B+r+6y6O9ln3LicvlgIE1kvA=
X-Received: by 2002:a05:6000:29d9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4982fd3e550mr237732f8f.26.1794246675934;
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
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
Subject: [PATCH v2 08/11] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  9 Nov 2026 18:50:13 +0100
Message-ID: <20261109175016.42061-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095118_247196_2BA9A3E9 
X-CRM114-Status: GOOD (  14.95  )
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index fecca343bd92..84bf18fd231d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD027606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kpWi9OoY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKAlO+Ew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=; b=kpWi9OoYMqQmimpr+25lsXdMFE
	2FnExZzWxrkZbwAGeky5uXMtgA2BOYCanmVb2h4Vl8/RlxDO9/lGa0v5ylHETcUWncIIbDzvZxUFg
	lPGdgAtk5VfA0lfUFb4VwGUQMODLd3Lv2meRk1o/7w8wdGZO3duEEjJJa8zDQSzPHWIZ2lggOs5CT
	6e1S61bOEOuwmgH4pp93UFhs+4YiVco4aNzR3tynnjrg5edWICFclyLOnrJBm2p26n0GyuXjgWzdd
	4Oo0jzKGjAzT6mBwEQWDvPdBKjTA2S2usiHDy1UdDQr2GL46uQIIrg4T8JoU3WKEju5o+pHZTE1z0
	IS5Py4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJDc-0000000EG5T-0hP6;
	Fri, 20 Nov 2026 07:39:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJDY-0000000EG4A-13IY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:39:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3829525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160370; x=1795765170; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=jKAlO+EwBr3fVc0Zq8J0vTDRBjjyGUqy6ej2r2GMSI6b662aZhOYOVuZx+lhhWS0Hd
         nWYqz+TbxIO4RpN740GyIFUh+XNML/FLMLoEQx4q6AnFQI/uJ4F1b5E2ZFwLg7s48BNx
         F+nIkOssCK/B1bKNUKQp73YMH9StSy0iOba6GU87HKzS8yeik6rdtX9CiGnNYr/FPLqV
         qRaJDUPFWekvspdplhrTy8RYCO/i6jMceQxY+k6sjk6mzSAj/L5WtcQTpYnwNgzBQ3Ft
         2U2HIKydKMFQH+Ntqt1QQw/32GFM1o2CpRQl3MC5m6IbX+0RWxAtUF08OZDvPhr5IuZ9
         mkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160370; x=1795765170;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YpcQQtt+BkeWtppp/Ekybjl+k1elzyBIQoPVcemdoxk=;
        b=vdhC2VcNa/vCJazlqAEckkNRv168jggwiBoSv80APDgbrchgwXbWs7jMTzhUlA86hU
         oIiW5+zJPCZQ02aTUUTVPa+5sILV+EX6PUDqo816WHGB8+jWQVwBN4Tbc1FItW6c9KTT
         C0+HoP7t4k7p8GJ9/+MVS6KaYT4SDgyQWYsK5pXtvxSvvA8o6EEKq0w2sUhVzefTtDLm
         Z9o2QC1gwm8xS0920Cj0jGGwv4VBDDyHBPyFlC4ME3QL+zckrCGBrkVGwV0El2236Bx/
         2gRGPMHPLZq3oP9GPRZGlt1o5ZW+vvCszHAsIDBBJy+ibkN+gh93Tc/UXt8sj//qrH0G
         RsAA==
X-Forwarded-Encrypted: i=1; AL+hErH1erOXkvITsuXz/CrS9bPaXBgQFf0xZYWxomMXryH5g51vejXRG+w+N/WVnD16Exytn5SFnqRMoqfwqcQY/gC+@lists.infradead.org
X-Gm-Message-State: APuU4Z+f1T1LVgf6xi+zreSWnUUkJh5vEqfCLXpw1Kjf1Nv9zGCft0vq
	TUQ82ZrR0Nv6WM+/UQPp+6Dq0Nqk2JCxvf/Z09nfkazQtF+8n9IT091w
X-Gm-Gg: AYBFou2SgZL8JkWsLhXmi3N9wRSSn0joGobSx5/KvIPeD1r2hzw+t8u1syWw52mGL+d
	UvqRTEHWqFqajsvIeppC/FWShtCEpxRMJukLt82HX81S6VcvueeRLAvaIi8LEjCXTZ8hG5cIvwE
	kceq8XJOkmr0mTwao6a8bVo3A36bwfrrZbnxBcrbZ/4yM+zpLiMcGwDtcCBJ4IslxfIXoa6wWAW
	gUiNAF7271JkKTI69jPd6tyHYNiUrp4NigLB+XpZLR+ldkY0sQ3dVsBsM5tFXUgDSYaY7+ZvsQe
	m2XiWwqD65rCSW/6vzVGduJ4DW4LsAAt90UZR4nkSSMQt4TFVl0FcQOUZWaXOrse8YtlC0T1AlF
	cfimFeVxDdQsg11XjCUKj5W/Is4+CibIgqWOHv3PG8+k9KRtvpN0vU6ABoqHJofISeGIwzRbii8
	IPy9j08sPPNuCGMPd5I0H2EVzMusg087/I0QiqLT/s01hmOaDp1N7nAOfAZ3TKcoZ6H2hSAw7z9
	hheLnah4t0qALtSC9LFZ2CeUlu164gfomLSlTJSUrJaeQzdJlb8HABNy1N654Iqh2mUl+31cRJo
	ktgUsAhVy+r1eocJFNchaHbQjd4SMMdrzhGn5xXd6/102oB5TTbTEuBkZXIx8Yw=
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr47439815e9.2.1795160369880;
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
Received: from [100.64.0.149] ([2a11:fb80:10d:2500:b9c0:ca33:edf1:6b97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm4393117f8f.21.2026.11.19.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:39:29 -0800 (PST)
From: Stefan Raufhake <raufhakestefan@gmail.com>
Date: Fri, 20 Nov 2026 08:38:58 +0100
Subject: [PATCH] soc: mediatek: mt8188-mmsys: use the full mask for the
 RDMA0 output select
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-mask-rdma0-v1-1-170f6f51901d@beckhoff.com>
X-B4-Tracking: v=1; b=H4sIABH5/2oC/x3MQQqAIBBA0avErBO0IKqrRAvJMYewYiaiCO+et
 XyL/x8QZEKBvniA8SShbc0wZQFTsOuMilw2VLpqjDGtilYWxS5arbyvJ1d3LVqvIQc7o6frnw1
 jdiA5Nr6/d0rpBZuO/t9rAAAA
X-Change-ID: 20261118-mask-rdma0-ff3cd398eaf0
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Stefan Raufhake <s.raufhake@beckhoff.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160369; l=2771;
 i=s.raufhake@beckhoff.com; h=from:subject:message-id;
 bh=917zLlA++Sanueh0GAPM2hRLA0nHVXsoglSLue1xr/k=;
 b=KWWDeFTtUeDg/koXMiq8KfXRjG+nZnKIs9HHVv1JZS7XoEper97Kvd9dK/0zM2uBAJqNHfAj3
 dFYQBMjhfPWAK1R8W0jFBT7GP2+VugOSIyODKe6IOmX/0wPvl66eeUA
X-Developer-Key: i=s.raufhake@beckhoff.com; a=ed25519;
 pk=e21SBDwGlYjlZrk3u52tzwoMvH7vIYNoigghcul0uzw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_233932_311394_17462054 
X-CRM114-Status: GOOD (  17.61  )
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

From: Stefan Raufhake <s.raufhake@beckhoff.com>

The output select of DISP_RDMA0 in VDO0_DISP_RDMA_SEL is three bits wide
(MT8188_SOUT_DISP_RDMA0_TO_MASK, e.g. 5 selects DP_INTF0), but since the
migration to MMSYS_ROUTE() the RDMA0 -> COLOR0 route only uses
GENMASK(1, 0). Bit 2 is then not cleared: when the boot loader left
DISP_RDMA0 routed to DP_INTF0 (value 5), setting the COLOR0 route leaves
the field at 4 instead of 0, COLOR0 gets no pixels and the eDP output
stays dark with "vblank wait timed out".

Use MT8188_SOUT_DISP_RDMA0_TO_MASK again, as before the migration.

Fixes: 8a7b1efb2ae8 ("soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro")
Signed-off-by: Stefan Raufhake <s.raufhake@beckhoff.com>
---
Hello,

While developing the Embedded DisplayPort (eDP) driver for the MediaTek
MT8370 SoC in U-Boot, I encountered an issue where Linux fails to display
an image if U-Boot has already initialized and used the eDP interface to
show a splash screen. Conversely, if U-Boot leaves the eDP uninitialized,
Linux displays the image as expected.

This patch resolves the issue, allowing Linux to properly take over and
display an image even after U-Boot has already used the eDP.

I used an LLM coding assistant (OpenCode with claude-opus-5.5) while
investigating this; it helped identify that the MMSYS_ROUTE() migration
had narrowed the RDMA0 output select mask. I reviewed the change myself
and verified it on the hardware listed below.

This patch has been tested on our internal MediaTek MT8370 development
board as well as on the CP6600-0001-0030 [1] device.

Best regards,

Stefan

[1] https://www.beckhoff.com/de-de/produkte/ipc/panel-pcs/cp6xxx-cp7xxx-singletouch-panel-pcs/cp6600-0001-0030.html
---

---
 drivers/soc/mediatek/mt8188-mmsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index c70c4b462381240d06a85144b4494a4d9e58850e..ecf0fffef20ad7a042dc02e510a7d266fb979c0e 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -233,7 +233,7 @@ static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 		    MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
 		    MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT),
 	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
-		    MT8188_VDO0_DISP_RDMA_SEL, GENMASK(1, 0),
+		    MT8188_VDO0_DISP_RDMA_SEL, MT8188_SOUT_DISP_RDMA0_TO_MASK,
 		    MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0),
 	MMSYS_ROUTE(DITHER, 0, DSC, 0,
 		    MT8188_VDO0_DISP_DITHER0_SEL_OUT, MT8188_SOUT_DISP_DITHER0_TO_MASK,

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-mask-rdma0-ff3cd398eaf0

Best regards,
-- 
Stefan Raufhake <s.raufhake@beckhoff.com>



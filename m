Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B94606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=furPueG6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XS36D8Zu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=; b=furPueG64fm6Hw
	Y4ByVT+lSY2I58+peS+r3dHDOVv++DdT7GCFXnP9J8oeXfEQe96f2/vc8/zBez0CYXTo18pFooKK8
	OVDsLmH/m9zym5QLiY0wAC1aa7GdOX+HrizZ2aLcO2/Bvpb5Hrw43PFtdjcdRnc37tOKSDUrxaNn/
	0T5ZfZcXgnzMkaX8kDuMbg3+kOb6ZITSlOYoEvs7pFWcISJ5zR99JW8/rUt3SP+EILAYh1Y7gQqW4
	bXaxvlorohGPBZ8odJu9OmNjn3ThZ7tmVmcql9xs7bcRnCapuYCNZNMaGVfSS3BctpHcmRBRv3J+A
	mI0ZJXOXM+AT5FJ+KeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1jB-00000003dOn-1rM2;
	Mon, 16 Nov 2026 18:46:53 +0000
Received: from mail-oi2-x0a.google.com ([2607:f8b0:4864:32::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1iz-00000003dIp-2KYX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:45 +0000
Received: by mail-oi2-x0a.google.com with SMTP id 5614622812f47-4c3bb46aaf0so1349604b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854800; x=1795459600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=XS36D8Zuif4S/SZQboEhUFPPr/opz3tIwvfJwXjdzoQ20qeR4UoTAGFcDOqrgdV2U1
         14Fv+21zQodXIRCk45XdUz45DZYWISnhho2DJNRTVm4VOJ4rIJHKAXoJ9pZY8dZNGHM/
         +VYgSy34LEjLLnpF+EfypK5ZN2g0QzLxnow+Qq7KvYd8LUs66SGwDs7VE9mfl2FZSfCL
         K1oHfYkVchbuXQinwT/ho4nWUmZKte4LsbOs05UkaGmziieYvAy6NxxWEy9KvMlN1u1y
         fate+pt2tgWEPcfLNtL39k5lI+fRyGMaDQjIvdR+yR33YJMj0pgzrSkZ0sMqmZnfHhLj
         elaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854800; x=1795459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=gmuyW5S9FE9G784xdcg/isZifyi2AbfssIlXnsukz1SC7pB28SpRbAlCF5m78y3TeY
         PSZO+cKpfBnAWtESpu7A9R0qKROxkHr5lNadLtiY686CZZTXC1+ERp8xvQqsFxoRbuyO
         zYZhMQdgEAUXiFjQ/4iUZunmGBi9lWUE5yJ7Lkt6KIq+HeMzEsOMW8yXTX6n5HJL8ETg
         XD3LKUE0mQin5rZaBTL4NmDZp8S0FFOJ2sG0SnZ4jjMikHKiqZfPvHwZaI5ZPhKjnN8d
         KOjJ3fEuhr0ldQsZbVQtXGq6hI/4nCgqUauD0ayoj5agqy/4LLerukWKDGl4sLKOe3iA
         1OXQ==
X-Forwarded-Encrypted: i=1; AL+hErEPZ8KnrceMU1DIYjYR6rrCtqQHnUFBe9A27PO+r1sKhfG1+is6bAyZWbc1EsSGlb9yIoWz80/5z29eD3IG2hkp@lists.infradead.org
X-Gm-Message-State: APuU4Z/U1RzBQZOwnT48S9/YGKwyAutFezIjzNBfSHpEuahhXqwQR2FO
	Ns8LpCHnMoWiMBCY2crAVFG2u4mBau0rESi35p8L8lkIpL5DR58FRQmK
X-Gm-Gg: AYBFou0HqfuKYwG2vrhYy3XQfYekdGtVauKnuQroigw8xvHM6IU1DHPGqkXskP8M/MS
	APbeMRCJWrXLjuF8XoUgBdd48oQy31jneUZwZ2kzHoIfuHo+8IW0gBpPI6Z1nfYmHJBrQzIDdm1
	2wf+4gySKbDTPfiSkn13QCCQX7UnBeQjeoeKKYbhhEvOL2gFdycvGUrio08e5Y3aQ+6Nwc6YQS3
	QD3urIv6wnWX/++0xMGLx09kUpN+UpXGho+Xn9jrATWvwnjFis/l4DpCSnd6skpNonGu9xRVsB3
	UfJilYgU1QF69FYbDpcVbM3S/wV7BoIQgWwQA7sEaQEKUr7ADOkKULlhdyaS/ZdDAAkb57kfvwd
	+DHRXgVejCWlA7bSB9W3yNxfNNqTkyryhqGfbTtpwgXS96aRyczInts3C06TK+08wXyJwQeVIec
	38hgicD6FFi6+fB0w1Rrp9JWNxWkLaXhYX5b+hV7ixlgNTmeceSMC+bVrFvKY/n7qIJfqqJWhJ+
	NpofkMpXSFKn+p6k2VwiKqZ6J+S0Q/LdBIMz5a0emblSH+8WPWfHK8eS3+Ygs2J2TQwQiMFWgYJ
	fXDGRDyeq0sYZHWGOdVsJvx5P1oQF8d4mzsz9p4oD5aIbcqb152ka8d4fQp9xC3SpsJkvdOgKh3
	l3jUD5+Bdcw9O7ljf1R8=
X-Received: by 2002:a05:6808:4fd2:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-56e63ba5727mr9976924b6e.23.1794854800435;
        Mon, 16 Nov 2026 10:46:40 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:33 -0600
Subject: [PATCH v3 1/2] rtc: mt6397: rename the write trigger register
 offset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-1-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=1817;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=df32cdCXYqRXb7AgGz4g+i9owLPH2NyaDIX+9W0kTJ8=;
 b=YXj0OOXR/Ek7mAgVNZ2ePkshYGmwdQh66wpXgUVRUARhBWhlo4xL7c+hw4g+ulZz6PAARMwLB
 rVWKea1gZoeASnjj2zRQPwTaWnyl9lPPgcWMM+sqyHTCH5hZTlMhQwv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104643_278273_A2090FDD 
X-CRM114-Status: GOOD (  14.97  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct mtk_rtc_data holds the offset of the register that commits RTC
writes, in a member called wrtgr after the register's datasheet name.
Call it write_trigger_reg, so that the next member, the control
register's offset, can be named the same way.

No functional change.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 7 ++++---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..5afdb707a5b5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -22,7 +22,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->write_trigger_reg, 1);
 	if (ret < 0)
 		return ret;
 
@@ -411,11 +412,11 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
 static const struct mtk_rtc_data mt6358_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6358,
+	.write_trigger_reg = RTC_WRTGR_MT6358,
 };
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6397,
+	.write_trigger_reg = RTC_WRTGR_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..44d2b2cb1ff7 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -71,7 +71,7 @@
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
 struct mtk_rtc_data {
-	u32                     wrtgr;
+	u32                     write_trigger_reg;
 };
 
 struct mt6397_rtc {

-- 
2.56.0



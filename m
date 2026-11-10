Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE8606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QF3NgMW2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzOALnYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=; b=QF3NgMW21llSNH
	hCr7Nc2oN0XL2JseiwVspyAXKQkorRjKEkL7OFsttdnqU68ejcDjjD0O4OAVJhg/S9LH+tj81PkVj
	ig8HEe7gmxVByTaylkwOwmzahULVNAegybMS4bjwrOwA7C8bOYElIDBGHJBNLOF/sEv/wLB64bBk7
	A6qPRahHV0w3gvnf57cIH95Xri2pSzYWHIid/lzwCV9j2lnGvfXwZ+38foP0lR06fZzPDJjueLAHg
	X3hO3rMOuMcG6z3oBCP+KYA81nUJ92EW8BF1moHLjf78FFh4cVoGMTZc5hi6sRER1RqQHg833s5RO
	Hn5wfGsVRJsiwkHbMakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdw2-00000002Qov-29Xt;
	Tue, 10 Nov 2026 04:58:18 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdvy-00000002QnD-1BRz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:58:15 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-91ecd81cd67so15341396d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286693; x=1794891493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=tzOALnYKC2li6NtQz6PAfjdZzciVMYcwBo8tgrqNuSpJS1wF2wJUzNDsb56cTm7fjG
         U7m+Un6hkVJzFEx79f7tqHLhQ9+/00X7MdKXhm61UAdT1PgxCE+jnLoxXcElc0q2JuKU
         6B/yC8W2349kJSy6e5VPsEoYfAP9Xz/d5Mt8DFBh7gia2tEDaIU4p7DPTXnHr6FeC9Qa
         JDEmvPBhd0KaX3KxPunuVQyRHRC8yxw9xzUPkqSWk4ZkOUDyHdyUm2McE12AYKqxJfno
         PGoS7rfNGqeUYAIsh/gjJwQ2e6E4GVU7K2oiNcyN49wlX0eeGOd1ylvX73e08thZWGQV
         zwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286693; x=1794891493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=jRPwCx97jLGnT8VX1s+9CReh8nX+ZAXq8/Aawwj1vSJfUz743zFeX6lfAiwTaXDCcA
         8t0F1HrhS3SvC9DWiBlXboOxe5IbeKroivoKxHAxm5Fr1ffOykS2JDTfe+MXS6UDG9Sz
         HN90UHGzFc8TpgUJo81MVxbD/dCW7zrfa26AA8aXEpGd1jJXOnrLa6I22oEF4lxyX2FU
         ekNjSLh7Aoud9S+uwxxr8S16mvSQLmIUQlT1p3pwAd8X6KxkrKNkLIqGQUoZpDvZkCDg
         u1tM9tCscXUTWDg/g96HJrB2Xa2FXpETdIPBfpGExDqqIAPNgz5aDDVG/UbJ2LsWr1CA
         QOsw==
X-Forwarded-Encrypted: i=1; AL+hErFPO3R/OXHGcVxC7MQqKkWNnQISwVNsv1BMenuk5hHAKkwTgxver1vQq6Ny58QDkUXa7W/vaUi2qia3B2hkJlu9@lists.infradead.org
X-Gm-Message-State: APuU4Z/cewa/xrw6Hv+t16AO0pAu+axeY7ULPQyxFQA2NMheJucbJukT
	+hQ8SW32DetPaPLkDQdbz900ynuatyKxSZCLCcANazzxNafVI2kn4Gk=
X-Gm-Gg: AYBFou1JyFQFCw0LBoqR8Pl/h3jPvOP7+6ylYEqDJCn2DO8T4Ez7EamMLTE9gLJxdWG
	Ip885hOUoXWdUdtfriHiEjDAV6tIA0Fyi+upODvpME/MKtBH7RtaICe1rae/Twraz3jpj6FSWoY
	0UxPuWCKmAPXJJEBXXXCCf6UABq+p962KnzYNVLopLVfRujZdG6jvFmEmmi/wkreiJHWtN6E5Td
	uKchLjohRTyvWb6viIxx5xAUUACkloHEhtkBr1f71Tka8ARFoO+gxKms2v4PhoRoZ0pvUkZoVqi
	jF9bJYLt52oG0DWk+IrWcFnZPTt+YkqXLUhKKvexPetMoQdznPutQDFigQxbM+N7HFHAc+HKd/v
	ZyB71fupUxLNeJMd0BZIW40kpiWs78yDO/uZZ/h4S+kaipUwDMpfVJ3hPkiV8S3BvaBP0TRaPhW
	JpirmffrFQUQW6N8Zcpj60wCRawQbUGH52/QWQw1+7F+tQu299DPJBqGPFuaphQzc1QkyBE0uTf
	EVANdgvZuw2WmMMK5+/w3sGVSJ/vaFkhIkC30bw0Tyx7XqvaSpCMIwxx0O2oboFoWGg3mXVE/9h
	tluVM7mtP3WGmj4BXpkOx2i8xXvvBlTzH1xdAWWwCw+yOiKXtEb+NBlwlobiFIiOJnJy5wueyNe
	+5CI3EpiG89JwxICshLY9xSpQf2GTt75HqeKc/2X/o12NbdOg+zr8Bo3g6a9zwvj0cngk7/oBH0
	8fQxth8r5Wqw==
X-Received: by 2002:a05:6214:85c7:20b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91eef88a091mr21824886d6.14.1794286692755;
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 1/2] media: aspeed: join IRQ and work before probe cleanup
Date: Mon,  9 Nov 2026 23:58:08 -0500
Message-ID: <20261109235731-aspeed-v2-1-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_205814_329286_8A8071F6 
X-CRM114-Status: GOOD (  15.50  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The setup failure path unprepares the clocks before devres frees the IRQ.
An IRQ handler that has sampled an enabled status can still queue
resolution work. Masking the source does not synchronize that handler.

Save the IRQ number after a successful request, then free the action and
drain resolution work before the manual JPEG and clock cleanup. Turn the
engine off after the work has finished. Request the IRQ after reset,
clock and JPEG initialization so earlier init failures have no live IRQ.

Fixes: 3536169f8531 ("media: aspeed: fix clock handling logic")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

With reset-default masking, no probe IRQ failure has been demonstrated;
this part hardens cleanup ordering.

Changes in v2:
- Join the IRQ and resolution work before manual probe-failure cleanup.
- Rebase onto managed reserved-memory initialization.
- Clean up JPEG and clocks if the late IRQ request fails.
- Split normal last-close ordering into patch 2.

 drivers/media/platform/aspeed/aspeed-video.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -308,6 +308,7 @@
  * perf:		holds the statistics primary for debugfs
  */
 struct aspeed_video {
+	int irq;
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
@@ -2232,14 +2233,6 @@
 		return -ENODEV;
 	}
 
-	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
-	if (rc < 0) {
-		dev_err(dev, "Unable to request IRQ %d\n", irq);
-		return rc;
-	}
-	dev_info(video->dev, "irq %d\n", irq);
-
 	video->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(dev, "Unable to get reset\n");
@@ -2286,8 +2279,19 @@
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	video->irq = irq;
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
@@ -2341,6 +2345,10 @@
 
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
+		set_bit(VIDEO_STOPPED, &video->flags);
+		devm_free_irq(video->dev, video->irq, video);
+		cancel_delayed_work_sync(&video->res_work);
+		aspeed_video_off(video);
 		aspeed_video_free_buf(video, &video->jpeg);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);


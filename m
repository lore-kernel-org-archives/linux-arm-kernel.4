Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4uJQruD6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=THfTGlqz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=; b=4uJQruD6AeVjE4
	8pxbD4VpXarTtDLWqUyRNlEU+UWYSpqszPE2TCf7vwf+t+a/mO7lN1fGbm9GXg7I3eC8DuT7vsi72
	QVPYvbWUGNajKzSniHNYF1bZeSqQcqh3BACbF93vBVdFEmicYPiiFinCooKc3vX2Z1KKV+EVgDuAt
	tRnY3tVnvpehbg8yQRBzyOZOLFm3wN1QLIKTdgMIsivlJ9iJflXMj06y56vOb+4nWiUtDsWOl0liI
	scicReBDTJ4cABrHizdZPO+WGdlGp9TO/rRNrP8FHpcWze8Zsa2hxnWEUN6VDuAAhz7bLq0LeUCbw
	4/U0CJS6/rw4VjZFY0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ju-00000008qYP-0aLB;
	Wed, 25 Nov 2026 07:21:34 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JQ-00000008qMG-3PCM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:05 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11668150eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591264; x=1796196064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=THfTGlqzfYCT1bqxli6ZUh70T0ajxW5iPHX+GXb7/59Wxm0ee9GhJhrAdRS7k8rk7M
         835+Rr3CLMZgYLuCv3VHbA7t2X6y9UHwY8Cmal+x5uyCqJn0pxdTSzf6sVR6hySuBoNO
         QPWfGzqDKTMCGV24nTeiKVskjpZrdimIYYd52nYROkYxj/UojruJZgY9RLiavhSklyI/
         ghV1lYK9S6WOnumh/gNURwqyAQcLKw7JStMxmAsnCFub0lxZppfZqmboe/NE/A/3Ve8P
         9uq8zPKQ1oSMEvFBHpG6zu30gpg2ui1v0xBwYS5rrKuB2dhbWoVlIPIews7M7agsCcQi
         GChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591264; x=1796196064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvNpguFZ8dgL57oZbzRJkOYpYD8+B/VysS9gBllwJ8Y=;
        b=vnD4eK4EJ4J5UcCyRfbDlNIZ4NcK0L7DJINoRbabyrpRuOGL6qDQqJ1eNIv3gWNcga
         tOufCamHnkaSlTUjoG2zfg6e0wJ9IZ2U7XiCSsSqztkfbDmTbFYmIYXM3KsBxrySJDj4
         EG3l6uoRagb0d+iJLs3aFpWl5x4hIKSlc7PvGkV4mKocFiICF+s1WH6cOZb598ZgGDbY
         zGa+Y09umZ0Yz5+fUJVBXMGT76pa9bCL6hyVpGmaOCYdwirTDzYygY1eY/L96nE2wMYw
         t+Jbs9yl/WxQxdqaorXxgpcME8swxUE2f5mCaLVabsJREVlSSfUInqhjg7AZnowLBdcU
         iG8Q==
X-Forwarded-Encrypted: i=1; AL+hErHCPfh6jhTYk8CG+ieIgUnsG+CkRzlmOLU6NB1j2M09lnKofgdg2Ss4esJfU8lhFvavM/fgEQ3gxurHsebXyVEZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/oT9fz7a7mJWzWWk3IHgNGgbneE5ulZiiRnIZ7lO5GL5zFGqwE
	0Jro40e36/gNZ2viwwV2LYNdNZ6ypN7Lbjb2d/WK5NaO5qz3HWbYN+/g
X-Gm-Gg: AZFdTZe2IKVbtBP1e4LiA3jlfjPbtW9oETKNs5Ii39mqPMOZsl+wrHm5k1KM13SzJ9u
	+YU5/UwYIvNK7jPeAQNnEmnuBaLUxAFrFD77nceLlqF36ya8BTPURmEhQ/y3jh/QY2m5sTKcfyD
	3q8l/sm3cgDAY25uFNmthplMDO+ScmNClwfAHYgp2fWCEMcqN2Ml9ST48Yxiz2Bj9ma+LgyrMKx
	RAgL8v4SH7SN4MqexndergsvyevvFnzipFZruTnn1zD+/Hugox4kA3GTGtAzuBLZDycViX29STJ
	fhdOtKVqJZz76EFrKvuszOaFjDqShjl2vqLWlN90Wa6jsGDsO0G2M7xBqKpCu0O+SwvPsnIVKfb
	F8zfp9/uRPL7UVK7luehlsPc0NLdwanF8nJxsZ7XWdLxgV7BhB6rG5dIdX8MtqF3atWDBXbUJfa
	9y21qoXveDK6RX39125aDC/ayNdslSb3ewObuJJ0ous0adgdp7f39PjqEZvmcZt2mM0sTvzr0kG
	XICrxcXAXg4kM/MsAj7L2Es03wKQXOuTSeJEN/seWL9NHs/KC/ymLbERNTDU/TtZAakuCSaDZRT
	/yM4x94VG8FS3n1uR4R55G7xjgAdWGq686ohSlj7sA7r4/n0zrAnRscG55MJmAo9
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id 5a478bee46e88-386a9158dcamr12709277eec.27.1795591264064;
        Tue, 24 Nov 2026 23:21:04 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:03 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 09/12] rtc: atcrtc100: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:23 +0900
Message-Id: <20261125072026.2997493-10-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232104_855319_C30E0EFF 
X-CRM114-Status: GOOD (  13.34  )
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
fails with "Failed to set wake IRQ" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-atcrtc100.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 25183331a..2c78192db 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -318,17 +318,15 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to allocate RTC device\n");
 
 	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
-	ret = device_init_wakeup(&pdev->dev, true);
+	ret = devm_device_init_wakeup(&pdev->dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to initialize wake capability\n");
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
-	if (ret) {
-		device_init_wakeup(&pdev->dev, false);
+	ret = devm_pm_set_wake_irq(&pdev->dev, atcrtc_dev->alarm_irq);
+	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to set wake IRQ\n");
-	}
 
 	atcrtc_dev->rtc_dev->ops = &rtc_ops;
 
-- 
2.43.0



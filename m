Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C8606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MkE7A6Xy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GMhVWgjH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cm39Pr1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=; b=MkE7A6XyFTOtHc
	Wv9nirisgqrnBLr1PQyvvdlSJQYiWW0rLcVXUcMFgSECXQ6TgeHPFYDB3cAZhcMRxsIdJdZhLAhzl
	yf4K2iZl6BBGWBITiPcbSmvcyGendduiAkGf5q7ojrVJaBb+TkfDPDNyMg8MF2XyqzpCCgBPQiTpP
	grGVGWGuCTYV1xAMKxpC76zco4XDVCwsucyzdky/gXExyk0/Gprq4IiIH+aSl/jJofof9F0J7PNCA
	3httthwU3PZsWgsURGXAp79R5tzBqBnAafg00T0blIcwa/PH68/ryRAoAZG16cZQHPF3A6z22ylk7
	Z0SYrEfgrl+LEh56Pclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L8-00000008rFI-0FXQ;
	Wed, 25 Nov 2026 07:22:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7K2-00000008qh1-2uoK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 07:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=; b=GMhVWgjHVI0R9Azij1/i4qIfqM
	Jqn1G9ZHBLhvEoshe16Jt2qzecir1fGveJFpUq4tfjYe1RxiQndahZc8YdhSpN7d8C7psMhEcbZH/
	JoBXhGteJiWX+DU5kDYb9Gjhx0ikTqspt7ryxFP+vpUodB8/txQ9DfhDEU3h7rAwl6Rx22qeaHaKP
	Hstxi5z/3CweZQcqgVXubktKYlFpk1/VSwE5CRpqpnzHSRJvDdgTYcpqUQWGzT34ZsDW8PPgGJRMY
	Qcn1sYLF1/QOuIIhU3/fZcT4gX3v32qpjhc6v1lzDW7EDxPke1jKUl4XOUXORH64ZGuCIBjMpEygt
	WutaSk1Q==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jx-00000004yJS-2A66
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:41 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7141650c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591294; x=1796196094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=;
        b=cm39Pr1+NGnY2gFYQhBhVUBJXxHjJ++CnERf/ZM5f/6ZA6YKWnQKcI4fNYnIr0yRnQ
         Rt+PqpwQuGYile5ysuNg+hZDrCl/COjKYAQ8zGPycuRz6o9PXNix9g5b2d0T+TqevGpe
         IDro+6jQl8KNVDfLzZC7Bt7otoJaJ6+pywnjMmaQR5h63irhXG8U4wdBD2C6tlSO5WM3
         Fye1ZOQZvzW/otDCA4TB4V+aUAGknutc4MqYFxX+yEC8YpaeiUdqxHqAY19mLScNIq9Y
         cAR2sUVJsJ10mw4+bvZNNvpfDi5jI7hLWypLAYvGmMT73k0IJ2k3gziTw6q8xWiA5ZRz
         Zf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591294; x=1796196094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdnrXivS6pphO0ni+EiUpdP5k6p87bnP8SNlAtan2c0=;
        b=hR+E0xRKD2E9g2o5eFlByApWwmtSJ8fDREMK29D+fzcFrE68jXovZ2PZfCbRTy2yAX
         JfyocsE9SbvenUZlskCQL+y0ptZ9t4YnYTbZWMkuWvs3nm6MaQ06OrnXLcedmIe6YaEy
         8QwVsS2boPT+Lm/ylgR2+crafepB6qiBg2jPO9o6/DjEbuHognHOE5Zce9kJ7ESrI3+b
         VyXZVMuaBq74HV6bLVlAg/yQ1PVkkQuVZrTr3r0jwdFMcUr5qJMQeSPR03LHE0hhzsG0
         aXsYWjOkLDk5ctmZgsm5mAaQmT6V4f1ImzDKd0ZqE/30OoWkK7jrqc6yc4AHYFZ2Oa2W
         OjfA==
X-Forwarded-Encrypted: i=1; AL+hErHHs6OpeQaT2W6v7c6GZKctN1lWZrq9FzKjeI9syFxiJy8cOPjSgVrTXRSy6RdwxNQTCvlK75cBkv6wc1FkhYQx@lists.infradead.org
X-Gm-Message-State: APuU4Z8LVvSNmn1FtQ5tk4jbvK7ktRmmmg1E3phCMlXey7bg9DV64aHl
	vlkJhS+WfGNt37IF1umYQxwE+qEdnIiHZHZEeP8qOii5UXAXtwvC6zTK
X-Gm-Gg: AZFdTZfk5K1uYJ9QGQnVpbzakxBeCQc67B6TMsIyNoZkhRnJnsfK4Y4iBhc9cWO2ipw
	JI48oHSIAq6FzSx6VxglrpJBZIq1halKF/D3/nqINYUcD+BUkKljkLaMuLkNAqlTPItU3ZdsScu
	Jk6/aWswKZ15WY/M6GIb4bjd1PL0OKLjCL0OesKmRgPw8kdaTB+jwIFOh9h6/8AmPCwGy7eYSsp
	MWnkfQZnT77jIj6+2qvLH6UlsPrT/qcuEJQsMDOuzW5sj1EUg4Mzfdp/Oht0PNMrG0jWrNcdsAG
	YDwbS3AzRsiNNLD+tVLH/Vls74mtb9KBM57DW7wmqo4Ac7R9BegZQw30McZGPBWyBjOhNb0/S7T
	Ezgz995QJDTsf8xFkX1BzLggwpTM+PY5futb1Bxr7DqIhD4hmaBb+NmldKNVxYV+RqAs+jkWYho
	wvDYt3rw8VVLPOk1ybbzlqNoeVhczJnAU+j4AUilttC+X00X+dbdB8UmGcMNkfuQG9BIEh3pNgp
	qt3MGUqeb3N9JMMkEyrLf8a+A21s3zEQtgkUb10CyX25+CuLCJgZUTCcuthhI8PMDIVw7iNQzBl
	qJL9Rksu4mbIsV3y2tpoSj8Ib0buT3boQyuez25Y0iquEwluy4sCTAz7M5t1XfwR
X-Received: by 2002:a05:7301:6184:20b0:386:b006:c8 with SMTP id 5a478bee46e88-386b0060806mr8919262eec.35.1795591294367;
        Tue, 24 Nov 2026 23:21:34 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:34 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 1/3] Input: snvs_pwrkey - clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:22 +0900
Message-Id: <20261125072124.2997511-2-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072137_634710_D46E4BC8 
X-CRM114-Status: GOOD (  15.77  )
X-Spam-Score: -0.2 (/)
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

When the driver is bound again, dev_pm_set_wake_irq() finds the old
wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
the driver prints "irq wake enable failed.".

Use the device-managed variants so both are released on unbind. Only
enable the wakeup source when "wakeup-source" is set, as before.

Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
through sysfs.

I used an AI assistant (Claude) to find this and write the change.

Fixes: fb3c09ba20ff ("Input: snvs_pwrkey - use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/input/keyboard/snvs_pwrkey.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 33bc3bd0b..513fb9bbd 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -245,8 +245,13 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "failed to register input device\n");
 
-	device_init_wakeup(dev, pdata->wakeup);
-	error = dev_pm_set_wake_irq(dev, pdata->irq);
+	if (pdata->wakeup) {
+		error = devm_device_init_wakeup(dev);
+		if (error)
+			dev_err(dev, "failed to init wakeup: %d\n", error);
+	}
+
+	error = devm_pm_set_wake_irq(dev, pdata->irq);
 	if (error)
 		dev_err(dev, "irq wake enable failed.\n");
 
-- 
2.43.0



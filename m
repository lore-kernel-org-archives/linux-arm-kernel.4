Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48438606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wvi75/No;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=D+aUQhGm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=; b=Wvi75/Noj6qYjq4zqOFmiq83Hl
	lVq5Y7wE8g/meSTwQm/XYFohx4n1V9C732uKGoyJ4ddwqfYiQHqJpTP+z/pUBWsZ2Lc1XFEyo/X13
	TIeaZS6OC163G42Q0cmio9ZqTHVTLaLZ2o+vYmag77+v2r3tvzdvMfr4PFPtAnODyiptw4ZUffexC
	oCasso2sjvz1lh0dTs0TqzrFXCv9ZBet2jjQidJumx7NEqzzhe7Ngvs0LdN5fLwEdDNp0QsYwOwJm
	nPT85pME4GGU4QU3T87lMetAIxtWSqvL74QnWNx9qmonS0Y+oS6qN7dO5rAEKt6sH2i5RweAgjXKB
	cT4nvuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9FJ-00000006wIO-3BM4;
	Wed, 11 Nov 2026 14:24:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9FH-00000006wHY-24kv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:24:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-49465892f7bso2350495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794407054; x=1795011854; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=;
        b=D+aUQhGmYPmjiltRhAfvRm2v50WOmoKZxWQHhIDs1gxoILzHMVomEaQzdXKcSIDIlk
         05YVYcEin1Uxh8PJls6dBDov/RbvxHc6lwpRrbDtPmdy/kGF1wryXqI4oh4yWuS6ak36
         lxJqmlSdGQAkA4hdgPrxfvRkmYiyLPUD856HqxhqcI+GgyM9awluHeLymj1+mpimyRO6
         NNPmlEyiKkWdZz4ZA/+Ew/42tLZ+5dei6c4do6dvPuOEHm8rguseZCQX3uSJVL4LMt/1
         Px9Gwd3Ex+T9FAvvz/D0yDINQoCfeb+xbi2oud8GWzjeF5VKUgk+Odw+SqiWl3JPvZXK
         1X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407054; x=1795011854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkvKw1RkLoUo4P/RmV52C0aJoH59lmWCBYxJx4Vfna0=;
        b=vV1ScRgUmBAwuZZuigQfnncTDkfoHpPJSvK6Aewn7AttlJUQEsEKVjYHv7HwEhBiVi
         qTC6G2OmOzTbNpIOo+L8KErGXZXey67o+IOruW4gEIVAAaR5L84u8U8HTD6Jc2d2/pZ/
         pm0+tjctBjbShl3zVYKm/gQ1KqAbVLsUZlxIYuDcbCZfqwJdMaHnjhMUPN0CJ1bO6+fT
         QceoEM2Qns8/EVZefZC7uAcPsP4BSuuVsdZ19aYc/B9RMwVGhwPELTzgDBlgrXpaFfb9
         zYk5lT52vIxm6Vvy9Wo5LZ9H6UVe5mGMrPg5xYJiUSzLoTXuhONfVYOMt9HeHoStpd6g
         x64w==
X-Forwarded-Encrypted: i=1; AL+hErEeD7RMkAfa9WWyugxcHZ5C7ubFX4Ox2vXS3qtZYtHW40jZHXU0Vajrc7GEZCNzVF1sDCDBHs0iJLECewhIHT+o@lists.infradead.org
X-Gm-Message-State: APuU4Z/z7BvQGlf3r6euDkZQCHgFmsppH1tvIH6JoBRCERYhEcGX57CL
	YU76aD2Sl7GDOVqABCxQBpCCwbyatOu/j+XIEICgYDD6Fc/nz6aQSDsTfepaipB1kduPAAs7m+A
	Zg2yj2KO4zw==
X-Gm-Gg: AYBFou1eCSf5H3wPi49Hmb8bG/vQne9KarnFyVAr13+rUfKA7R/7QZqu/7SOGJiEgVr
	qMu7tqzzeQ740BQVK/5YaEHLZBrnxv0c5yt8NOaYpUyCXa+V/WupL5AL2LzhZGX7XD8MwMHMLHW
	RkYJtuO8C89ZVQ9ynd8UeISXo/fXrYudrNftMEySICma0y0K3q/kvJytHglQw9vPLDR7W5HZUJh
	GXzMSHF5wn4CyTcO53723HdcvtUdd0JXqwSx2LEAek6kHkxzSuvdZfbWnP38vHLMczmtimRlnqG
	BY7GaJhRvjGq1Jr0ZXR+h5vHY7gbN4ChhEW+xq82Aw0jts/+utS7zPH+zrR1e3qu0kF4VUE9Mj+
	XtJGGomG/U0xRE1w/+nYKaMr2Ay/kT92p5CAK81tnHzgalPdote2TUryk6QZ+iedakrUjzXh8zO
	kYMBP8bNX2GL2V1ZJkjIGkLhNDWF+Zyq+ZqQECBFWvRP+pwYtvn1vLnREO97H6GvTmcxawk8VuL
	nZBnP/VMcu3g0MkzPtYos4kww507X89MtSAFQqPa2ScZthrzwVMJ++uaF01TCd/a2Tl5pYQdS5J
	SgxnSMWbRKyawG9P1/3pdV6Fq/kQ7EHpfk2Zr3F7dE0+WDfXvzIZWrtOs7WS0Z5QckpZT35ddZ3
	1O8wl/jjVWA==
X-Received: by 2002:a05:6000:5c7:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-499c6027cc4mr4071191f8f.20.1794407053616;
        Wed, 11 Nov 2026 06:24:13 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11352871f8f.37.2026.11.11.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:24:07 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Nov 2026 18:24:01 +0400
Subject: [PATCH] scsi: ufs: core: Register the RPMB bus before adding
 devices to it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINAtTSvWLSrITdJNKi3WTbZINUk2TDZKNrFMUwJqKShKTcusABsXHQv
 hF5cmZaUml4DMUKqtBQDF/kqFcAAAAA==
X-Change-ID: 20261111-ufs-rpmb-bus-c8e4c1c2c49f
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
 Stanley Jhu <stanleyjhu@google.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Avri Altman <avri.altman@sandisk.com>, Can Guo <can.guo@oss.qualcomm.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211; i=alchark@flipper.net;
 h=from:subject:message-id; bh=rACyBhlqQdc7vEC+waUwW3Q2wxEerf4GPNn9xVrd1kk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9qWrhLHryfo6Zfv8kgTXmP5Ycq+UK9rIJfnTBefE/R
 eM7n25+6JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq73UwMvTapVw7c+Px7UTL0o0fu0xWTvzBXzvvsdqKE/etJ54MVFzEyHCv4b9
 a2rTNWwKmWhle/3Oy5fFh30eWkzXP6YQY75960pYFAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_062415_578561_C261FDFC 
X-CRM114-Status: GOOD (  15.41  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ufs_rpmb_probe() puts each RPMB region device on ufs_rpmb_bus_type, but
nothing ever registers that bus. The driver core used to accept such a
device and treat it as having no bus, which hid the problem. Since commit
36f35b8df697 ("driver core: reject devices with unregistered buses"),
device_register() fails instead, so no UFS host registers its RPMB
regions any more:

  bus_add_device: cannot add device 'ufs_rpmb0' to unregistered bus 'ufs_rpmb'
  ufshcd-rockchip 2a2d0000.ufshc: Failed to register UFS RPMB device 0

Register the bus when ufshcd-core initializes, before any host driver can
probe, and unregister it on exit.

Fixes: b06b8c421485 ("scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/ufs/core/ufs-rpmb.c    | 10 ++++++++++
 drivers/ufs/core/ufshcd-priv.h |  9 +++++++++
 drivers/ufs/core/ufshcd.c      | 14 +++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-rpmb.c b/drivers/ufs/core/ufs-rpmb.c
index 756673337648..591e7f2e1474 100644
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@ -276,5 +276,15 @@ void ufs_rpmb_remove(struct ufs_hba *hba)
 	dev_info(hba->dev, "All UFS RPMB devices unregistered\n");
 }
 
+int __init ufs_rpmb_bus_init(void)
+{
+	return bus_register(&ufs_rpmb_bus_type);
+}
+
+void ufs_rpmb_bus_exit(void)
+{
+	bus_unregister(&ufs_rpmb_bus_type);
+}
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("OP-TEE UFS RPMB driver");
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 99f654b79035..4f2661036d7b 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -499,9 +499,18 @@ static inline u32 ufshcd_mcq_get_sq_head_slot(struct ufs_hw_queue *q)
 }
 
 #if IS_ENABLED(CONFIG_RPMB)
+int ufs_rpmb_bus_init(void);
+void ufs_rpmb_bus_exit(void);
 int ufs_rpmb_probe(struct ufs_hba *hba);
 void ufs_rpmb_remove(struct ufs_hba *hba);
 #else
+static inline int ufs_rpmb_bus_init(void)
+{
+	return 0;
+}
+static inline void ufs_rpmb_bus_exit(void)
+{
+}
 static inline int ufs_rpmb_probe(struct ufs_hba *hba)
 {
 	return 0;
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c9b2eefbd7b0..4653d497e27b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11687,9 +11687,20 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
+	ret = ufs_rpmb_bus_init();
+	if (ret)
+		goto err_debugfs;
+
 	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
-		ufs_debugfs_exit();
+		goto err_rpmb_bus;
+
+	return 0;
+
+err_rpmb_bus:
+	ufs_rpmb_bus_exit();
+err_debugfs:
+	ufs_debugfs_exit();
 	return ret;
 }
 
@@ -11697,6 +11708,7 @@ static void __exit ufshcd_core_exit(void)
 {
 	ufs_debugfs_exit();
 	scsi_unregister_driver(&ufs_dev_wlun_template);
+	ufs_rpmb_bus_exit();
 }
 
 module_init(ufshcd_core_init);

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-ufs-rpmb-bus-c8e4c1c2c49f

Best regards,
--  
Alexey Charkov <alchark@flipper.net>



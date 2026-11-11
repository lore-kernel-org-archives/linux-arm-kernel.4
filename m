Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KvCBpLMt;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=igQSIZoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=; b=KvCBpLMtJd7QCToNasLKpAuQCc
	wP9NuZAFGBnck98gSNSyNWpz9QiMgR+J54fQa4UkxqumqtFOFZEP4CCnt220OAA3ixFik1P6V31gq
	6xKVoPsvRphqbgi3dBdLlaOQSebiTULvnr6HRSVkOT5QebF1LeXXBbikZW00grrKFOktp9eDPGBrC
	H3+9L6MqDzqxHwk6uX3uZmR5ZEcxRo+0AuHn4M4y0KQWHgmPTyccoSzwBZGjOV72IyRBt7+CqIF/I
	qu0C4+gZxnBVYRXoxwRha1iG/+28AA2wqs3htD8L5cfrkhcZpdHChjACMMw5ExDemBm4MuML2ZdOr
	tG0foOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tq-00000006YXa-2qZ8;
	Wed, 11 Nov 2026 11:53:58 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tU-00000006YEI-3rTa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso17539145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398014; x=1795002814; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=;
        b=igQSIZoqd61Ns4u3STOo9YL01NCWnO19LX/tNsoDeMmaf81XG0X+kGNUdj7/zkc2Nk
         hkuB5uwN2Fiqz56VeuINIAXH1WfNu8NiqirHI/P9dv40e0FZBf49ykeJI59XLqXYWCgi
         Tk0v7YST7AuPOGo+/pzFzqWeFYeB9Hww7w/Ej/RlRwvj9zEai775ei4D54KixedP0fcW
         MOJkb4viF9OnQQos+0+ywADglLWYYDcloIBg+Os8Z8rruauSjs5pO0M8DVx6zijFpX1M
         CxV1YLQowauAK4L92g7M86ABu8Grid28aox7aNFxeY6q7L/myjpkMo5NVuG2vNfB9E7G
         /pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398014; x=1795002814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inO5c+2NRpGzTtQSXHFgAvhlXc9hM7LgLA83dSp1tzU=;
        b=f6Vq/x3T3pEeEBYPDOnlcCBtJtXYmRNmCIlUdLZrHVsLEt9UqrD4n+rfR2dOQRQ1df
         1aCC239GJnVWNvwXrtiZpvzKG14d2WG1gikR2LxLNu4aCa9qrnf1/QYnHzL2c0uHN0p6
         JgPh+nZPcIix/ohqUuYb56NmKAkUTrOO00WZmWCN7ddGtiab41RJrcXDOc2pZYEB+2ht
         4+cItulXnaUAdHV9ivwGMPDe2hhqAXOLg0b5sJ4dt4pgqqr9KWyODYhSiMQQ+VhJoyWX
         rUoH1PpTA3FUCyG7a1HD5utFabx1i8dyX0dkq0MaiOPQEr4/GQjJDCEdTbGa5a4ybZ6y
         Ts6g==
X-Gm-Message-State: APuU4Z9HrI0bxhF0L31GRJuExKDCxF9QHptRVdD/yiDUToc3RqRVcYZV
	kNjGPQxzzJbfmOIdjy0XQYNntvR9otAwTU8PTx4V0xwMoY/mdbPEadtDSiIGlEuIhudjNlKt1Dt
	7ivGMN45jx5ls471xXi60KXZX6bztk2ypKPSWB9QpjPbKJq34Wdr5OfT0lrRehMNivSaIOfexnv
	wxSiDt3u6EKw+WonG4XXG52UKKne2W76yLsbU9rh9axFU1
X-Received: from wrpb11.prod.google.com ([2002:adf:f24b:0:b0:48e:1312:61f9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6308:b0:4a7:b304:253e
 with SMTP id 5b1f17b1804b1-4ba09381867mr42238995e9.22.1794398014308; Wed, 11
 Nov 2026 03:53:34 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:10 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3296; i=ardb@kernel.org;
 h=from:subject; bh=CcqzZVt/h+BPdElOQ8MZ9n76eaBY8LRWeodUS9k8nn0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuMbTrriNDJ8q5vmpbdh8aCLv8+UW3+9JfTIMCqiwn
 SX+IKqqo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEw4uR4fCaaYJPGTYZCZvb
 WczKs1oh3qSUMVP0ZNX/n+fztpuekmP4X7JLd36Sxpt2LqU57YzTd1y7nSm4bN4nblY3o6AEN91 QNgA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-15-ardb+git@google.com>
Subject: [PATCH 6/7] platform: arm64: lenovo-yoga-c630: Disable the EC
 interrupt while suspended
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035338_896756_889EEFE3 
X-CRM114-Status: GOOD (  17.23  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The EC interrupt handler reads the pending event from the EC over I2C. If
the interrupt fires while the system is suspending or resuming, between
the late suspend and early resume phases of the I2C controller, the
transfer fails, as runtime PM is disabled for the controller:

  geni_i2c 884000.i2c: error turning SE resources:-13

The handler then returns without having read the event, and as the
interrupt is level triggered, it fires again right away. On the Yoga C630,
this shows up as tens to thousands of these errors in about half of the
suspends.

So disable the EC interrupt when suspending, and enable it again when
resuming. Pending events are then handled once the I2C controller can be
used again.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 34 +++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index cad40c58c55b..2776063bfb58 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -10,11 +10,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/platform_data/lenovo-yoga-c630.h>
 
@@ -216,6 +218,7 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	mutex_init(&ec->lock);
 	ec->client = client;
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
+	i2c_set_clientdata(client, ec);
 
 	ret = devm_request_threaded_irq(dev, client->irq,
 					NULL, yoga_c630_ec_thread_intr,
@@ -230,6 +233,34 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	return yoga_c630_aux_init(dev, YOGA_C630_DEV_UCSI, ec);
 }
 
+/*
+ * Keep the EC interrupt disabled until the system has resumed. Its
+ * handler reads the pending event over I2C, which fails between the late
+ * suspend and early resume phases of the I2C controller, and as the
+ * interrupt is level triggered, it would fire over and over again until the
+ * handler gets to read the event.
+ */
+static int yoga_c630_ec_suspend(struct device *dev)
+{
+	struct yoga_c630_ec *ec = dev_get_drvdata(dev);
+
+	disable_irq(ec->client->irq);
+
+	return 0;
+}
+
+static int yoga_c630_ec_resume(struct device *dev)
+{
+	struct yoga_c630_ec *ec = dev_get_drvdata(dev);
+
+	enable_irq(ec->client->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(yoga_c630_ec_pm_ops, yoga_c630_ec_suspend,
+				yoga_c630_ec_resume);
+
 
 static const struct of_device_id yoga_c630_ec_of_match[] = {
 	{ .compatible = "lenovo,yoga-c630-ec" },
@@ -246,7 +277,8 @@ MODULE_DEVICE_TABLE(i2c, yoga_c630_ec_i2c_id_table);
 static struct i2c_driver yoga_c630_ec_i2c_driver = {
 	.driver = {
 		.name = "yoga-c630-ec",
-		.of_match_table = yoga_c630_ec_of_match
+		.of_match_table = yoga_c630_ec_of_match,
+		.pm = pm_sleep_ptr(&yoga_c630_ec_pm_ops),
 	},
 	.probe = yoga_c630_ec_probe,
 	.id_table = yoga_c630_ec_i2c_id_table,
-- 
2.56.0.611.g1030f0b940-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A35606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnAdJG+F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/4olVxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=; b=HnAdJG+F1RPa4g
	GhON3PnUMzKQdfHq5ZqnYDK5f2NuUZ/cZGR7GRhKX+pS2p53di0xMSX+wZ0Ipq+CjI+DRI6YPqpjf
	Pv1XyllZ+TrJ4qr8b5bgFDF9WgvkSDe8hf3xDVfnA58Cua6x8DVLrzae7ejw8X9hLy9WSpa1A8Cq9
	d2SxDKIlLmvQl7MeUfvsbWkLIaSNsioG+Nps/O2FvWrasKX4/M9C4be9o38YM7uB6e7PUeo52EWgH
	1oToWkVoqhtAZZv7azmGDKBqemx/TrZsBTbnu70epnPsDDjC7mlR/0zEUtEkIvDYJ0wTD6fR1A/bF
	YupR0RMN3oVcreltmt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp1G-00000004avP-2aLR;
	Tue, 10 Nov 2026 16:48:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0x-00000004akk-15Xr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13901505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329286; x=1794934086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=;
        b=T/4olVxnTvX5BCmhGDhy6DWXRqJUfVrLUvxCtTWvKH/Lbk6JR8Q5vyY/iEBMTmtW+v
         RU8SwFJzokSAmcppiCUSyPnmYhLf0aqDrzBYHI+h7sxEnz87RwVAfFpyFtbgCNCBdAcN
         OTKsaa+quBgC01sTQR83foMql8YP4O65ZpciovQGvh6+J/WAJ75q19mBFqrdYZNP62Xj
         xwD25kXFojFPnuZ/CejRwV2A3ylFlrY39DYnPsxRvVhjwHuk1H9vpoWrF/YPHVI1VmNj
         m+4T0OVf06YBNZAtDTgb9vgVN92h2/A1qLDPvQgEYZ3LhhZpS3x7tsZlZ00jjzWGjEe0
         +duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329286; x=1794934086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=;
        b=frxDDtox76JFWBqu9O4Jtgc6vd6Wbq8B4mRf6O0ytJOUJuwH3YFm9H5+darh283V3N
         M61qndBx2IWaIAivZodhIN/I15RRw5LCJNSvR/mfCm4BiShuiqWhNwkuHfBd3Y3zedvN
         r0GCm+plrNHXGqVHpeKMxA+2lDpmpBj4op2yvneXeYHTbjEefH2uxjvV+YIVYWcxDtjr
         qxfKP3VQrK5KRbeO1AflzzLz+REL1QEv5fGXHttEHUJk1bb6WHBjIRBzFevCGM16lWmn
         pm7+5Z6O2a+wiJ6bUbr8bsTDF/nv4lj3dvCFvHRG9bzLrIBinSmz0xXG+NsHRztI3QAo
         8ZNA==
X-Forwarded-Encrypted: i=1; AL+hErGrdwyJ8J3I6W8qZYCL+AqvdQlBskGiDIluwPyo92jHjxZnwdEf3AktmybuS+WIGqOuNqkXJpIFNU72uUrKerzx@lists.infradead.org
X-Gm-Message-State: APuU4Z++aDQ4BJIvuxDU/oP2yPFoS0GtywgH9gtDDMRj0KomNTbrS10C
	v8o9Z+RyhX9jmKPgzUVSMA6/gl6zI3d0eWAaA70P6OaJsqwdjLb08ewh
X-Gm-Gg: AYBFou05CgJB9dbQTne6QOC0ZYbHmvYcVC6y045rp8DIEU7j0BRl5198OuMbrNmviJv
	gSuIbLme9Ubqw5YcXHKpJHMpbdhbK29sF2t2G05zqzmNu44xsRX0j61/o5koPER4aFjzg8S2UUx
	CQCCa4nTpWD+OgwI/w8NEerwaR28c6wD8vJZzSNNwjTN2vXGEITkqhVNeJR0gJcN1mTKhP8s3SI
	DyUOMEBy2Win63We8HScR/Op8SQO/W/f0Ak3299IELZbiB7Q4DcsAABCIv+wL26WPHcpduobD05
	Jkhx7HDFTkwUtTFlouGSA/3TQp5m4hBH34lrkta4/Fuj8CI5HXqsO5xhOEPcHe1nz9gyZEFmRX0
	tUX30wMRFQdRcQgb6RIvlFvmIAsqH4EJmO1ZjdZFoHiiyS5T+IfP6qyQetaypxSX5xljLkppIic
	XBweqPSrkKfEiwrlMYxvO6pl3qPK3uyg5r4hCRT/CN4FSfkT5BBflR5qWLD5XmIxEfw3hikImIq
	T/xoeLoPxqN0ub0bYux8Ot2HETBNgHx1715j5ns1nidKlZfdxHqffNAjNVjFnmiGaeJqKeV5CDk
	BrpoEhBNF1Xwt1xeQIYK2+1fcgJ0FDnIMCMYqYyMesekIeQHkv96rbzVOxuzK/C/5bBqnwAvXPJ
	r7IDK1SXUBPd9gjOJxHuyOPil5HmSVIjkGUfF
X-Received: by 2002:a05:600c:3b8e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba023367dbmr73326205e9.10.1794329285394;
        Tue, 10 Nov 2026 08:48:05 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:05 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:51 +0100
Subject: [PATCH v3 5/5] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-5-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=cCr9oSQ7ijmTl0sHNAB0mmcjcqvy+3BnH3Zv/rG+4pA=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rA7SOj4zCwP4LvqClwcUlAL3SUUi5sg3T75
 Dso4NA7juWJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z1FaD/9nRWH78cALEuYlTOoVLuBlFwnxBDk5lcmdQPOlJvETMq+CEqsq+t6v9/eKLtLLoxEdH4T
 jw+AIUtoY81iQ33bh7PNl+0GcWB+HCWpkvnj/0c8jZq8ARhpoJ8aTfOgp7OWrm2VZlfwcj9JPuM
 mYDw7cxR5k4JhALV07WeqyN9XyN2bcGGEuFBPevk2Gzo9np93mc/lqwwv3/F4koHBN2d+NV+fvK
 BPuuDdFznh7RrxTMOjHjSLe3/jZ7zKBcd2kEviwcbq7aIP5ftAWwR8u5MjKZEQaEg5M/eHgSOK4
 cPo67KB1EyftRLGXBfvgWjZmfg8BQpaMc3L6vpP4EwcVRoYq+zYQXkNWbMoxc78sgdyaGhanfVH
 mOvkTuzbadxQt7fCjK26uPKs59icGp86793lHUtgc8PL5wLTpY0o6IajBCsokMm7O06AuBGAOki
 OoKtUx07MU1eRuT17r7XhF7NLUcm5p/2e0iot5gLjjdDWhNzN+PBBj0HzPGRbCnTH+DbtDkSkQm
 ZEywDAYRHWk1mXJasgT4OBmEoIdbjamtulKgd7QBQH+vorqgKfqd80VxjUnUifOAmCsDGKlc6qR
 a7ThQ91fSGhMxq1Wt/P8tIoMMazk0+g32orU0dy5vKLkKbcuOnYblQM5wbFebUEBKIwggjNEUpt
 m7SlfgYSxxcwM5Q==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084807_438222_D13071BC 
X-CRM114-Status: GOOD (  21.58  )
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

When the raspberrypi-firmware driver is probed multiple times
(e.g. via multiple device tree nodes or dynamically loaded overlays),
rpi_firmware_probe() blindly overwrites the
global child platform device pointers rpi_hwmon and rpi_clk.

During initialization, rpi_firmware_probe() calls
rpi_register_hwmon_driver(), rpi_register_clk_driver() and
rpi_register_rtc_driver() to allocate and register new child platform
devices, storing them in global static variables. On a subsequent probe
the same platform device names are already in use, so
platform_device_register_data() fails and returns an ERR_PTR. The old
code never checked this return value and stored the error pointer
directly into the globals, overwriting the previous valid references.
When an instance is later unbound, rpi_firmware_remove() would then call
platform_device_unregister() on that error pointer (or on a pointer that
belonged to a different instance), while the previously allocated devices
were permanently leaked.

Move the hwmon, clock and rtc platform devices into struct rpi_firmware
so each instance owns its own children
and their lifetimes are correctly paired with the parent.

Also check the return value of platform_device_register_data()
so that an error pointer is never stored.
The child devices are optional; do not propagate registration
failures so the main firmware interface remains available.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Closes: https://sashiko.dev/#/bug/linux-667c4859-a44e-4461-aa3f-5b04056cc1d3
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 50 ++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index ef3326d5cf30..7d8b89aeaf02 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -22,10 +22,6 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
-static struct platform_device *rpi_hwmon;
-static struct platform_device *rpi_clk;
-static struct platform_device *rpi_rtc;
-
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
@@ -33,6 +29,10 @@ struct rpi_firmware {
 	u32 enabled;
 
 	struct kref consumers;
+
+	struct platform_device *hwmon_dev;
+	struct platform_device *clk_dev;
+	struct platform_device *rtc_dev;
 };
 
 static DEFINE_MUTEX(transaction_lock);
@@ -204,6 +204,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -211,13 +212,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (ret)
 		return;
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->hwmon_dev = pdev;
 }
 
-static void rpi_register_clk_driver(struct device *dev)
+static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct device_node *firmware;
+	struct platform_device *pdev;
 
 	/*
 	 * Earlier DTs don't have a node for the firmware clocks but
@@ -231,11 +238,16 @@ static void rpi_register_clk_driver(struct device *dev)
 		return;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->clk_dev = pdev;
 }
 
-static void rpi_register_rtc_driver(struct device *dev)
+static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
 
@@ -252,7 +264,7 @@ static void rpi_register_rtc_driver(struct device *dev)
 	if (IS_ERR(pdev))
 		return;
 
-	rpi_rtc = pdev;
+	 fw->rtc_dev = pdev;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -329,8 +341,8 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
-	rpi_register_rtc_driver(dev);
+	rpi_register_clk_driver(dev, fw);
+	rpi_register_rtc_driver(dev, fw);
 
 	return 0;
 }
@@ -349,12 +361,12 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 {
 	struct rpi_firmware *fw = platform_get_drvdata(pdev);
 
-	platform_device_unregister(rpi_hwmon);
-	rpi_hwmon = NULL;
-	platform_device_unregister(rpi_clk);
-	rpi_clk = NULL;
-	platform_device_unregister(rpi_rtc);
-	rpi_rtc = NULL;
+	platform_device_unregister(fw->hwmon_dev);
+	fw->hwmon_dev = NULL;
+	platform_device_unregister(fw->clk_dev);
+	fw->clk_dev = NULL;
+	platform_device_unregister(fw->rtc_dev);
+	fw->rtc_dev = NULL;
 
 	rpi_firmware_put(fw);
 }

-- 
2.56.0



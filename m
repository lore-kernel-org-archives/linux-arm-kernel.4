Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68017606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Il5edCK4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvTOhZad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=; b=Il5edCK480rW2RhBAXmHFyb+TW
	NPxY+bmmIz8QtYdMFLLzlGzaXdj3+AdL0YG0xsjmC8Cewkov6/a7iqPkpbFF3+52DtpfzhSiAvqyt
	1JPgfnzYTiLysWgGLfH4r5CaCmGEGiJ/8e6jOq5gQER2j8/3CB7qiOu2v3RBcwcMvEo3R7BYYZMuK
	dmjyZLbwaByjHbEocf4fT7pmtqrtL41UVJSH/Ek6eqyQoOctu/u9qOrtuAQMwmhr/NbYHbywsU0I4
	FCuycdiYbQkMXwMtxeCiYs8kvdNijaF+WXQEMuuWUleXmQbB0OIgTW2V16wJ1GyJd0CumXH8Gdgab
	KzIzRdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqv-0000000Dp0h-3PL0;
	Thu, 26 Nov 2026 15:57:41 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqt-0000000Doza-04In
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:57:40 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5688555c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708658; x=1796313458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=;
        b=dvTOhZadGLmjMKlInjPhosGnM4GT2AGU6Y4MRCPtG7azjAOGHT0M1oM4RicZwi7Z82
         sdnnuo7jfBk2EaIlLSo4RuV6a5dwfo2e999ntQv0FR5m75jPAVds2xgi4c3NPf118xZ/
         3mGmT2lofM+XlJUrWqFhqVsrJXz4SZ/U+vjM2MF1Vt/qfiZlrL9SS4OGQuFwXT52Vdr1
         DqKs4nL/5mh/YW5kp/1+x50iH7HZd0qQ73TlPbufn0qHexN+jmtrBafh7TAMHWWQK+f3
         8/KvHo5dYT/ZSfW3Fv8//fBfuTsHhtprA11hGm91ltpsQwfQfMReRRfuVQMWkA/IA+uJ
         BnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708658; x=1796313458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=;
        b=xQ+yKHDzz+Nr42kohGdPfrpuoMPOxAW/MqHQvXgjz9JFBkvxED181v6IfIlx6EEAgT
         g4MzqXNcRo+2JnxrEpcNT4C8KH6MnQ1S4Dmad1eDgDnvzXv0HmP3Pa6k6pr1zcEMbdm7
         dkP/dplZrjC47/NDUH1mJgRSqio8N0RuzteaXER5R4XlZiU1G+PCAmMlyvLTyZp1ln1k
         XluuIRknNDcRDfiAY/qKyQj4UTN1KtQiSs0NClr0/cVOwGKWiSdcG0joRwP4R0qQkbwL
         6QEZIUrMXi6n62i3ofERoWfeQKeLy9viM7RNoOtTRVWgIC8OrLBZabprfLJ+fNTaCvDw
         c03g==
X-Forwarded-Encrypted: i=1; AL+hErFSey9mwufXgFLwnxgTO5qFgR5EKD0cgXJOFYTH0KoH00LpkUJOjCH3LszDHycvL05gkSzthzPCJVjo0cxqzx2z@lists.infradead.org
X-Gm-Message-State: APuU4Z99SpGd+AFTr6T2s18DFg3PlXleYdoapbWDfC9/BgckY2WnXu1a
	FeyG4/9go7QDOf7vbW4TLK5UOswfTrXqENb7pN6dETtABMTE1wazmSI=
X-Gm-Gg: AZFdTZdVowQqq6c9XOGp5B57OQTWR8NLB/BIwAabeLoJuaGzu1B4WMRhqs60/8eGOdh
	I21ORHe4kicEqtg5+rn0L48RX7V3EIU1EebWJB1RzHE3NINamhakEoCaWZJrpBlOjH9ceME2B8b
	+vhgq7T3L4T5g93EtTk1/TGNwvMHaFf7/R8SPvsjKEszD9eqgAFF0vULlD9F9vrCcmPJqj6Phuo
	kxccTcumgZ5WMRj0w63uHijYZrA41Fw/WPs2qm1o4TlMbZf1wlgOQ+7b0fO1ObpZxUCNWtEp16x
	5kjvGvNNcedkpazWzivlmlcIzMZ1jxpS+KummXMmZqF1BToi8efKhxuMzSBhZs89iQzXuzxrove
	dYUmWne4S/JPwIgESBFz/9G5vSy1I9BllannLUGBCG/l3CzCw936k4tvWRMYna7F5E+gox/xCST
	eNRvd7PqcygnpF0PoOGaAjG4Un1T/ihZWCndEYbmRJPmsq7PPYWVmEfjcLn/VAGz3jhv7Rci4gM
	Zhvd5JIu9rU1tmz4BAl5wdKI6nf6URcULCgkt/ArNyCC2IWSZl66w/JotJRa2HkKoxD4oAMaaIC
	BK0lt+evZ+uva1BeCLufFo9WEoCfg6WqIfmrYAW5Q7To9ddNrhmQbABpKSu+r/0tCjp1etaXzMg
	Uf6czhFF+38ki
X-Received: by 2002:a05:7022:f509:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b5568b7e07mr21816423c88.24.1795708657937;
        Thu, 26 Nov 2026 07:57:37 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm59966455c88.7.2026.11.26.07.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:37 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] coresight: tnoc: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:31 +0800
Message-ID: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075739_054678_81F54EF0 
X-CRM114-Status: GOOD (  14.81  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

_tnoc_probe() parses the output connections before allocating driver
data, enabling clocks, mapping registers and setting up the trace ID.
If any of these steps fails, probe returns before coresight_register()
can take ownership of the destination fwnode references.

Get the platform data after trace ID setup. On either lookup or
registration failure, return the ID if the AMBA device acquired one.
The platform-device variant does not allocate a trace ID.

Codex helped trace the two probe paths and draft their shared cleanup.

Fixes: e54a52a28a36 ("coresight: add coresight Trace Network On Chip driver")
Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Add the TNOC fix identified during review of the TPDM patch.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tnoc.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tnoc.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ec28b439d73d083ffa0de52ef454a9cd54b88175..2f3e2044676358925233c59ff3977fa36555c2c3 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -191,11 +191,6 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	if (!desc.name)
 		return -ENOMEM;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -217,6 +212,13 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	if (ret)
 		return ret;
 
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto err_put_id;
+	}
+	dev->platform_data = pdata;
+
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
@@ -226,12 +228,16 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
-		if (drvdata->atid > 0)
-			coresight_trace_id_put_system_id(drvdata->atid);
-		return PTR_ERR(drvdata->csdev);
+		ret = PTR_ERR(drvdata->csdev);
+		goto err_put_id;
 	}
 
 	return 0;
+
+err_put_id:
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
+	return ret;
 }
 
 static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E576606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z2L6k+xm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hmj8n4hq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=; b=Z2L6k+xm3ya54k
	+o45WIKTct4wj0MENMFXipm0CQWq3FODBLjN/GpDQZFBBiIa4EpjEHUbL1Tsr9Ui5Xvd/yLTcSLNR
	5YsvqRiPSBH04niTxTH/Uo3UKtk/iXebbg/yrqIP6l19OjBUvNe6cLOStkszCusFsHxxm9WC1uynb
	jrclIzUI7haRmBe43GpLUwCpul/zS2+s1LvMXtQ8gSw8PxT4dlZdGXWZBHjnTYEfLt3te7qWqI48p
	Z4PGWXGl+3WSBTuZ69UZ3iDUDWzswH9oWQS+pjQpKz8GtrdK1YveDtKg9OYhC9b+YW0EEfLlgCVwK
	RW2tpIlf7ll0N3KFZPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1Ws-00000000o8S-2dxk;
	Sun, 22 Nov 2026 06:58:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1Wd-00000000o2l-2zuh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:58:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2f045b921caso11735045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330691; x=1795935491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=Hmj8n4hqILpCjp309Z2/5Pe56HiqOvO1tp5ioePUjBKcWiK8aDS+6Y1pkWS2ZxFBbX
         uUc39IlGgM82aElzsEIfkT+Aah3bkJeTf7jrSPPmcCgBJ/H8EUXwftexBi0TBgd+azjJ
         gh/u4AtT73xNkAP+yc6LW+V2rbFsywpsGxZgaksp9nDWIK1UYI7tJvIX/cAQA2QcGTrK
         7Cjr/Hjsv9qjHM8SkHlmvblw8JT5rXiWR8mpr4A9Vb4CV+dazp8mI3Y6huEsE5xCh1Qu
         mVP49h1snKAQYt9m6cZPXDw9hoyjXF5/cdnLYUg73G4QEpUjJZRHk06FeLeOUO8efbPT
         synQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330691; x=1795935491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+PnSLxKsJCEKZh3Ds403ivdl+AA4FlpjzNhhNO09oY=;
        b=aIn/VKzV21cHmsTV7eMJM6X8mUZ+QPOcJHLooui1tFKn9BgRhkCQY6dbczLFiaqfrV
         N3/BuqaubS8I5QoDwX5A3zGS5MnmI3FlQlAmQqfUVVVx8WVZ3cs4jve4GbRTEE3Qjdev
         tZ3zqh++Ppsi27IXaHW9j1JZ7Py751BzBmm1UfACaVW9ibzSh2BTpuQ8eafQA2U13SNt
         M/CZKTQTvDqZHEDjQsGVJY0I3IwSYkZI8PlruEdcOCS5ZfXMG7HU3IUJE8Yfv1YeULXu
         zNtqUR2RiYYLcLweg4o4ZVosS19tpS5qg7OYQBsuvsOpavGkBdnsI47hkro5oxKXk0YX
         yNqg==
X-Forwarded-Encrypted: i=1; AL+hErGVonN8psSpe4RxBPIFDBHySlJZhrrs+8KUWO+UNuVBOn1Ks6DFKxxlrz06ZcA/K57+JRLGzEtkB+7uI9ihYEsn@lists.infradead.org
X-Gm-Message-State: APuU4Z+o5JxeMRUIO1APm9Y+4LoRUSsyjEMja5F5ZDBcygr3YatJLtSu
	silr5GdXgJnsBI8M8DEWY+dQfctlM6ZTdQUXicKEn58GKKLM+GvAYWXA
X-Gm-Gg: AZFdTZfTO4861D/2VmgdCPK2t0LNnvURpO3zTxZ2LKb+67S3sWVWkoCJkRGcdLdmNw5
	vhjVA0yn6uOrdvdKOxrqWpVw4ZBz6e39+xaJxTC6NeuOo0PjA1giqYj1JOPMNUvH2KgYNUwGzTg
	gDovpr7EBR3K4HZn6JqM292RqlOU87U3CgXB0bSyA3WAUrc2hNq1WUMHUswS3Wozngss3am4X8L
	Ys6zi8Dm9ij6qpNr4RoV2+kEjRRD7vqOoYH7hu+WKs6MrpNlq3W0asb3Ptbn6zpacCf2mTPJjOB
	2Bd4RLWbH6elBFDlRC/YvYs/wOLEGvbfQdunpFJMtewwXM+ylgEQGX6e9mUKIjWez7wmAe1QgP5
	DdhLhGESk5nkcNKbtMMhpWoC79v5qKMHN5QKvH0dTI0fdwBeFovroL2yFma2Vpku9U+1Qudn3a/
	XXFLd+XRc4WnxpZQpw4Q/J9ysvrLwUxjFBnQwXwC44/3WL1iamXF1n3DTq7kHSvlkKCtR1+rMaD
	pu6FSpNKRvYLTr3lyjwV3yhGyG4YDskjQgZ7U4rGbOUmoTy4pM0LtB7ERT2BBxSGB7phaNynI1Q
	mOJgyo0w0uc6RKaRHQiOkC1TliUeiqOUvO28grxlqUJf1Q7iI3qr
X-Received: by 2002:a17:903:240c:b0:2f0:3382:cf52 with SMTP id d9443c01a7336-2f03f156ddemr67246795ad.15.1795330690792;
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Sun, 22 Nov 2026 14:55:23 +0800
Message-ID: <20261122065549.3265519-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_225811_754855_45C17C42 
X-CRM114-Status: GOOD (  10.62  )
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

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..f248a04b925c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0



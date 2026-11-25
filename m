Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A216606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wmDiZgTo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OO5IrD5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=; b=wmDiZgTo5piA54
	ETrqeEsQQT6PaU0Usrelwbt4ehNl5TbuSfWPcJZ4en/dxR8csh8p9z3GU+LeSEv/Iu83bqdBwRwo6
	PKK64HKelPHjx7Xk8nE6yCW2iecAR3BZHcTZWXdNXbqCxeA7nXacNdQSl0hgpmmnPAXyRyScZn2+t
	T2VBWRwKlKmHTkvgTKt8kg/O+8WM6oNES+JuvxlE6lh35yu/1d9uAkyQRS7o1KlOubEjbbQe4r684
	hj1wrHmu3myTUmjOsJjSlYeip16SXuvcKTiMo3D9dsNeVk61y50fMM53AIUKeJ3cVguPZL7alkct7
	JbcA305UrZBD+1U9NPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hk-000000093Zw-1dsp;
	Wed, 25 Nov 2026 08:23:24 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hb-000000093U0-2nTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:23:19 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-38692f62b22so6087199eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594995; x=1796199795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=OO5IrD5fZlOfWYsNL7OCQOq1s0BBTuZHD2JOMNZC/1HWaqwak+zSjDfSfXtC+YmTj0
         fTU7LpbWBLsiYePLorqlFp/WztVh+QCIXJ7TWT5L3wL82HOTwkt586E497QC1xgtTjSR
         1xnkfHSiP81290h92PdISxo8k7limI6sFSAQTxqBbmz33PTM9JWuvoc26mT9KIl001w/
         rGW2QARDtF11mXpFpjFklMBdHOPZ9iyHsNyVVW3V4Q3HxgcpsxfIIFXDpDSRqB2JZkWz
         ANq5cA3EKRcZYcljuQCQ2KFqC/ohevnGmyA6MuCPHB8KlkvsB5Eya5fkYF3jke4pAbUT
         l6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594995; x=1796199795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=dnZOoBa0ggcHiexVB0xEiveg2gExylbnH9QKWMEbHwsFepPCwWxA+tObXsEFd9X/e7
         j7v9R9ES1Jlcve3f8qeSZ08OWWA/qVR4goHSNjjsGCHr67MtLt8ycP+ik4j/HylHLu3i
         0d/Hzl1iKbV4wZQ5Qxja3h3uMTrwr/EaS5z6Q4YOI/QXlZx6EKVFipD2qDsCwSDoOkpt
         UIRotj0dPEkY1AXaivSFKY4dWUb/6prsKg628GwiHphLGAvb/zRD90gREH8ayLa8AUXS
         QbL7mzw5JB5dfK0pWE+xTsVRpBPdT/jQjGZfqZtE83yoMudYw+1WnBcKnbBhy3uym6w2
         nQfw==
X-Forwarded-Encrypted: i=1; AL+hErFt8eRcWXmKpNuICx+UCgKswQqsxpXy5g91A/z1us3WiK/px98Mskl6SM2tWDpCikImqeMtdLKDrx7GxWpzBwrp@lists.infradead.org
X-Gm-Message-State: APuU4Z+O7vmPE0AoajowhY3DCmUqFuZEJ15rXdwkVx2emIOpvVL8FFKv
	6HyQU2Q5MlwWl0562xhd0UkDBpOKDr+MmukesDaeJ5Mi66mdqTwLk/ZW
X-Gm-Gg: AZFdTZeWDRHx+XKfD19Rye8V589lMmx2hIY46d9+ZnDGbc95ke/Eh2yY2KTokR2RPBG
	YFIWjByJXtUfbp6HtWqgRcz/5SaxjHul+ra5OFyCeW3521kzynXUkGa6YZaYDZaZw3oRQgSRkK3
	NCISmtq3vhK3u66jXW8NEzKmBzJ73OLbbzljdEyhOOgZXAZXqk+MPKvd6ChoyELrV7HXQ628S1D
	Q5ybN6YKfM8QilmVloY1GS81M2tY3tXgFVWsaR5Za2T4LcSi6qJD1whHuMpoV5j8B4WJy7AHi7J
	DQupPzXqpAwS1S3ptY6tARyqNjcF/FpvLSKLXwCV67izAqVzddFRsKZieotcHKVondxKW34fiSg
	5T5YEbTpNRHz09+fzhK6vGVDrmOLf2nZLQt4p7QB/2DYgJh0Aucg5QINMdo4wEPM/gFK4cnlcwt
	5+/feXWKFgqQinw04QNR5rBJyDzAyk7T6Y94mMgz/zKaXtiPTEAHhF5T0FKEu6JiVjhEnblIQCp
	q5sKKvKqJX1DTAm9S5Y/NGDwrVBVpvJF053K8QjLmMUpcm2I27XzSL/sm3835pT0JkCN9e4j+xA
	8y9JspU3FZ1810lYHLsHMYaqaICJTovT4XgQtZJl9jsaprBB0rTle4egCm5oF6zjZZV4+mojy0c
	5WuN4PELX63EVGxZ8wg==
X-Received: by 2002:a05:693c:88d8:b0:386:954f:7c18 with SMTP id 5a478bee46e88-386954f7cf0mr14871602eec.31.1795594994538;
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 13:52:20 +0530
Message-Id: <20261125082222.136238-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002315_705356_96FC5511 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1



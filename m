Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B9606A897
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4YVursme;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bw5XsoLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=; b=4YVursme9au68W
	Rn70b9HDO7BIwRocw+azx4UeO9JBGHfNpNsJ9U2bA8KPzhETvlCi91hs3mOve7Q8tigRepSP/XZPd
	6Jf8sNqXtuv8KSn7bYAHd3kGHgfIoY0HajWssBkzdWq4UpJECRC2jkp1sEmJMxYmH8OtnrhWZgsn7
	IX3xKgFub//0/y9bCQMakdmmt0X/MwVPhyHlEvRcmcBjQXQpMQREhKyRfWS8FpkUkhudN8Tl6Ygso
	qbbzZwG3aokMSNhE1QbFSagw/sXcA+grZoPDkF39fk8CbO8z/RH40aTZTZeWBOloZgJvN405/ulLf
	fnmulpwvRcpo7d4q/gCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QZ-00000006orE-1xSP;
	Wed, 11 Nov 2026 13:31:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QV-00000006op5-410l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:31:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1918569f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403906; x=1795008706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=bw5XsoLyaIhSrLoZLzIgZ5WUHNQfUJuE5TP4QielsGZ23TchqC4eQEtBEQNAdthzdu
         33x9j0IFJVHKh797B6M3mcobSY3jzqXZj7t5LQgG5JjBTRTAKTmvIEdgklne4fXDveK+
         60MFzMKq+xz/6vsnEHjzg/TUnf+S/TlYfzuYK+PvXjVojJuxZMWEao4w5msZONuVDyfG
         miDTWQOofXZbZMYF5zSgmTa93S4QVc1jTiejCZIx5hl+gbQAN91gjyJ3QfbDd/wV4N6g
         Fs+HNmCH52KqQNMLLDxjn4PEaDUrgUGouTr2zQ3I50+w76XpRDWkL6eXYbENtIstAdRe
         cVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403906; x=1795008706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=GDjUxh1PZk6IzBx9qGpmtYcHua0ejicjf6KikTOqbD8uHN8HMkZ+AOoJg82fTpazGR
         7b55+IxFTzd9pBNwIo9h+d8N3dMPHaH+LaiW+pI2GtoWV60Jz92gIBlKPYM1fk3woTSB
         hAlLeOBcNTmBwjX/ofOiHMOL9PcH+27qTMtX9m9t96ExRrLlNXzYd59g+QI3F+KbE2SK
         mmLtGfPZBX1IgXiBvIpXwRTxN5/L4Gj3HPwu4rskExFbrHe30PaMrGwCYfnyB/VDXGya
         kt4tn1bZcDiJjlyKRWXK8VWRCkz2gU4L8EwZoL1h8Y3edqsK2yuOE2HPn2IM/RPb0DiQ
         T4vw==
X-Forwarded-Encrypted: i=1; AL+hErEMBS5gU6/MJc2QMeiQ6gTtJgVHZLIMu/pcAjWcVu/dMKvHFw+A5wy1ltxVhv661V1GxVfyHBdlzOHofRy2+Zf/@lists.infradead.org
X-Gm-Message-State: APuU4Z8+SDud6ZADSs/Vb8zcBUL3jlZghG07eXjQM01vBIGFtrYwTsgu
	7992xIDCjpKuO2FUuPmS0hwGJiRZ7UsWeQ1JTAWCBcJa7V3qtVwPdP9K5MNZCtGj2q8xB+b6ZVS
	+70W5IxY=
X-Gm-Gg: AYBFou0Kx+bN2axzt4zw9tU2QktznbtvG7vQxgXN4ao4i6V29dZlaiDMZP2iRm+iQa4
	UXE9eHv5RB0XRLE8Wvcsq+fTvZYPrDfBgem7aL0d6MFRLPROxF/6Swf5KrEA6iWDCO4JHDIXUPv
	Wd0kabDPhcV8oTjEVIA9QZPLaVkslZ6JWxa3UdLKp0ZJSEB4G1hI91afFTD929ucT2q8oKuSnem
	5IivyvXSA7JfxTU15bEbUhJre42dVEvtLSzOc8hP3AK0aV+wHvWXZjg3TmY/ap245rcquvNBLdX
	H4WcPuHNsiNIFrxfnyYvalnhxdMs2yMfMG6rCl0kbagfSkbaGA5luIblMp7uxbJzZVn6+SC8Cwa
	Q02oGuvglKS1uLlpK8B/K+HxSvqDvrt1YuArmYPPf2GM2SqcqXraZrRjgwf1JA93dOf/xhHCEhu
	D7V8jsYAbURtAR07q2PU+ULfQixhgb5SAiF7Q5u6VTGSKrrWZEHsRiJjV5hEpCVbdVKRcI+qN+a
	CGOBG218Di0SI1QZTp8xP7bmPli5a6tJJfD5qXVwb8EgYG/0Ev5LMaVQyL8Ry3V2Oqe9G9BgCGS
	IR9Y2n4qgn3lMe9RA8RxVKO1KeK4lB31xFJf9qyM4WHgfLOktb4BTPgA3+RKuXDHCYSJmjZpEBJ
	ey5Ja9/PxLA==
X-Received: by 2002:a05:6000:4688:b0:493:8704:ad42 with SMTP id ffacd0b85a97d-49a90b3a0d6mr1095762f8f.7.1794403905804;
        Wed, 11 Nov 2026 05:31:45 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 14:31:18 +0100
Message-ID: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053148_038545_A89E7E5D 
X-CRM114-Status: UNSURE (   9.27  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3



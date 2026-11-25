Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C195606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljMRIwjY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=din6on0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=; b=ljMRIwjYBSfl2p
	clFBXhN9oQ1qZBRnQ71nYtcep3OgCKHV/LY8so+ih0m/beFg9SbvCAGc5c3Rx/0OMfkAllFT+FKtA
	K9nP4cl42KvAuByTkIi+dmVUDJ1ViV53x9om2DcENh7q62QOyUocB/JnYr/7MA2gLDNpDxHV4lk+l
	XriwNdUiYRgTwbHPAThGg7Iq3lSGPZmluTxyIUGLNvmYlDpCUOk4sR4YP5VMbRYhwxrgnShH4WMuV
	73waRLh6ONZ1HYHGkAL79xcBSqFrl6RYs9ReJwfbGPpSvi8HtlklPek1ePBaZcn9JDhOfOi/QkqZM
	W6gVpVkhc9OGrJPJGJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLZ-00000009fAh-27vG;
	Wed, 25 Nov 2026 11:39:33 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLW-00000009f9N-1u0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:39:31 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3771489c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606770; x=1796211570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=din6on0m8Odlb4LiWYZUa2R6njLjHoBZuZ3zKr+kySF1H+WXqXvY6ddJPvQT25Tiya
         iFkFUffvTv7CzATqRPjC9xiuWYbkHCwuoPgdbhIEMW16OqA5TJsR+XQ/3mPYDz7fHGNx
         nmyeg5cydF/ADR94eduFlahNlhVSN6BDSEYCIph+PaouMQm/p+SwNQerwnsUxmb7z5Hs
         ZSIy5vAZ12iw1ysKO3lFLhBjwVKuh5rZ+o75DdbPIbwFVv4QIzmKdaurBs+RvWOBv08N
         L+u5n7AsTwNQSA7DNNE9fQWJefTiv4NUTI6kIxo5wU8b1C26OCtsgpBhVm44LWDaJol/
         +KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606770; x=1796211570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=GFonRpo36B20wc2R5zdOG3csPQEiw36nz6qAybZDAZdYnUxbz8O0WquZ0xUouZxsGj
         Da7k338LJu0XJN36FgEY51a7HwWPqwq6ZBvvTug44L/sWpg8fViZrY3w42md33vxkM37
         J/PFWrb7y3iOTjBn5a7Tk5ckwO7MbZ++zLVcuEHOn6ciN86ghtMnmEqP995031o1a9WR
         Eh/OaRzBxp2G/ypSDUJ1s9tc4fTEHs/IuO9Si0XxPQGvbcrUaK9xFtjjyz88eiOnhVAi
         jz/NH0DNQWtszNbbq2gLVvxwmqdc1Jp244KTlaqP70DOIt3rzwoTmDdash0qp6ra+tbb
         iEAQ==
X-Forwarded-Encrypted: i=1; AL+hErFhctFG8y8YLJPbnZqHwPqpVB0aj7OHPW+2GlDAxgO3cRPxUnm9g1H4NVJmjL/w/Ag5VMsHC2GSsJpIPStWbO2G@lists.infradead.org
X-Gm-Message-State: APuU4Z/6r9gd7hyPOsArvuHI2DDw6TdXuUu9ViRvq4RQFgrZhdJkWqAQ
	EW9KhzghUWCulJOReU+ElDBloe4I8dQulySbqx32mBrnJVUnwX6u1xUP
X-Gm-Gg: AZFdTZehTvPRpWg/IRxNdcy2k5AYYL3+/Kc85VdZOU6BEnm5TNnBKbiFaBxYrR5T0O6
	Qei8MwiS/Q8I3UpgfNddVIYN/7OHmFMpsoxD/UxBzFk+A8ASRzTTRBmJHWkpYjZzBATq/SMNS9N
	ekjVpdTJNMlYFMnPXATR5dzR78Ru0Tequ/58Yr7+GmzyTPLC0/Ya95UXocMHJ1I9JtypVU0ymHF
	NpjAlIKTPZ3OKqDuU7xLQS5dWgOKpjUsZIri2LIUXleqw9XNHrBK3fe5p2bFwLxYBeAwWvn8ZNN
	pcPTO2mY6Fk5QL9iI2oK8d8+muQXG/0LXZfuoV2vA5B8YUP8GCFLevD4wbxvTrPXvp2LUZH00zv
	8ix8ODzolqjd7XW8Ft8CDL36F+dtiy4OCBk0sDkSpeEJxjuhDyu7rex3r1ChzFGqOnuC96+lQSW
	zOjHpTgVqNEpS+WMdVt7e3n5fDK7ykasdaNZUoADzltXI2jpDzeLFaW3HhPkN4Jd83xiFxHkQuJ
	7Lq292r7VwzsrEnnIpFnJUpQtNLUxGH2UJVsLWrBE2RCSvyKHCQThidlXAM2ChKSv2vvrSS8Yai
	6GDiNleXdZ+fGCNnghkQ3BM1aHH1iZHMG797N+yDNc50Oo4=
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr17106600c88.4.1795606769639;
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 17:08:43 +0530
Message-Id: <20261125113845.297658-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033930_495127_3BCE379C 
X-CRM114-Status: GOOD (  10.20  )
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
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1



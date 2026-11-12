Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD9606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ii2wG83i;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoStrknI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=; b=Ii2wG83iPu8F1P
	hYAJsSwf4xXv2/Ls26XRhGVo+Qi6fdEauFqfqtdEBuK0QzaKgAk7fsxcHBF3rzQaTwIqSoSk8Vny9
	DvIhE+pONJN8RounEXuvdj4eLXthUAOs8uA3rdiqX35nvnUxHS6ExvkVBSXQ8EGVJt1nQZNvZehZA
	keI2dS42lHSakrBPS3TvwE7XgXSBXaTNoubLvorHLA8MV5KuvX56N2af9yoDDGrCpdu6Zb3GE8GzH
	O0/7oD+Qq6p9M8A2RhHT60GQ9q2+vXd5/tA7/fkV5Wb1vSG8iUcXQczhEWZxSGFDyf3lceLkrHmRT
	rczr7IWM4EJ9CqPP5WrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXc-0000000Ax8B-2PDP;
	Thu, 12 Nov 2026 19:33:00 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXY-0000000Ax6z-1jo7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:32:57 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-37600b0db49so1139514eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511975; x=1795116775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=GoStrknIhJZZD99qQBz8jd0Ke8U2fR29giFU5Sv/PwXu1p+yProo3OKP2yB9BNWuNu
         y67uZa7Vlb1FzDwip698wmHO7yKvRvI2Hzr+azSVtR3p8DxgA9TSjemZlsy8N7Rbb/Zu
         7GqYyyuU69O4JoZlPVHMv1wObBmw1w1gSGH1dZTPkBbixtdWaP0YefLjvWc8u6JxMIXK
         Hf5uDPc+w138svSupUrNOiALbV9GYegr3cO9HLN4nZpsXx+iuh6GcmIz43OYZ8R4hQ9V
         yRXjWtzMxM4xH5s934C2kk6aqtHO3DQJJUoAZvyZs4vJkd6hpmum3CufeJ6MflQ6TmqQ
         SE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511975; x=1795116775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HwqTVVnFT7TKtTWFLYes0RUTc1B02SxtEVX6833g/A=;
        b=MUC+JEbWbnJDxYAnUcbGBD7Cu9ZVJezpPdYTyW0UoGzq3FGsCa9Cc/dmunDu6rzHEt
         sxTch3i7A0MpqM+6DLV8xfHrmK1bNCB0dS1BYk2r0+axEURX5NwSZw66vkEQKFvDw4zV
         lXrJlsNgXx+utJPlR/EMsTMfP57sMLLAYEeGSntVjnR07P7T5stplaBjwOnJ28thH+J/
         ymxvKnJ5I+6fCNnFc+Iic6FThcI1fdaaBQ86ozf8UOtqbbW7vqKKrFSxVPBJpSw7sBh5
         xEJmag+xgcis3ok3trBzOYFZnx6cXf4w5wxMpQ+Wp8aq+PgWZdyr/R8WTvK606Urm2EI
         j7tQ==
X-Forwarded-Encrypted: i=1; AL+hErFYfNXctxvdr7VaRlkjnwz83ekL0PDcGo87Tf9CdTLukgdcWWQa7WRzEhZP9BPXVGg5n1+rSITafyZDuCQ0aD6w@lists.infradead.org
X-Gm-Message-State: APuU4Z+zEg/vLxOCbFKB/cdk6qlwolBg2o4ohr8WM/S6mQTUUQzFP9z/
	F9ulN23xYyW4RObSxt27ZRDSfQTKghfN7zsTmQEeaP5HorGoa3fBlXIv
X-Gm-Gg: AYBFou3Pr5TZ+9vOuLTzoe5ZqrP7MuAUrChCj8SboDNB9kx5wQHmoQsn8UJYsL1e5QP
	6N7pH52eJqaez77yMbzk/TaIdypsXWq5hVv9wpwkXTif8JEq1l/jvsfh/BOGAbKFBT6a5kaMEXs
	6ul2e8O7aMeU8ESRo3WmCvOaElQAiBoR63+DNEQ/HJ2BAZjgfKCq0U8im1iYXzMm99gl+qqQHTW
	ALUgyj2gEAiwaTf7cKYLCTkbcHB/qrR7Y7wh6UkHkrO09Orb5s2psSfIiEzGFLVF/kqc0hfIcdo
	pa3mztOfVSoVDDZdP2dMfFKw1yfo9hWDdkmIudxyDRKtgq9/B+ectphn+WLu/GBSjv2zPg5ybLl
	i82aLZXeFBlFb47bBy2sfNnEYAXe/fw4Fk8jx4pq+w6QWJKbNtnQe4IPzWwceMIn4dewcGkhq3M
	3MHzT/Jpa2HIgxxM38j9c09LkNdtP4oWwxjqlEbXt8acNbiojrVCTW78TQvabuZhwvLqDZ573RZ
	HBtg6SYKUuQ9l5AR9L5DsxpxzkAr22c5Lvzc3BDYSQHN4btVlhkaWRpP7kBpttPqV3jGYl9wxVE
	2+n1leJ14LY4vHNy+bdYoNlXfOwC/O8qL9md7aYg67mFfSFRHz1IlVHEiah1Ca1tFT+fMQw=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr4156057eec.25.1794511975341;
        Thu, 12 Nov 2026 11:32:55 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:54 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Fri, 13 Nov 2026 03:32:44 +0800
Message-ID: <20261112193245.250149-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_113256_476277_6DC0D50D 
X-CRM114-Status: UNSURE (   9.51  )
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

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..e3bd3d7660 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -34,6 +34,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0



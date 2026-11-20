Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF03606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQPKUN0L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBY8OMXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=; b=BQPKUN0LNzIdev
	L50DeLu0JxDvHLJA7YOlLpwmZhWyCxL3W4LoKICNLpaIv2d7Gl8qoP8c3zNFXHs7fW9HlvGMguvmd
	WkWZocANB02afV8Ng2pXuPi3c1eiY1NmchOafIViXiX+Xb+6wNiX0IRQYipqJQmNDFGipDlW0bM9p
	dzVcYzp0rahnIaVK89Sb0PXjv/T7mlXuSnS2nOFqcngoQrD7ZdTbaQEe2sF4n4ijpIK3WZpnNDGix
	2Bsw15aeatOzPXoBcTkGlWToxL6LRYOJbOcj44ggqELUQxg7UlHt1IXtvefAv/jWfWhpqTycuO683
	QhqdVg+Dm9r9qmCSyHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSh8-0000000Flta-2m70;
	Fri, 20 Nov 2026 17:46:49 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSgP-0000000Flk8-2xDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:45:59 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so761774a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196757; x=1795801557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=aBY8OMXS8GyKXyYDeazp5UHtcnqG4kNeQwh+9I9I55FKjFjyQCOZlcG6vTZGJQB8+n
         n4IPyH1Zp+fRIs/8GcoG+eY9b12c5Qgkwr9g8HOXweviAzLsPR89yn5gtTZqpw6KY2pT
         erRy0dCg7AQawZ1DBbu7XMrSwuQKYR5bCGfZQbOLpYS10lCyxwhZzGrKMIk5QZkg0iBd
         KT2LNasLcOhxzGvvFdj2oysLLEKrwigIpGxZs3uQqVcX7mkiLhT28f2UFkioPazqmypC
         D9k1HJvRNcyrL57tqkKEykPwEk2xtLrwXzRhnHvkgb1/ZgMvWB8nYxtdBGEKZasNCwed
         LMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196757; x=1795801557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=vwU1dqV5AIjWCYM0HNsLc3jMMmJ2yzCJ8wIScOnznR3IQP0NmUlBHW0Khrs3gS36DM
         hE35MvBed5oTDCcL9kJHHyK4Lt9IlaqJAL3CE+xC3cUwetnM0V6/MPrnJpnVVBIqdsVH
         AQTqO9olqhrG3SAhyZvIVQ+YyyuULXu/Y8FFDIY+nMWcXJaPXfzVfg2q6PdeM0bN+5om
         gaY0ki+UxcUjrb8IbDWs6ORzF/DflyKTE39Q48R10e9LCRaJQGuUlcokuHPeyCGz/YF8
         saGRFzuzBInbRKGWtU5K0MzNyYEbDViiwTr72jQDAKxW6a5qyFGJYIHEglNsXIs7/v1N
         hL6w==
X-Forwarded-Encrypted: i=1; AL+hErF+zFRXS2f17GEiLJFxY1hDESPqMcgufZatiGPQgWYhdL3FnehtJGzadmReXRa6q/MdTh2CvWxZnPo8wflO8mAQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8OwOL2d8K65QpvEKmYgG9Cvw1ScHBryQz58uksaFpdbkuu374m
	5qHHIVf1phUI3RLL8Jwvnm28eZhvJM/uxifQTVpapxXBd3g+hEbziCyK
X-Gm-Gg: AZFdTZcMLyhPM5MZ41fQSuVp4oBCuWZBsITQra9BZ0UQJRwcso/yVIrFWzcsAW9mL+/
	5sNa3SjJFNicblWBhJ74W0e1PWJx0u/+O9b31cAEgO5VCXFkj/NR5qu7eyxhr5ELu2reMz3jwNA
	pQkfriC2BhlQDV10eCkCcVUWOVaG3aS/tXnmZlwTv44xGdi/M6vhgOmJC7NEZqOW/McQ8ASjlMi
	asnnNYfO270P5lfPo1mZKkvxM+c5p7Pkt6a9dRjvLwxuXwzB/Erz3Xxg4UUcKC35DDtyTbPf+Yn
	U94an7u/8cvJdtpOHJQwjad1usTROZ+S9WLxiKG873T62O1PUkrA0NgckeuItciO0P733VAreb5
	26CgT9IJiKhKWItE+G42GAv1L3dCtGwf/wG4E1ZlSLpsDfAFfYuWtJ3pBu15h5TS1gitduHkeYr
	sTP8Xpw0ucnHN6LlReIYZ1fd+LFZoB5sqEjYu7v/zoiO9MHKptAD2HgDRjZhaZnc4pD2qiViHmS
	8gEKCgrKl/HglaAineHKrJ2u8VSNtZr9qoJODzZj6tshjf5ilnGG3Dvsopdqsbt6PfM5ZaB5J+n
	le1C+UXf79qupLzHifHs9zKIUwbH0fncro8xFKH+S22E4g==
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr3378438a91.27.1795196756648;
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 20 Nov 2026 23:14:39 +0530
Message-ID: <20261120174440.123487-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_094557_748402_940B5BA5 
X-CRM114-Status: UNSURE (   8.48  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Describe the cell offset address space and extend the example
with the read-only property.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>


---
diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cacb0..d8e19c224 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xacjQffC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhdd1cqJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x/k/1K6IfLcckBF6B7BnUJei+H5Q3WU5NtpHwL0e5HI=; b=xacjQffCOyXCDUHJIMCE5KKPI4
	SIlT9QsNbcBaQcifO3QHMrTSWXlHatJnjSv85nlEZBYj1VLOaL14GXVehqE8trZCY/uqF5TxbUOuF
	l+v2l508jDr7SyWSfbxseOloBHuYXo3W/xf35ESJ0McUkQfjdnf96Gmse890tvGZUMTeyq0sEVOpG
	rwg1IQyxcrraQjCRtlT8TxQ/Y+59qWr9VMkXjVecqnAyH1Sr6HB9UGT5gRQdomQuCQGI51aN9Surn
	rDmJWzGcH2k4WgHkLpDOocSKpUeJkJOryPKQS28r44BJeOHNoncVVd3kfNjfUpaQMH/VqHw6eXbSJ
	7aFQ2frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllW-00000005ruA-2qfF;
	Tue, 24 Nov 2026 08:20:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVllS-00000005rt5-1wou
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:20:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CF4F442F9;
	Tue, 24 Nov 2026 08:20:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795508433;
	b=p0WU6qpTs0YQOqjB9QlzMsUZynmSbIIvciLj0yd39oGXjUaWhRsdywxUZAYHyaA9Xs+I
	 MhmFKGxHmDVDIhFICObkSP8YP8I4tn1zelCFQyY76TDwfB6ANZc3utBvDFmRQoPdVmusC
	 CgPIbHE3blTj159Hnbkw/2cZUoNMacouYW4WQ9GX9Ub/bxUuLnYUC7eVI9NaYVb/Dpv8b
	 lzXLqbpcq0VQQvxq3AdCiShjBt2qNohZquiylpFqdCkLK+jw+p4cWEGVqhhXebnSemKMk
	 11zbyLAPQgjVjH1RdTcUxbSBTqo2qz/LyhZa+5bRUEgrdID5+JJT3Hp+DQ6Dn6FugmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795508433;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x/k/1K6IfLcckBF6B7BnUJei+H5Q3WU5NtpHwL0e5HI=;
	b=svoG4JjC1j3dc8gGVYP2PQF72AYunOS4M12xMvctxkQ1tz01CK8WLnzNJ9p6oQLhVzBC
	 jLPuo1Uh7hSwhuCtBd7xclyVhlsGbdbu2tA8EpxhZQN/CdjZ/Y3AeSucUlXmMUvgfUPvW
	 6SCt3Sj/str5HzOwNhTXUcGjiNS1ojY80PT9uxkfw+ea/HYYL9SWUDKqVNd0wG7Qo6ej4
	 /mVqKBoq9+/1ePHcMNUeZdBmqb/cQcmLnzrhQ9K52y37NDmX4gupbhzd4Rz2VRYYiKgHl
	 sDOSqbRklfVP/xKRHUQ7CPsNCdr2BKc0zVJhzDfxlqThXtjZ6sBH25KMWgO8+/cn+rA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69FE81F000C6;
	Tue, 24 Nov 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508433;
	bh=x/k/1K6IfLcckBF6B7BnUJei+H5Q3WU5NtpHwL0e5HI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fhdd1cqJqepn0Oib1oLenJ6STpyu8A/6HyjpLKN1bw+3C2j74y/d3Gw1ntR92Aopm
	 jH3cqljXwgHHW7MCIXF3U10XiFRuIfygLxOXZEYC+jdPc/+UIWpNoM3MFVswCEzH9S
	 XP84aEV5EwRh2uU4FrqLV74n6tO+N+h1MNS/TSiEqbNMs/LhW/+V6VAY9iydF6o878
	 eYjSSWayEPQy6h8pBBLjSCsARw9XKewLVcRs8atyY6Y8ut+N8OHzBTOdvH/6iwik79
	 NYfxXGy8iCdhMZJM22jBZ74rDAGpLlprH66nPPXLRt1UvaOr7NyDRqFIzqW5kX0hdu
	 PxK0TveLmjrvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E13C14C935;
	Tue, 24 Nov 2026 08:20:20 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 11:20:19 +0300
Subject: [PATCH v2 1/3] dt-bindings: rng: Add Cortina Systems CS7542 TRNG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-trng-v2-1-0192937b44be@gmail.com>
References: <20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com>
In-Reply-To: <20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508418; l=1739;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=l1fROYGvUCU9bKrkug2vK1Rka6sqX2RjZb2LewzoVUM=;
 b=KLrAWWXkmpFw430BX6JJHZ2JmgYjVP9RW3wKNQj2b9SDOaf+FmseKvatXmzjfdl0MRUiQdzXQ
 5dkdxpSSjRdA0IB4U4Vfw7jq2aEYzV7SNV1ywSouWEbmCFbODJV8GzI
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the Elliptic TRNG register block and its reference to the
shared global control syscon.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/rng/cortina,cs7542-trng.yaml          | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml b/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml
new file mode 100644
index 000000000..2a3890650
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/cortina,cs7542-trng.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/cortina,cs7542-trng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 true random number generator
+
+description: |
+  The CS7542 A0 revision is affected by reseeding erratum 28891.
+  Hardware entropy reseeding requires the CS7542 A1 revision.
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+properties:
+  compatible:
+    const: cortina,cs7542-trng
+
+  reg:
+    maxItems: 1
+
+  cortina,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Global control syscon containing the SoC identification register at
+      offset 0x00 and the scratch register at offset 0xc0.
+      Bit 5 is set before initializing the random number generator.
+
+required:
+  - compatible
+  - reg
+  - cortina,syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    rng@f0600000 {
+        compatible = "cortina,cs7542-trng";
+        reg = <0xf0600000 0x20>;
+        cortina,syscon = <&global_control>;
+    };

-- 
2.53.0




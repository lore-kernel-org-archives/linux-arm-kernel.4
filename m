Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NCCgRmSx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCI53vjs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aXXbFIqeuNqZ+gcGb1wBjBrEJR2db0REnn66oJVi+ng=; b=NCCgRmSx8axDKJcE8f8JUaw0jb
	UjE1HAwYqWaGUZASuxLec+VRE0R3vS+CrLQmYzcxJhYg0Ld2cfVJs1s9hk7/yOZIS91qeeCn4QbwH
	w37UzjQ1z4r9dMZjqaPymE59iL4rFecND4gjHydACL7RaW+2iOsVzqflVkEgLyC26rrSjF420w7FP
	Kb1M+y7eWrONmFXsRzopLKfTuLhNIXIcfP/qAWzSrqhHndNBZ71qslWbQBn6zBay6IpCe4jL8s8FT
	keZlEij9lU2DppMRX902bCib5clpDpapXgBecI8FXy7qNjQnXLPQ9OhY41elRlfMZSS/QikgP7SlI
	BOYj/Ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbtD-0000000ENsN-1VzN;
	Sat, 07 Nov 2026 08:35:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbtB-0000000ENsG-3fQx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 08:35:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65C8543CE1
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Nov 2026 08:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6781F008A1;
	Sat,  7 Nov 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794040504;
	bh=aXXbFIqeuNqZ+gcGb1wBjBrEJR2db0REnn66oJVi+ng=;
	h=From:Date:Subject:To:Cc;
	b=VCI53vjsIrd/IEA1+mmAlrhkEdAWLeO1Y1vTyyKnIjdU7PePP5OL4Ij1JlCMWPquh
	 DwrTJaPxlasnH1jw9Wf+QmlyTB2L+ghysBxD/tXOKc/1FvPHe7B78YlWkHX+TcyMoD
	 Td3CHvLBb3b09dMtdeD+Je+00vvnXzK9pqIufQNFv+Q/G7EbfCA321vGIZmFUjt32z
	 1ReI177KkjwRj3c28vdf1dkk6t2wuo8+R9yIREMO4J0+8Oy9gLN3K7u1mWGqy1gJmp
	 4mj0mDb3tzUF9A4ojsVJCp/y9yNFFlh3sM9d8gauy6Ozis7RYtE+zMKsw4Adk8qyUS
	 iRq0OaLvv23tQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 07 Nov 2026 09:35:00 +0100
Subject: [PATCH] dt-bindings: gpio: nomadik: Describe DB8500 and GPIO hogs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-ux500-gpio-hogs-v1-1-123fb308fe90@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MwQmAMAwF0FXCPxtIBRW7inhQG2suVloUQdxd8
 A3wHhTNpgWeHmS9rFja4clVhGWb9qhsAZ5QS906Jx2fdyPC8bDEW4qFewlrE2SeWnGoCEfW1e5
 /HMb3/QDJZ74vYQAAAA==
X-Change-ID: 20261107-ux500-gpio-hogs-90df5d0ba601
To: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DB8500 boards use a specific compatible with the Nomadik fallback,
line names and GPIO hogs. Describe these existing uses without changing
the GPIO register or interrupt constraints. Found with CHECK_DTBS=1.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Describe the existing DB8500 compatible, GPIO line names and GPIO hogs.
---
 .../devicetree/bindings/gpio/st,nomadik-gpio.yaml     | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
index e871149c520f..e70f3b5ce7a6 100644
--- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
@@ -19,9 +19,13 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - st,nomadik-gpio
-      - mobileye,eyeq5-gpio
+    oneOf:
+      - enum:
+          - st,nomadik-gpio
+          - mobileye,eyeq5-gpio
+      - items:
+          - const: stericsson,db8500-gpio
+          - const: st,nomadik-gpio
 
   reg:
     maxItems: 1
@@ -34,6 +38,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   interrupt-controller: true
 
   "#interrupt-cells":
@@ -60,6 +68,11 @@ properties:
   resets:
     maxItems: 1
 
+patternProperties:
+  "-hog$":
+    type: object
+    $ref: /schemas/gpio/gpio-hog.yaml#
+
 required:
   - compatible
   - reg

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-ux500-gpio-hogs-90df5d0ba601

Best regards,
--  
Linus Walleij <linusw@kernel.org>



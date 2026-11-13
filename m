Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF77606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JUy8nh04;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FS3UO29D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=; b=JUy8nh04ed4aer
	3BejCCg5lwFNYjmsSimoUuAzzW0Gia0vHiomaduZcIMX/2HRqXaXqswA/QWPSKgsUwObYfEBA+s5S
	QI5L/jYUaY2b2MyCtuR1y8wdiAvaDV7qyBnmf7bOrhS/3gBilEpKX164YizvWBG9/zy4512f8t+Cv
	a+SIzPzl8c5Mxl9vUsfKBEOdSPFCPeJeEMMQ/b5ff71p1+Tay9PTqTp/PnBkQTdFhvZj+NEORgdlX
	9HYiQKUeU3ucc57/Xd9V1FwBA/d88Qahm851qDbumOZY7QdwIcvGbX4bdpgTK3L4UkF1P80KzgXyU
	UibbnHq6V08cpW/xR7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRn8p-0000000CAlK-2Pdg;
	Fri, 13 Nov 2026 09:00:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRn8m-0000000CAkn-26hK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:00:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e9d7791b00so9388335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560411; x=1795165211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=FS3UO29DtjZisJC4VO75/G856S0uEmErZdk5etRKsqX9HOTPVQyYLnl9OGctVN3u8p
         w8WB2X34SmtDcCGFBepvbSQVqrt13G6X77914R/A66SVorMqbT8T2rU94mHSBT9Yyjws
         OIleeuyC69IHAD5B5c48MiUK+aTIRIV/+dNzklB7WKSBohp45dj2G2NakXZmnqLapeON
         y5+gxeZiSu1lnSWVxdVshCUnrlHCK20J0Ex1rDLXZVkEpFMZF6Qd839IjNrmoESuZ5RK
         b7US7OZfscCZL+AvH89BwkwkYbHockYDWoiO0fq8ReOHinj3WBRy9qybvKYrdladT0bU
         HUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560411; x=1795165211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=riFEh3FgvcU/Jpch7t0//9WL86UptntGF1+OHMUy0xSHGxCdYXWeRU0hC1CVn6KgGx
         4IYydlsOLRiYoaOL33qKbZ/rKC5rFgEZLZHZok89pDicbqzz0dvAGrm0SpqSmFqUAnq1
         pOOzGULmVgZlhX/0y6yyg1gW51hDldCiNwuUEaotJ/K+4xusuOiOLItC0k1zpYHO6CHy
         4hcg8YU/iZc4GtxDSYsEPFaT4LD7UmZvVtCgvo804n+vgY11+DSwNb9wbARAYv1itIpJ
         22/+VZUL6iRHlD2zFeTHeudxMMqqXh+1r5Tts/yaATMkOHvKIxkJ7+zku91LmvESK1fY
         u3gg==
X-Forwarded-Encrypted: i=1; AL+hErFLfA2ZRp/0Cd+7otp73bPRCGUjhHeDyLuS5VODg9Bkh5mEv2TW5hAsuepOQjgtSR9RmhTY0EmV0yzDPMmZ/NZs@lists.infradead.org
X-Gm-Message-State: APuU4Z9C6Bt/b/J05KCYkmF1aETzosimVTf28Oz3/Z3q+afniL5ZLLP7
	jGluXgQ56545rfctUSH7/JxqMGL6lueys5eWeszlsalXwra2blsdzrNF
X-Gm-Gg: AYBFou1xkPOjSQx6DsbP9xOk8141q/7tas5AQ6XqIhZT52eiaAw1HdY9yvlNKAwn0vb
	SypPkPtfAvkhhlwVd03lXEZQsKf3J5oPyIlIG2pqEFpyVmyZQXWgYXWLprcfafZbxgbUbOYVOuC
	ORnAwtAEYpSJXTw0s6la2TEInPgEjE0RahtghynEbUzhA2U5Dw43f1SXzFO5kx/XKn/pTBebfku
	BR7SVRKqKH3H6MHtqwWD9bR+E3u5ZqdXdoiLZeXxHa/IvyaLhStivrsAjnmAqJRHj+XXlg6kCSb
	vNa4Oeu+eMFwYJZQz2oMiMv4MwJG8joTm84+xXdZzCLM5Fr39bCcn5VPy8GjC5uFKFWamJlj09u
	cK45f8QtuwDZ2za+xv+GIaZ7ZOSnVm9gD/79TK8xfxneGb0WD9tt/GmMGLf472ybxvh2KIlDYgf
	8JgWW7k+w/f0D8MvuxLxUHfH/fg0MvAELmkavQlSDP9JPA8XqnwkI2MFzpjswoSv/okoRb2FC30
	j3rroD9yQxwGlfbleyz+/guH36pRS0mmLROyFnRYfzQILKtI67UgVHLYuUkG2VLQaxkn+x0rNXO
	UEV7W+updhIwRPz9BNBdzllhjLsNhmaArkoDJZjaFrU0p9TZtt6SAj/x8z/6AlfWuvz5Jxuybaf
	KhOka
X-Received: by 2002:a17:903:18e:b0:2e9:4bf3:37a1 with SMTP id d9443c01a7336-2ee0dd9fb88mr18714675ad.63.1794560411369;
        Fri, 13 Nov 2026 01:00:11 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc859sm6953055ad.59.2026.11.13.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:00:10 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fyhsueh4linux@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Fri, 13 Nov 2026 16:59:59 +0800
Message-ID: <20261113085959.32798-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
References: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_010012_546745_33061E61 
X-CRM114-Status: GOOD (  12.11  )
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

Document the Nuvoton MA35D1 hardware matrix keypad controller.

The controller supports up to eight rows and eight columns
and generates interrupts for key press and release events.

Signed-off-by: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..ff4f94166f0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Matrix Keypad Controller
+
+maintainers:
+  - Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
+
+description: |
+  The Nuvoton MA35D1 keypad controller scans a matrix of up to eight rows
+  and eight columns and reports key press and release interrupts.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+  - $ref: /schemas/input/input.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  keypad,num-rows:
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    minimum: 1
+    maximum: 8
+
+  autorepeat: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk KPI_GATE>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <MATRIX_KEY(0, 0, KEY_1)
+                        MATRIX_KEY(1, 0, KEY_2)
+                        MATRIX_KEY(2, 0, KEY_3)
+                        MATRIX_KEY(3, 0, KEY_4)>;
+    };
-- 
2.43.0



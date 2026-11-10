Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4W8d98j/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPs8etbi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=; b=4W8d98j/zxWUri
	HdslfzoPGzc5Eu/AppY0a0kaZ2MWNX452o7g/2UD1R+jc2ZExZEEU4kk+p/NvCQtjP3bcN4VAVlBL
	z7ehIROsBK9ckBoh1tGm/6gMTRwsxEoLfYKk9qZL4fwZ4k8gMlpE+sijLOZLvoNHMvbXKrdOl1Yp4
	X9bImU9TmrObBDcxxhhq+Fbh/EYH+iLchsAHVsusq33RPwZmw/x1NKtaJNWY2nEbE1NhOKnSKPpr8
	apbdI8UmZ830hzDlXYMc1XUQ0C5SK2bVZQcEly8v2luHV1vgnkp/ofuRpk6QBYQyI0SrJ3J0gZcZP
	0Hv5O58Pzq7d4+rySGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjoH-00000003bD9-0DlN;
	Tue, 10 Nov 2026 11:14:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjoB-00000003b9W-0XgE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:14:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1178316a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309274; x=1794914074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=VPs8etbiFOOxPzKpI6z9qqSEQpWViN97aIGhtf/t2oViVfPm+IUyXO4dyWFtIvkr1g
         U4hvU+WZlDTrEIgUNJSM9TVXeuqO33/zfHENBrKM4YxThgfPY9x5N4CKzMrbKFEimtI5
         IaGaOK2VuL5KcC6ZUoVB7LJrFrJPYxpjxSh4fhB3ZIIfIzj69cVM+6g/5Z0CY9hj+sCt
         LAFYQG20rizE95qPh2ZjwfoEWva/Q9TTEO9p43gXbjE2/zxpEcVdAoqFeXpaBMUwdvqZ
         jNbc9FgW7OntaJLjBy2ivGG+MkJq9ikiV/UTLLwuajUDKnEhakbcE2DwT4JGDxFczxNF
         3Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309274; x=1794914074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=0ThhU6Uze9ua5QM1/kI/zPgtaAlKVhiJQNzJ4ioI3qj3kd7cTdbOVTQOQWRmjlNMpB
         w7yiF0Pd0M4qqY6Bjd1ImfD9OGf8J8fZz0M2qg5liKIaNVPVhxCQ17CyAwm0QdwwQ41u
         jGGdXjIQaKiNVgoSWKL0EbZu1Y7vp/zJV+dGpHMr15lDJmEdiPRJn7ZbJS+iaMwAdZX9
         V1dTm5PXTN8n+IzmQFHdb5fZDohDk6of5FdFYSJIB518tliJNILfySkmvgsGk55ZClIT
         P/89EmT0uZ+6VnFlKKGsH8TZXpml1C4q0cW9fR1fvdMZpDM6PD5EumOZEEHHWathSk77
         blAw==
X-Forwarded-Encrypted: i=1; AL+hErGTp3qzaRAddJWzTdrXKwPP/FG8imWJPwoWwe4Xf93XdISqMs9PT+rDzHEUxMVzWMMMvR9ge47eTeihNaH/LgvG@lists.infradead.org
X-Gm-Message-State: APuU4Z/MYVyF11tSHgccsM/DBXEOmxyQXmTAOefGKgkbMcln0KZwIoTG
	sIy2WP4ufp8TBC63uXDY4Fy9RC2/hiHl03CagHfXAhnLrDCjm6ATeNua
X-Gm-Gg: AYBFou0D5CKEVUZqhQD7EiZcrmCXKqLUqvzoD9jF8xrIwXJmkGKqBMwlpBvRt679iKY
	bBa7MgqBPK4+XHEspupP4a8dgI8+8czZSh7idTIwRhNZb1YrBtnlnQz9YYQeErBS5FayFNNO01y
	ZSQI7jfRe5cQ7QzGPBE/d+zqFZnT2ZjYz+r4vatb+s/26yKGHvPL5vSJIxnDnvLzUtK7RMV353S
	zAkAedgng2OGbtTXGxQ/eGtamvAhApZfSgWIvToDLGLMm2PAl9hIETfz9ProJfrEH5B/JWxgRc4
	waboosixxbmWP4uN5BRMCFD/QPfTFk/UfteM88f1WtG+8/Bm7Wur6cRhQCTaxVZR4BZx+TQrWcB
	cJvAsXcLqYCCAKA7FC497wclqAKzx9gbErwJJYLmoOFfwuboPGsy+vgqxLzRPhpdFRt0XJdR3ko
	nUET0W4m/tZYFierxDd4BCC9f3ZEH8w983GPkVPmOvcUKQEOdMbQjVJGbEkOC29vtr8o+NP+zVT
	61GpbbT3tIhauP6aYE2cswWq+cftKt4CfzmqBR32R6fvuDRQVjO24TIvSLdIzcKx7sBm0AIT479
	f1UAPGntsTiUtAJOR0BDZbj0iB2UjTcSBV6BpPqaam6OFCWXYKgN1olnFahtjILp0dfd+mBF0/B
	8VXCU
X-Received: by 2002:a17:90b:2e87:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3b166d05111mr2527465a91.46.1794309274191;
        Tue, 10 Nov 2026 03:14:34 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:33 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Tue, 10 Nov 2026 19:14:18 +0800
Message-ID: <20261110111419.89535-2-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031435_175963_7E8EA857 
X-CRM114-Status: GOOD (  13.11  )
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
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..be678d0b38b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,73 @@
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
+  keypad,num-rows:
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    minimum: 1
+    maximum: 8
+
+  autorepeat:
+    type: boolean
+    description: Enable key autorepeat events.
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
+    #include <dt-bindings/input/input.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <79>;
+        clocks = <&clk>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <
+            MATRIX_KEY(0, 0, KEY_1)
+            MATRIX_KEY(1, 0, KEY_2)
+            MATRIX_KEY(2, 0, KEY_3)
+            MATRIX_KEY(3, 0, KEY_4)
+        >;
+    };
-- 
2.43.0



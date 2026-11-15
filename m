Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20554606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qVV/DzzO;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=otpA62Ho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=; b=qVV/DzzObwLl6zCoyrpg0dhQT5
	44Fwnwq+79Tp/5eiSBWVB1KN6xX1yvF0RkxgdScHh6c4VCeuTQEkC4kZt7Ut42cP5OItmCjJWUZF6
	UEWqSU39oUk8F9mQ/6IONKWEJ25qhrYVsSJGlSpqDJMvWl/lJ6P6JNZlCyUlDAPEWWYeMup4I2NAH
	tcy5bUSGnsEVajHEH8oIofN3T9p+/BhBdCZUhR2XVQ6ZJNGOot07ZgoRbbrgKtCzywr4PqUYbZloY
	77RomGAQZ0uWdmEz9yeOhPE5vrbUX6eJ66TcU5uRVbCZGUoXOScJ+u6XpaCrtXLydr6qou/bBoG3V
	Zv3IYTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYI-00000000IUm-02X6;
	Sun, 15 Nov 2026 18:02:06 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYA-00000000IQw-0BNt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:01:59 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2e94f72fb9fso23054655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765717; x=1795370517; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=otpA62Hob3FxHE6HJwuk1AhmnB7aIAaDMjFvEuEncYi6WOj6ZcypjsBptp82M5sliO
         kilb+96THg3tqiSjKgTvVZ10Yp3LH3iVPQlcjHNujxBsV2aRQd6QhhchorwxL41Na/cu
         oL48Eq8aGFJEZ6jWLaEKbo++P0gyZzNp4CJPzGCIfBgbQqs6yKd1SsAwYt0rGyVIp/Tr
         j7OMFxR/R5UMV4pJkLXsbnW3J21KFD1erw4gTjJz/JBE4hwKSQ2hsxNVJc81IrDP+WJr
         oCUiINPbJHEFALcOrVylTU/Du9EuCS5khSYJtEeyxNTNa7XAv+2H/hytFgGLTfOUwkxd
         k6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765717; x=1795370517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=QgIXjniQQszSt0bSJFUUSuLdp7FDOomy8oiDV2/fyXnYOT0J8aPwSkh8f6SBdhOf7H
         wEbhqPxnrmrdO6jKK2N7o8Q93SJ7JBXPI299gxw0rqzVI0jW2jfshzHwCeX/O+jIgjn3
         HT3QmYNFOao9CRRfThPkee307N9lYgNdxPp98pmAW3fGiycC18ggpaD1cpSFCQs4PjGs
         WRMMES0IrVPE8xckodDZzBNKY3hayuOHwrwwZon2nlFrdfkqQ4vr16wE+pj78O4ff/2y
         wlnD2mNthcJ50m6NhdMA6I04gb6Z5yc1qH9GDOKJnlwLS5A3KgSsS97CicBcD8pmzPJd
         w0Hg==
X-Forwarded-Encrypted: i=1; AL+hErErPhYlz/4Q5mLzAVy7IuYwc1pN7/NLnfuJ3Wj1I4wuZX4hdEpTwxZ3erAzXl0WNlbBe9yWTZ6IjDU32MhOxZ7l@lists.infradead.org
X-Gm-Message-State: APuU4Z/5J6123VEx/q2Bbj4OP6WwnpwxzjjEBsMhnRc8Y/cx37G/efEs
	KSH7vSw6StClcPVtvJVLGzrkp7rr8bKhg+1Acpx9oY+SAim+FMDlGQ1bYu2KD1AgPxwUIlRVAdn
	/evzvQ7wv+mPWe9Gwt+QgnlTcR+bTcZgltw==
X-Received: from plbmz13.prod.google.com ([2002:a17:903:350d:b0:2ee:2d4e:e83b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3886:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ee0dfb0832mr69763855ad.40.1794765716407;
 Sun, 15 Nov 2026 10:01:56 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:46 +0530
In-Reply-To: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-2-vamshigajjela@google.com>
Subject: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100158_098733_A50900B0 
X-CRM114-Status: GOOD (  14.79  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-31.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV Technologies MIPI SPMI
master controller integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga").

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
new file mode 100644
index 000000000000..60d1e1769cf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV Technologies MIPI System Power Management Interface (SPMI) master
+  controller integrated in Google Tensor SoCs starting with the G5 generation
+  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    const: google,lga-spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi";
+        reg = <0x14853000 0x100>;
+        clocks = <&spmi_clk>;
+        resets = <&spmi_rst>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..cd5ae89b4f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.611.g1030f0b940-goog



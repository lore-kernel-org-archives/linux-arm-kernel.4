Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B348606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uO+rF5xk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Foy6rauo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=; b=uO+rF5xkTAragd
	umg/13tj7a50W7/U84ZQsrecssSvsasoQeMKGMN+BJOPXfItjlqTTmhULi+Et2jypgbWHJMBWlP8n
	0eN2fgnGsxlDx+v1RFs9nwDKSa7vh3568hCMh4yah2wFBmq812DSiVGXkBjfmaNa/X6bs+Hb2grf7
	gpZolu8AZwQrWpa5AW1dDi6nk4nW1nF/qLkhSgj0iE0lhMxvhYN7NHLD3Q3p9Vcrv7HqsoXXkXEQc
	UpxFeKwaAIJD1OEoDe6j7PuApJjg3Yn0rwLl1x4EP2v/u0n9YZSMoTCvad/0fxaSzVEHm3zGmqatM
	9LsWiek0tG+dgeqCnkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEd-0000000813I-3BgK;
	Tue, 24 Nov 2026 22:43:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzEZ-00000008114-2FR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:43:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4893774f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560210; x=1796165010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=Foy6rauoNV3NE7XsHnPdVZQqtvEYT2gGgO/JgD01+9lfIKsKiSOBsC6XOoqHMLpU5i
         lQLaN9dWW3GxchKWlrwVImN+Sn30IfliT+tdOsnL37ziXDcsdGwI+efnu9fi4PQkqFjq
         kuQku+P6GH3oDzi9vd7OfUFRlVvLq42yYXQy0x8VENDct2wqEyeQEyQasFobi6SlEG46
         UeQEwYDeEeB4+8m5sSW8jnFMSnO8rlhQtNTx81KeBk5OJkJdbksqWlG6n9bH6WZk1IHz
         XdlmpBVBVGMaPoQmAzfYFgbSMukbogheA2J6eRxRtdOLU5LEm6VfW4PNJJkBi7RVC4pk
         bTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560210; x=1796165010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7rPLYS7So0Y9QvCfhAuguLYZiylbNJV9FhluYZDmJM0=;
        b=Ru3oabdwBJuf76I3gAUnu+O+UClZ8k7aQ4e5k/K88ccLRePlRkwM2k8xFAhmDMFMpl
         zJYLZhcBPE+7X74eG1gPGuagv3g5N+TaetIpbsGxZC5TmOlWoMQKQ6Grm7vPlM+KvVqc
         /l1WD8gNVlYZJRAL9CoOm6UWLcepE8UbrOOvI9fpfb4FbDBjvOMxIoIoAqgX61WSNAKY
         GznOjWwyBr4o9NbhcugslrKpyErk4fgQElJQjbsZDS025dNDalTYDWpcweOUe63fQPaQ
         I6uCm8kMQCQoXAcQazuvwoTEsXpfdlY+flydOuxZfzd/ZOsQf5yLQMNKdE1OtxtmmVEx
         NmqA==
X-Forwarded-Encrypted: i=1; AL+hErGc5w3v/NcTpiRha7WiuAycU74B2TegoTivRc8ziOh2P0LTKZGsDIOxSgMq52XqpyhZVt4h4TJEajpW4tRMnXcb@lists.infradead.org
X-Gm-Message-State: APuU4Z+55P4JXLlUKaBQ6RCIA9BJI2KTw0/jsdFV7f/PdK1p9Dwe8EE1
	IAsvwB7bcThVky4EFErtlVJm0aoLTmsFRy1bcj2HRx/0NHo9H/VQKYdd
X-Gm-Gg: AZFdTZdXc3V9pPQv/nVVlieV+hsEcWMKG9mbzfNQvoX4IZa+SGnwGn05vSKSCG1VQUj
	KBp5hHpl6JJLmDW8jecwH/Y/0tQ3Qp9ZEyzC0nKEevhmNjBpJfVOPjfKo/qfP0h9P1Ewms4iwUf
	Cdam7q8Cl7pdFGqD5iiBgVjm+PJTKW6PM93IPU8JUHiMR0AZnF1HxwQHySKlqFWMjOP4+f5B3I5
	0df/p+Cq0j1jQhmigOk+ZWeZ5DS6JWlXWuJSP0tJ21esFJnGKh5zEUycNQwvQUGQPbK+fz8NB9O
	DHAkzB57/GkWjSgrzr3EcsyB5yCnTL2mesW4SPA9loJaL55EZlH4Lui+2E/6yqKqKBD0Jk27Er4
	V0Z/cJeVa0LGEVOo40wqTNTUHXZwf5VK5mc8rReaX4MCE7CFyVsB+k1TbrK1g9inD3VteJqD5oE
	f+pwix/U3O+PBbJXAnSQzoxAa/weokBo9Bc7moJScpOWkNeKYAJpbl1JS0npHHRekFjgD/HZSBC
	FjxXvnaeafCTonPjX0ktjRvdxr5s6ypupC3dwrJ2LaTzahbNPsmlIUpIKt7El7bsP6vX/42DhUR
	ejXWdPnECLZ0IQ9TQjiuVCmnuqq7eLjzOvx36Z1CK8ZVprhBJP+jZU6j7ofwhudlGU2EF4hOa/Y
	r6g4=
X-Received: by 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-4abb400c591mr31382607f8f.41.1795560209956;
        Tue, 24 Nov 2026 14:43:29 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
Date: Tue, 24 Nov 2026 23:43:15 +0100
Message-ID: <20261124224318.227478-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124224318.227478-1-ansuelsmth@gmail.com>
References: <20261124224318.227478-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_144331_639199_FC977AB1 
X-CRM114-Status: GOOD (  15.72  )
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

Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
work. Add the required register to configure the PCIe PHY and provide an
example for it.

The PHY link to another PHY (the QPHY as described in the YAML) to
correctly handle Gen2 speed and mode. It's mandatory to have this PHY
configured for correct functionality of PCIe. The QPHY is a unified PHY
that both handle USB and PCIe PHY.

It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
calibration phase or calibration might fail.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
new file mode 100644
index 000000000000..a8ec5ac781cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 PCI-Express PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
+
+properties:
+  compatible:
+    const: airoha,an7583-pcie-gen3-phy
+
+  reg:
+    items:
+      - description: PCIE G3 analog base address
+      - description: PCIE G3 PMA base address
+      - description: PCIE detection time base address
+      - description: PCIE Rx AEQ base address
+
+  reg-names:
+    items:
+      - const: g3-ana
+      - const: g3-pma
+      - const: xr-dtime
+      - const: rx-aeq
+
+  phys:
+    items:
+      - description: phandle to QPHY phy for Gen2 support
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - phys
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@1fc7f000 {
+        compatible = "airoha,an7583-pcie-gen3-phy";
+        reg = <0x1fc7f000 0x1000>,
+              <0x1fc7e000 0x1000>,
+              <0x1fc30044 0x4>,
+              <0x1fc35030 0x4>;
+        reg-names = "g3-ana", "g3-pma",
+                    "xr-dtime", "rx-aeq";
+
+        phys = <&pcie1_phy PHY_TYPE_PCIE>;
+
+        #phy-cells = <0>;
+    };
-- 
2.55.0



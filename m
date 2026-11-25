Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FCE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K0HDenuv;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=f/hXOya7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=; b=K0HDenuv/nW3MA
	sOZcUWp+sZgWVQkEDAN7H76Sjphvhgg3S3H4u5iOyTo0NiZx/V47Fuc1mOxV6I9Kpb7sHnHAhpknR
	VYbdeb0qtLtxNB0WGqc5PmXwR/oiduzCjbOT5deMrm/OGDZEWxaiIT06oSwJycrf4q1fMze8oGbWb
	7rgBrScn7c2WfOQvxUT7Kems4xwrXfyDKo2FFtOTHpv743UUHYRgHqHIjsqur9xlLLCSjmJzj1jZ7
	2+mMEe2E9Ph0rVggJVyNeURL/xJc8boyLZ5JKT41JV+LgL5B/5yD2OOp+kONY34lsQ2lysXwUl2/D
	e2QVA+qLy+iMFRuNGQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInl-0000000BA2l-01I3;
	Wed, 25 Nov 2026 19:37:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInY-0000000B9tS-1UGt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:36:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3608304f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635414; x=1796240214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=;
        b=f/hXOya7/3Qxl7AXaUnI4r5JzOw5WvzqD5Bji399CuFoFd7TonKQJ+aw3MXhMStQ57
         4JS2mix1Pg56LfmJyy4uP4URBY5ymfnwpnKJHrVXX/gCYJrM1H9PJe0kdjLPKsSM5VUv
         H1Nj63Vr27wYwdStUmFqGJuvi/jwJUNoRujdObJNL+Hi8wl7oIETaNejKzhJ19jP6Oxb
         Z4eveTqhmdMDW1SHgMOmLYbpEO9xty8xmWWJ+AbGDbObRsZvyHWexPJHVCjHBklm9CHf
         HfbOxYt096M+lTqz0Wvr/gBLq7XAre7hjRUdQsKz6CZFEt53a9cSI576hzaLWSKq6OSc
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635414; x=1796240214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pJOtI67d+kHFSLgQGK+M1K+XRengRZYaaBfHiu/Z+E=;
        b=jLlq6Nv4O/e3pyHQK9Rkpn4WPpTKTKKu1V1oTVfnCldd8idKpXyhH1E/zKtLV0GLjn
         g89LwxCirXRfWq64o/0hgpnNy0SyZgOospHOJrdoVmcog/dAWulcK3o/Qagti0KlX597
         hHgBOS9AtF1bMZZhIREqTvdmHeWbdvnOEODXl+vYR5HTZo0jdxmJuGCk771MEMZJff1w
         JIoohaPpclNtBDMypuCqrKS4Tr85Fqx1whVU48Fj7CSAdAwBQa0305T79sDCANy1lA+/
         CINy+YTTqlVaGmSbTNJhjJ27TzgdDFEMeb4oQmk+vzY7VxU2HNW4kbQG4J4N3+194VnD
         i1jg==
X-Forwarded-Encrypted: i=1; AL+hErH0QBHiV2oOYtXgC5mkEo2Ok4qRqPo8q50CR3sxf7B2l9MGsLWboCSD+wmRR1f5Ehqj6rMxRoatjBHIr8awDZkr@lists.infradead.org
X-Gm-Message-State: APuU4Z9Y8fr+qxD1ia9a5NegRcfKpEApOX/g0NJ+AmUKOLRnC8ZXxYkA
	CC5/aztqUOOS9ZI4iqxhSJO2CrHE+mgSGFJ5NY7uSW14PlcPtTkDdh9/ogmc/E7n/Yk=
X-Gm-Gg: AZFdTZdINV/j5ItHZKbAJIJoy2YJiltvORAXWLq04MByiTuk8OElrlafm5+A0kdFiuv
	Xugg2KBHC73KzsTNijMmG3QXhO68GTQvKWFsOogmv744bjHoRcnetqMwCMN2nfT2Hjfhf6F7gB/
	hurKromJj+RkrI/wPQkVEOSxH1P738dPOZu5gqZobr4T9DOAa/JRUpuLzjd8Gqcy43HSwtIElqP
	8DzLUvqKBE/uIdTZqhviGIsP/gDKzNp4D9HDYihwR1BMxX4K1qzKaenziJwu3gc7RKkqoLFjh8H
	w03NtuLPfIwxdsC6tvrWx5Fhcsmk+ZMpcfCENBai+tdVvmSIPdqas7Lz7K6vdpTkeoRtSVe+gKJ
	URnfdvUy2ltesM4RK4+DA5X935iKShploOFKKcRBW6BSO+TIwqTjnogc8QkmG9GCd3ic8gyr1a0
	1smyWLOTVtduQkTDSOoOJwr+28lXKpajc0Q/zJYEHdy6yDt9ZabEBOeX81h2ndT2M0TJbFLv86N
	GXdrlW4DrXYWn9eEd4pjktN8p/PaEjbLzm/USvF6WjgpkgFDbNTf9rnH5RkJWdPjVfrkElzqjyF
	P4WZYW34G9l3b7gptRM5dMJR1Bqi38oDUlw+f3yk0d+iQ+IcnfNbu58Kp4CHZ/NWlKyfIa4pak0
	i9Z8RrhVEQg==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr37014528f8f.56.1795635414475;
        Wed, 25 Nov 2026 11:36:54 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:38 +0400
Subject: [PATCH v5 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-1-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613; i=alchark@flipper.net;
 h=from:subject:message-id; bh=KY2yBjwot5EgrybI0zeyPf83MlVvC55FsNHz6cLctls=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5yd2619ad0b62MzqmbMV9u7TFp0xh1BIcFD6zZlX
 W63XyNo3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUd3Mw/A9Kmq5avWfzuT+nk/crNx8/fW6XcGP4wzo1Xb7PSk58QSsYfjLyOmg
 IqZmuvmDGeFqvUPph9q27cxvdnuy0rN6vVLo9hRcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113656_436392_F82BC0EF 
X-CRM114-Status: GOOD (  18.63  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rockchip SoCs ship with a unique CPU ID programmed into their OTP memory,
and compatible bootloaders derive Ethernet MAC addresses from it, so that
boards with no dedicated storage for one still get a stable address.
Whether a board ends up with those addresses then depends on the
bootloader patching them into the device tree.

Describe the CPU ID cell with a compatible which also defines that
derivation for Ethernet controllers referencing the cell as their unique
ID, so that the addresses are available to anything which reads the
device tree, whatever the boot flow. Index the addresses by the
controller's "ethernetN" alias, which is how the bootloaders assign
them. Keep the compatible vendor-wide, as only the location of the CPU
ID differs between SoCs, and that is given by the reg property already.

Plain "mac-base" does not fit: the CPU ID is not a MAC address in either
of the formats it allows, and may require different processing vs. adding
an offset to the base.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 24 ++++++++++++++++++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |  5 +++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..3acf306612ad 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -19,6 +19,17 @@ properties:
           addresses.
           It can be stored in a plain binary format (cell length 6) or as an
           ASCII text like "00:11:22:33:44:55" (cell length 17).
+      - const: rockchip,cpuid
+        description: >
+          Cell with the unique CPU ID of a Rockchip SoC (cell length 16).
+          An Ethernet controller referencing it as its "unique-id" NVMEM cell
+          derives its MAC address from it. The base of such addresses consists
+          of the first six octets of the SHA-256 digest of the 32-character
+          string of lowercase hexadecimal digits representing the 16 CPU ID
+          bytes in stored order, without separators or a terminator. In the
+          first octet, the multicast bit (bit 0) is then cleared and the
+          locally administered bit (bit 1) set. The number N of the
+          controller's "ethernetN" alias is XORed into the last octet.
 
   reg:
     maxItems: 1
@@ -48,6 +59,19 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,cpuid
+      required: [ compatible ]
+    then:
+      properties:
+        reg:
+          items:
+            - items:
+                - description: Offset of the CPU ID
+                - const: 16
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index b01567f99284..a1935bb49282 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -56,6 +56,11 @@ examples:
             #nvmem-cell-cells = <1>;
         };
 
+        id@200 {
+            compatible = "rockchip,cpuid";
+            reg = <0x200 0x10>;
+        };
+
         calibration@4000 {
             reg = <0x4000 0x100>;
         };

-- 
2.56.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A1606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n3YTMa7O;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ApvIgA7p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aGX/622BLcEUD7STQZB7h5g1EsoIPpXceYZcwodljQ8=; b=n3YTMa7OPovwIiap3jA4RCFrRL
	XxzASyxWACk3z5lviJ632NPDP7w7JJE9aJVldPY8sNtay0SMbsB6Nx8jAol6amB5NOijDG9g1RMz/
	CsgPjW0hoecYXdi39klJHqxWz4TIdM4Ebbn59l5tU0ItuJkTJFz110ZLsjYQ2J+hgA2y80CVdHqam
	spDRqY/NAzChPuLZ/8JPDd7ZJCBVktfU1/LNcIbeipYh6KRpMJXr95t4Gk0DKGz8cYwQ5S9Q8137f
	z7bt9WEtmq1N7ottJ/kfxmc9Y52XdyhnD/RGCEHLOm57yni/uxZRYpppZKw6N1DZlbX6MMiIwz2D8
	F9S6gf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUioI-0000000H3nQ-0Cvs;
	Sat, 21 Nov 2026 10:59:10 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUioF-0000000H3n1-09GS;
	Sat, 21 Nov 2026 10:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795258741; bh=aGX/622BLcEUD7STQZB7h5g1EsoIPpXceYZcwodljQ8=;
	h=From:To:Cc:Subject:Date;
	b=ApvIgA7pRlHLWlCD61Cqsgkd1XAu21U6HEpfnhJ3n0zf/dTorZroIBa5n3cX1JCDD
	 Mde57uPNmsgTcAdwAiPp2OUWcgoPPPUI8pSSZlbJZDFk1+5qr8tXJaqHndMPQ9hVv5
	 H05mYMOjSbjcMAWtQ1gxkzGnDTXPOVIIFDptYHIQ=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id EBA89487; Sat, 21 Nov 2026 18:58:58 +0800
X-QQ-mid: xmsmtpt1795258738tog0ojgbw
Message-ID: <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLgVnKCHPq4TJMLrJsypE6Qo40ozViJR71TS3Rr5PZXax0WLYJQQ
	 wsN5lH0sfI2ww8GsJuYP9MvREmVdkYFAYUqAVidf7DH03HXepozXc936IqEVlUbtupVL6VKLPec5
	 3BanyHHL0/2FebIvbA9kdpq48WBDXST5bhNxhhhesJaOctePRELF/c+2AQdt3h2935RqDXTiVEID
	 0rmiaRFlUOGkbCBjcOdOPxrR4Pir59L6HkLD1H7D76gnG5KwCOyAv0hQnoLMyQxkd/E0WcZ/5+SO
	 jKcJvfv2xPT6ZAOq0IfbCRUOCaqmT8hDSfnf2pTEFjXCpGVginVmooJ9pzU0pHZcMcKsk4Np++A+
	 e4fuNgy+TgE/9y0bo2mgVgkHz/FeOc6vy0GKhjmCwwOUW4oT3gNZV2snV7JdnuYQibcFh51lI/Th
	 QkWwvIhZiV2PDl9ng5mFjMU+6qVHNd+mHnhQv8Z1+RCH/8nyZcIhwL7NeNo44kNb1LeWmSgKA1Rx
	 Z9Em4smSvdi5433IyQ/90/DbmtQrOZiYvl2a7A4XtNrORy2CTdV4cwUptnSVBJngHUq7k0YpqroZ
	 hmNM3pibG3Sdy88O0I/c/6yDOCbI+Gq28F7ujWNdbnP+eVDi9RwQhF2X5VxaidcS1BLYD7q6i/0r
	 q2Dv8+k2zr+PhKDRZlyd819/CmGB6BCFdA2XAd7wrjy3aF1qT+JBZuMXXMxF8RIYH484Z/nOEExr
	 I/2lSb+kOl+5/cjGn4LZjp8Tiyiejb9I+JA1aGzwxyX5z7UI3zquOL5osFvpyYQhEySzuxT8zuJv
	 Z5d9skrCWYe887mEyzyXZmvNvBoF6CKsbBg3XnfOZSZJ7tV69OTL2KQmVofUVv49IuJltlkDC9v+
	 JTCriJh4nMySdRt6RpQf0wZefXtS7YsP2dEV0URzJjRR7E7gGP+5RDFJoP6DnIkYKiYrtABkd6f2
	 eZ4oW7xPouEx6Wz+OINGD2Bulif2Bi6mvt86KBO7wNTrWYlSRMnLUcu7bKuQCSqA9CDOKYSHT2CH
	 c5xgphM6oz59GlQZ1wZV9OwkBSlxUPg8C3IrSxPQkYzj/FvyFyqI+rkMsQDjHmO+7SvotBX+Jtzd
	 aiA/Qp74516r3YWs2lLaW1XdMjSMPbwsAM6GlKJDW/wgD3DXLCzaF8uEolug34RCaMNIFq
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] dt-bindings: clock: rockchip: add clk-out
Date: Sat, 21 Nov 2026 18:58:55 +0800
X-OQ-MSGID: <20261121105856.1414984-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_025907_395270_9A0D611A 
X-CRM114-Status: GOOD (  14.20  )
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

Document the Rockchip clock output/input switch, a single GRF-
controlled gate used for signals such as the SAI MCLK output.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 .../bindings/clock/rockchip,clk-out.yaml      | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
new file mode 100644
index 00000000..bf2a9b8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,clk-out.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Clock Output/Input Switch
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  Some Rockchip SoCs route a clock between an internal clock and a pin
+  through a GRF bit, for example the SAI MCLK input/output switch. This
+  driver exposes that single bit as a gate clock.
+
+properties:
+  compatible:
+    const: rockchip,clk-out
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+    description: Parent clock.
+
+  power-domains:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  rockchip,bit-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Bit position of the output enable in the register.
+
+  rockchip,bit-set-to-disable:
+    type: boolean
+    description: |
+      By default the clock is enabled by setting the bit at
+      rockchip,bit-shift. When this property is present the polarity is
+      inverted: setting the bit disables the clock and clearing it
+      enables the clock.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - clock-output-names
+  - rockchip,bit-shift
+
+additionalProperties: false
+
+examples:
+  - |
+    clkout_parent: clock {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <12288000>;
+    };
+
+    clkout: clock@ff910004 {
+        compatible = "rockchip,clk-out";
+        reg = <0xff910004 0x4>;
+        clocks = <&clkout_parent>;
+        #clock-cells = <0>;
+        clock-output-names = "mclk_sai0_to_io";
+        rockchip,bit-shift = <8>;
+    };
+
+    audio-codec {
+        clocks = <&clkout>;
+        clock-names = "mclk";
+    };
+
+...
-- 
2.47.3



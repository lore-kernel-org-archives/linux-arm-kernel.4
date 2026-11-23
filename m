Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWDI69gY;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Sv+LIzL+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=; b=sWDI69gYXQlIzS
	VBss0tX+xSQ2iEYatl9jsBlBegTFrLI6+VGDDhKqGaGRRaineZwIJ8mCOgKyjoh26YTMqtpeWB37S
	RnhyHi/ctuUwdtQjwBSOndUD7s4nrm58G/tvRl/7Ih7ankdRsdfqJA4JW4xuP7gWo9BCopi/PFoq4
	5byZY+aWeS/onk+BCj8VsP7xuFu2iRRZoQ1L9NjQ33H6MTuhVnP3zcNqZdoSeH7M1ThLj2w3Bli89
	4PGV1aw/Tc86I/TTA09jVIjqRRM/z+Rt7HtV2cWZFnuSYt0kZnr8P80GKwtt4tRrdjCu3nA8YPrYb
	N4Fbfr7STfBNQZ2tqOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5E-0000000413o-3tUv;
	Mon, 23 Nov 2026 15:35:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW54-000000040wE-2Nla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:35:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so27159795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448144; x=1796052944; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=Sv+LIzL+Of8aNMLKZPNz0acogCqg+INHiA90uYEQW9XXOhzCkBNM/zu5MY2IC2piAx
         Kd+NWtG1BENZkswAu9zsGBbuBAH0cGFzKn9HGk/ZR+duU9DPg0CUy8EF6EO1rCwTRHay
         ePMJ7HjxfQnIVHkzE5Ly5QYrMTO1Y5+drTjTt2xtozf58G9uCFnuJwIwAzfAA/kcNCrA
         l2pna9HcaGkluW9sgaWCe21sPPpMe1N/K4p3KNXY6QhdpGWdmzQVrtixVY8JC4XJXl+d
         sj1iccxVsKfovoedEv/X1cghIiZneF3dwTbTfrL9kf5TCXdZRGWCesxVuD7w1dBXGe5X
         yTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448144; x=1796052944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=Hu6rLEjT68aOOX1vf+Xd54oWNkOnM2n7KocpyqcygY0Qg9XvuW7UhiSf9yzDJv/Wf2
         GHggTb4z3tMdxSVonpIVr+O2hzFkCTSuruzy9jbpy/0+0IIX/IJZNsqIZgHrjqMmIem+
         WN891iqgC/u4pdiKcb1ug+7GPUzmHPSNujXDp/HhXsVx+OOh7kjDv6dKOMfiObbL161r
         yry1xCOjCQGJpRJOTJ33yoM0TU7FTtZJAWKFi/l6kNTteMDvw6zHX1LoRBXe9Oh1egyt
         zGFxfIA0AZeo/11xl+Kk2YbmYJ9XOFklKgfSbqz9NCSyl05et2YnwsSrNlv3oZrIj1ae
         OxwQ==
X-Forwarded-Encrypted: i=1; AL+hErG4zHx9fU3RP/XrwmCoczbf+Oo8HKVT1OrFwb3bXllHu3T0e5YwGJqeDMloJqNNvT8vXP95/GChQHiwZVg+3weY@lists.infradead.org
X-Gm-Message-State: APuU4Z+Z5a+LIr9qwWzZWukgeC7ttcxUYut2xlfJTFUBZLsublx7J82f
	L2uljX8eG1HhIMoylEX/he1hcqn1wGiefkh73ptnUvvL+qwUVTB7e0zh00oT9q7mS0s=
X-Gm-Gg: AZFdTZfy6TJSBrz7tSkZ5Lhru2zXNaYKxyCZ6By2bgBhKNMZuSK7f+AyfVTBGrAQZ4s
	5bXmTc4jXjKQq5SgYo3U2ij4ZIhVT+Y7Mdm/PGtbO7kd/ApfzgXJ6h+A/wE/g64A31s9Tvo5SJa
	NyG36bHTt3Q2jBiUW5f50sWX7DBDhS+GXY9BgAG2am/ZqBd3gzcEzkqK67jerZzzypfWZjcWbz2
	d+sxIcOsdnUd2epwW3saJ3n5WHJMkoMK6byRSG1f0KwgcEDHhSwmDrLxa3b5pimQ0tZ2Ipu2+bs
	gzTCJSs55WjNDjf5RRIv5wqRPdalRN5MGB7IG7Y8zjGr/6iRa0awvvd+OG6BQBWCKC0L4so5mTU
	jK3vv6kvtZYTcv0ErC77SHZ120YHuH8Ug4wocUrgcwsWk+9YSI//TAOEdNp3PzZ74kEofhfRGCx
	OAKBZGEa4UewcQ6UK1Mdi5uSdY723HgAo01aydi9B8s3wqMnQLP8PwHIbofvhQtdGBK4w+S2eZy
	7LTs16JlmBesMhxzTeHpD93iYO2c2oTCsnV3po/fAzFFQbfpDCDjk5uXY5D2OHFr7+IDeXJE1qA
	tl0yxmRmp6PAtso627qutgOA4St44c77xdkxXVZgShiii6L2pZanUrXPLyalRDdhBWNeOvm1nra
	oPR2n0Tngpcf0jlEP2kjfKC18muTRf38=
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr225893635e9.4.1795448144501;
        Mon, 23 Nov 2026 07:35:44 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:44 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:35 +0400
Subject: [PATCH v3 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-1-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CS20fXFVzcjdeDfFRS8feA1q6Da6FDy2IYeGw5SpswI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHrKKs0NOXrWbHuL6dy7FkVJ/w/fVjU3e1eiHZF28
 uiFi24VHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1ejUjw+vperrr1krosv0zKhQ6bOgZ/p99ysff5eIi0kKBgke3fGf4pxXLKK2
 9JWrJNEex6/NyY7w3zfW+Ix6m+GvtNP6wk7G3OAE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073546_897102_9C96DCF8 
X-CRM114-Status: GOOD (  18.59  )
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
derivation, so that the addresses are available to anything which reads
the device tree, whatever the boot flow. Referencing the cell as a
"mac-address" selects the derived address, keeping the raw CPU ID
available to any other consumer from the same cell. Keep the compatible
vendor-wide, as only the location of the CPU ID differs between SoCs,
and that is given by the reg property already.

Plain "mac-base" does not fit: the CPU ID is not a MAC address in either
of the formats it allows, and its offset argument is added to the base,
whereas the bootloaders XOR the index into the last octet.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml         | 33 ++++++++++++++++++++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |  6 ++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..ad38954cfb59 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -19,6 +19,18 @@ properties:
           addresses.
           It can be stored in a plain binary format (cell length 6) or as an
           ASCII text like "00:11:22:33:44:55" (cell length 17).
+      - const: rockchip,cpuid
+        description: >
+          Cell with the unique CPU ID of a Rockchip SoC (cell length 16).
+          A consumer referencing it as its "mac-address" NVMEM cell, as
+          Ethernet controllers do, refers to a stable MAC address derived from
+          the CPU ID rather than to the CPU ID itself. The base of such
+          addresses consists of the first six octets of the SHA-256 digest of
+          the 32-character string of lowercase hexadecimal digits representing
+          the 16 CPU ID bytes in stored order, without separators or a
+          terminator. In the first octet, the multicast bit (bit 0) is then
+          cleared and the locally administered bit (bit 1) set. Any other
+          reference to the cell refers to the CPU ID as stored.
 
   reg:
     maxItems: 1
@@ -48,6 +60,27 @@ allOf:
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
+        "#nvmem-cell-cells":
+          description:
+            For a "mac-address" reference, the first argument is the index of
+            the MAC address, which is XORed into the last octet of the base
+            address. It is ignored for any other reference.
+          const: 1
+      required:
+        - "#nvmem-cell-cells"
 
 required:
   - reg
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index b01567f99284..f30166109a7f 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -56,6 +56,12 @@ examples:
             #nvmem-cell-cells = <1>;
         };
 
+        id@200 {
+            compatible = "rockchip,cpuid";
+            reg = <0x200 0x10>;
+            #nvmem-cell-cells = <1>;
+        };
+
         calibration@4000 {
             reg = <0x4000 0x100>;
         };

-- 
2.56.0



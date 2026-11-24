Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27C606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v+CAQNyv;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=sgYmJYzf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=; b=v+CAQNyvWWJrKv
	JicvEWR8us7pUZBG+nE4AGNUC1O7fVOD3ph6+at5EJXPDKDP8fljl2d8I0xzrj4p5NrKh3p5WaOoL
	nA5UQeIwZVR6NWOTrHOK+8wuirq49ikAorCiqBXS6mRNAeMNwuqmFZljCLVPTFdpYUbkZnUDkj3i5
	HgKQQow38rg0FSy5JDdWySYmq13lp0I2qW66RtBNMicVJCn/rlgGBloHGVTxn9t7jkCNNQhOnqKXP
	gt4Ohow7bzYw/e842LXP0zRkyALmGOk4zuDUAz3yDMYjQTQzXiy1Xf8kQDV1P9hoUUEgCnjKCo9Dg
	rFzrkGaahW2mSjf168Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGn-00000006Swb-49KX;
	Tue, 24 Nov 2026 12:05:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpGU-00000006Sgb-0sSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:04:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so38621125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521888; x=1796126688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=sgYmJYzf2TH9glX3D/gG0B7Kqz/Dq6g/NYwi1DZrQpoLFHcZP7SsQ1pQBtCHsGbiEg
         /HzfI1fTDwpGssNZrrPr8Wapn/UEbOKvW6NqkCw2rWLwHPOCsYMA/XJ0mfGNgO44LQBw
         DoqNthFDxtPUzZYrDCesBlp/wcd1lAWUfEZMQT+GPEWvDL8jxoA9mP9/Xs2zv2q9ueg5
         NsVAcsZAUt0vraRJ+ubP2MJ8kSILj1GqwoAgNxUeKM/k8gP4PdTSgMOOeUAYtIG9hP2y
         pbFhSrk3XZ6QQ06BL5+91JrgI2kfA39Sg1xzbqnQZOcNoQ0vi88syqBzSaXtN0wiLYwb
         HaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521888; x=1796126688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5vpypoSKp4E8dfxVFDQ4mbg6cBO9LFnQEcbGDqjzgg=;
        b=buPFoQWsCx7Fcz8sFrbPCDGtHTiIQMRD97FrySGb97/x2ih25ZGV4dm6gevS9/1tbC
         ZqyZ8CutWk89scvhN/rldSWXDaWKT4Q+iJUEvwI+adJTxREYD77WfnlK9xj/r3A4nVA0
         BKTpnj1sXQoTR1McRLc/XK10oqIVNWTl4Z61TFWhJLvAA9S2Cr56geHzoxAOl0hl4tvp
         NHXVJU2wETNIjn5Q+SrsoXyc7yRspgA6OUag0/5xRqlMJrjswpkCXgEG8cBTxk6RFhbx
         xItrWm0P0Mo+3XovE/NhtUbNPg18ZdVLkBzJ57kfvJZLApAgX2QC/W89YZN8VDbijnpE
         TuQA==
X-Forwarded-Encrypted: i=1; AL+hErHBf040CXgBS556JAG98ZwlgXGJlESHsrea/tYUAoTtjp/O2z9ommi3yDgVURG8ITI92449zDpLQEFt8vem5W/9@lists.infradead.org
X-Gm-Message-State: APuU4Z8ERm5cZWZg1oRY/hZ0liuYeUXpxgNKyqL3qtzHkot983xgNSBv
	bWr4dKr8AiIP9BNcUC5MXAuK9CrYHtN8Apxr53ayX0Ji1UXxjp+KrhsBPHPoUa5K2+w=
X-Gm-Gg: AZFdTZcasp1rvRCLBhxbAWcPcye1vGsPEvNDuAzvPP1RlRjfEn/dbnMoZnGGwQ2RXos
	xmX0uoqDWaFzWE1G6NxS8Nr4iK9CYmRcZO7iLmWvb/ozYSjhwpbl0Us+xUrnFokTnd8JDlqQh0p
	ghhTOm1oNAw04EUr3behOXQgsQbEAh6yEXnl9NsWDdhRnFaEbaK5YeLZVG7lIYbNzvJIyHoUlbH
	qDSuI2pBdkijJVCoEhfLb8tSnJGMtgI4/hO69ZYJehzPHHfam4JOPRSbvUv8OIZ9Rs8K4+93Yff
	TdTcMC/4LqKOOp1l/zc8/Cm9g+TMyawasjhrhOPDYGcvVb7fSx1DFTNnEwPnWyvOO4FHGnyqYFH
	np/0Qh/+2hz78JPkKEG7NcfBGVz1lLtMej1Yugs/TCKPNp8bt9Ny4uKLfBMmTz+urDzl8rd2NbM
	tLogvyK630mXRCBbqr97eH66rCcoCY+X6kru032IIiXThLvnxXanZZ2BFAqVxChhCqmjs6092uE
	xubQrsaUtjGEWP654JR2RX1FWbdRBjdqCyfh8MYserDudgGcWmq2W+aZqL2mKib+88sx7Qipjci
	GC4n197Rqlc1FwFxfmhsVG5G1rY4ikBRfuggO8lHRHk2zPS6V57PQyQcQTvRuRsH840+3fhfz90
	vL+CaucyBq6KEzo12L/1Tpu9V9TA5jw==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr320380315e9.5.1795521888248;
        Tue, 24 Nov 2026 04:04:48 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:47 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:31 +0400
Subject: [PATCH v4 1/5] dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-1-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CS20fXFVzcjdeDfFRS8feA1q6Da6FDy2IYeGw5SpswI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gb/cTkkOnU6z7Mg8WvBWxZIC6dIne6/+bxhV4vEh
 O9ytk88OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqE0sZ/gev0w9uPyqSnpO85MoFybvMdlLvja7sNeW/kFZ8OW6jvxQjw0v7PSl
 rmeY7e3f86W24O/N148I+y9L0na53zs3TaN7Aww4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040450_309911_572A0F6B 
X-CRM114-Status: GOOD (  19.40  )
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



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5FA606D805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ye8ZB1j;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UbKOBze2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=; b=0ye8ZB1j19SGM5vbDfezwxgh47
	/TzZ1gSyE5rljVdke9+cxxhq4kbuGyDTj7tkMXfhJ4TDKPRvIJxEKnGDv7NcXDxDHZKIS0Z0dS1DY
	XI6him1K9yY3okyFN6yVSMYJToHpzXTDu27XYKdl8u6uCKDghqqKptL0XNTJg+xWhVqZX5pg0gynE
	gmlpIgqT3ijOeDTeH8Dg4aGE/F0LFsPpRNRcrQu5Kayp6F1y8Rm705c/70+s/BioQFiFmkwERWCCg
	pMSiQ7xWojkG7dDK9reMx9LgKYsARGI8H7hJF1RiQ0eAOjmgH6Zr0bILUre/xwG8wg8mfloLUk1+H
	blQGrJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXkG-0000000EAOt-3ZDH;
	Sat, 07 Nov 2026 04:09:36 +0000
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXk2-0000000EAM2-3vR8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 04:09:25 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-30c0d568830so2794446eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 20:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794024561; x=1794629361; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=UbKOBze2q6Pf+3tKATOvDwwwwjGfa4FFJi3gEhY/WVrT/eduXv/dp7mi6APKMjIdhs
         VWAb86Yi64sZlRsplriOiEEj5Rz0k9SfwVtGrbe2kwD6Q4M7isMGgEQrvpQ2/PFIs6vz
         XvctoTK1XYcd7GIuJPy/N9g+pznAlyv5vYXO0Dvt8Bjl46Cy0+HkFh0CKpeolQfU1JCN
         ecMQNuUs0f59hNsavFAcX3GEJlYiCPD/0J98LP9znHXBV+f1G9aP1DAhu4edc4EIyIWk
         ARqT+ZBvFXRfstfcAq6KA2W0H2krYlLV4NrHpWss4BW7BbXB1vOJVc5VV0VkSUAy5big
         EGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794024561; x=1794629361;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=XspJcjMCffjhtn82BVzjjLCjLCzp+1FiJeH+a4jbEYltc+EPW05zRSDX+DsanrOvoV
         KZFh1Y55n2xcgKa5YuFFJp3elLfzD7mDdG3uQdjt+j2tc7WBgbTBYlh76+oywGYXro2L
         3I+Wb3I0Jxgl2bQTsFf2cuJxrT5CauEOnj/T4WTEFpsRwUPbWugT2Eb0PpolIMBjYRMp
         vGcZtOdsV7HQRKw1EcgEe4vtEc9iPeZeuu55FKbXiA0xF3t+X3QOegd5VowFfaIXkYa5
         Qqn4AdyIP62YPbk5m5Jth/u4x/bJZzUapTZidWmB+HFAlEt3EYMnqWVtKFxI62Pv76Ka
         11yw==
X-Forwarded-Encrypted: i=1; AKwUvBw+/O7q91uJTupJxGsYr3WG696JN1WhqFgM7rBCbPNjhuwuOer6jRIEnGZKWXMwFDZ81S03n5hpszOHRcWuqzIa@lists.infradead.org
X-Gm-Message-State: APuU4Z9q8FiV0L2T/QOd+eUdlLXdqEruvJ9fX7O+23Nh0d/ySg73Yo+W
	ZWd3lyh7eJhHhdj6Wq9Si3okKykAj5/OP1+LMn+9OyexgovpRixqcjwtRDrL3ZkwjzIdMkXA5oI
	javi9Xkrqdg==
X-Received: from dloo22-n1.prod.google.com ([2002:a05:7023:a56:10b0:1b2:4d89:1614])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7e0a:b0:1b2:611a:8a10
 with SMTP id a92af1059eb24-1b2611a8dd5mr4522194c88.19.1794024561095; Fri, 06
 Nov 2026 20:09:21 -0800 (PST)
Date: Fri,  6 Nov 2026 20:09:11 -0800
In-Reply-To: <20261107040913.1384033-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107040913.1384033-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107040913.1384033-2-irogers@google.com>
Subject: [PATCH v18 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dom Cobley <popcornmix@gmail.com>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_200922_982255_5CD6960B 
X-CRM114-Status: GOOD (  15.22  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..e1a5a16b8d75
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description:
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present, with the primary
+  monitor evaluating the System fabric and the secondary monitor evaluating the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.455.g6c5a503b38-goog



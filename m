Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8486606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O7LN+W+Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Dg0AMJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=; b=O7LN+W+ZtPifkp
	CNe6pzflSo9CRHZ7Sfvs3v9X0LdsBQnOB0OvB0J3zgQZnN73w1WmT4atLqxiBFoPsI3HcoPgPx6wA
	O2wxIyv8OE+IWc2WFTVLZQ7JprfKnk+tOyu7k8PF4IqE/5d38vHjV3X4wa4t2tRZc1lofEA05G062
	6XGwIPByTSuIkdwCFS6YcvC3sT4GDVcA38cZpnja97mg7ZAVB3/pi9/Qd+aQx6KMPMmqTIP20XbqM
	zyG/6sNKieKcmd7Tash3op/BUYDDctvZ9yek020UuV1jCYt04/VZctXaV5yvaTI7LS7sRI3ES7UEV
	ZKP1Erwx3U27eYtZebGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKv-00000005JhG-0u1F;
	Tue, 24 Nov 2026 01:28:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKk-00000005JfE-3x3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 01:28:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a070781f63so1777318b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483714; x=1796088514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=0Dg0AMJR2ntXquW3EOBK/b6I9fJRCuB8chNIJxtl9k3l7XAt5lZxVR8uYLcJJYtCig
         7hjQpQNYd00/Aqq6VCF2wuiJLzhlYl7OjuU3JrV+66b8GnfgSbyXzLsuXzfXmvWHuAdE
         sec0v8/1lwdnKcAJ7pccfaxeIoZbJYZ3JNowOMkrcSekosoLpQGVtP0lLdlfMm6mLL3S
         zXD44pPzQSgR2DjSfOK03j+1m2s/IvxHq+qw/nNehHGK/UETk7uIKe4/dJ3bUWNfZkkz
         U2WRGS+pNrEULRSB80l35nUMyf6rRWWwjmzH1kqFntvjcnmbJUfPJ0mRPhY/qtR8wSV1
         em/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483714; x=1796088514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdOLga9Vo4Xp9js0CC/DhzZs7tFM2odH8QHKwA4/WTk=;
        b=04XA0og88tTXnJBQD/IRHJl1OnV2XnRV5djppRtXTutBa3dcsU+/r6XRqtC9BmlYyu
         V4OLT8Et64audR53W75Hc0jhJE9SE51o2HS3b2S14n7EVKYN9OsmlORn8K/hir9USDOm
         YDBB1OgnrmOCIMGix6/2CvsQqj2nApRBD1nNBwyI+0iVhJ3ELJOI4JvZ+SU6gVAbZN6K
         a/JPticgSys/H5LF3fcHqMYa4mpVlKVCuOptsT1fCFh0uShKz7rcfIGUiJh0N+RDEA+7
         Ft4LAeF2r/Nn+Gbpmxf6GETEA8OQZjdqVnetd67dq6hUjAMHn5kfbBh1GseYjW4jIbl9
         Zhcw==
X-Forwarded-Encrypted: i=1; AL+hErE+yWrYTLRc/pINH9a+TQnqh9Q9Mbu5lX+vZPqH0cuSTdsNIY0kgcteHo3onaueHkLV275mohoCgGCq1cGEyMz9@lists.infradead.org
X-Gm-Message-State: APuU4Z/2J/63j6fWVZfvEdtj0kSGSX/3/1vZbjeTkENyJTZnvrGNP0FD
	99YFHPkvoU4+nky0KRhaNRf1PFNdLdVviT4glyBuy7/WRnN/lbTFv9261xOo18kq
X-Gm-Gg: AZFdTZcTE3e16/bU6N7N/mLR+nQULueLsu7/KQflE5T5iLPsdBU3yno0Sdf+h/vLB9x
	viyWmFx1BIPpCOVoPdQYWxZ48VSXRw1Wyz7PJF5OOQYpk7gpxAMIZ5yabVHbnmcw2AUPpPkjhXd
	hOoy1qh6tbJWStax/0xNDdTRm1PChPQQIFUPFxQoRDQcB96mXEPLQJWe5g4ldJOAwDC6Ylq83+a
	Of9ct5hPk+59akZkRzf5s4jKjX1wPuYpkR2xIVUZDWQSNHiJtWB/35H/DiAce5cjQ2iEDwlm6Fa
	6/AYGzYKQqs+vy0t/Who2xONAXrzdERus8Z1ukm6sxFgQxuG+lfSLgXTwl5gZOttJA0lFJF2a5k
	gmu3vcWcrtisj7LxVrNje5rMSegkOCOWoUxj1KS1pnjQOL8fwCwUY2dPRU7CaIFgnbyIL8B0YsR
	VczOzLRVycNprgTSnx4Q3ybbZRadwMGZSfDVLwABKpxDxvsz7ZLPWsXD1rTsm/naMChUwNyQJp9
	nT2dhwALnybwMjHCm2aagHcF60NnJu57uPnKlv7p/fDFdpJJNqiNcJX8OOh9+uy64mlq7uCFKaW
	VSCNVrL9htP3XbloTFw1frLIrjtQHvRxLQ8fkHoU8Ho0DPhSGd1G0Ug=
X-Received: by 2002:a05:6a20:1bc6:b0:3f4:79fa:414 with SMTP id adf61e73a8af0-401bb21187fmr9289912637.13.1795483713931;
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:33 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
Date: Tue, 24 Nov 2026 09:27:35 +0800
Message-ID: <20261124012755.328774-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_172834_982257_AAE98D98 
X-CRM114-Status: GOOD (  14.17  )
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

Add Device Tree binding schema for the watchdog controller found on
HiSilicon STB SoCs.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../watchdog/hisilicon,histb-wdt.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
new file mode 100644
index 000000000000..427225c9aa46
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/hisilicon,histb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB SoC Watchdog
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description:
+  HiSilicon STB SoCs (Hi3716, Hi3796, Hi3798, etc.) integrate a watchdog device,
+  which triggers an interrupt after a configurable time period. If that
+  interrupt has not been serviced when the next interrupt would be triggered,
+  the reset signal is asserted.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3798cv200-wdt
+      - const: hisilicon,histb-wdt
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
+  clock-frequency:
+    description: Frequency of clock in Hz
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/histb-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@8a2c000 {
+        compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+        reg = <0x8a2c000 0x1000>;
+        interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&crg HISTB_OSC_CLK>;
+    };
-- 
2.53.0



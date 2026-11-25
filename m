Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA94606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8GXXlCV;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dj3D5vJV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=; b=X8GXXlCV5HaOZOHTfb1/2Lv9Nd
	2QmJ1qtg3Gt02pizxc+1K0y+zlxeHUZBZq1dLeeXbDpMwZDfMh0tdzJwOkT7cpGrfndLHAE9ZnfCO
	BNabXRtwQy32OEY9+w694LhAQeShs0fh0qqgQ3DwmouNzKoUSGVUTl31OaNfL9mqQ9PvkbGTGZXg1
	juSWXGh0ka2BMO0hkI3ozpuwu7Pkyi42kH7ncUOUKm1fZfMIS6g/XUiwIGkjXi8H3791Y8Fwb/ELf
	HxvUoPo/1tPyUn4iNpOmACvzxvuGLs9CEzlgIhShreN2OqkN2Hen2/1Smod8EbHHfUlDAe0CFCTHT
	nCAlMB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDQU-0000000A3rG-0EdG;
	Wed, 25 Nov 2026 13:52:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDQK-0000000A3nN-105d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:52:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so55301995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795614754; x=1796219554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=dj3D5vJVM+PNiB47ubhY1mFJa0Q6JdjlJkAw/HoZp85ZiFlalyowKWjE2UsCcZCKuD
         G6W9L2XvhSWanqM7otycTMGk3E7/YiUSh1aLfV0jrtwBc32f4XI49vOCwaN0s+ZsSgbp
         oxlPh6ife24IO82dPk2JFG6mt7VObBvsCtlUouihVYs1MtjXncg1UWXnYDC0nzRptT4f
         NqMf9nN5hb/rrHrQoTp9+dCQ4tKPZQZyHfZ2Z1EMIJbd9kfJ3ERCMzPZC7NGBk1lS3WY
         ydsex4uf0MiFTe/SHszl+0xGIybmUur9/ScdG7zQIVMonhqdaaBYjQYyEDhF3n6WT81X
         WNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614754; x=1796219554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvTqFO/9KuL3qNgchwfE4HWhvbAVhX6VqEBAJl1To8c=;
        b=EQxH0Kmgnb9z5vXKXgJrpjQlMwW2SucHuek2I49ocKdsTq0U/62S29M4DMnWmLM++W
         wXJWlIWY+uPp3hgA7ab3MpfY3wu/xNxcBmOJIv/DsMcyplNS8E2/2rMAFt3WVdetirdO
         N7glrMdV36BG335c4I5glKbBmpNg1ZuzHNEIQ0HaK+VNl4IRSGOveU5VGnZPn446EH26
         Wgi7xot9oXmRIX/+xMs7BcN25bwFwXllbrqUVizSP7siBAmse1NJLPFd4dniyGuxW/y5
         0gdvgHn5QGcfE1e6Aor7BDR9b51KROlmKL2AGTFxgUwVJwhdVGMp6wDJlXIVuNLLha5t
         tRVg==
X-Forwarded-Encrypted: i=1; AL+hErGDTlR1xkLW3rkRC9z4jhOC657wtCLGz77b6+6upJITPRa+G5nDorqS2pEObgK65k/hmH/q1sIV4NQFu3wHmfHg@lists.infradead.org
X-Gm-Message-State: APuU4Z8n7d0BnmKX8Cu4g2wwmNZw0Wqpg5sipt65HmRkGlvBVJxyh0uV
	sGhP5OBPx/yT0ZK27xyPK9HDU4hsKDIiQNsUJNwSFfBVdu6tMyCJFQnV+Qa4osqbWTA=
X-Gm-Gg: AZFdTZdjONNgsvOw0fZGE5vuiNl+h4tLLgyNPmXYFfTpva+ybvC/b/qY0hs/1/IEHai
	4uOfSONpFdYM3eiOqNlVuCh5nDpRONwq0UDqU122+SVXfgECi57p+KE4ZbIOKns0d9Wh99bwb3f
	jMWPmD5GR74AxNi0tmihRlwqGAuACJh5l1MrItQnP2jovDv/wWVWLDFjnFNRTyclaqMH5C5yxQy
	IeAHjYzxeoaXcCo9gQR6OdiyhrQIapF2IgTtKBQ47L9wPTm0mhVsXLjGS/tobH74HAhrIELSq9O
	RRK9Vgvg130rbvl2RDhGNT3U5AIdpa+moJaF23MRvn6FbUVmbp3Uq4/By16+2BhQ+nS560SsM3y
	ifEPOkjA9yRbrtdOpR8y47+RmZureE2KvqsNlT1v9zujOYDhBLhyi+17qc4OEhoz/tNBYPpti+m
	xFY52mRK4QiT7todBI+jKV+EJKq1qfTLrUz70H9HxvoScuGv/XfJ3asef0y1uKFamk3MCdoTQ/O
	3QjSLI4PiSJfcq5zwiJnY3DQho4HUQvm68rLw9DzDHuSgUp1/hcmkXgadJQB5AilU/6OESRQfvp
	07tdPuyDqJnmtwUOcPbexPyUVgGEme9E+uQehkISBPaewB5heItYXRWiDbEbReX3yjwjOFONfqL
	k8SLcUZJJ38v+
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr367951945e9.18.1795614753817;
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm469009105e9.9.2026.11.25.05.52.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:52:33 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: hwlock: st,stm32-hwspinlock: add mailbox cells and interrupt
Date: Wed, 25 Nov 2026 14:52:31 +0100
Message-ID: <20261125135231.98914-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055236_297351_9CCD81EE 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides locking, releasing a hardware semaphore raises the interrupt of
each core that enabled it for that semaphore. On multi-core parts
without an IPCC, such as the STM32H745/H747/H755/H757 (Cortex-M7 and
Cortex-M4), this is how the cores signal each other, each semaphore
serving as a doorbell.

Allow '#mbox-cells', its cell being the semaphore, and the interrupt of
the semaphores. Each core has an interrupt of its own (HSEM1 for the
Cortex-M7, HSEM2 for the Cortex-M4 on STM32H747), so a description
gives the one of the CPU it is for.

PebbleOS, whose STM32H747 port uses the semaphores as doorbells between
its two cores, describes and uses these.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
index 829d1fdf4c67..3b8d872b7c21 100644
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
@@ -9,16 +9,30 @@ title: STMicroelectronics STM32 Hardware Spinlock
 maintainers:
   - Fabien Dessenne <fabien.dessenne@foss.st.com>
 
+description: |
+  Hardware semaphores, which also ring doorbells between the cores of a
+  multi-core part: releasing a semaphore raises the interrupt of each core
+  that enabled it, and the core taking the doorbell clears it in its
+  interrupt status.
+
 properties:
   "#hwlock-cells":
     const: 1
 
+  "#mbox-cells":
+    const: 1
+    description: The semaphore ringing the doorbell.
+
   compatible:
     const: st,stm32-hwspinlock
 
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: The interrupt of the semaphores for the CPU the description is for.
+
   clocks:
     maxItems: 1
 
-- 
2.45.2



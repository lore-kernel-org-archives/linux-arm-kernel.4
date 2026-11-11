Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C52606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5y1ZIj/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktSbiTHE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=; b=p5y1ZIj/08qJEew/YAiqig3291
	I+C73/FTt+kogXSy3dY8CIxSnQaT22MMjeKqgzJN2Hani/V5n/zJpkGnHPE9b8PxJu2g1dsTPEyP8
	zBswYGOcMJKz+8BbQKE7619H+7pTvmDjy4nySE+4RwGYyHa4mqNVbkOSJW4TMI8qdMvelMHJbFGbk
	WDdOB8EpKAlKr3FVy3fWwL3VDECXFtg08+fVsiiR3rEO9+ExtDF2i2lCN2Q1ICeoDNnk7899JKK+X
	DIUxYy7skVJnndiRidyqgBgMhuJpOQx6jGunxjck0IhH3LO1yp9+5f2IwiH0RSm21YWaE2UsCM4c6
	hHBrId/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bw-00000006QqL-1OTi;
	Wed, 11 Nov 2026 11:08:36 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bp-00000006QmA-3FxF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:31 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so23182965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395307; x=1795000107; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=ktSbiTHEovsTQoe33TurxUsYJvJvYUKVa5ILf9CLTPOkeZFYMJEyeP22q+1mPoL421
         d/gJxdw9rC3RqvlpPwlyQisOq/eEKzBViOkJAc9wNe5e/Vyb/iyre9+4QGPOLW5Bxqo8
         bhJHC/ywcN8cd5fu1uN7Adc/9btQVt7k09Vh77DbO4NM17Sb1vgk4DRbPu5rBP92MXng
         QcADibHju1v+JSvlEA0Z+UMpcrWthuNfl+R4zvf0iiuA+bSNvs9LdR9MSyPaTzXFJTzT
         KpBrpFHLek7zQb3XEqEua4L/YA7wPIL5U9jHWtQXusDACulHS4X69HLydQ5DWvVNdm8+
         entA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395307; x=1795000107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=mxV4Zdae6B4QDJ14OwlTInmSUtKl+O2wMz04fghzZUnw1+MW2KqhT2rnfEWmhIxB3Y
         /v1NnvJsDxVFr74NNnTE8rj7VlVzs95WaFI7pEgqJl7Ka4en7PLgpgI5ulDRr6ZElI5A
         bmLD3lVNACSnrSZlAWWtr/b4dRhGgI4WWHaB/XIRl9BPIy8cX2+/mQYJKy9wkexoegUq
         4r9x3+0Q4HqLU2BP7l6tgVZorGNnRP7MG/rqp6DEaboOdWo9pP1/9nuK2IfA5ig8iN7T
         jpc8h4CUJfSsa3hUAGQlBpf6+rjx9UYaRRH4S5fV6xRVkb/2uHhl7XYKR9ybijJ4Jncx
         PCVA==
X-Forwarded-Encrypted: i=1; AL+hErENh9xb/t7hNAt85v63bIITBipm9fzo1Yfhy6L5d9+CD0kSfRs47rUm9IQ+kidpH0hkDVMFLuP6MNTiETtG1DrM@lists.infradead.org
X-Gm-Message-State: APuU4Z9k9cffF3nwl5aw/rpdeKNThHN6/e1Ugu8csRtDLbdI8bSYhc23
	RfQxU290M1+TQnJnTh76t4QtE5ROSHmt7X81ROE1d8oIoWu8rvn1rPaP5yL5gGTYmrE1KQH7cDJ
	3ICHzjIgzWYbQHDotKS1frg==
X-Received: from wmgb22.prod.google.com ([2002:a05:600c:1516:b0:4b8:b187:f0cd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b83:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0935dbfcmr39556605e9.10.1794395307014;
 Wed, 11 Nov 2026 03:08:27 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:34 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-5-vdonnefort@google.com>
Subject: [PATCH v3 4/8] dt-bindings: reserved-memory: Add lendable-dma-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030829_946695_71E4F16B 
X-CRM114-Status: GOOD (  15.89  )
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add bindings for the "lendable-dma-pool" reserved-memory CMA pool, used
to dynamically unmap pages from the kernel direct map before lending
them to a secure world.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../reserved-memory/lendable-dma-pool.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
new file mode 100644
index 000000000000..0b924d941b4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/lendable-dma-pool.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory Lendable DMA Pool
+
+maintainers:
+  - Vincent Donnefort <vdonnefort@google.com>
+
+description: |
+  This indicates a region of memory meant to be used as a pool of DMA buffers
+  that can be dynamically unmapped from the kernel direct map (e.g. before
+  lending to a secure world such as via Arm FF-A).
+
+  On architectures where the direct map cannot be arbitrarily modified at
+  runtime (such as arm64 without BBML3 or without rodata=full), the operating
+  system ensures this pool is mapped using last-level (PTE) page table entries.
+
+  The reusable property must be set, and no-map must not be set.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: lendable-dma-pool
+
+  linux,cma-default:
+    type: boolean
+    description: >
+      If this property is present, then Linux will use the region for
+      the default pool of the contiguous memory allocator.
+
+  no-map: false
+
+required:
+  - compatible
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        linux,cma {
+            compatible = "lendable-dma-pool";
+            reusable;
+            size = <0x4000000>;
+            alignment = <0x200000>;
+            linux,cma-default;
+        };
+    };
-- 
2.56.0.542.g3ef89b7020-goog



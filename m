Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95F5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URboK9WH;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QaBZlPkB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mz4A0EINz7FXiOtg+LRLaTUicVm3TZtwZy9VYgokgFo=; b=URboK9WH7gay4i5nO7ckLm2KND
	NYWDOR0pHrcP0qmiDqGfa0tqPLxax/JOkq9OmGdyYOCjO68FLSPGGnIyU4c6VzVTk9mGPxrnAz1cc
	y5Ti4gHE+4tc11b/T+uWuBP/o9bdluHHZlrRtFM15yoSkBQdZo9RqiVoHUZG+UOYmBsqBU3xfXa1B
	bThSPUhbhqSRIzIPqqfFdYrTnjRL1/+/TNAK0W7OQKlSNM5OFWuh3sr1fGYdAJNoVytlKNgrgj7XU
	QXLMogiwz+CxiKEK0w3VwZ9nmX8Fsfv8AyMEiceRo02aq89Kl6mQzaAxP8rPhK7jK1jr6m93GREh7
	9fNpGHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe0k-00000002Szz-1nQr;
	Tue, 10 Nov 2026 05:03:10 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe01-00000002RWh-3S76
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:02:35 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b42827bb4bso1152549a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794286943; x=1794891743; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mz4A0EINz7FXiOtg+LRLaTUicVm3TZtwZy9VYgokgFo=;
        b=QaBZlPkB6nTVmLz5BUvblv2y9FFBoWni7AJEBTirRc1BNJhbl+aCosYyhjtHMoWDoK
         tdtxF929SK2X6LjUDrXzmT+wYklZxRxRBmm4frzjNm2eHDWx7B4QT6s9Pq5RLAjwq/Vu
         XsNkjMPEfj9wg+bg/aKdv5ERZdSfSeI/9JOMIXU0FeZaVm6kZlv2NT/eZyqhEbKss8vB
         n/NDUUzsL9mgBIPPp5KEjUA3S4FHGiRad40B8IDz1lDpavwFyYTKRnBULOqJCzU/oh+t
         RvBx/dRm7p8rY0g2lejBWeiSCIq52CSs+9VOYaOm66bhkfC5xu6Wyb8W2M1DRYv4HZ78
         g/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286943; x=1794891743;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mz4A0EINz7FXiOtg+LRLaTUicVm3TZtwZy9VYgokgFo=;
        b=RCKv13Xt3F0kO4Lm+GCzCrJC11ZR0HLG08kXjODkMERls7oBT4Uebiww3LLP0K841+
         IgbTi6TCjuQ8Drc6gD+IHfD7QYpKRfWvjly6H1qMVE0BwWZkTFjMJU2r441v5cqc6w84
         5yfi8++ZvVayyEsxH+99YeUGkk62etpGmNov1BqyVGPxzPpWBQ7jsEem8XYEe3Sg9qwk
         Nk/aTuw1zO0FlkiSxHsv6jvovRVKpMJeI/Zy5eU1N6cKmngKNK89dlzSHABgvsfUBEyy
         pUB6dMb+1yWxYFjCzYqs9YfFm+3FA4ABYTmaY+S6huD0daZx1/Ln91tOAkCzZaBAmaqd
         zFqg==
X-Forwarded-Encrypted: i=1; AL+hErFV9oAYJFLHVY/W7gvVW0WWr7JdmIvtnVPwqvmYmQYaYKBN0J1FFwb132jUwpVEOufRO54Tn6FE/iOr6vfXFI2G@lists.infradead.org
X-Gm-Message-State: APuU4Z+//fYOpV0RzYn2eee0/JNrcIyPbzCz7QcSbEKKP7Ts1R+S/gdH
	IxzJ5ZtbqcZscUa6R2WfMXVyrJOVeT0FD6vxitfB9+yW7bnoGNznDNBrhse991PB3tA49IXddkw
	mPSSobk5nT/oBcwnifg==
X-Received: from edt12.prod.google.com ([2002:a05:6402:454c:b0:6a8:1d4c:399])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ecf:b0:6b5:6522:de39 with SMTP id 4fb4d7f45d1cf-6b756ae247dmr1199083a12.22.1794286943216;
 Mon, 09 Nov 2026 21:02:23 -0800 (PST)
Date: Tue, 10 Nov 2026 05:01:59 +0000
In-Reply-To: <20261110050202.529473-1-tarunsahu@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110050202.529473-17-tarunsahu@google.com>
Subject: [PATCH v4 16/19] PCI: liveupdate: Add feature header to struct pci_dev_ser
From: Tarun Sahu <tarunsahu@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org
Cc: kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210225_968938_87F88E35 
X-CRM114-Status: GOOD (  17.56  )
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

Precede each serialized PCI device entry in the PCI Live Update KHO block
set with struct kho_ser_hdr via DECLARE_KHO_SER so future per-device PCI
Live Update features can append fields to struct pci_dev_ser without
breaking compatibility between adjacent kernels.

Mark struct pci_dev_ser as 8-byte aligned since its largest member is u32,
initialize the device block sets with kho_ser_size(pci_dev_ser),
initialize each entry feature header in pci_flb_alloc_dev_ser(), and
validate incoming device feature headers in pci_flb_retrieve() before
accessing the struct pci_dev_ser payload.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/pci/liveupdate.c    | 27 +++++++++++++++++++--------
 include/linux/kho/abi/pci.h |  9 ++++++---
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 0bda94f4a7e4..f4c84bcc0629 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -288,7 +288,7 @@ static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
 	ser->devices = 0;
 
 	outgoing->fhdr = fhdr;
-	kho_block_set_init(&outgoing->block_set, sizeof(struct pci_dev_ser));
+	kho_block_set_init(&outgoing->block_set, kho_ser_size(pci_dev_ser));
 
 	args->obj = no_free_ptr(outgoing);
 	args->data = virt_to_phys(fhdr);
@@ -318,6 +318,7 @@ static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
 {
 	DECLARE_KHO_SER_HDR(pci_ser, *fhdr) = phys_to_virt(args->data);
 	struct pci_flb_incoming *incoming;
+	DECLARE_KHO_SER_HDR(pci_dev_ser, *dev_fhdr);
 	struct pci_dev_ser *dev_ser;
 	struct kho_block_set_it it;
 	struct pci_ser *ser;
@@ -338,15 +339,20 @@ static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
 	incoming->fhdr = fhdr;
 	xa_init(&incoming->xa);
 
-	kho_block_set_init(&incoming->block_set, sizeof(struct pci_dev_ser));
+	kho_block_set_init(&incoming->block_set, kho_ser_size(pci_dev_ser));
 	ret = kho_block_set_restore(&incoming->block_set, ser->devices);
 	if (ret)
 		panic("Failed to restore devices KHO block set (%d)\n", ret);
 
 	kho_block_set_it_init(&it, &incoming->block_set);
-	while ((dev_ser = kho_block_set_it_read_entry(&it))) {
+	while ((dev_fhdr = kho_block_set_it_read_entry(&it))) {
 		unsigned long key;
 
+		ret = kho_ser_validate(dev_fhdr, pci_dev_ser);
+		if (ret)
+			panic("Failed to validate incoming PCI device feature header (%d)\n", ret);
+
+		dev_ser = kho_ser_payload(dev_fhdr, pci_dev_ser);
 		if (!dev_ser->refcount)
 			continue;
 
@@ -456,6 +462,7 @@ static struct pci_flb_outgoing *pci_liveupdate_flb_get_outgoing(void)
 
 static struct pci_dev_ser *pci_flb_alloc_dev_ser(struct pci_flb_outgoing *outgoing)
 {
+	DECLARE_KHO_SER_HDR(pci_dev_ser, *fhdr);
 	struct pci_dev_ser *dev_ser;
 	struct kho_block_set_it it;
 	u64 count = 0;
@@ -464,9 +471,12 @@ static struct pci_dev_ser *pci_flb_alloc_dev_ser(struct pci_flb_outgoing *outgoi
 	kho_block_set_it_init(&it, &outgoing->block_set);
 
 	/* Try to find an existing, previously unpreserved, entry. */
-	while ((dev_ser = kho_block_set_it_read_entry(&it))) {
-		if (!dev_ser->refcount)
+	while ((fhdr = kho_block_set_it_read_entry(&it))) {
+		dev_ser = kho_ser_payload(fhdr, pci_dev_ser);
+		if (!dev_ser->refcount) {
+			kho_ser_init(fhdr, pci_dev_ser);
 			return dev_ser;
+		}
 
 		count++;
 	}
@@ -480,11 +490,12 @@ static struct pci_dev_ser *pci_flb_alloc_dev_ser(struct pci_flb_outgoing *outgoi
 		kho_block_set_it_init(&it, &outgoing->block_set);
 
 	/* This should always succeed since kho_block_set_grow() succeeded. */
-	dev_ser = kho_block_set_it_reserve_entry(&it);
-	if (WARN_ON_ONCE(!dev_ser))
+	fhdr = kho_block_set_it_reserve_entry(&it);
+	if (WARN_ON_ONCE(!fhdr))
 		return ERR_PTR(-ENOSPC);
 
-	return dev_ser;
+	kho_ser_init(fhdr, pci_dev_ser);
+	return kho_ser_payload(fhdr, pci_dev_ser);
 }
 
 static int pci_liveupdate_unpreserve_device(struct pci_flb_outgoing *outgoing,
diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
index f53f6350e53d..77ddf5938822 100644
--- a/include/linux/kho/abi/pci.h
+++ b/include/linux/kho/abi/pci.h
@@ -19,7 +19,8 @@
  * File-Lifecycle Bound (FLB) data, identified by the compatible string
  * ``"pci-v2"`` and laid out as described by the structs below.
  *
- * struct pci_ser is preceded by &struct kho_ser_hdr, which records the
+ * Both &struct pci_ser and each &struct pci_dev_ser entry are preceded by
+ * &struct kho_ser_hdr, which records the
  * total size of the serialization and feature flags. See
  * include/linux/kho/abi/feature.h for the feature header layout, feature
  * rules, and validation.
@@ -42,14 +43,16 @@
  *            reference count is equal to the number of preserved devices at or
  *            below it in the PCI hierarchy when the struct pci_dev_ser is in
  *            use, and 0 otherwise.
+ *
+ * Preceded by &struct kho_ser_hdr.
  */
 struct pci_dev_ser {
 	u32 domain;
 	u16 bdf;
 	u16 refcount;
-};
+} __aligned(8);
 
-static_assert(sizeof(struct pci_dev_ser) == 8);
+DECLARE_KHO_SER(pci_dev_ser, 8, 0, 0);
 
 /**
  * struct pci_ser - PCI Subsystem Live Update State
-- 
2.56.0.506.g506a7eabc5-goog



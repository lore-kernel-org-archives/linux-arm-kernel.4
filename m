Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDvBIyfW;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lroROn1l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hqbeun0C1/XgWjYnTEG1QqOg75mMAInimMPRhrMj/I8=; b=FDvBIyfWxmTe4XfckG2bCjl5jI
	1YBwSVvfXRiNAPRluol/7J8dbpq3jERf//8mLW4Lp37+L+5mvyF4tApe7EEufGZYNDCg9jjSV0N63
	ndZpR0/CIvoWptzGxL8RyrHkOUoxP6j123VYpV0F2Urud/0LMl8W0cp3cqNMGmFaxBUB4l91sgERf
	aTijQplcOGtpNPgSRW1oyQowtS3h8XQhGq6m7uf52ZPjbOgGQy2nMQ35HeMNJFNINcyn+dzJlpzMB
	ytte24Au2o4ld0aYnM4ulVLuugZWKcZu0YNb0az24+QTDSZ1uAGbobvZRYsR/T+8ZKl0ylCOETi8t
	gjJf8j6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe0G-00000002S2q-2wS7;
	Tue, 10 Nov 2026 05:02:40 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdzx-00000002RRU-46Ke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:02:25 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6b586d1266dso1491742a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794286940; x=1794891740; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqbeun0C1/XgWjYnTEG1QqOg75mMAInimMPRhrMj/I8=;
        b=lroROn1lNiA9x6e701IBz5Fy+DX6vMMIVVzawCcQPOZ3OXwM3uZZeMTOugBWALm9wG
         dcwlg9A1ZCe63u9R7J/Q1sY5701CmdU/EFfL8uJ2hsmHv+a2H90rORSIxKziaf11Enbx
         QRZVTgMnHJRxagGX9JntTqVHi+57oSnEmmuZXljiCm3K+UAbVKqfpGk+MN1m4/G1MxdA
         AruF6L1ienHtjVthAjBoPy+2Rv7GfYSAqz/iqJTri0Qi6gSIqsW7tatkmDtUtdDGfyzf
         muFp/fzL+w2g9myUlyEUY2uA5qnmEr4SN4KB9OniCu57uWkIa5chBBs2g8urkN3wxlli
         yRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286940; x=1794891740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqbeun0C1/XgWjYnTEG1QqOg75mMAInimMPRhrMj/I8=;
        b=TeV2X7GZjQAm03xCYy/GUwbCQ7RCh7y3r2MdCXQGRiDTyO+Hpp0UUrSt8vfmlTtW3c
         WSTlfMz5FF/VNcmHAVtbQdB1YrQpsA/B9CBP3dOyVoHeUA/LWUFB2QVuN+lLPj2op2eC
         ZqXVOcTotud/D48IPr8LxWDYDNgBuE5BbDOINLINQ4x8imDuKVSs3tppaZHtEOtSXvgV
         osnvpSp/QnEzVErh1Kl6/ncA56SCmenHCXI5i3kT+0oCN3SRvUyd3eIDc/G5mG34qKJz
         jplOdBHzQHbhJua0yTEBltw0162jCGIVI7TsYt+Gygi4h4ylMUq4/F6/sY/iqKIlwyCp
         Hjbw==
X-Forwarded-Encrypted: i=1; AL+hErGVA+3P7iQXYc8J9b71tcLubrQkdkRCZyXn39Drz7EoVvKAq4LKg9Ll+D8krx2GQxMKj0bT0TtTb7qzTGYm/2FG@lists.infradead.org
X-Gm-Message-State: APuU4Z/JJ8vkEo7qS/6QH0TWPqO9LIYLkmK4b4IQKQiVzD8Is63CKXvl
	tWoc2nWHubo4SJ7ZdnzMSBlxAmw4g3th6swYmydX3gHGbH98dfjEpas7Qnbq2W/qmUIiknvvEwg
	oyOYqGOAnQTYaqDdxfQ==
X-Received: from ejqs13.prod.google.com ([2002:a17:906:454d:b0:c3f:2fd1:c5c])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d0d:b0:c41:e0c0:e6b7 with SMTP id a640c23a62f3a-c504951cddfmr104842866b.12.1794286939400;
 Mon, 09 Nov 2026 21:02:19 -0800 (PST)
Date: Tue, 10 Nov 2026 05:01:56 +0000
In-Reply-To: <20261110050202.529473-1-tarunsahu@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110050202.529473-14-tarunsahu@google.com>
Subject: [PATCH v4 13/19] liveupdate: Add feature header to struct luo_flb_header_ser
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
X-CRM114-CacheID: sfid-20261109_210222_047794_D1A6F04D 
X-CRM114-Status: GOOD (  17.97  )
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

Precede struct luo_flb_header_ser with struct kho_ser_hdr via
DECLARE_KHO_SER so future File-Lifecycle-Bound (FLB) header features can
append fields to struct luo_flb_header_ser without breaking compatibility
between adjacent kernels.

Initialize the header in luo_flb_setup_outgoing() and place the outgoing
entry array immediately after kho_ser_size(luo_flb_header_ser). On the
incoming path in luo_flb_setup_incoming(), validate the feature header
with kho_ser_validate() and locate the incoming entry array at
fhdr->size so entries remain properly aligned even if the source kernel
serialized a different header layout.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 include/linux/kho/abi/luo.h      |  6 ++----
 kernel/liveupdate/luo_core.c     |  4 +---
 kernel/liveupdate/luo_flb.c      | 36 +++++++++++++++++++++-----------
 kernel/liveupdate/luo_internal.h |  2 +-
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 38b4658183a2..4913707ba0d3 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -157,16 +157,14 @@ DECLARE_KHO_SER(luo_session_ser, 72, 0, 0);
  * This structure is located at the physical address specified by the
  * flbs_pa in luo_ser.
  *
- * If this structure is modified, `LUO_ABI_COMPATIBLE` must be updated.
+ * Preceded by &struct kho_ser_hdr.
  */
 struct luo_flb_header_ser {
 	u64 pgcnt;
 	u64 count;
 };
 
-static_assert(sizeof(struct luo_flb_header_ser) == 16);
-static_assert(!IS_ENABLED(CONFIG_64BIT) ||
-	      __alignof__(struct luo_flb_header_ser) == 8);
+DECLARE_KHO_SER(luo_flb_header_ser, 16, 0, 0);
 
 /**
  * struct luo_flb_ser - Represents the serialized state of a single FLB object.
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index d0f72f27001d..79bb5f64bfac 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -131,9 +131,7 @@ static int __init luo_early_startup(void)
 	if (err)
 		goto out_free_ser;
 
-	luo_flb_setup_incoming(luo_ser->flbs_pa);
-
-	err = 0;
+	err = luo_flb_setup_incoming(luo_ser->flbs_pa);
 
 out_free_ser:
 	kho_restore_free(fhdr);
diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
index cd715a7c1d99..a8dcdb8456fd 100644
--- a/kernel/liveupdate/luo_flb.c
+++ b/kernel/liveupdate/luo_flb.c
@@ -53,7 +53,7 @@
 
 #define LUO_FLB_PGCNT		1ul
 #define LUO_FLB_MAX		(((LUO_FLB_PGCNT << PAGE_SHIFT) -	\
-		sizeof(struct luo_flb_header_ser)) / sizeof(struct luo_flb_ser))
+		kho_ser_size(luo_flb_header_ser)) / sizeof(struct luo_flb_ser))
 
 struct luo_flb_header {
 	struct luo_flb_header_ser *header_ser;
@@ -559,33 +559,45 @@ int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp)
 
 int __init luo_flb_setup_outgoing(u64 *flbs_pa)
 {
+	DECLARE_KHO_SER_HDR(luo_flb_header_ser, *fhdr);
 	struct luo_flb_header_ser *header_ser;
 
-	header_ser = kho_alloc_preserve(LUO_FLB_PGCNT << PAGE_SHIFT);
-	if (IS_ERR(header_ser))
-		return PTR_ERR(header_ser);
+	fhdr = kho_alloc_preserve(LUO_FLB_PGCNT << PAGE_SHIFT);
+	if (IS_ERR(fhdr))
+		return PTR_ERR(fhdr);
 
-	*flbs_pa = virt_to_phys(header_ser);
+	kho_ser_init(fhdr, luo_flb_header_ser);
+	header_ser = kho_ser_payload(fhdr, luo_flb_header_ser);
+
+	*flbs_pa = virt_to_phys(fhdr);
 
 	header_ser->pgcnt = LUO_FLB_PGCNT;
 	luo_flb_global.outgoing.header_ser = header_ser;
-	luo_flb_global.outgoing.ser = (void *)(header_ser + 1);
+	luo_flb_global.outgoing.ser = (void *)fhdr + kho_ser_size(luo_flb_header_ser);
 	luo_flb_global.outgoing.active = true;
 
 	return 0;
 }
 
-void __init luo_flb_setup_incoming(u64 flbs_pa)
+int __init luo_flb_setup_incoming(u64 flbs_pa)
 {
-	struct luo_flb_header_ser *header_ser;
+	DECLARE_KHO_SER_HDR(luo_flb_header_ser, *fhdr);
+	int err;
 
 	if (!flbs_pa)
-		return;
+		return 0;
 
-	header_ser = phys_to_virt(flbs_pa);
-	luo_flb_global.incoming.header_ser = header_ser;
-	luo_flb_global.incoming.ser = (void *)(header_ser + 1);
+	fhdr = phys_to_virt(flbs_pa);
+	err = kho_ser_validate(fhdr, luo_flb_header_ser);
+	if (err)
+		return err;
+
+	luo_flb_global.incoming.header_ser =
+		kho_ser_payload(fhdr, luo_flb_header_ser);
+	luo_flb_global.incoming.ser = (void *)fhdr + fhdr->size;
 	luo_flb_global.incoming.active = true;
+
+	return 0;
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index e22a8cf39d91..df8306d73768 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -121,7 +121,7 @@ void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
 void luo_flb_file_finish(struct liveupdate_file_handler *fh);
 void luo_flb_unregister_all(struct liveupdate_file_handler *fh);
 int __init luo_flb_setup_outgoing(u64 *flbs_pa);
-void __init luo_flb_setup_incoming(u64 flbs_pa);
+int __init luo_flb_setup_incoming(u64 flbs_pa);
 void luo_flb_serialize(void);
 
 #ifdef CONFIG_LIVEUPDATE_TEST
-- 
2.56.0.506.g506a7eabc5-goog



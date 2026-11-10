Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02900606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hy5dMTDf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Sa/09Q+R;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i4uJ7/+9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QH3sulygYhhWPnxKAIiCVfW20U0EPZtpLbJ/h67Rp6Y=; b=Hy5dMTDfM08YbMwAkljQw4UD3q
	JoVivgtWIL8k8qamHKkmyaZO7HNJiuE3o03K6f3a6ONRekfoLJGLTP2QqfHlIdyjnJp5LcEh5dXZQ
	PqFf4t4VSkYLJ0VscNRCrAEoIruxrKjwLamBJ/K7R1YGusHw+w2H03TeQ4nl1FJiWhqCVWQNuplhe
	GowbmE+zuyEVTyY1fwTvajRaVD5NOfhpCaLBpqW4hwHz0JngN1FPxMsrXDJPLYTw6weesWpUUV5Dw
	7RRuk56D3yeeZWQGYl3Srlfp6v7N7R0VG0+w9UKAmwZpnz+N6nPuxcO8n/dmYVCZKtvdKl+wwMxxn
	paf7Zi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe0f-00000002SqR-0PNB;
	Tue, 10 Nov 2026 05:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe0B-00000002RqQ-0NFR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 05:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QH3sulygYhhWPnxKAIiCVfW20U0EPZtpLbJ/h67Rp6Y=; b=Sa/09Q+RUgt/oRqeLEvNRzPZG5
	LU0cm1DMDB5SfPNoGRIIhH2Xm92XvDk48My0i0Vae9TG3DslKiJMbE/trVJc0cXkR0ih+1k1nKVgH
	VTRvS9cHwaqcF/P6V/kxuhgVHykBQseZZjO+S36tACwvQL8JWL1kOANh4UqFZd1zCmjgvubHo2/ie
	S1DbHKPZI917b6x6BiHDfcOqoQv5IZC3HBftYutVcy6aiisNHT9TSgXyk6piAKVKLmgNTDzs4SmTk
	5bDlcu+X0OMy7LJp+1j/zRxApBj3G70pw+Wgxx1fyb3fIKPEYtADSen+mCzKEOLSbnYfV+OfgzPGw
	SRA3D6xg==;
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdzw-00000007WHd-0RfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:02:32 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a17741243eso9067785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794286936; x=1794891736; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QH3sulygYhhWPnxKAIiCVfW20U0EPZtpLbJ/h67Rp6Y=;
        b=i4uJ7/+9WxQ9F0wMdLUkMpUUJp+x70OvRsZuB6xenP1w39rvNO36dm+eRjlNCxltAP
         I0q+W4bYL60h3JrzcJRDDySwYauw1Ts5+rIjmTmGEz86dk07XBIlhcAfCyCT5Lh/q1ee
         e1xoN7erm0957+UJ5LyRORLUXS3c/9BUojRbzegW1DGBiM9+rD2nquM7g746F9VxnWSu
         iAzUxXUkm3WNVizcD2sQ+Z8GyELIoLGxJncYwFS4ef31MnTDd7Abg9QfSoVTJkZFW/pB
         keyzmCmUeZcMliMj9sJdrnBQsaD6ZhZO4zwz4R2ylhqyBwOZkqtgQUlT7j8kbC74hKWq
         K3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286936; x=1794891736;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH3sulygYhhWPnxKAIiCVfW20U0EPZtpLbJ/h67Rp6Y=;
        b=2vu0p9bM9fitvactzTbLUbtyjWX21ZjPZ9ocAl10HCe6a1OGplYiQoXzVwY8jgFPqX
         w3pq5vEgYw4QhVB8mRqFNvTj3IEyiWsfvtmhz0DUxxuQIgUGwcYHLF7YOKNbhxgdXnen
         QpBYlePXwUXRvswhE5i+2HmzpfFvaYicOO3kMz1G8RAKVKege5sjp+hxLQbxTmDuYE1Y
         nOMd8GDwcRhdfZeMx5vrDzQlGOrwdN1p4nFVPHiABfrAW7pTZ3G+LGQsU9npLVT1uA+N
         +fI4pqqReTsN2Ly16zsWo7IUm9XQgY/fpeOoNKEiWNxdGIsUfyNAnanV7Js5K4WyBpwg
         h9zg==
X-Forwarded-Encrypted: i=1; AL+hErEEMsWnKMjVhBB4sRk0SvGBE8RdBgvv8gaWY63tziOfQ0DNqqeIQLmqMZeYXaSh1YaucdKUDaHaAWIc8gYau0pS@lists.infradead.org
X-Gm-Message-State: APuU4Z+VlDhwPxK24ESmFpVt9C6DRS8o9Xepfwvtu53g+UiGp0/55HeS
	SESL09s/DsOUnEzR34yjgidG76Aey1+JUR6y3fOU4/h0tN9Yc6Mz724zgFmd3pKMMu+0O9nRUZp
	GL0yoTgTlpqBatvRwWw==
X-Received: from wrvd15.prod.google.com ([2002:a5d:538f:0:b0:48e:1449:1f6c])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b9b:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ba023577bfmr24128895e9.30.1794286936085;
 Mon, 09 Nov 2026 21:02:16 -0800 (PST)
Date: Tue, 10 Nov 2026 05:01:53 +0000
In-Reply-To: <20261110050202.529473-1-tarunsahu@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110050202.529473-11-tarunsahu@google.com>
Subject: [PATCH v4 10/19] liveupdate: Add feature header to struct luo_session_ser
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
X-CRM114-CacheID: sfid-20261110_050231_489833_B3B9F9FB 
X-CRM114-Status: GOOD (  19.87  )
X-Spam-Score: -7.6 (-------)
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

Precede each serialized session entry in the LUO session KHO block set
with struct kho_ser_hdr via DECLARE_KHO_SER so future session features can
append fields to struct luo_session_ser without breaking compatibility
between adjacent kernels.

Size session block-set entries using kho_ser_size(luo_session_ser),
initialize each entry feature header during luo_session_serialize(), and
validate the incoming feature header in luo_session_deserialize_one()
before accessing the struct luo_session_ser payload.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 include/linux/kho/abi/luo.h     |  6 +++---
 kernel/liveupdate/luo_session.c | 38 ++++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index dfa7ea434d0d..425c52c494f1 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -132,15 +132,15 @@ static_assert(!IS_ENABLED(CONFIG_64BIT) ||
  * between kernels via Kexec Handover. An array of these structures (one per
  * session) is created and passed to the target kernel, allowing it to
  * reconstruct the session context.
+ *
+ * Preceded by &struct kho_ser_hdr.
  */
 struct luo_session_ser {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	DECLARE_KHOSER_PTR(file_set_ser, struct luo_file_set_ser *);
 };
 
-static_assert(sizeof(struct luo_session_ser) == 72);
-static_assert(!IS_ENABLED(CONFIG_64BIT) ||
-	      __alignof__(struct luo_session_ser) == 8);
+DECLARE_KHO_SER(luo_session_ser, 72, 0, 0);
 
 /* The max size is set so it can be reliably used during in serialization */
 #define LIVEUPDATE_FLB_COMPAT_LENGTH	48
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index df667fe15fb2..641bd67ce76e 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -131,7 +131,7 @@ struct luo_session_global {
 	struct luo_session_header outgoing;
 };
 
-#define LUO_SESSION_SER_SIZE (sizeof(struct luo_session_ser) + \
+#define LUO_SESSION_SER_SIZE (kho_ser_size(luo_session_ser) + \
 			      sizeof(struct luo_file_set_ser))
 
 static struct luo_session_global luo_session_global = {
@@ -557,23 +557,33 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 	return 0;
 }
 
-static struct luo_session_ser *luo_session_ser_init(void *mem)
+static struct luo_session_ser *
+luo_session_ser_init(DECLARE_KHO_SER_HDR(luo_session_ser, *fhdr))
 {
 	struct luo_file_set_ser *file_set_ser;
-	struct luo_session_ser *ser = mem;
+	struct luo_session_ser *ser;
+
+	kho_ser_init(fhdr, luo_session_ser);
+	file_set_ser = (void *)fhdr + kho_ser_size(luo_session_ser);
 
-	file_set_ser = mem + sizeof(struct luo_session_ser);
+	ser = kho_ser_payload(fhdr, luo_session_ser);
 	KHOSER_STORE_PTR(ser->file_set_ser, file_set_ser);
 
 	return ser;
 }
 
 static int luo_session_deserialize_one(struct luo_session_header *sh,
-				       struct luo_session_ser *ser)
+				       DECLARE_KHO_SER_HDR(luo_session_ser, *fhdr))
 {
+	struct luo_session_ser *ser;
 	struct luo_session *session;
 	int err;
 
+	err = kho_ser_validate(fhdr, luo_session_ser);
+	if (err)
+		return err;
+
+	ser = kho_ser_payload(fhdr, luo_session_ser);
 	session = luo_session_alloc(ser->name);
 	if (IS_ERR(session)) {
 		pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
@@ -606,7 +616,7 @@ int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
 	static bool is_deserialized;
-	struct luo_session_ser *ser;
+	DECLARE_KHO_SER_HDR(luo_session_ser, *fhdr);
 	struct kho_block_set_it it;
 	static int saved_err;
 	int err;
@@ -635,8 +645,8 @@ int luo_session_deserialize(void)
 	 * reliably reset devices and reclaim memory.
 	 */
 	kho_block_set_it_init(&it, &sh->block_set);
-	while ((ser = kho_block_set_it_read_entry(&it))) {
-		err = luo_session_deserialize_one(sh, ser);
+	while ((fhdr = kho_block_set_it_read_entry(&it))) {
+		err = luo_session_deserialize_one(sh, fhdr);
 		if (err)
 			goto save_err;
 	}
@@ -665,15 +675,17 @@ int luo_session_serialize(void)
 	kho_block_set_it_init(&it, &sh->block_set);
 
 	list_for_each_entry(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_reserve_entry(&it);
+		DECLARE_KHO_SER_HDR(luo_session_ser, *fhdr) =
+			kho_block_set_it_reserve_entry(&it);
+		struct luo_session_ser *ser;
 
 		/* This should not fail normally as blocks were pre-allocated */
-		if (WARN_ON_ONCE(!ser)) {
+		if (WARN_ON_ONCE(!fhdr)) {
 			err = -ENOSPC;
 			goto err_undo;
 		}
 
-		ser = luo_session_ser_init(ser);
+		ser = luo_session_ser_init(fhdr);
 		err = luo_session_freeze_one(session, ser);
 		if (err) {
 			kho_block_set_it_prev(&it);
@@ -691,7 +703,9 @@ int luo_session_serialize(void)
 
 err_undo:
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
+		DECLARE_KHO_SER_HDR(luo_session_ser, *fhdr) =
+			kho_block_set_it_prev(&it);
+		struct luo_session_ser *ser = kho_ser_payload(fhdr, luo_session_ser);
 
 		luo_session_unfreeze_one(session, ser);
 		memset(ser->name, 0, sizeof(ser->name));
-- 
2.56.0.506.g506a7eabc5-goog



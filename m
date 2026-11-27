Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dlv2sr1/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GYOQEExT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=esRSTx9IpL/ybW25VHcD6mzBY2hlIDI+k1S943K/5/g=; b=dlv2sr1/2DNF/uFWvT8LE+lIkq
	3iV6b7+l5pDsHs7cKxdggKMsDKpP6sqSiWu8rdSxqOAOD7yBuF09ZWN8/KT9h4TlJVRWynab32ULz
	xAF3z9G0PkWz8QfBHK/Q6dea6DOgGxZnAn7QW94zKwtg3ssCyTIfnYpbOmSoQcJ6x0ZHLX25HlV3U
	8fgG3en+XJIHXxbAWo3LDBQD5fAkozzhcFi4Mvr6lDbWfOikyQSzwVRIhwg9QTKVWB90YWN5nBjt0
	l61cIDfkh8xaDbOqUzKK2f5rj5DwMmYQU4e4Iy+QNQVuHdrXqioAyJ2aIUVO/Rx63bUNIvUsl+I4t
	3LGDACQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzI3-0000000HBKJ-0Sdh;
	Fri, 27 Nov 2026 16:59:15 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzHt-0000000HBHo-0LNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:59:06 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c4163a5400eso767822866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795798742; x=1796403542; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esRSTx9IpL/ybW25VHcD6mzBY2hlIDI+k1S943K/5/g=;
        b=GYOQEExTWfvgzGmoSen2JI0/rIBRTuCURLKghif1pGjLGwMFP9PayCoPrSfEbXdei0
         Lv36khN5SEc5wljZ85coQQeDUPm6IoeLpfRtJH6aVpnQ+w1Sr1LzPmeglduNgukqu+pK
         2gwoO7Y2FXa9HZRWlg81zCtZ9yjwJpKWJd7trqaxqpsKvkwVfRnY2La0UcaWwHypxJpn
         fNdBT8eWEk6PZTIbxNSbHNiTWjpRbmavrhnu35Vd5rOiG0WxRzeiykwctS0AHEYEUMHe
         j7H7oDGjxVAVL/Z0UiqNZ71yX34Q+G7r5niyn3TpfXVIE/aArcs4rHQHCCrEiyF8czyh
         Xz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798742; x=1796403542;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esRSTx9IpL/ybW25VHcD6mzBY2hlIDI+k1S943K/5/g=;
        b=yyGc2f/tltUU0aIOx4TTkV2EPwosJUZjBD/O1JdySqdLTKtPNviMwMnXF81aTsauwm
         WMjWMLS2W5sZyu/qtoUyppvwvm5Y/GGuTIOJ4vTQ7zN0KSKMaJBXh6RMHKW4/iyzn/Su
         njCir1Lb+RN3LZu59obXIIoGQax7ULMfsRx8pEdssVjCxfF8nlRBny0n6WiBj+b29Bj4
         09Z36cHnBYmkO6rA17mls7EuSICsOYslLHoqfxJnjKX8agJlsIV08iGGKfo77FAY/Czk
         lAKDmn5/oRUl5LKii2fkN8PyvEz63/nVvmKw9dRG0MJLHW27H56rAo9+11kRk3naqoxN
         eeSw==
X-Forwarded-Encrypted: i=1; AL+hErFRFB1WBqrTRgnxp428wmSyh2VqrHdTNWyBwSPkgmJ6XCxoE6sDS3DVMCxwvBleObspZDEE3/t4QLarOvhouec/@lists.infradead.org
X-Gm-Message-State: APuU4Z8XHp6WuW2RkUqIWrSZJtQQhkASEkBfiAn3KDMGc/nkV7VFfhFT
	Dbr0sfapgPGq8v4P/wsshKM5DlY1OB6q1zfvbUpFYsEYMhXqOj4EVA/NRDdFM/0ucaYEgQjMJhs
	aqFuEWi6kNCZNgk/jw2aDQA==
X-Received: from ejcl14.prod.google.com ([2002:a17:906:78e:b0:c4d:4f51:fd3c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9301:b0:c46:78af:6150 with SMTP id a640c23a62f3a-c5131585160mr2356923966b.2.1795798742373;
 Fri, 27 Nov 2026 08:59:02 -0800 (PST)
Date: Fri, 27 Nov 2026 16:58:41 +0000
In-Reply-To: <20261127165843.709034-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261127165843.709034-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127165843.709034-2-vdonnefort@google.com>
Subject: [PATCH v2 1/2] util: Use a memoized value for PAGE_SIZE
From: Vincent Donnefort <vdonnefort@google.com>
To: will@kernel.org, julien.thierry.kdev@gmail.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, alexandru.elisei@arm.com, andre.przywara@arm.com, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085905_135028_9B85BF96 
X-CRM114-Status: GOOD (  13.66  )
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

The PAGE_SIZE macro invokes sysconf on every evaluation. Promote
host_page_size() to util, memoize the sysconf(_SC_PAGE_SIZE) result and
back PAGE_SIZE with it.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 builtin-run.c      | 14 +-------------
 include/kvm/kvm.h  |  4 ----
 include/kvm/util.h |  6 ++++++
 util/util.c        | 15 +++++++++++++++
 4 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/builtin-run.c b/builtin-run.c
index 75e8ced1f421..f06231e382ad 100644
--- a/builtin-run.c
+++ b/builtin-run.c
@@ -401,18 +401,6 @@ static void kernel_usage_with_options(void)
 		KVM_BINARY_NAME);
 }
 
-static long host_page_size(void)
-{
-	long page_size = sysconf(_SC_PAGE_SIZE);
-
-	if (page_size < 0) {
-		pr_warning("sysconf(_SC_PAGE_SIZE) failed");
-		return 0;
-	}
-
-	return page_size;
-}
-
 static long host_ram_nrpages(void)
 {
 	long nr_pages = sysconf(_SC_PHYS_PAGES);
@@ -427,7 +415,7 @@ static long host_ram_nrpages(void)
 
 static u64 host_ram_size(void)
 {
-	long page_size = host_page_size();
+	unsigned long page_size = host_page_size();
 	long nr_pages = host_ram_nrpages();
 
 	return (u64)nr_pages * page_size;
diff --git a/include/kvm/kvm.h b/include/kvm/kvm.h
index 72a8c3f32b5f..2b7e4b7f4a9f 100644
--- a/include/kvm/kvm.h
+++ b/include/kvm/kvm.h
@@ -23,10 +23,6 @@
 #define HOME_DIR		getenv("HOME")
 #define KVM_BINARY_NAME		"lkvm"
 
-#ifndef PAGE_SIZE
-#define PAGE_SIZE (sysconf(_SC_PAGE_SIZE))
-#endif
-
 /*
  * We are reusing the existing DEVICE_BUS_MMIO and DEVICE_BUS_IOPORT constants
  * from kvm/devices.h to differentiate between registering an I/O port and an
diff --git a/include/kvm/util.h b/include/kvm/util.h
index 0f5a4bba5714..dc0972061108 100644
--- a/include/kvm/util.h
+++ b/include/kvm/util.h
@@ -154,4 +154,10 @@ void *mmap_guest_memfd(struct kvm *kvm, u64 size);
 int kvm_create_vcpu_thread(struct kvm *kvm, pthread_t *thread,
 			   void *(*start_routine)(void *), void *arg);
 
+unsigned long host_page_size(void);
+
+#ifndef PAGE_SIZE
+#define PAGE_SIZE host_page_size()
+#endif
+
 #endif /* KVM__UTIL_H */
diff --git a/util/util.c b/util/util.c
index ff888bf9e061..c4ee03304503 100644
--- a/util/util.c
+++ b/util/util.c
@@ -235,3 +235,18 @@ int kvm_create_vcpu_thread(struct kvm *kvm, pthread_t *thread,
 
 	return -ret;
 }
+
+unsigned long host_page_size(void)
+{
+	static long page_size;
+
+	if (!page_size) {
+		page_size = sysconf(_SC_PAGE_SIZE);
+		if (page_size < 0) {
+			pr_warning("sysconf(_SC_PAGE_SIZE) failed");
+			page_size = 0;
+		}
+	}
+
+	return page_size;
+}
-- 
2.56.1.839.g22a8290db9-goog



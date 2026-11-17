Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1805606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwKN0ta9;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jtwfl3gE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wu/NN4dqsDscYK6J12nkPIxZlOHkGY0u8c3baZ+fClg=; b=jwKN0ta9kHBstF5e5ARKR3YQb2
	/7DtSXsCPEPdKicWHoqMmP0C3kwA8QEvsQ81TbokZ8vqUq3kmKGH/xOuUmDRVPH/73wsn2ucZg488
	+8oG3CdsnVPqaQ5hf0kFi7k538ZzZweJ4shpM+PM0QHlb3510o1Ukq+1SDAkY4Vy/iqBTatbBAKBM
	Cd9rEyx6r+zwgvnA0nR6FJYrKAeufTpIuFCuu2enfw0rGketLQeIYjFriuFg/pyPfn6f2SQMT5QQ0
	/FmcUzvMW88FGskn8QQwbrwxxojwSyr79ryl9EBtUVb1pLKNoGir4dwVvhU5iYZU9S8znza9/XlEv
	Y6k8WfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bC-00000004MMX-0a5m;
	Tue, 17 Nov 2026 02:07:06 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b7-00000004MIK-1czv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:02 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4241300a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881219; x=1795486019; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wu/NN4dqsDscYK6J12nkPIxZlOHkGY0u8c3baZ+fClg=;
        b=jtwfl3gEHeli0+QXXWu9XEFgPqjfp3YOhxS3BsfXP+vt+v1dT53wlXlubHYGXv/1kD
         Bae4Zm3godejiUDPSB7BNCBXPfVH4vFJA7g2ClA6CmwVo5L5kCx+7NlOU2Hz8OzmnJMN
         /xfjvypZX6uU2tri6NukyiAJp7DfgKlrTEZIgmEQgZBExxfGBxCsl3lGp5GYxlVRY8Vc
         gQY12Mj8AyM/MMG4NY7LOpgzluvQo4s8uzNHwozj1Xdto3SH72EONT53UEi7RjhosvBu
         4DGY7eiz+63Ec57MLWikw85CUlAuSvm9M3sIoWOfIhO6SFkbgdT71dD0Xer1R3jBQgLa
         GgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881219; x=1795486019;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu/NN4dqsDscYK6J12nkPIxZlOHkGY0u8c3baZ+fClg=;
        b=C9eVm/RGVOOoo1mMp8GzbzJ00xx22862fy6rPFnecbaqKsZtfMeszMnWwPnUGzB/eM
         5pEgOXn6inGYNKTs5FggPMWMAi/erZohurrbtuTqBbEqmH0MagXjIZU0jB8R8meXkPt+
         478AB+sT2MmKt8WaJvw+bLpDxxXieCzoKkOdOtH+jlijTz5B3HTEktwTKAqtNjdr5c6x
         XG/Z2+2ODlzo+Ps/jac/4nODW/Hbs0YUJoP7sc4UuJUUvE7/mySD1svQPASeY8LwzTBO
         Ra0Mm94bSBZCbfGq2qsDNx2QL8pU/m1IgM5pA6ujg7EOVnFe0l44usnC+2Sry6hwcjE0
         FX+w==
X-Forwarded-Encrypted: i=1; AL+hErEo/ct57Sp2n3Y7wNJ2MTJ8Dix/7Cd/XDm8CK8cK2pwCHHV/X1h0UQRvXBWiTs0LtVEpIUQ61BYux15IPNuYSNa@lists.infradead.org
X-Gm-Message-State: APuU4Z8f9r2KGAgxBlvYF3oRFwrDLSvQlkiLCeQ8whCi8V2AsJLsr4c4
	M2XEiC71W7X90UQwV9nzyMk9VX0rmtLXnZt24A0eWbZz1KontRAQkayJ5+EkTTGKzgyG/trEo8f
	pcZ1tud/IVQzVwbu58NC7kss8gA==
X-Received: from plpw11.prod.google.com ([2002:a17:902:9a8b:b0:2e8:bfd5:b889])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr125024925ad.25.1794881219009;
 Mon, 16 Nov 2026 18:06:59 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:41 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-5-dylanbhatch@google.com>
Subject: [PATCH v9 04/11] sframe: Separate reading of FRE from reading of FRE
 data words
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180701_531366_5DB0515D 
X-CRM114-Status: GOOD (  17.69  )
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

From: Jens Remus <jremus@linux.ibm.com>

__find_fre() performs linear search for a matching SFrame FRE for a
given IP.  For that purpose it uses __read_fre(), which reads the whole
FRE.  That is the variable-size FRE structure as well as the trailing
variable-length array of variable-size data words.  For the search logic
to skip over the FRE it would be sufficient to read the variable-size
FRE structure only, which includes the count and size of data words.

Add fields to struct sframe_fre_internal to store the FRE data word's
address, count, and size.  Change __read_fre() to read the variable-
size FRE structure only and populate those new fields.  Change
__read_fre_datawords() to use those new fields.  Change __find_fre()
to use __read_fre_datawords() to read the FRE data words only after a
matching FRE has been found.

[ Dylan Hatch: Adapt for in-kernel unwinding without flexible FDEs. ]

Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 kernel/unwind/sframe.c | 97 +++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 24 deletions(-)

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 93dea710d3bfc..50afaed9a0c93 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -38,6 +38,9 @@ struct sframe_fre_internal {
 	s32		ra_off;
 	s32		fp_off;
 	u8		info;
+	unsigned long	dw_addr;
+	unsigned char	dw_count;
+	unsigned char	dw_size;
 };
 
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
@@ -183,6 +186,67 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 		 s32 :	GET_SIGNED_AND_INC(to, from, size),	\
 		 s64 :	GET_SIGNED_AND_INC(to, from, size))
 
+static __always_inline int
+__read_default_fre_datawords(struct sframe_section *sec,
+			     struct sframe_fde_internal *fde,
+			     struct sframe_fre_internal *fre)
+{
+	unsigned char dataword_count = fre->dw_count;
+	unsigned char dataword_size = fre->dw_size;
+	unsigned long cur = fre->dw_addr;
+	s32 cfa_off, ra_off, fp_off;
+
+	GET_AND_INC(cfa_off, cur, dataword_size);
+	dataword_count--;
+
+	ra_off = sec->ra_off;
+	if (!ra_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(ra_off, cur, dataword_size);
+	}
+
+	fp_off = sec->fp_off;
+	if (!fp_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(fp_off, cur, dataword_size);
+	}
+
+	if (dataword_count)
+		return -EFAULT;
+
+	fre->cfa_off	= cfa_off;
+	fre->ra_off	= ra_off;
+	fre->fp_off	= fp_off;
+
+	return 0;
+}
+
+static __always_inline int
+__read_fre_datawords(struct sframe_section *sec,
+		     struct sframe_fde_internal *fde,
+		     struct sframe_fre_internal *fre)
+{
+	unsigned char fde_type = SFRAME_V3_FDE_TYPE(fde->info2);
+	unsigned char dataword_count = fre->dw_count;
+
+	if (!dataword_count) {
+		/* A FRE without data words indicates an outermost frame. */
+		fre->cfa_off	= 0;
+		fre->ra_off	= 0;
+		fre->fp_off	= 0;
+
+		return 0;
+	}
+
+	switch (fde_type) {
+	case SFRAME_FDE_TYPE_DEFAULT:
+		return __read_default_fre_datawords(sec, fde, fre);
+	/* Flexible FDEs not supported */
+	default:
+		return -EFAULT;
+	}
+}
+
 static __always_inline int __read_fre(struct sframe_section *sec,
 				      struct sframe_fde_internal *fde,
 				      unsigned long fre_addr,
@@ -192,7 +256,6 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
 	unsigned char fre_type = SFRAME_V3_FDE_FRE_TYPE(fde->info);
 	unsigned char dataword_count, dataword_size;
-	s32 cfa_off, ra_off, fp_off;
 	unsigned long cur = fre_addr;
 	unsigned char addr_size;
 	u32 ip_off;
@@ -213,7 +276,7 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	GET_AND_INC(info, cur, 1);
 	dataword_count = SFRAME_V3_FRE_DATAWORD_COUNT(info);
 	dataword_size  = dataword_size_enum_to_size(SFRAME_V3_FRE_DATAWORD_SIZE(info));
-	if (!dataword_size || !dataword_count)
+	if (!dataword_size)
 		return -EFAULT;
 
 	if (cur + (dataword_count * dataword_size) > sec->fres_end ||
@@ -225,30 +288,11 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 		return -EFAULT;
 
 	fre->size	= addr_size + 1 + (dataword_count * dataword_size);
-
-	GET_AND_INC(cfa_off, cur, dataword_size);
-	dataword_count--;
-
-	ra_off = sec->ra_off;
-	if (!ra_off && dataword_count) {
-		dataword_count--;
-		GET_AND_INC(ra_off, cur, dataword_size);
-	}
-
-	fp_off = sec->fp_off;
-	if (!fp_off && dataword_count) {
-		dataword_count--;
-		GET_AND_INC(fp_off, cur, dataword_size);
-	}
-
-	if (dataword_count)
-		return -EFAULT;
-
 	fre->ip_off	= ip_off;
-	fre->cfa_off	= cfa_off;
-	fre->ra_off	= ra_off;
-	fre->fp_off	= fp_off;
 	fre->info	= info;
+	fre->dw_addr	= cur;
+	fre->dw_count	= dataword_count;
+	fre->dw_size	= dataword_size;
 
 	return 0;
 }
@@ -298,6 +342,7 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 	bool which = false;
 	unsigned int i;
 	u32 ip_off;
+	int ret;
 
 	ip_off = ip - fde->func_addr;
 
@@ -338,6 +383,10 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 		return -EINVAL;
 	fre = prev_fre;
 
+	ret = __read_fre_datawords(sec, fde, fre);
+	if (ret)
+		return ret;
+
 	if (sframe_init_cfa_rule_data(&frame->cfa, fre->info, fre->cfa_off))
 		return -EINVAL;
 
-- 
2.56.0.679.gc527c65306-goog



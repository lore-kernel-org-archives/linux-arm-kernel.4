Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92560606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2xoy6auS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jcJ8C/UM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=; b=2xoy6auSEMoSxb
	QP/9FbFBtKpBr7yBIZ3/e1r2ym0x6SSQcX+uo4Bxus9Djo88qgHRxkqV+/69nu4MAWxOSs1T4mMRB
	2IUizDKARhQdNcPmT81WBUfKN9ehnPkimGYZyZhuU1BCi73tEUdQMfx9eQgKjpfWGnBW9huPIfXQL
	RCNobvWfG88xXLN8KkEoAKX0ShhHI/x7IkAM55ZFmRwZgUJdNCL5daRr2PflqaEtoANkv1tOru/ra
	ZgExXwRNLlt7Mi2Qf6vp20UB4wnDcyXzDyESVSaGHXoqqm8DTeRW0TfnLB0h+xS2zM+9VMG5DNE9O
	dZvdDFaZSTFMdNPUHYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgp6-0000000Elff-0cJn;
	Sat, 07 Nov 2026 13:51:12 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgp0-0000000ElaZ-3n5a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:51:11 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2552109eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059466; x=1794664266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=;
        b=jcJ8C/UMPqtd564pbpwehzpFvz2+uZiwFwuSkvPvP0bbjwbIYOD9Ws7f8X0T4j+vhd
         Pt6EIah5Pq+OCJI+D8V5HbgyBVz2oMJVXxKMyvBF5PXalD8JmfVd2ExClxNH0F5wbYs0
         US5njIpCoFmsWhC/5jd8s69o6IkWicZY9IV1ps7NzhLevHSncSTH4ywvDg/I4XbLF5++
         blEMkswW464bvFE3tS1ciZ/v0K8PvrUNp0PvRaqqkcxSf5JLrk/ResoSWDNs7LddcfsH
         2uFvlIxmwb8jS/tZ+/0WtA6B078pMM3raj3Xp22wXL1UVyDixqFNYjysdByvrBOsLlNO
         Nk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059466; x=1794664266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baZEbrhbhDEpq9QKIXgzBR/d0LlM+jrSsgwjy5hT7Ro=;
        b=tqrzDDVFn/sOoZ0o5qAYckiFdFXrSweVKIw6jnKVS8+8MTuBCkzW/LLHKw4JIHe7VD
         KyMRfi6fWGvu8sY9ZsxYb/XTRZEEZGvU6aI5Akgji2JLvL5A+s1a4CoitBJvAnzqgUYl
         UPBV2PfoH98111rED4y3QfzUtIEruBmka7uVeB3lAXVbV25V9wQbFbJRCza6ZJzGeQq4
         oVB/JACfec/pQt35hAW942SeD6iHrPQxI60/KxjeKZDaIsrMDQxYrlxkz7tYJK6syNdg
         uw2xWSYZNGJqa43hsGl4BaP0PFFmxneEqTqiAiRNW4lfxbXiaCHeGZQqeaHeji0aRRGz
         zRcg==
X-Forwarded-Encrypted: i=1; AL+hErGqT2YqdtKgkQ1BAJ1jpwajJDPbmGWA5IO7z07uynGy0/lXp4hX4IUAUFwstLCZtuM2D1DJhhQDqqfHP1fUyvdb@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zl09Bk/e3Y5Yro5ttI1EciQw/ekVyo7hksUqo1Wi1p9JrfOtc
	CD43tRL87Wxvcq+f37dsb1DMBvIlvPQtVQYL0z2KWhkSOJ1VI2nXTGtb
X-Gm-Gg: AYBFou15K9iBtafpB2Vx7dGE9RhaqgACQ47u2Nl4/xM5GeVAK3hVGIYUUlqK5xIIhAn
	Nl3VwaNXwp7MrW1SHDHTGojvLPNAf4nr+dSdsnjW5vZZzyW9Nwp4xmpGdu/bpC0YbKQIlVIi+Ph
	mxVTwG8cWYhjZ9kIZid4qaz++LvqJrhdWUIDkSTuSWLc3KHBWJrYQlLgdVRN1V3gExlOY07h3kI
	YJpm3y4FDF19ocUa5U9mk0AnePdI6IuYUryl9smszhIyqfBq0NcFDKaHaanElWOZb3F1FO+8INa
	1UF4NetcubId4whETDXNDU79GTlpwI1+X6fgVIIGXz71GZxx+CbshUHoj72EiBRqJrMMUmgSSng
	m8ZUU+yxXZgCkQWZFtY2aP6KX1VBM26F+JMUcpJdtqkyx6iVMLOZFNU+Q/pQSO4/+IYm842ubKs
	4RjKhdidxf77Y6C9qoub4YkfX4Homdl+LLS7+0qIbXH3c+c8e13Yuu2asj/JMh0NJOCyjnJk3AO
	UBHHLSRQ6s1OpXH0v7hukq0N/WFlMVGj5znAWXwaQIjzLypPjAZp4HcvCM5O7JVKzpw2Yjb1OAR
	iaY2JfM2snXW1bOS8/o7sERfV/2GEuQhdVnwBymkOA3kdisvd/XDisWfWw==
X-Received: by 2002:a05:7301:6486:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-36f75b1f828mr7447409eec.14.1794059466185;
        Sat, 07 Nov 2026 05:51:06 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:51:05 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Sat,  7 Nov 2026 21:49:53 +0800
Message-Id: <20261107134953.748622-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055107_004656_068E0B53 
X-CRM114-Status: GOOD (  12.80  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5b898da0826ad..6a150b11261a3 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3365,6 +3365,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3696,6 +3704,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3734,8 +3766,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags | VM_UNINITIALIZED,
-				  __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags | VM_UNINITIALIZED, prot,
+					__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1



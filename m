Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAai7k+m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cAi8Qn5I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPNmDWIn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=; b=tAai7k+mJeqJIR
	22Sk44jK9oMQ/bFtPT1cCQz+LdbtrqtHhLSuDU1tEyeqHYV2rEOJu5mLfSWnA89fYK1MYlazsS9rr
	EnFimuxEm0v46gWTf1RX3jQBxXXLKni/e/VX1cukqFNJafnXeR0BTGOeXneBFdUp4ro2EzplKQhed
	w/98rnx27obn9icRxRmkdQGRH3L022esCA6pO6pWrJ5wgoksE37BsiIJrdFYYPrmhx2RRdH7NntQh
	ZD5CjgZpdqPNK207OlzqECEGHAT6ynfcW6aHqFfxveuta/gJIx9cYX/WrP8czH+VtY51MS3SMQTOe
	7+eP/khbgiT6odaSe1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwS-0000000FMUO-0Ifa;
	Fri, 27 Nov 2026 09:08:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwQ-0000000FMSv-1hS8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=; b=cAi8Qn5Ijm4ex7C2iJfbzGwykT
	eRIFos9+qg+FpqaKS1TQOxP+6Gm/Obhx+H0Xlrna15mRZDih2CESUsc7tHb7ichaZ8RsQTJZq4B1e
	bxBM6ZtYcUkKpKgvOcd6jnQE2JKUtHPY6mvwjRc+rZFa+NAGw3kuWPu9m1SIypjNpbK9yC0oyEjf9
	HmyQ+dyj2vaDEfvLTe2Y+460Owgz+K8yW6PJ6Gl4SZV/Uytwt0RdGV5rCkXD4uklE72Oa1BvTLTO/
	P2LF7dvDk/DgwcBwBpdJB/tTz9k1Q6sBkqLAeDH7kS5G55OtnuqzpUzsxYlBgdktoU/fIGVlV1+zM
	HHwQ/kmg==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwM-00000007UPW-0ILM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:08:25 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2effa00323fso30996795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770500; x=1796375300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=xPNmDWInEfjr7Gud7k2Hsqh24mq3PCg11uXQnIgkCzAKmR88klRoBa4n2y5IQWlygi
         BrYEoEIRS8j7YAdHxUCBP5Bc529oBOlOUNYcLzCrTksgQJevo8BofnQ7Q5ovnGd8SEiH
         Q+6BNSsjocHkctLOaEKoQWSEL3any1wV1RDid6l6DqP21r2Dw8StPZHSYEpaPPGy7wk7
         pfGDILbzr1aeru0aRo2iDOC4XiYObn3lUU4e7GIXPlGRI3jLkeoM3zySTo3GjM6YH0Zy
         /KBRK79dHTR4pGjNcNOrBWFAKG2QUujJlR7jfxi+HCdDQxbxzUaJmKWMvvJ+7r3gc6DC
         6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770500; x=1796375300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=NKNWz4J+JfGiE/EtqB+178RYmEvuzVyvT0TLudfjN6dIulv8U2iEOaS5tqUm4fqBJJ
         Nk+2vPk4zdrOhPXi1RHlDLT48CRHIqsBumVh/227khq0CADyF8J8K5l96MwHGNYMjgDf
         cdS0/fJvJbaqnIs5Ux8psQPBrgn2ZRMdcXf82jTQDXWTtsL+nU4Cl2rt7k1OemfU2Drx
         FImOTECeM5X7DCixjPIRn9tL7N3tEVqbRF264/zzIrd2sQQiFKYLcvpyW7GLbA1/RYEE
         jD6vcgx/3zvFVoWDtDkcppgc5rQUrS4isUIL6MNaNZK/tWtzvguA95mY25TjtNFB/C1V
         NEFQ==
X-Forwarded-Encrypted: i=1; AL+hErGIBC4WEDFZ6UIpuc+teEbFDnCTlGOV23ITtZozQZFSGBAJOoLw23AsI60YhBXV1rx1GPUpMEOJSC3aW/UZDt3P@lists.infradead.org
X-Gm-Message-State: APuU4Z8JMo0q+D1ftGwIw1n8vHkkSuQlIOCwPsxzW3DLJrajQ9m3UJGa
	7cisqiMkrjLNPaUDrbdrEW04/W+EcAlrjLgXsmhMwL37eSu5uzGTQBk2
X-Gm-Gg: AZFdTZeR8E+K685lEpXwmEpBKmChRhh/qwd96F6a302sxUymsiMOXqP81QHXLksCPEl
	lBAY+B3aMXo2vKv+Z7Hq60Rc/kXInZQRWn++fne5gmq0SXVuC4RX8Z44HAFxQP/63A+ZkaYNbRu
	c6dVdVde/pHciGpcAYaAH9AiTFzcxMRBOrm465u543eYSVl2ou3tCIX6TZpj0wFgFE1qV2dQXsA
	QRFzGjLgGvRvS2Bkr6aW+idHQ0DB0x0t6OzUe5Xpwz7qcj1VjddfWiRTMwXAJLYPg6xMvcdrFwP
	yVh6C66yntsThcxp1FZV4xdE/cRNPVAv6JlHZQzQOfNo88N2WssSdItdf3hRvRhbqLcE1vzR8lq
	xVrzNkZDpEWBGU2chx6RcncHxaiNanV1ugnyFyNioMHq6zq5ZRqPOke4okCN20uj2sJynd1ig9P
	yNX7Z/Ouz0+B5YKoqS1PWUNVllLQVnD+1EmxuYnVjiINg1q8A++RA1r0q449Ur0fAtyPrqBthby
	FZxzASB/Emd9RqbBwtfimE/SXfTWh5r7J/o7thxuAgcftEUlTUcp/RmN2yUOz8ePX4aNDSGP9Na
	9Own+fazk+rKp5i5jWfJT4mlEYkfM8WqmNMIwlTEfg==
X-Received: by 2002:a05:6300:6d93:20b0:400:77e2:eb03 with SMTP id adf61e73a8af0-4014d35f25cmr14065528637.48.1795770499535;
        Fri, 27 Nov 2026 01:08:19 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:18 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 27 Nov 2026 17:07:18 +0800
Message-ID: <20261127090723.741253-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090822_102953_D99DB001 
X-CRM114-Status: GOOD (  17.25  )
X-Spam-Score: 0.1 (/)
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

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the
same two-pass operation over system RAM resources. Concurrent memory
hotplug can change range source between the two walks and make the
populate pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tM/Y7y5/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fAdYN//N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D7W8dIhk/DqXieEbhErgMGNgKNDf1PvMknMAo7MRw5U=; b=tM/Y7y5/XqQ/1wE8r9Ye45qP8H
	2gahWg+EuktMIaT21BvYlAS1G03AGA1AoD34/xCQWU/yKYKp/J/LUBs/dmshUkgMoH9kbZOBtOvPe
	21vpqKKOhSkK0sc0Vgh+92TIXBWkafxkO5Wi/8BK2aY31JmDLQflfi5y21w+Vw9MXZhpoUcChhRFK
	CwsSFUo9Qy1SXTbwpXc9vpLjP4ZeesvsM1Wi9kRP9lDxWYI+vfBTA1DGtsltP5KTeJkBFDBVLupxZ
	2Z1ynzSjyvnfnEHW6K4Ew7+uOEfC/ywzigZu1yL0oQMhOJjVY23jWi8atoqdMusTW9M6sTNjI3o+/
	jzpdQmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTk-00000009yuv-0ZPo;
	Wed, 18 Nov 2026 18:33:56 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTc-00000009yqM-33i0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:33:51 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c505eecba6cso116895966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026825; x=1795631625; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7W8dIhk/DqXieEbhErgMGNgKNDf1PvMknMAo7MRw5U=;
        b=fAdYN//NAVXjoJvwRoTcXtJOGU8OzaCqJPV8iyAIhNxf2io5fQrS7Ix+MLCJFS1b96
         i0P4cssL+7ZD3u26YbqfCEUFgtRGrofQIL5jvOBtnFuIgR2gD0BcwZAAFtMeeg4AqjMu
         uJJL8SiTwntNkwWCM5ofynIggBiph1MpiN7gwJXWpbCpDUBFKz5cxuy1ypu/gYDRqaXP
         hze7MLNP48BfuGY0oXhpl3GNzbKlIO5T+LbKge2vokUrtSxZlAWpVlB56bQHLnUrNfWC
         tk1iW9ViccdZ8k+1lEDlYa6qDxEwreYxoqRH8Wmomx0TGJ63w6TJRzQvsFGPWMQMN0U2
         T8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026825; x=1795631625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7W8dIhk/DqXieEbhErgMGNgKNDf1PvMknMAo7MRw5U=;
        b=ETEPaNIqoBtbOoGtvOAvARvxnQWXPAoQB0tLL8RPB3kRqSnocsWJ0hfWHViOBxCPmH
         7W6Ss6AtF3vtqNkDC5EDKbvxpjTWt+LGnCqJaN04sjTKY20X6OvLB0ZXPmskKl+JPzv6
         +pDnr45Kay3cAw4GRMwRP1EN5LMXyjn+TvwZtynWY96d5tK8p/9wkTtBcrYGYCfQvMU3
         rFyeidTsV+oQHraamHOidlE2X3020DAC5wyg/VT5mIAoyPr+EUp/iDMwYdCxQvMsN/ar
         lUES6PEYrkNyGDnOfiLaEX9+iPYPEC+JL4tepfixVR/mJA4WeyYbJsdDlI87JCMCx9Qb
         w+zg==
X-Gm-Message-State: APuU4Z9wPx2Tmnn/262YwAlFF8Cz+IyxpSi+tTUxl2jDtbuiFHO9R1td
	C4m8i4/vcYYAe7jkkyBUADmuevwPeNOScH2FHPTtF2Xpre0MY6gxa5w2vcLj/c1UDXGxOvTjylS
	WDa5tHhhafCZu6BSABo1/ZWz+TmpQA3r6zF59WYM7zjFiW4lrY74LUy1egi9mx5pPVgEaFa8fKl
	Y6PdHL4g48kGCJ1SGaZhMBGp7TLZ6k/1zUv4oity3r0OkU
X-Received: from edvn7.prod.google.com ([2002:a05:6402:607:b0:6b7:571e:a4d4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:f816:b0:c51:ab6:1c73
 with SMTP id a640c23a62f3a-c510e1f7781mr289337866b.23.1795026825043; Wed, 18
 Nov 2026 10:33:45 -0800 (PST)
Date: Wed, 18 Nov 2026 19:33:38 +0100
In-Reply-To: <20261118183335.1944213-4-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118183335.1944213-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=12342; i=ardb@kernel.org;
 h=from:subject; bh=yeLwTN77ft6fk1T3xMXpT5oTOh68Ub8vtL//EWQPC2k=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevv++asLU/utcxjm/BBaNqdZ9VKgrKnTrglGL470LPNZ
 3XA1Kp1HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiqZMZGR64v2PlaM7Z1fEq
 Yf6z5IeLX9wrEfvCVWi30ma76Fp9tckM/1PNsyocnaJWJ2/48OZooFBh8Wl+edO1aZKe/97d3Ms +lxcA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118183335.1944213-6-ardb+git@google.com>
Subject: [PATCH 2/2] raid6: arm64: use the EOR3 instruction where available
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Demian Shulhan <demyansh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103348_868036_913B4F0F 
X-CRM114-Status: GOOD (  21.58  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The SHA3 extension to the arm64 instruction set provides EOR3, which XORs
three vectors in a single instruction. Use it to fold the XORs in the
Horner steps of the NEON syndrome code, which reduces the instruction
count from 5.25 to 4 per data disk and vector for the 4-disk step, i.e.,
a reduction of a third compared to the original code.

Build the EOR3 versions from the same neon.uc source, with
RAID6_NEON_EOR3 defined and the SHA3 extension enabled, and use them
instead of the plain NEON versions on CPUs that implement SHA3. Use
-march=armv8.2-a+sha3 for this: SHA3 is an optional extension of
ARMv8.2, so any CPU that implements it implements ARMv8.2 as well. This
is also what older toolchains (e.g., GCC 8.5 with binutils 2.36) need to
accept EOR3.

With SHA3 enabled, GCC and Clang fold a ^ b ^ c into EOR3 by themselves.
The exception is the loop carried P accumulator: recent GCC versions
reassociate the XORs into it in a way that only permits a single EOR3
instruction where two can be used, so use the veor3q_u8() intrinsic
explicitly for that case.

Results on an Apple M2 running Linux, best of the 1x/2x/4x/8x versions,
in MB/s, using a userspace build of the same code (4 KiB per disk):

  gen_syndrome()      2 data    4 data    8 data   16 data   32 data
  Avalanche (P) neon   54099     46028     41733     40484     39569
                eor3   63505     56936     53229     51807     51380
  Blizzard (E)  neon   21670     16197     15524     13915     12475
                eor3   23388     19800     19583     17278     15609

  xor_syndrome(), 16 data disks, stop = 15, in GB/s by value of start:
                           0         4         8        12        15
  Avalanche (P) neon      39        37        36        33        25
                eor3      50        46        44        38        25
  Blizzard (E)  neon      13        14        13        12         9
                eor3      16        17        16        14         9

Compared to the code before the previous patch, this is 15-48% faster for
gen_syndrome() on the performance cores, and 18-39% on the efficiency
cores.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/raid6/.gitignore      |  1 +
 lib/raid/raid6/Makefile        | 19 +++++++++
 lib/raid/raid6/arm/neon.c      | 42 +++++++++++---------
 lib/raid/raid6/arm/neon.h      | 16 ++++++++
 lib/raid/raid6/arm/neon.uc     | 20 +++++++++-
 lib/raid/raid6/arm64/pq_arch.h | 34 +++++++++++++++-
 6 files changed, 110 insertions(+), 22 deletions(-)

diff --git a/lib/raid/raid6/.gitignore b/lib/raid/raid6/.gitignore
index 6be57745afd1..2e9bd6299837 100644
--- a/lib/raid/raid6/.gitignore
+++ b/lib/raid/raid6/.gitignore
@@ -4,5 +4,6 @@ altivec*.c
 int*.c
 tables.c
 neon?.c
+eor3_?.c
 s390vx?.c
 vpermxor*.c
diff --git a/lib/raid/raid6/Makefile b/lib/raid/raid6/Makefile
index 5cdb7223de2a..314ed1012cc0 100644
--- a/lib/raid/raid6/Makefile
+++ b/lib/raid/raid6/Makefile
@@ -24,6 +24,10 @@ raid6_pq-$(CONFIG_KERNEL_MODE_NEON) += arm/neon.o \
 				   arm/neon8.o \
 				   arm/recov_neon.o \
 				   arm/recov_neon_inner.o
+raid6_pq-$(CONFIG_ARM64)	+= arm64/eor3_1.o \
+				   arm64/eor3_2.o \
+				   arm64/eor3_4.o \
+				   arm64/eor3_8.o
 raid6_pq-$(CONFIG_LOONGARCH)	+= loongarch/loongarch_simd.o \
 				   loongarch/recov_loongarch_simd.o
 raid6_pq-$(CONFIG_ALTIVEC)	+= powerpc/altivec1.o \
@@ -56,11 +60,21 @@ CFLAGS_arm/neon2.o += $(CC_FLAGS_FPU)
 CFLAGS_arm/neon4.o += $(CC_FLAGS_FPU)
 CFLAGS_arm/neon8.o += $(CC_FLAGS_FPU)
 CFLAGS_arm/recov_neon_inner.o += $(CC_FLAGS_FPU)
+# SHA3 is an optional extension of ARMv8.2, so any CPU that implements it
+# implements ARMv8.2 as well
+CFLAGS_arm64/eor3_1.o += $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=armv8.2-a+sha3
+CFLAGS_arm64/eor3_2.o += $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=armv8.2-a+sha3
+CFLAGS_arm64/eor3_4.o += $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=armv8.2-a+sha3
+CFLAGS_arm64/eor3_8.o += $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=armv8.2-a+sha3
 CFLAGS_REMOVE_arm/neon1.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_arm/neon2.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_arm/neon4.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_arm/neon8.o += $(CC_FLAGS_NO_FPU)
 CFLAGS_REMOVE_arm/recov_neon_inner.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_arm64/eor3_1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_arm64/eor3_2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_arm64/eor3_4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_arm64/eor3_8.o += $(CC_FLAGS_NO_FPU)
 
 ifeq ($(CONFIG_ALTIVEC),y)
 altivec_flags := -maltivec $(call cc-option,-mabi=altivec)
@@ -109,6 +123,11 @@ targets += arm/neon1.c arm/neon2.c arm/neon4.c arm/neon8.c
 $(obj)/arm/neon%.c: $(src)/arm/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
+# the arm64 EOR3 versions are built from the same source
+targets += arm64/eor3_1.c arm64/eor3_2.c arm64/eor3_4.c arm64/eor3_8.c
+$(obj)/arm64/eor3_%.c: $(src)/arm/neon.uc $(src)/unroll.awk FORCE
+	$(call if_changed,unroll)
+
 targets += powerpc/altivec1.c \
 	   powerpc/altivec2.c \
 	   powerpc/altivec4.c \
diff --git a/lib/raid/raid6/arm/neon.c b/lib/raid/raid6/arm/neon.c
index 2f8e98f5556e..722f15f2a6ad 100644
--- a/lib/raid/raid6/arm/neon.c
+++ b/lib/raid/raid6/arm/neon.c
@@ -7,6 +7,7 @@
 
 #include <asm/simd.h>
 #include "algos.h"
+#include "arm/neon.h"
 
 /*
  * There are 2 reasons these wrappers are kept in a separate compilation unit
@@ -19,35 +20,38 @@
  *   outside a kernel_neon_begin()/kernel_neon_end() pair.
  */
 
-#define RAID6_NEON_WRAPPER(_n)						\
-	static void raid6_neon ## _n ## _gen_syndrome(int disks,	\
+#define RAID6_NEON_WRAPPER(_pfx, _n, _name)				\
+	static void _pfx ## _n ## _gen_syndrome(int disks,		\
 					size_t bytes, void **ptrs)	\
 	{								\
-		void raid6_neon ## _n  ## _gen_syndrome_real(int,	\
-						unsigned long, void**);	\
 		scoped_ksimd()						\
-			raid6_neon ## _n ## _gen_syndrome_real(disks,	\
+			_pfx ## _n ## _gen_syndrome_real(disks,		\
 					(unsigned long)bytes, ptrs);	\
 	}								\
-	static void raid6_neon ## _n ## _xor_syndrome(int disks,	\
-					int start, int stop, 		\
+	static void _pfx ## _n ## _xor_syndrome(int disks,		\
+					int start, int stop,		\
 					size_t bytes, void **ptrs)	\
 	{								\
-		void raid6_neon ## _n  ## _xor_syndrome_real(int,	\
-				int, int, unsigned long, void**,	\
-				const u8 *);				\
 		scoped_ksimd()						\
-			raid6_neon ## _n ## _xor_syndrome_real(disks,	\
+			_pfx ## _n ## _xor_syndrome_real(disks,		\
 				start, stop, (unsigned long)bytes, ptrs,\
 				raid6_vgfmul[raid6_gfexp[start]]);	\
 	}								\
-	struct raid6_calls const raid6_neonx ## _n = {			\
-		.gen_syndrome	= raid6_neon ## _n ## _gen_syndrome,	\
-		.xor_syndrome	= raid6_neon ## _n ## _xor_syndrome,	\
-		.name		= "neonx" #_n,				\
+	struct raid6_calls const raid6_ ## _name = {			\
+		.gen_syndrome	= _pfx ## _n ## _gen_syndrome,		\
+		.xor_syndrome	= _pfx ## _n ## _xor_syndrome,		\
+		.name		= #_name,				\
 	}
 
-RAID6_NEON_WRAPPER(1);
-RAID6_NEON_WRAPPER(2);
-RAID6_NEON_WRAPPER(4);
-RAID6_NEON_WRAPPER(8);
+RAID6_NEON_WRAPPER(raid6_neon, 1, neonx1);
+RAID6_NEON_WRAPPER(raid6_neon, 2, neonx2);
+RAID6_NEON_WRAPPER(raid6_neon, 4, neonx4);
+RAID6_NEON_WRAPPER(raid6_neon, 8, neonx8);
+
+#ifdef CONFIG_ARM64
+/* versions using the EOR3 instruction from the SHA3 extension */
+RAID6_NEON_WRAPPER(raid6_eor3_, 1, eor3x1);
+RAID6_NEON_WRAPPER(raid6_eor3_, 2, eor3x2);
+RAID6_NEON_WRAPPER(raid6_eor3_, 4, eor3x4);
+RAID6_NEON_WRAPPER(raid6_eor3_, 8, eor3x8);
+#endif
diff --git a/lib/raid/raid6/arm/neon.h b/lib/raid/raid6/arm/neon.h
index a9977ec57f27..a8fc4ba06944 100644
--- a/lib/raid/raid6/arm/neon.h
+++ b/lib/raid/raid6/arm/neon.h
@@ -16,6 +16,22 @@ void raid6_neon8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
 void raid6_neon8_xor_syndrome_real(int disks, int start, int stop,
 				    unsigned long bytes, void **ptrs,
 				    const uint8_t *gmul);
+void raid6_eor3_1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
+void raid6_eor3_1_xor_syndrome_real(int disks, int start, int stop,
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
+void raid6_eor3_2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
+void raid6_eor3_2_xor_syndrome_real(int disks, int start, int stop,
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
+void raid6_eor3_4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
+void raid6_eor3_4_xor_syndrome_real(int disks, int start, int stop,
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
+void raid6_eor3_8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
+void raid6_eor3_8_xor_syndrome_real(int disks, int start, int stop,
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
 void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
 			      uint8_t *dq, const uint8_t *pbmul,
 			      const uint8_t *qmul);
diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
index 6f74e2b82fc4..e1084a8d3a18 100644
--- a/lib/raid/raid6/arm/neon.uc
+++ b/lib/raid/raid6/arm/neon.uc
@@ -33,6 +33,10 @@
  * Since this reduction is linear, the bits shifted out of all terms can be
  * XORed together first, and reduced using a single polynomial multiplication
  * by 0x1d, which is exact as long as no more than 4 bits are shifted out.
+ *
+ * When built with RAID6_NEON_EOR3 defined, this file is compiled with the
+ * arm64 SHA3 extension enabled, allowing the compiler to fold the additions
+ * into three-way XOR (EOR3) instructions.
  */
 
 #include <arm_neon.h>
@@ -43,7 +47,19 @@ typedef uint8x16_t unative_t;
 
 #define NSIZE	sizeof(unative_t)
 
+#ifdef RAID6_NEON_EOR3
+#define RAID6_NEON_FN(n, fn)	raid6_eor3_ ## n ## _ ## fn
+
+/*
+ * The compiler emits EOR3 for a ^ b ^ c by itself, but recent GCC versions
+ * reassociate the XORs into the loop carried P accumulator such that EOR3
+ * can no longer be used, so spell it out for that case.
+ */
+#define XOR3(a, b, c)		veor3q_u8(a, b, c)
+#else
 #define RAID6_NEON_FN(n, fn)	raid6_neon ## n ## _ ## fn
+#define XOR3(a, b, c)		((a) ^ (b) ^ (c))
+#endif
 
 /*
  * The SHLBYTE() operation shifts each byte left by 1, *not*
@@ -116,7 +132,7 @@ static inline void STEP2(unative_t *wp, unative_t *wq, const uint8_t *s1,
 	unative_t d1 = vld1q_u8(s1);
 	unative_t d0 = vld1q_u8(s0);
 
-	*wp ^= d1 ^ d0;
+	*wp = XOR3(*wp, d1, d0);
 	*wq = HORNER2(*wq, d1, d0, x1d);
 }
 
@@ -129,7 +145,7 @@ static inline void STEP4(unative_t *wp, unative_t *wq, const uint8_t *s3,
 	unative_t d1 = vld1q_u8(s1);
 	unative_t d0 = vld1q_u8(s0);
 
-	*wp ^= d3 ^ d2 ^ d1 ^ d0;
+	*wp = XOR3(XOR3(*wp, d3, d2), d1, d0);
 	*wq = HORNER4(*wq, d3, d2, d1, d0, x1d);
 }
 
diff --git a/lib/raid/raid6/arm64/pq_arch.h b/lib/raid/raid6/arm64/pq_arch.h
index 27ff564d7594..4e397aa36480 100644
--- a/lib/raid/raid6/arm64/pq_arch.h
+++ b/lib/raid/raid6/arm64/pq_arch.h
@@ -1 +1,33 @@
-#include "arm/pq_arch.h"
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <linux/cpufeature.h>
+#include <asm/neon.h>
+
+extern const struct raid6_calls raid6_neonx1;
+extern const struct raid6_calls raid6_neonx2;
+extern const struct raid6_calls raid6_neonx4;
+extern const struct raid6_calls raid6_neonx8;
+extern const struct raid6_calls raid6_eor3x1;
+extern const struct raid6_calls raid6_eor3x2;
+extern const struct raid6_calls raid6_eor3x4;
+extern const struct raid6_calls raid6_eor3x8;
+extern const struct raid6_recov_calls raid6_recov_neon;
+
+static __always_inline void __init arch_raid6_init(void)
+{
+	raid6_algo_add_default();
+	if (cpu_has_neon()) {
+		if (cpu_have_named_feature(SHA3)) {
+			raid6_algo_add(&raid6_eor3x1);
+			raid6_algo_add(&raid6_eor3x2);
+			raid6_algo_add(&raid6_eor3x4);
+			raid6_algo_add(&raid6_eor3x8);
+		} else {
+			raid6_algo_add(&raid6_neonx1);
+			raid6_algo_add(&raid6_neonx2);
+			raid6_algo_add(&raid6_neonx4);
+			raid6_algo_add(&raid6_neonx8);
+		}
+		raid6_recov_algo_add(&raid6_recov_neon);
+	}
+}
-- 
2.56.1.708.g77570a6a1d-goog



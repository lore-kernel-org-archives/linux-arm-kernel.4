Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B183606A698
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 22:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l4M4f9me;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KRMs1T5+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=; b=l4M4f9mezYZC/Q
	PIiEn3zDGKABS5xwiQEWAlA5IF1n7yy4ByF9zFWuTPVUB+pOnTXi97Juhc4AN/lUU9bebeYVJgxEK
	sWH+cKg7lJGv6YxZNeUtZ7LykqPBBqTEZ3QcezQlyFVRHYauZxMhZSIt+Qo0+mD1KIGktWwEUG8NW
	gaL9F2Tn3l8PlrfSBBPjV93D0nf1OO48nL3Ip/d3OMsFrFpKC0GyxhIMlwG7W4o44EoTWjPDYk3Uh
	OIvOoKYWBPoRUM2+wXLFMWaQI+fXpqvGYmI5uGUpsdtUq6fL5+DhCzs49IXUZZKxwEQb5ccHoGIwL
	snMWBv0xnljRTzeiEtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWhz-0000000GKUU-1Uc5;
	Fri, 20 Nov 2026 22:03:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWhq-0000000GKRr-0tH3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 22:03:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so10141175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212220; x=1795817020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=;
        b=KRMs1T5+gEA+Crv43O0x5lkN9XAw3dXYH+I9tnqpeOY8LagiVafmnxCSD9yaoKHt2A
         EvzjHVMCaIVUIc36rvCW0LwfwIb2Ebb3yTGRMJFDlwkJ2UqR0LKD8MTrJpoGCPuY3apQ
         R4pKASjgW2B6k1755QSIHrU2gmdYG0WbxDeWDpno2KkLAt1QEgsN9J4y78cUO+o5OF1S
         Whn6/YkONrcK5TU6ftrdu/YlkAIaw6DlcEPdIRSJDQPNCJVnhA5NVlU/yNFBlZYjmTO2
         6jo8WBU+fFbpyjagRBc3SmDceK2ByYhr1cE/pGPS1PIGegKkNVaW64NylGXMojbIfJKB
         Qk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212220; x=1795817020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=;
        b=JLAbXI9hINQ1MAJ9wMV6hrF410dHttqX2PhsS4h+eblefp7wbLDYleSc3kW5/KQd/M
         iiIZcE+pWo9G9eLfxMH82GthxrzhGXXFVruxyv6RogiJri7Kh0N9OPvOPEo9pVP7H6ax
         wM65rO6avkqK8azuXYTOQAjQwJwlB13L31eI2UCCGGt1cbqxFPuHKd8pMQQjB7tFc/JH
         MduN0b9z76bSc9NoIjM6KtpxFF4K9t0F7LNulM8BpJu7Z9IoTaU6mhm2oOeJNwaYoFC8
         x8eBVCh5HAE1T7OQQXQ8Z85tuIDc34hFZfVZz4Lp+jLWGZBDWuwUABQRtJppUTDeOlxA
         q4yw==
X-Forwarded-Encrypted: i=1; AL+hErFqzq+f3cMMpVBS6KxIF5YMMCcXk4VMcd6e0ogQJm4ywwCA0+R72wIDw0x9iTfGRwR5Oa5GTwU0clv0Jgw+bXsr@lists.infradead.org
X-Gm-Message-State: APuU4Z/tfL7y71AVj3zATWHK37imp0O6niVTeowsxq0kyLQw+3AqT2+I
	FuWseYKjh/j0dV3dBbrnn8bEcpfIZmCCtjzlsuAtjP6T2A53kmISQBws
X-Gm-Gg: AYBFou2ZUphJsN/Xx8qP3qfyvlg6arqVIiGTgBPuitqdzKTzvPRUHR2zUdKzMR6vft0
	PtztmaxMPlABDKbp7Y5zUr72LBrbvq+WOxR6rB1hPR/MfPyZDequ6Gsukrtmx8rv8yy7syG8Y62
	iJaVs0D7wh+VCcssBY3/Vmdk11lod88o1Zk8/6hbWhGNB3dEY3NRhdVuPztg0XOxptqK2X8yaJN
	PZYs6J5k1T9O4FPoB5sq3mj5bJTxUGqdq/on1shHO2ADRJ2nEZ3LKANvYeqIF+M4iFj+NVsxY4U
	MN/N5MqUrmCiG+NaaP2EKbSKzHVlajc03+OG4+5z35m6vak58DFdEiggVKVy/SbLGxLwAYSUPIX
	/YVIWEhR98hC9LMjmMaBdl3NPqE+MsksSAXf/Zu5VjpqS3L7EsGFm5VFcTHrtFSFl6rrgWkSSUu
	Fz8NOszxFPfFUP1LhUybrB+Db6MrhxckQWz36aqJHVjERZ2NRqePYM1Xb5dAeDTmhKrxtzwQbw9
	Ruvo7AUtrNadcX0h97XnN8MhuEWVoPJnFWrFRA72mTnjg7cVs6aKVtUYw/RawYsVS0k0RDkxJQg
	L4yT/GIxHwWdZkMGBCxqPnP8kkGZz3TVEwXAPzAKGtpogU+GJQElz5MyZgtjTGHUew5nqiYRgXW
	DwSpoX2Mi
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr105794155e9.29.1795212220053;
        Fri, 20 Nov 2026 14:03:40 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:38 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:23 +0100
Message-ID: <20261120220330.1067165-2-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120220330.1067165-1-demyansh@gmail.com>
References: <20261120220330.1067165-1-demyansh@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_140342_319688_29183591 
X-CRM114-Status: GOOD (  17.02  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

arm64 falls back to the generic csum_partial_copy_nocheck(), which does
two passes (memcpy() + csum_partial()) and hits software GSO paths
(e.g. TCP over WireGuard) and UDP/ICMP replies.

Implement a single-pass csum_partial_copy_nocheck() in
arch/arm64/lib/csum.c using a 64-byte carry-tree primitive unrolled 4x
to 256 bytes (~21 instructions per 64B, pure leaf function with zero
spills on GCC 15 and Clang 21) and 16-byte @src alignment for
len >= 272. Each summed word is read once into GPRs before storing and
summing, so the checksum always matches @dst under concurrent @src
modification.

In-kernel KUnit benchmark on ARM Neoverse-V2 (3.0 GHz,
CONFIG_CHECKSUM_KUNIT_BENCHMARK=y, GCC 15.2 / Clang 21.1, median of 3):

  case (src/dst)    memcpy+csum_partial  fused (GCC / Clang)    speedup
  ----------------  -------------------  -------------------  -----------
  16B    (+0 / +0)     4.0 /  3.7 GB/s      6.9 /  5.9 GB/s   1.73x/1.61x
  64B    (+0 / +0)     9.4 / 10.5 GB/s     19.1 / 22.0 GB/s   2.04x/2.08x
  256B   (+0 / +0)    16.3 / 18.4 GB/s     33.2 / 35.2 GB/s   2.04x/1.92x
  512B   (+0 / +0)    19.4 / 21.0 GB/s     36.5 / 39.3 GB/s   1.88x/1.87x
  1368B  (+0 / +0)    21.7 / 22.2 GB/s     39.5 / 41.2 GB/s   1.82x/1.85x
  1448B  (+0 / +0)    21.8 / 22.2 GB/s     39.2 / 41.1 GB/s   1.79x/1.86x
  4096B  (+0 / +0)    23.4 / 23.5 GB/s     42.5 / 43.9 GB/s   1.82x/1.87x
  16384B (+0 / +0)    23.8 / 24.0 GB/s     43.3 / 45.1 GB/s   1.82x/1.87x
  16B    (+1 / +3)     1.5 /  2.6 GB/s      6.9 /  5.9 GB/s   4.44x/2.25x
  128B   (+1 / +3)     6.4 / 10.5 GB/s     24.3 / 27.2 GB/s   3.78x/2.60x
  1448B  (+1 / +3)    17.8 / 18.0 GB/s     38.0 / 39.0 GB/s   2.14x/2.16x
  1500B  (+1 / +3)    17.9 / 18.2 GB/s     36.5 / 39.6 GB/s   2.04x/2.18x
  4096B  (+1 / +3)    19.1 / 19.5 GB/s     40.6 / 42.0 GB/s   2.12x/2.15x
  16384B (+1 / +3)    19.4 / 19.6 GB/s     42.3 / 43.8 GB/s   2.18x/2.24x

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Demian Shulhan <demyansh@gmail.com>
---
 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 ++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)

diff --git a/arch/arm64/include/asm/checksum.h b/arch/arm64/include/asm/checksum.h
index dc52b733675d..9f766db01152 100644
--- a/arch/arm64/include/asm/checksum.h
+++ b/arch/arm64/include/asm/checksum.h
@@ -44,6 +44,9 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 extern unsigned int do_csum(const unsigned char *buff, int len);
 #define do_csum do_csum
 
+#define _HAVE_ARCH_CSUM_AND_COPY
+__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len);
+
 #include <asm-generic/checksum.h>
 
 #endif	/* __ASM_CHECKSUM_H */
diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
index 75db718e5b6a..2bf2d63cfd42 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2019-2020 Arm Ltd.
 
+#include <linux/bitops.h>
 #include <linux/compiler.h>
+#include <linux/export.h>
 #include <linux/kasan-checks.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 
 #include <net/checksum.h>
 
@@ -116,6 +119,192 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	return sum >> 16;
 }
 
+static __always_inline __uint128_t get_unaligned128(const u8 *p)
+{
+	u64 lo = get_unaligned((const u64 *)p);
+	u64 hi = get_unaligned((const u64 *)(p + 8));
+
+	return ((__uint128_t)hi << 64) | lo;
+}
+
+static __always_inline void put_unaligned128(__uint128_t val, u8 *p)
+{
+	put_unaligned((u64)val, (u64 *)p);
+	put_unaligned((u64)(val >> 64), (u64 *)(p + 8));
+}
+
+static __always_inline __wsum csum_fold_acc_cy(__uint128_t acc, u64 cy)
+{
+	__uint128_t t;
+	u64 s;
+
+	acc += (acc >> 64) | (acc << 64);
+	t = (__uint128_t)(u64)(acc >> 64) + cy;
+	s = (u64)t + (u64)(t >> 64);
+	s += (s >> 32) | (s << 32);
+	return (__force __wsum)(u32)(s >> 32);
+}
+
+static __always_inline void csum_tree64_ovf(const u8 *s, u8 *d,
+					    __uint128_t *acc, s64 *cy)
+{
+	__uint128_t v0 = get_unaligned128(s);
+	__uint128_t v1 = get_unaligned128(s + 16);
+	__uint128_t v2, v3;
+	s64 o;
+
+	put_unaligned128(v0, d);
+	put_unaligned128(v1, d + 16);
+	o = __builtin_add_overflow(v0, v1, &v0);
+
+	v2 = get_unaligned128(s + 32);
+	v3 = get_unaligned128(s + 48);
+	put_unaligned128(v2, d + 32);
+	put_unaligned128(v3, d + 48);
+	o += __builtin_add_overflow(v2, v3, &v2);
+
+	o += __builtin_add_overflow(v0, v2, &v0);
+	*cy += o + __builtin_add_overflow(*acc, v0, acc);
+}
+
+static __always_inline void csum_align_src16(const u8 **ps, u8 **pd,
+					     unsigned int *pulen,
+					     __uint128_t *pacc, s64 *pc0)
+{
+	uintptr_t off = (uintptr_t)(*ps) & 15;
+
+	if (unlikely(off) && *pulen >= 272U) {
+		unsigned int adv = 16U - (unsigned int)off;
+		u64 lo = get_unaligned((const u64 *)(*ps));
+		u64 hi = get_unaligned((const u64 *)(*ps + 8));
+		u64 odd = (u64)off & 1ULL;
+		u64 m = ~0ULL >> ((off & 7) * 8);
+		u64 h;
+
+		put_unaligned(lo, (u64 *)(*pd));
+		put_unaligned(hi, (u64 *)(*pd + 8));
+		lo = (off & 8) ? (lo & m) : lo;
+		hi = (off & 8) ? 0ULL : (hi & m);
+		h = lo + hi;
+		h += h < lo;
+		*pacc = ror64(h, (unsigned int)(odd * 56ULL));
+		/*
+		 * At len <= INT_MAX, the 256B loop adds <= 16 carries per
+		 * iteration (< 2^27 total before bit 62 is cleared, and c0
+		 * stays < 2^33 overall), so bit 62 of @c0 cannot overflow.
+		 */
+		*pc0 = (s64)(odd << 62);
+		*ps += adv;
+		*pd += adv;
+		*pulen -= adv;
+	}
+}
+
+static __always_inline __wsum csum_fold_final(__uint128_t acc, u64 cy, u64 odd)
+{
+	__wsum res = csum_fold_acc_cy(acc, cy);
+
+	if (unlikely(odd))
+		return (__force __wsum)ror32((__force u32)res, 8);
+	return res;
+}
+
+/*
+ * Single-pass copy and ones' complement sum. Each summed word is read once
+ * into a GPR before storing and summing, so the returned sum always matches
+ * @dst even if @src is concurrently modified.
+ */
+__wsum __no_sanitize_address csum_partial_copy_nocheck(const void *src, void *dst, int len)
+{
+	const u8 *s = src;
+	u8 *d = dst;
+	__uint128_t acc = 0;
+	s64 c0 = 0;
+	u64 odd = 0;
+	unsigned int ulen = (unsigned int)len;
+
+	if (unlikely(len <= 0))
+		return 0;
+
+	kasan_check_read(src, len);
+	kasan_check_write(dst, len);
+
+	if (ulen >= 64U) {
+		if (ulen >= 256U) {
+			csum_align_src16(&s, &d, &ulen, &acc, &c0);
+			ulen -= 256U;
+			do {
+				csum_tree64_ovf(s, d, &acc, &c0);
+				csum_tree64_ovf(s + 64, d + 64, &acc, &c0);
+				csum_tree64_ovf(s + 128, d + 128, &acc, &c0);
+				csum_tree64_ovf(s + 192, d + 192, &acc, &c0);
+				s += 256;
+				d += 256;
+			} while (!__builtin_sub_overflow(ulen, 256U, &ulen));
+			odd = (u64)c0 >> 62;
+			c0 &= (1LL << 62) - 1;
+			ulen &= 255U;
+			if (!ulen)
+				goto fold;
+		}
+		if (ulen >= 64U) {
+			ulen -= 64U;
+			do {
+				csum_tree64_ovf(s, d, &acc, &c0);
+				s += 64;
+				d += 64;
+			} while (!__builtin_sub_overflow(ulen, 64U, &ulen));
+			ulen &= 63U;
+			if (!ulen)
+				goto fold;
+		}
+	}
+	if (likely(ulen >= 16U)) {
+		ulen -= 16U;
+		do {
+			__uint128_t v = get_unaligned128(s);
+
+			put_unaligned128(v, d);
+			s += 16;
+			d += 16;
+			c0 += __builtin_add_overflow(acc, v, &acc);
+		} while (!__builtin_sub_overflow(ulen, 16U, &ulen));
+	}
+	if (likely(ulen & 8U)) {
+		u64 v = get_unaligned((const u64 *)s);
+
+		put_unaligned(v, (u64 *)d);
+		s += 8;
+		d += 8;
+		c0 += __builtin_add_overflow(acc, v, &acc);
+	}
+	if (likely(ulen & 4U)) {
+		u32 v = get_unaligned((const u32 *)s);
+
+		put_unaligned(v, (u32 *)d);
+		s += 4;
+		d += 4;
+		c0 += v;
+	}
+	if (likely(ulen & 2U)) {
+		u16 v = get_unaligned((const u16 *)s);
+
+		put_unaligned(v, (u16 *)d);
+		s += 2;
+		d += 2;
+		c0 += v;
+	}
+	if (ulen & 1U) {
+		u8 v = *s;
+
+		*d = v;
+		c0 += v;
+	}
+fold:
+	return csum_fold_final(acc, (u64)c0, odd);
+}
+EXPORT_SYMBOL(csum_partial_copy_nocheck);
+
 __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			const struct in6_addr *daddr,
 			__u32 len, __u8 proto, __wsum csum)
-- 
2.53.0



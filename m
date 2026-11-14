Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85869606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZnPjjKmV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3a0FDZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Aug5HYuUexp65lrDsNz0aPnl/1iCDZSOI0eqGOeKB/Q=; b=ZnPjjKmV+py29N
	ciACpT/dQXotSEEBZv2KCwWbNDh1B31Hiwy5Sb3LTgj/x6I9MeRw7c9yZ+9j/rtU20FY3UoydKdvW
	bqFT6rovwSjjtCZDc7zmGmWj2cQJsCVNUTf6EeI55cPeHNXigXIPNhNhg1qVKgllR/i55FX2yFazf
	cgY+FQMskcGIiPrSZMTlRUi27LROWOWYO5RDoN3pkroKEeP4mTYYefTVprk+gj/LDMPDJrekCOMzv
	Tj+JXNe6EEtkeS4C9UnD3mtgiw3pV/UImD2xUM9P1CPmaWAgIklZdfbIuQmxdIMGCOaERYSCMrIRC
	omnIO++Yh/iMHquKh5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS55Q-0000000FLs9-1n2f;
	Sat, 14 Nov 2026 04:09:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS55N-0000000FLr4-2lAn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:09:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4918c2d727fso816374f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629392; x=1795234192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aug5HYuUexp65lrDsNz0aPnl/1iCDZSOI0eqGOeKB/Q=;
        b=v3a0FDZTqyIB+QjnUi8n3CX4SPZ5AECszJjYLXA7Ku6+uvTEQDEqNKqcLrByt+uyIm
         ppTCXoSlHYM7dhDExiW2wof9XgmWQrUPIrHCkghhhd5mZWahPzFUguLk7PC8Pfm5+Ep0
         24XrSDrG6OKqEX8hMD9efnUApB9STJPJjHrZ5UX0F6QqZ4YqpW3EI2len0GcKVLk9nmo
         bNJ6rFde8oxOT05HkxupJCx7SPyzHZZv85f6OkK/WimCptK0Rp42HFOAUqqXV+3U76e0
         lZg1LUiJi1QSgecCunVVhvWU4Wu69+OemERodDAR6bwTIx+GF+zPL3MnSzXo/u0YcNOd
         KLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629392; x=1795234192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aug5HYuUexp65lrDsNz0aPnl/1iCDZSOI0eqGOeKB/Q=;
        b=RAjj93smCHAx74qTHnOHSrPPjx0GUZP4gFMYn4+YQUveJOKXT3pqCHttYxqp+XKQYy
         1VB+Mu3J07FlInLzrtVAmby02ulnK2xyxKcdypDtzB+QNgUsEbcKcm4zGUYKsoN3Drtd
         vCr5Ug2YF41R6KSMjmyIER8THN98/2ks/hAExnmMyyBb9GB2RwdVEbwqy4Wvyi5Lxxjr
         075xko/aGKpdzUnHRkB9FgtveR4Bp3eGxAcdgWZOfYsGTA/WGffOkeQ4Q7Y2UfN84E4Q
         ci4nI89FrG9mB9Cec6X9ZDmND+HQhzhOMbRjJ0KnbPeQGWCPlFDRqnjDjCQ/hyFrzSp2
         6Deg==
X-Forwarded-Encrypted: i=1; AL+hErHWZ5gZAw6MzMAD+90osUabOrn2/1vjQ0kSxlz1J+ucnEljmyECuDaGoN8gtmMLH3Oz76YX+Sq63PMKlkUtjmHj@lists.infradead.org
X-Gm-Message-State: APuU4Z+cOTmId+hjkph/pZFvKF0tsSl7oJb8bFB3VvWYIcOUpug/Tx/i
	XG4evbMJ3CjCXR7TOza15OWO64MuPu4J4mZdrFWelMeVRfWMqBTiogFH
X-Gm-Gg: AYBFou1YnSp6SF9Ra+0107I0Duk5zxrmmUk0XJ9QPIIFZI5RFwq2vxYE0CAjCOKr5fw
	dRpIJ6HMpRYTRjA+HuibZoOQTIsMqAUWvRoWcZTDgp26gdzelAC2VBppQtZBEvlzdaOkk2vdEYP
	7qr4U08XEfCfvuYnDha3bsQJ/2rWG+sYCnqhtnYZ3Lh4oXkya4Rsz2YxOZ3vaRuCnvkD5Y4SrVc
	5mkTAn/48ggoapJFGJ8XPp6XJrz65zYvIyVjhCa/gEtOp02M8NAMohym2D2loByYsT9bTNnklFf
	mZPOprnmI8CPiPbrB6d+jaUpEYWn01JkQfAlIE23X4X0aoB1wmIebij+wj5LPpEasgMh1X4YHHn
	JfA1owHApSKq1QeV/brGccj8gwGHRyL4yRtX+RREQistS0ArC1LSX/+bDYMbqUytx6Bgbz5KHrl
	yc5f2YJEs5fusvdtqtVfC7aItk/O8xqgcuLKO01NXBD5Pbyp6qFhh8mYuQ/C86fbZF2miz9fmYF
	UTUqXjcRcn2WdessRpyYGX6hemBC3gWmZcMuEIdcoC2pPxly2Xr2ktEIg+FRUF+yYAh3GIORNZP
	UywMxgxZleMlx7m95HSpjtQruAecvd4JtcaOnoSOyxt8SudOOP/R5uTkmb5oZ0cdIwyAg6G6gRk
	Q7/ohbu9C
X-Received: by 2002:a05:6000:2411:b0:493:59c9:ebcf with SMTP id ffacd0b85a97d-49c7335112dmr9072910f8f.57.1794629391616;
        Fri, 13 Nov 2026 20:09:51 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm8488670f8f.46.2026.11.13.20.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:09:51 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saeed Bishara <saeed.bishara.os@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet checksum
Date: Sat, 14 Nov 2026 03:57:00 +0000
Message-ID: <20261114040943.219870-2-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114040943.219870-1-demyansh@gmail.com>
References: <20261114040943.219870-1-demyansh@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_200953_750687_C7CC053B 
X-CRM114-Status: GOOD (  16.35  )
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

arm64 currently falls back to the generic csum_partial_copy_nocheck() in
lib/checksum.c, which performs memcpy() followed by a second pass in
csum_partial(). This double pass is hit on software GSO paths
(skb_segment() without SG or TX checksum offload, e.g. TCP over
WireGuard) and UDP/ICMP replies.

Implement a single-pass csum_partial_copy_nocheck() in
arch/arm64/lib/csum.c using four independent __uint128_t accumulators
over a 32-byte stride, followed by 16/8/4/2/1-byte tail handling. Each
word is read once into a GPR before storing and summing, emitting paired
ldp/stp and adds/cinc carry propagation with no stack frame.

Throughput on ARM Neoverse-V2 (Google Axion, 3.0 GHz, GCC 15.2 -O2,
warm L1 cache):

   len   memcpy + do_csum   csum_partial_copy_nocheck   speedup
  ----   ----------------   -------------------------   -------
    64         10245 MB/s                  15902 MB/s    +55.2%
   256         18851 MB/s                  26026 MB/s    +38.1%
   512         22465 MB/s                  28421 MB/s    +26.5%
  1024         24330 MB/s                  29900 MB/s    +22.9%
  1368         24192 MB/s                  30221 MB/s    +24.9%
  1448         24188 MB/s                  30279 MB/s    +25.2%
  1500         24165 MB/s                  30096 MB/s    +24.5%
  4096         25299 MB/s                  29946 MB/s    +18.4%

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Demian Shulhan <demyansh@gmail.com>
---
 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 100 ++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

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
index 75db718e5b6a..a9617cde28c1 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -2,8 +2,10 @@
 // Copyright (C) 2019-2020 Arm Ltd.
 
 #include <linux/compiler.h>
+#include <linux/export.h>
 #include <linux/kasan-checks.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 
 #include <net/checksum.h>
 
@@ -116,6 +118,104 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	return sum >> 16;
 }
 
+static __always_inline __wsum csum_fold128(__uint128_t sum)
+{
+	u64 s;
+
+	sum += (sum >> 64) | (sum << 64);
+	s = sum >> 64;
+	s += (s >> 32) | (s << 32);
+	return (__force __wsum)(u32)(s >> 32);
+}
+
+/*
+ * Single-pass copy and ones' complement sum. Each word is read once into a
+ * GPR before storing and summing, so the returned sum always matches @dst
+ * even if @src is concurrently modified.
+ */
+__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len)
+{
+	const u8 *s = src;
+	u8 *d = dst;
+	__uint128_t sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
+	unsigned int n;
+
+	if (unlikely(len <= 0))
+		return 0;
+
+	n = (unsigned int)len >> 5;
+	if (n) {
+		do {
+			u64 v0, v1;
+
+			v0 = get_unaligned((const u64 *)s);
+			v1 = get_unaligned((const u64 *)(s + 8));
+			put_unaligned(v0, (u64 *)d);
+			put_unaligned(v1, (u64 *)(d + 8));
+			sum0 += v0;
+			sum1 += v1;
+
+			v0 = get_unaligned((const u64 *)(s + 16));
+			v1 = get_unaligned((const u64 *)(s + 24));
+			put_unaligned(v0, (u64 *)(d + 16));
+			put_unaligned(v1, (u64 *)(d + 24));
+			sum2 += v0;
+			sum3 += v1;
+
+			s += 32;
+			d += 32;
+		} while (--n);
+
+		sum0 += sum2;
+		sum1 += sum3;
+	}
+
+	if (len & 16) {
+		u64 v0 = get_unaligned((const u64 *)s);
+		u64 v1 = get_unaligned((const u64 *)(s + 8));
+
+		put_unaligned(v0, (u64 *)d);
+		put_unaligned(v1, (u64 *)(d + 8));
+		sum0 += v0;
+		sum1 += v1;
+		s += 16;
+		d += 16;
+	}
+	if (len & 8) {
+		u64 v = get_unaligned((const u64 *)s);
+
+		put_unaligned(v, (u64 *)d);
+		sum0 += v;
+		s += 8;
+		d += 8;
+	}
+	if (len & 4) {
+		u32 v = get_unaligned((const u32 *)s);
+
+		put_unaligned(v, (u32 *)d);
+		sum1 += v;
+		s += 4;
+		d += 4;
+	}
+	if (len & 2) {
+		u16 v = get_unaligned((const u16 *)s);
+
+		put_unaligned(v, (u16 *)d);
+		sum0 += v;
+		s += 2;
+		d += 2;
+	}
+	if (len & 1) {
+		u8 v = *s;
+
+		*d = v;
+		sum1 += v;
+	}
+
+	return csum_fold128(sum0 + sum1);
+}
+EXPORT_SYMBOL(csum_partial_copy_nocheck);
+
 __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			const struct in6_addr *daddr,
 			__u32 len, __u8 proto, __wsum csum)
-- 
2.53.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WpI6daQY;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c4xRxcJ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xf5yntll6OvEACYDQPF6iyUd4+4yx2qz7cf2F/G84v0=; b=WpI6daQYTOAdW840YgXj7Bw1rl
	IiprbhnkoFDG+4Ayzy6ABOZbhvf1SLFTB2qwtEcS6pw/8DThHLBaH3XjE4GXgooyQHQXR5a65a7qr
	lwEbKVsK+3WdVxs8gyATYwB7CUTJK4EGPv98U6agDL4VuV+BYPjY1++orVZ5uArHHeRw/fhwNMi0m
	DhNSpoetCn0WBuJkA85WUcLKo2ZwvfeSGcVkEueh1Kl4GF+MFqVYtaJPVNtOGkDnyzQHZAiBPVUnX
	dxCbWGphN1ZEiF8xsC4Z5s4sEvDKCFfjNp0s5dSBAxw70on5Xrwi7UPDGPvIXUM5TjugPfUf6vdxr
	fXfn9qPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTk-00000009yvI-1EKN;
	Wed, 18 Nov 2026 18:33:56 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTc-00000009yqm-44dY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:33:51 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-49d70f45b22so849806f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026824; x=1795631624; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf5yntll6OvEACYDQPF6iyUd4+4yx2qz7cf2F/G84v0=;
        b=c4xRxcJ1tssU7qr4+EQtmVXahqXAwtPK+HoSflLRKdMD5Dko4IZZyZ4qJ0dacjioCi
         7pqemqN0+3vWreq6uGMQoPOpm4YSdFFVIZ+ObNhAXR5DAf5WbKZ2tZ2/RlKHO572lv4d
         aGp5hWPCtGLw2wId86O+63tAzXPGOwLhJu9xTq8W6CxayAPBOVV4M4JML98saZAH0ki2
         5Gjfb2OsflwUPQaJ19KxpPceKpQyAlDxiY33osRgHXyFxQKaSAst/LJAD2GQjFjNGrN6
         uEdVsi9U2jSYqp0c5r8OC7BTXG5AFL3U+Ycswj9v2M3gHNKcTUtfvpTxe6M6ebDqigsD
         52qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026824; x=1795631624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf5yntll6OvEACYDQPF6iyUd4+4yx2qz7cf2F/G84v0=;
        b=rIgWmyjZbla0bC+3t1wgum+t0APY+zL/eErEW7a0/T9Y0lSoENOieErhYt70BGxVHV
         Cvib4ujK1V9o0D8l8wcqKOEZfiUw+otBYwijRY3wM1UpvZYA+kyfPcKtzyBfM5u4gGOZ
         XhRJaZ+YIJ4n1LjSCfnz/1HnODok9jZbOFgRu5QTyoSfvFxzO8KJWf6GKL9NIbej17eR
         SfFG9KlCpB/JOQdVhjP4vD23r0aM30769Q+ghiJwaZhCxGIvQEQ08GwAxsAdv9nTE0pK
         sAT4Y2tU1Vrl+zEChwLfuFB2AgWC9MiXi8+9Sv4Ku/HrzwTeqOuLvq0c7XtfvYUTC1IC
         +ARA==
X-Gm-Message-State: APuU4Z8OTZZgrEjClWpoZOSkw1iu1dIXzUFahOpmQ986EDROUKQRkD1E
	wdiZeORZxG88XzGYzDfXIUv7GpH2lfOK32fmXryxk8EZscYlLa3M/rRzNP6065K1PK2OO9/8M+q
	RaWpuQhh42wIUT58ovtqsKNSqe9dkSUQGxRaqLZL6KAP5bJqkgV0gxexoXKbo8xqI4x36PmXjfP
	x7dUTwmvIDm945buIW5Pl3ASP7dZdlD5VlQf+k2fTWypQF
X-Received: from wrrf12.prod.google.com ([2002:adf:f98c:0:b0:4a3:f307:7cdd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4b0c:b0:48c:4442:54e
 with SMTP id ffacd0b85a97d-4a63b50e9a2mr7189678f8f.30.1795026823574; Wed, 18
 Nov 2026 10:33:43 -0800 (PST)
Date: Wed, 18 Nov 2026 19:33:37 +0100
In-Reply-To: <20261118183335.1944213-4-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118183335.1944213-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=14784; i=ardb@kernel.org;
 h=from:subject; bh=qSF8zwGWCmp12GLXXIDTAzypjGxftvkUaZ0ss4YPgRs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevv+0a1hrPt59vPtj60X90t1jBpUt57lr23v0vr2JVE6
 WrOPM3VUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZidp3hf6BgVs2xd0dO8RUX
 /Xb+M13V/Oa9fQnG3x085f2nl/tWRzAyTH67ZY2+dfmaKwv8pN+2pUnZPrcxKX9u8/Nlta3btQP b+QA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118183335.1944213-5-ardb+git@google.com>
Subject: [PATCH 1/2] raid6: neon: process four data disks per Horner step
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Demian Shulhan <demyansh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103349_474207_4E343C25 
X-CRM114-Status: GOOD (  25.09  )
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

The NEON code evaluates the Q syndrome using Horner's rule, multiplying by
x = {02} once for each data disk. This takes six instructions per data
disk and vector: four for the multiplication by x, and two XORs to add the
data to P and Q. It also creates a dependency chain through Q that is four
instructions long for each data disk.

Instead, process four data disks at a time, i.e.,

  Q' = x^4.Q + x^3.D[z+3] + x^2.D[z+2] + x.D[z+1] + D[z]

Multiplying by x^n amounts to shifting each byte left by n bits, and
reducing the n bits that are shifted out modulo the RAID-6 polynomial.
Since this reduction is linear, the bits shifted out of all four terms can
be XORed together first, and reduced using a single polynomial
multiplication (PMUL) by 0x1d, which is exact as long as no more than 4
bits are shifted out. This reduces the instruction count to 5.25 per data
disk and vector, and the length of the dependency chain through Q to that
of a single step per four data disks.

In xor_syndrome(), replace the loop that scales Q by x^4 at a time for the
unmodified disks on the 'left side' with a single multiplication by
g^start, using the nibble based table lookups that the recovery code uses
already. This is much faster when only a few high numbered disks are
modified, which is the common case for partial stripe writes.

Put the code that performs the Horner steps for each lane in a helper
function, so that unroll.awk keeps the instructions for each lane
together. This prevents the 8-way unrolled version from running out of
registers.

While at it, use the ^ and & operators rather than the veorq_u8() and
vandq_u8() intrinsics, which makes the code easier to read, and allows
the compiler to use EOR3 instructions by itself, as long as the SHA3
extension is enabled (see the next patch).

Results on an Apple M2 running Linux, best of the 1x/2x/4x/8x versions,
in MB/s, using a userspace build of the same code (4 KiB per disk):

  gen_syndrome()      2 data    4 data    8 data   16 data   32 data
  Avalanche (P) old    55203     42463     37529     35354     34744
                new    54099     46028     41733     40484     39569
  Blizzard (E)  old    19790     15393     14050     13333     12887
                new    21670     16197     15524     13915     12475

  xor_syndrome(), 16 data disks, stop = 15, in GB/s by value of start:
                           0         4         8        12        15
  Avalanche (P) old       34        33        30        24        11
                new       39        37        36        33        25
  Blizzard (E)  old       12        12        11         9         4
                new       13        14        13        12         9

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/raid6/arm/neon.c             |   6 +-
 lib/raid/raid6/arm/neon.h             |  12 +-
 lib/raid/raid6/arm/neon.uc            | 180 ++++++++++++++------
 lib/raid/raid6/arm/neon_compat.h      |  22 +++
 lib/raid/raid6/arm/recov_neon_inner.c |  19 +--
 5 files changed, 161 insertions(+), 78 deletions(-)

diff --git a/lib/raid/raid6/arm/neon.c b/lib/raid/raid6/arm/neon.c
index af90869aaffc..2f8e98f5556e 100644
--- a/lib/raid/raid6/arm/neon.c
+++ b/lib/raid/raid6/arm/neon.c
@@ -34,10 +34,12 @@
 					size_t bytes, void **ptrs)	\
 	{								\
 		void raid6_neon ## _n  ## _xor_syndrome_real(int,	\
-				int, int, unsigned long, void**);	\
+				int, int, unsigned long, void**,	\
+				const u8 *);				\
 		scoped_ksimd()						\
 			raid6_neon ## _n ## _xor_syndrome_real(disks,	\
-				start, stop, (unsigned long)bytes, ptrs);\
+				start, stop, (unsigned long)bytes, ptrs,\
+				raid6_vgfmul[raid6_gfexp[start]]);	\
 	}								\
 	struct raid6_calls const raid6_neonx ## _n = {			\
 		.gen_syndrome	= raid6_neon ## _n ## _gen_syndrome,	\
diff --git a/lib/raid/raid6/arm/neon.h b/lib/raid/raid6/arm/neon.h
index 2ca41ee9b499..a9977ec57f27 100644
--- a/lib/raid/raid6/arm/neon.h
+++ b/lib/raid/raid6/arm/neon.h
@@ -2,16 +2,20 @@
 
 void raid6_neon1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
 void raid6_neon1_xor_syndrome_real(int disks, int start, int stop,
-				    unsigned long bytes, void **ptrs);
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
 void raid6_neon2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
 void raid6_neon2_xor_syndrome_real(int disks, int start, int stop,
-				    unsigned long bytes, void **ptrs);
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
 void raid6_neon4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
 void raid6_neon4_xor_syndrome_real(int disks, int start, int stop,
-				    unsigned long bytes, void **ptrs);
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
 void raid6_neon8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs);
 void raid6_neon8_xor_syndrome_real(int disks, int start, int stop,
-				    unsigned long bytes, void **ptrs);
+				    unsigned long bytes, void **ptrs,
+				    const uint8_t *gmul);
 void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
 			      uint8_t *dq, const uint8_t *pbmul,
 			      const uint8_t *qmul);
diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
index 14a9fc2c60fa..6f74e2b82fc4 100644
--- a/lib/raid/raid6/arm/neon.uc
+++ b/lib/raid/raid6/arm/neon.uc
@@ -22,15 +22,29 @@
  * $#-way unrolled NEON intrinsics math RAID-6 instruction set
  *
  * This file is postprocessed using unroll.awk
+ *
+ * The Q syndrome is evaluated using Horner's rule, but four data disks at a
+ * time, i.e.,
+ *
+ *   Q' = x^4 * Q + x^3 * D[z+3] + x^2 * D[z+2] + x * D[z+1] + D[z]
+ *
+ * Multiplying by x^n amounts to shifting each byte left by n bits, and
+ * reducing the n bits that are shifted out modulo the RAID-6 polynomial.
+ * Since this reduction is linear, the bits shifted out of all terms can be
+ * XORed together first, and reduced using a single polynomial multiplication
+ * by 0x1d, which is exact as long as no more than 4 bits are shifted out.
  */
 
 #include <arm_neon.h>
 #include "arm/neon.h"
+#include "arm/neon_compat.h"
 
 typedef uint8x16_t unative_t;
 
 #define NSIZE	sizeof(unative_t)
 
+#define RAID6_NEON_FN(n, fn)	raid6_neon ## n ## _ ## fn
+
 /*
  * The SHLBYTE() operation shifts each byte left by 1, *not*
  * rolling over into the next byte
@@ -54,13 +68,85 @@ static inline unative_t PMUL(unative_t v, unative_t u)
 	return (unative_t)vmulq_p8((poly8x16_t)v, (poly8x16_t)u);
 }
 
-void raid6_neon$#_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
+/* Q * x + D */
+static inline unative_t HORNER1(unative_t q, unative_t d, unative_t x1d)
+{
+	return SHLBYTE(q) ^ (MASK(q) & x1d) ^ d;
+}
+
+/* Q * x^2 + D1 * x + D0 */
+static inline unative_t HORNER2(unative_t q, unative_t d1, unative_t d0,
+				unative_t x1d)
+{
+	unative_t lo = vshlq_n_u8(q, 2) ^ vshlq_n_u8(d1, 1) ^ d0;
+	unative_t hi = vshrq_n_u8(q, 6) ^ vshrq_n_u8(d1, 7);
+
+	return lo ^ PMUL(hi, x1d);
+}
+
+/* Q * x^4 + D3 * x^3 + D2 * x^2 + D1 * x + D0 */
+static inline unative_t HORNER4(unative_t q, unative_t d3, unative_t d2,
+				unative_t d1, unative_t d0, unative_t x1d)
+{
+	unative_t lo = vshlq_n_u8(q, 4) ^ vshlq_n_u8(d3, 3) ^
+		       vshlq_n_u8(d2, 2) ^ vshlq_n_u8(d1, 1) ^ d0;
+	unative_t hi = vshrq_n_u8(q, 4) ^ vshrq_n_u8(d3, 5) ^
+		       vshrq_n_u8(d2, 6) ^ vshrq_n_u8(d1, 7);
+
+	return lo ^ PMUL(hi, x1d);
+}
+
+/*
+ * Perform a Horner step for a single lane.  Each step is a single statement
+ * so that unroll.awk keeps the code for each lane together, which avoids
+ * running out of registers with the wider unrolls.
+ */
+static inline void STEP1(unative_t *wp, unative_t *wq, const uint8_t *s,
+			 unative_t x1d)
+{
+	unative_t d = vld1q_u8(s);
+
+	*wp ^= d;
+	*wq = HORNER1(*wq, d, x1d);
+}
+
+static inline void STEP2(unative_t *wp, unative_t *wq, const uint8_t *s1,
+			 const uint8_t *s0, unative_t x1d)
+{
+	unative_t d1 = vld1q_u8(s1);
+	unative_t d0 = vld1q_u8(s0);
+
+	*wp ^= d1 ^ d0;
+	*wq = HORNER2(*wq, d1, d0, x1d);
+}
+
+static inline void STEP4(unative_t *wp, unative_t *wq, const uint8_t *s3,
+			 const uint8_t *s2, const uint8_t *s1,
+			 const uint8_t *s0, unative_t x1d)
+{
+	unative_t d3 = vld1q_u8(s3);
+	unative_t d2 = vld1q_u8(s2);
+	unative_t d1 = vld1q_u8(s1);
+	unative_t d0 = vld1q_u8(s0);
+
+	*wp ^= d3 ^ d2 ^ d1 ^ d0;
+	*wq = HORNER4(*wq, d3, d2, d1, d0, x1d);
+}
+
+/* Multiply by the constant described by the nibble tables in m0 and m1 */
+static inline unative_t GFMUL(unative_t v, unative_t m0, unative_t m1)
+{
+	return vqtbl1q_u8(m0, v & 0x0f) ^ vqtbl1q_u8(m1, vshrq_n_u8(v, 4));
+}
+
+void RAID6_NEON_FN($#, gen_syndrome_real)(int disks, unsigned long bytes,
+					 void **ptrs)
 {
 	uint8_t **dptr = (uint8_t **)ptrs;
 	uint8_t *p, *q;
 	int d, z, z0;
 
-	register unative_t wd$$, wq$$, wp$$, w1$$, w2$$;
+	unative_t wq$$, wp$$;
 	const unative_t x1d = vdupq_n_u8(0x1d);
 
 	z0 = disks - 3;		/* Highest data disk */
@@ -69,30 +155,41 @@ void raid6_neon$#_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 
 	for ( d = 0 ; d < bytes ; d += NSIZE*$# ) {
 		wq$$ = wp$$ = vld1q_u8(&dptr[z0][d+$$*NSIZE]);
-		for ( z = z0-1 ; z >= 0 ; z-- ) {
-			wd$$ = vld1q_u8(&dptr[z][d+$$*NSIZE]);
-			wp$$ = veorq_u8(wp$$, wd$$);
-			w2$$ = MASK(wq$$);
-			w1$$ = SHLBYTE(wq$$);
-
-			w2$$ = vandq_u8(w2$$, x1d);
-			w1$$ = veorq_u8(w1$$, w2$$);
-			wq$$ = veorq_u8(w1$$, wd$$);
+		z = z0 - 1;
+
+		/* Process 1 and/or 2 disks so that a multiple of 4 remains */
+		if (z0 & 1) {
+			STEP1(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], x1d);
+			z--;
+		}
+		if (z0 & 2) {
+			STEP2(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z-1][d+$$*NSIZE], x1d);
+			z -= 2;
+		}
+		for ( ; z >= 0 ; z -= 4 ) {
+			STEP4(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z-1][d+$$*NSIZE], &dptr[z-2][d+$$*NSIZE], &dptr[z-3][d+$$*NSIZE], x1d);
 		}
 		vst1q_u8(&p[d+NSIZE*$$], wp$$);
 		vst1q_u8(&q[d+NSIZE*$$], wq$$);
 	}
 }
 
-void raid6_neon$#_xor_syndrome_real(int disks, int start, int stop,
-				    unsigned long bytes, void **ptrs)
+/*
+ * @gmul points to the 32 byte nibble table (see raid6_vgfmul[]) that
+ * multiplies by g^start.
+ */
+void RAID6_NEON_FN($#, xor_syndrome_real)(int disks, int start, int stop,
+					 unsigned long bytes, void **ptrs,
+					 const uint8_t *gmul)
 {
 	uint8_t **dptr = (uint8_t **)ptrs;
 	uint8_t *p, *q;
 	int d, z, z0;
 
-	register unative_t wd$$, wq$$, wp$$, w1$$, w2$$;
+	unative_t wq$$, wp$$;
 	const unative_t x1d = vdupq_n_u8(0x1d);
+	const unative_t gm0 = vld1q_u8(gmul);
+	const unative_t gm1 = vld1q_u8(gmul + 16);
 
 	z0 = stop;		/* P/Q right side optimization */
 	p = dptr[disks-2];	/* XOR parity */
@@ -100,53 +197,28 @@ void raid6_neon$#_xor_syndrome_real(int disks, int start, int stop,
 
 	for ( d = 0 ; d < bytes ; d += NSIZE*$# ) {
 		wq$$ = vld1q_u8(&dptr[z0][d+$$*NSIZE]);
-		wp$$ = veorq_u8(vld1q_u8(&p[d+$$*NSIZE]), wq$$);
+		wp$$ = vld1q_u8(&p[d+$$*NSIZE]) ^ wq$$;
+		z = z0 - 1;
 
 		/* P/Q data pages */
-		for ( z = z0-1 ; z >= start ; z-- ) {
-			wd$$ = vld1q_u8(&dptr[z][d+$$*NSIZE]);
-			wp$$ = veorq_u8(wp$$, wd$$);
-			w2$$ = MASK(wq$$);
-			w1$$ = SHLBYTE(wq$$);
-
-			w2$$ = vandq_u8(w2$$, x1d);
-			w1$$ = veorq_u8(w1$$, w2$$);
-			wq$$ = veorq_u8(w1$$, wd$$);
+		if ((z0 - start) & 1) {
+			STEP1(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], x1d);
+			z--;
 		}
-		/* P/Q left side optimization */
-		for ( z = start-1 ; z >= 3 ; z -= 4 ) {
-			w2$$ = vshrq_n_u8(wq$$, 4);
-			w1$$ = vshlq_n_u8(wq$$, 4);
-
-			w2$$ = PMUL(w2$$, x1d);
-			wq$$ = veorq_u8(w1$$, w2$$);
+		if ((z0 - start) & 2) {
+			STEP2(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z-1][d+$$*NSIZE], x1d);
+			z -= 2;
+		}
+		for ( ; z >= start ; z -= 4 ) {
+			STEP4(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z-1][d+$$*NSIZE], &dptr[z-2][d+$$*NSIZE], &dptr[z-3][d+$$*NSIZE], x1d);
 		}
 
-		switch (z) {
-		case 2:
-			w2$$ = vshrq_n_u8(wq$$, 5);
-			w1$$ = vshlq_n_u8(wq$$, 3);
-
-			w2$$ = PMUL(w2$$, x1d);
-			wq$$ = veorq_u8(w1$$, w2$$);
-			break;
-		case 1:
-			w2$$ = vshrq_n_u8(wq$$, 6);
-			w1$$ = vshlq_n_u8(wq$$, 2);
-
-			w2$$ = PMUL(w2$$, x1d);
-			wq$$ = veorq_u8(w1$$, w2$$);
-			break;
-		case 0:
-			w2$$ = MASK(wq$$);
-			w1$$ = SHLBYTE(wq$$);
-
-			w2$$ = vandq_u8(w2$$, x1d);
-			wq$$ = veorq_u8(w1$$, w2$$);
+		/* P/Q left side optimization: multiply by g^start */
+		if (start) {
+			wq$$ = GFMUL(wq$$, gm0, gm1);
 		}
-		w1$$ = vld1q_u8(&q[d+NSIZE*$$]);
-		wq$$ = veorq_u8(wq$$, w1$$);
 
+		wq$$ ^= vld1q_u8(&q[d+NSIZE*$$]);
 		vst1q_u8(&p[d+NSIZE*$$], wp$$);
 		vst1q_u8(&q[d+NSIZE*$$], wq$$);
 	}
diff --git a/lib/raid/raid6/arm/neon_compat.h b/lib/raid/raid6/arm/neon_compat.h
new file mode 100644
index 000000000000..81410b2c2c99
--- /dev/null
+++ b/lib/raid/raid6/arm/neon_compat.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ */
+
+#ifdef CONFIG_ARM
+/*
+ * AArch32 does not provide this intrinsic natively because it does not
+ * implement the underlying instruction. AArch32 only provides a 64-bit
+ * wide vtbl.8 instruction, so use that instead.
+ */
+static inline uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
+{
+	union {
+		uint8x16_t	val;
+		uint8x8x2_t	pair;
+	} __a = { a };
+
+	return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
+			   vtbl2_u8(__a.pair, vget_high_u8(b)));
+}
+#endif
diff --git a/lib/raid/raid6/arm/recov_neon_inner.c b/lib/raid/raid6/arm/recov_neon_inner.c
index 53c355efa7ff..66f687e5dea8 100644
--- a/lib/raid/raid6/arm/recov_neon_inner.c
+++ b/lib/raid/raid6/arm/recov_neon_inner.c
@@ -6,24 +6,7 @@
 
 #include <arm_neon.h>
 #include "arm/neon.h"
-
-#ifdef CONFIG_ARM
-/*
- * AArch32 does not provide this intrinsic natively because it does not
- * implement the underlying instruction. AArch32 only provides a 64-bit
- * wide vtbl.8 instruction, so use that instead.
- */
-static uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
-{
-	union {
-		uint8x16_t	val;
-		uint8x8x2_t	pair;
-	} __a = { a };
-
-	return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
-			   vtbl2_u8(__a.pair, vget_high_u8(b)));
-}
-#endif
+#include "arm/neon_compat.h"
 
 void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
 			      uint8_t *dq, const uint8_t *pbmul,
-- 
2.56.1.708.g77570a6a1d-goog



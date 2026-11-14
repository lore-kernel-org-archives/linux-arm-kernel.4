Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E0iiox3x;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Or9yRx1k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PWySbDG6gTOOgHtX0X2Egn1jbX/EYKXSYGg78Rt2ZiU=; b=E0iiox3xZsns4Z0Kuqm88HsaD4
	mkeBbgLrpLdEHBdC6ephSif6xdiWHSFRWa+qQ0cNHGU7Nzv4XvBRD83/BKvmb0HKh7f/LKhBEctRM
	nfUelD2vjO6HdGUkSjYzwdhk3LOLCfDOPoNsjUeul8qzlO/eN1fjJMhYO0uEAu/aJDl61xtSBUMhN
	x3MbJzrj16ZO0Gv32i1NZHfaW1WJySnjOQIR8K55wOxyEm5s0OFMskRDfOgHVRFOFR0TnU3pmS4wg
	p9F/54AD3lTSl2lcJWCqNpHKXa8HbAqVd5fASxYM7UCI18xgATSkI63qHNjlza6iSsgMaxpi4QCyT
	eVOtUl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSL1g-0000000Gll6-15av;
	Sat, 14 Nov 2026 21:11:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSL1f-0000000Gll0-00xd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 21:11:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D89D446CA;
	Sat, 14 Nov 2026 21:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FFA1F000C4;
	Sat, 14 Nov 2026 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794690666;
	bh=PWySbDG6gTOOgHtX0X2Egn1jbX/EYKXSYGg78Rt2ZiU=;
	h=From:To:Cc:Subject:Date;
	b=Or9yRx1k8yAjmkMKC5SLTIhH2rKDeTiRNH7mB9HVU7mkKdAqlYV/wcHOnZiLrK+Js
	 iTi+angU0P+umzgB+0Wsr85H5WjM7M6f0IzZjLbkoa2oNHVl+lkvAV2ZNDG6nuimGt
	 EOw0fH0tcwJE5iBfejQhAvLkLRC8LYRxomTsiGhmCpVmx9lQ+UwFBza/CaeZCS1zbR
	 /ydQkmdQDDymATE9LoRV9RHGfaE8PbeWBxhIJxRCPNWzHx7xJqyFwC+dLmimdIvKKl
	 ii2z5D08FJapCQ/zpy9QnfRTqfJqqo9hf7h6S25/woGHkx4JabwX4SapEEo6qQmfSz
	 2C+21g7PerA7g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: arm64/sm3: Use assembler for sm3 instructions
Date: Sat, 14 Nov 2026 13:10:19 -0800
Message-ID: <20261114211019.80609-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All supported assemblers (binutils 2.30 and later, and clang 17.0.1 and
later) support the sm3 instructions now.

Therefore, drop the use of '.inst' in sm3-ce-core.S and just have the
assembler generate the instructions.

This requires adding '.arch armv8.2-a+sm4'.  (Yes, the assemblers want
sm4, not sm3.)  I also tried just '.arch_extension sm4', but that
doesn't work with binutils 2.40 and earlier because they consider sm3 to
depend on armv8.2-a or later (and this file isn't built with
-march=armv8.2-a or later).  This was fixed in binutils 2.41 commit
205e4380c800, but the kernel currently supports binutils 2.30 and later.

No change in the resulting .text section with either binutils or clang.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is intended to be taken through libcrypto-next

 lib/crypto/arm64/sm3-ce-core.S | 41 +++++++---------------------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/lib/crypto/arm64/sm3-ce-core.S b/lib/crypto/arm64/sm3-ce-core.S
index ee7f900d7cff7..91eee7d760f93 100644
--- a/lib/crypto/arm64/sm3-ce-core.S
+++ b/lib/crypto/arm64/sm3-ce-core.S
@@ -8,44 +8,19 @@
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-	.irp		b, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
-	.set		.Lv\b\().4s, \b
-	.endr
-
-	.macro		sm3partw1, rd, rn, rm
-	.inst		0xce60c000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3partw2, rd, rn, rm
-	.inst		0xce60c400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3ss1, rd, rn, rm, ra
-	.inst		0xce400000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt1a, rd, rn, rm, imm2
-	.inst		0xce408000 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt1b, rd, rn, rm, imm2
-	.inst		0xce408400 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt2a, rd, rn, rm, imm2
-	.inst		0xce408800 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt2b, rd, rn, rm, imm2
-	.inst		0xce408c00 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
+	/*
+	 * The assemblers group the sm3 and sm4 instructions under the sm4
+	 * feature.  So we need to request sm4, despite this file being sm3.
+	 * In binutils 2.40 and earlier, armv8.2 or later is also required.
+	 */
+	.arch		armv8.2-a+sm4
 
 	.macro		round, ab, s0, t0, t1, i
 	sm3ss1		v5.4s, v8.4s, \t0\().4s, v9.4s
 	shl		\t1\().4s, \t0\().4s, #1
 	sri		\t1\().4s, \t0\().4s, #31
-	sm3tt1\ab	v8.4s, v5.4s, v10.4s, \i
-	sm3tt2\ab	v9.4s, v5.4s, \s0\().4s, \i
+	sm3tt1\ab	v8.4s, v5.4s, v10.s[\i]
+	sm3tt2\ab	v9.4s, v5.4s, \s0\().s[\i]
 	.endm
 
 	.macro		qround, ab, s0, s1, s2, s3, s4

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.1



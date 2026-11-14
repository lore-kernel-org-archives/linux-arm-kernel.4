Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGRF5adi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIXCbvlh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3cTSklSM869HvZ/lNR+9JrA84aFdBBlR64yvM3C+hpM=; b=fGRF5adiypLuvNqSr1BY2EWpk6
	N7BbKgX1eQC+KH+w5tYtFZ9tgHoTOhg8+lgThgaTocf8PKb31vlvkBpocJggJG1M1ncl898W040OD
	1U94Ei9gDzl6DiwrbH7CLXURYOaGxJhsEz5GNjWm5G/KrmsLAININhD5qrzS+Znmci0SRL6G93I8j
	b/NxCEjbuQJrBy8P6Gf02ggsbGYNFLAeIPgQRlCbGyHb962lGQ/pf3jSc0q2h/7uCSjeax3z2R2tv
	GrTfI/8cWI/fMnU46C2Ot1VP9NarlcjiHyu6JQ7Z0XNIn6+7R1HpJejSgnvtfysfvsqQpxMpyyCaI
	kgG5IjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKaX-0000000Gkv0-1Dqf;
	Sat, 14 Nov 2026 20:43:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKaV-0000000Gkus-3nKH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 20:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A5D045A27;
	Sat, 14 Nov 2026 20:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF92A1F000C4;
	Sat, 14 Nov 2026 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794688983;
	bh=3cTSklSM869HvZ/lNR+9JrA84aFdBBlR64yvM3C+hpM=;
	h=From:To:Cc:Subject:Date;
	b=aIXCbvlhiSeCGeX2Vjg/JhSiD5e/b0zXPWRMnxwOdQgKGOp2bF0J3AIUvTqBQvKBS
	 DbiXlXjZMb2f2mO5eYROkQRN6+U2WOLCILc4lvmy+uOZaZUIcKguZTHpnvc8p8hkuY
	 p2mnXXJhoA3HB4NxJtZCpiwnCGFvmCq1rW4jpTyg8BqPvwgx+A1TXuiJVZ1VTBD4j/
	 P0d50oLZlWpS9E0hJSRT3Nxg4MXQXshzLaisb4X5U1b168cjWMRHzGrvRUD9NtnDiA
	 39B0sVPuvxzVTJWfB01ZJ+H/4Ws/8kBr2JaaOVT0djSRqWChXMW3rG/tVjVyfRWlpG
	 GHZL3kPRZRyAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: arm64/sha3: Use assembler for sha3 instructions
Date: Sat, 14 Nov 2026 12:42:45 -0800
Message-ID: <20261114204245.67919-1-ebiggers@kernel.org>
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
later) support the sha3 instructions now.

Therefore, drop the use of '.inst' in sha3-ce-core.S and just have the
assembler generate the instructions.

This requires adding '.arch armv8.2-a+sha3'.  I also tried just
'.arch_extension sha3', but that doesn't work with binutils 2.40 and
earlier because they consider sha3 to depend on armv8.2-a or later (and
this file isn't built with -march=armv8.2-a or later).  This was fixed
in binutils 2.41 commit 205e4380c800, but the kernel currently supports
binutils 2.30 and later.

Also prefix the immediate operands to 'xar' with '#', now that they no
longer need to be plain numbers to generate an .inst.  This isn't
required, but it follows the standard convention for immediates in arm64
assembly, including elsewhere in the same file.

No change in the resulting .text section with either binutils or clang.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is intended to be taken through libcrypto-next

 lib/crypto/arm64/sha3-ce-core.S | 73 ++++++++++++---------------------
 1 file changed, 26 insertions(+), 47 deletions(-)

diff --git a/lib/crypto/arm64/sha3-ce-core.S b/lib/crypto/arm64/sha3-ce-core.S
index b8ab01987ae07..02f225fd86ced 100644
--- a/lib/crypto/arm64/sha3-ce-core.S
+++ b/lib/crypto/arm64/sha3-ce-core.S
@@ -12,29 +12,8 @@
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-	.irp	b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
-	.set	.Lv\b\().2d, \b
-	.set	.Lv\b\().16b, \b
-	.endr
-
-	/*
-	 * ARMv8.2 Crypto Extensions instructions
-	 */
-	.macro	eor3, rd, rn, rm, ra
-	.inst	0xce000000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro	rax1, rd, rn, rm
-	.inst	0xce608c00 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro	bcax, rd, rn, rm, ra
-	.inst	0xce200000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro	xar, rd, rn, rm, imm6
-	.inst	0xce800000 | .L\rd | (.L\rn << 5) | ((\imm6) << 10) | (.L\rm << 16)
-	.endm
+	/* In binutils 2.40 and earlier, sha3 depends on armv8.2-a or later. */
+	.arch	armv8.2-a+sha3
 
 	/*
 	 * void sha3_ce_transform(struct sha3_state *state, const u8 *data,
@@ -125,30 +104,30 @@ SYM_FUNC_START(sha3_ce_transform)
 	rax1	v27.2d, v27.2d, v29.2d	// bc[3]
 
 	eor	 v0.16b,  v0.16b, v30.16b
-	xar	 v29.2d,   v1.2d,  v25.2d, (64 - 1)
-	xar	  v1.2d,   v6.2d,  v25.2d, (64 - 44)
-	xar	  v6.2d,   v9.2d,  v28.2d, (64 - 20)
-	xar	  v9.2d,  v22.2d,  v26.2d, (64 - 61)
-	xar	 v22.2d,  v14.2d,  v28.2d, (64 - 39)
-	xar	 v14.2d,  v20.2d,  v30.2d, (64 - 18)
-	xar	 v31.2d,   v2.2d,  v26.2d, (64 - 62)
-	xar	  v2.2d,  v12.2d,  v26.2d, (64 - 43)
-	xar	 v12.2d,  v13.2d,  v27.2d, (64 - 25)
-	xar	 v13.2d,  v19.2d,  v28.2d, (64 - 8)
-	xar	 v19.2d,  v23.2d,  v27.2d, (64 - 56)
-	xar	 v23.2d,  v15.2d,  v30.2d, (64 - 41)
-	xar	 v15.2d,   v4.2d,  v28.2d, (64 - 27)
-	xar	 v28.2d,  v24.2d,  v28.2d, (64 - 14)
-	xar	 v24.2d,  v21.2d,  v25.2d, (64 - 2)
-	xar	  v8.2d,   v8.2d,  v27.2d, (64 - 55)
-	xar	  v4.2d,  v16.2d,  v25.2d, (64 - 45)
-	xar	 v16.2d,   v5.2d,  v30.2d, (64 - 36)
-	xar	  v5.2d,   v3.2d,  v27.2d, (64 - 28)
-	xar	 v27.2d,  v18.2d,  v27.2d, (64 - 21)
-	xar	  v3.2d,  v17.2d,  v26.2d, (64 - 15)
-	xar	 v25.2d,  v11.2d,  v25.2d, (64 - 10)
-	xar	 v26.2d,   v7.2d,  v26.2d, (64 - 6)
-	xar	 v30.2d,  v10.2d,  v30.2d, (64 - 3)
+	xar	 v29.2d,   v1.2d,  v25.2d, #64 - 1
+	xar	  v1.2d,   v6.2d,  v25.2d, #64 - 44
+	xar	  v6.2d,   v9.2d,  v28.2d, #64 - 20
+	xar	  v9.2d,  v22.2d,  v26.2d, #64 - 61
+	xar	 v22.2d,  v14.2d,  v28.2d, #64 - 39
+	xar	 v14.2d,  v20.2d,  v30.2d, #64 - 18
+	xar	 v31.2d,   v2.2d,  v26.2d, #64 - 62
+	xar	  v2.2d,  v12.2d,  v26.2d, #64 - 43
+	xar	 v12.2d,  v13.2d,  v27.2d, #64 - 25
+	xar	 v13.2d,  v19.2d,  v28.2d, #64 - 8
+	xar	 v19.2d,  v23.2d,  v27.2d, #64 - 56
+	xar	 v23.2d,  v15.2d,  v30.2d, #64 - 41
+	xar	 v15.2d,   v4.2d,  v28.2d, #64 - 27
+	xar	 v28.2d,  v24.2d,  v28.2d, #64 - 14
+	xar	 v24.2d,  v21.2d,  v25.2d, #64 - 2
+	xar	  v8.2d,   v8.2d,  v27.2d, #64 - 55
+	xar	  v4.2d,  v16.2d,  v25.2d, #64 - 45
+	xar	 v16.2d,   v5.2d,  v30.2d, #64 - 36
+	xar	  v5.2d,   v3.2d,  v27.2d, #64 - 28
+	xar	 v27.2d,  v18.2d,  v27.2d, #64 - 21
+	xar	  v3.2d,  v17.2d,  v26.2d, #64 - 15
+	xar	 v25.2d,  v11.2d,  v25.2d, #64 - 10
+	xar	 v26.2d,   v7.2d,  v26.2d, #64 - 6
+	xar	 v30.2d,  v10.2d,  v30.2d, #64 - 3
 
 	bcax	v20.16b, v31.16b, v22.16b,  v8.16b
 	bcax	v21.16b,  v8.16b, v23.16b, v22.16b

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.1



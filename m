Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CA606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=maBTtR1S;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m99FfT49
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xu2+ZqWLiH8ac/CHEFRlUaMcIRQgTHmvl2/TbWN1jDE=; b=maBTtR1SYY2pMu
	JIMFEtKLXIt607gg5J+0ONCFoMSHOq8XaUAiaJiL+THIG9UEX8IJf8epvjE96eHIDGqdqbh19jNoQ
	esyFeB3nP5oBwT3+Us3Po3dgrZQogmPA1DkoX0o60tacOqlEfJztShomquWP/ZZeGeSYcGDDBebUn
	MvlXnPR2g6Xr0jYaysom+EWpJL4cMKDgTTGDZ/jSXMW8fIDWgBoO10WawxiAFWYOUHSEPW1s8bXKW
	dEpZLHMPzZuNPN2Xpnrz2AL6zXWz09z1BpxAtlTr9Ah7eUudLrkoaf19n66Vwm5fcDnLw3fbvnN8K
	bv3dmEHQY/qTp1A8I1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBu-00000001Pa4-18lF;
	Mon, 16 Nov 2026 07:31:50 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBl-00000001PWB-2rpG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xu
	2+ZqWLiH8ac/CHEFRlUaMcIRQgTHmvl2/TbWN1jDE=; b=m99FfT49cAacTyHuKC
	ZVlrc/ddyosRz6FdT5OMNPUKS80vN/Zx7yTwkCJebC8IoVumS/Rse8b+ZTC14Bzn
	mGcQFH5F9R5QQ0ae2l3+QsANZwRqgXtidwYsX3CSCTtcMzpHNdNDDAp1hh7b2sD3
	XneAEZi1KkV2IYvdhw8VekmBg=
Received: from mm (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnB4dFsfpqIKNJFg--.7882S3;
	Mon, 16 Nov 2026 15:31:21 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Niu <benniu@meta.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com,
	xiqi2@huawei.com
Subject: [PATCH v4 1/2] arm64: copy_template: add an offset-addressed 64-byte loop
Date: Mon, 16 Nov 2026 15:25:11 +0800
Message-ID: <20261116072512.1323883-2-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116072512.1323883-1-xiqi5703@163.com>
References: <20261116072512.1323883-1-xiqi5703@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDnB4dFsfpqIKNJFg--.7882S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF17JF4fuF47trW3uF43Awb_yoW8KFWDpw
	1xWrW3Kas8GwnrA3yfX3Z7CrWakan3JFyfWFZ7KFn7tw1jqa4Yqw43Gw1F9FWUJ39ay348
	CF9YyF1DGas0gFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsuc_UUUUU=
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7QnXDmr6sUm9jQAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233142_166537_60766B84 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Qi Xi <xiqi2@huawei.com>

copy_template.S is shared by copy_from_user.S and copy_to_user.S.  In
its 64-byte loop every load and store is post-indexed, which on the
user side means two LDTR/STTR accesses followed by an address update.

Add a COPY_TEMPLATE_PAIRS variant of the loop that uses offset
addressing and advances src and dst once per iteration.  Without
per-access writeback, the loads and stores of an iteration can overlap
rather than serialise on the base register.

Defining COPY_TEMPLATE_PAIRS before including copy_template.S selects
the variant.

Co-developed-by: Ben Niu <benniu@meta.com>
Signed-off-by: Ben Niu <benniu@meta.com>
Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 arch/arm64/lib/copy_template.S | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
index 7f2f5a0e2fb9..12ab3bc8afa3 100644
--- a/arch/arm64/lib/copy_template.S
+++ b/arch/arm64/lib/copy_template.S
@@ -161,6 +161,40 @@ alternative_else_nop_endif
 	*/
 	.p2align	L1_CACHE_SHIFT
 .Lcpy_body_large:
+#ifdef COPY_TEMPLATE_PAIRS
+	/* pre-get 64 bytes data. */
+	ldp2	A_l, A_h, src, #0, 9997f
+	ldp2	B_l, B_h, src, #16, 9997f
+	ldp2	C_l, C_h, src, #32, 9997f
+	ldp2	D_l, D_h, src, #48, 9997f
+	add	src, src, #64
+1:
+	/*
+	* interlace the load of next 64 bytes data block with store of the last
+	* loaded 64 bytes data.
+	*
+	* The loads can fault on user memory.  Since dst is not advanced
+	* per access, each fault is fixed up to account for the 16-byte
+	* blocks already stored.
+	*/
+	stp2	A_l, A_h, dst, #0
+	ldp2	A_l, A_h, src, #0, .Lcopy_opt_fixup16
+	stp2	B_l, B_h, dst, #16
+	ldp2	B_l, B_h, src, #16, .Lcopy_opt_fixup32
+	stp2	C_l, C_h, dst, #32
+	ldp2	C_l, C_h, src, #32, .Lcopy_opt_fixup48
+	stp2	D_l, D_h, dst, #48
+	ldp2	D_l, D_h, src, #48, .Lcopy_opt_fixup64
+	add	dst, dst, #64
+	add	src, src, #64
+	subs	count, count, #64
+	b.ge	1b
+	stp2	A_l, A_h, dst, #0
+	stp2	B_l, B_h, dst, #16
+	stp2	C_l, C_h, dst, #32
+	stp2	D_l, D_h, dst, #48
+	add	dst, dst, #64
+#else
 	/* pre-get 64 bytes data. */
 	ldp1	A_l, A_h, src, #16
 	ldp1	B_l, B_h, src, #16
@@ -185,6 +219,7 @@ alternative_else_nop_endif
 	stp1	B_l, B_h, dst, #16
 	stp1	C_l, C_h, dst, #16
 	stp1	D_l, D_h, dst, #16
+#endif
 
 	tst	count, #0x3f
 	b.ne	.Ltail63
-- 
2.53.0



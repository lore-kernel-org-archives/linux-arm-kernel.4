Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3372606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5Cc6dby;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCdudd45
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h7jKhgW2MQavDeYA5DvZZ06yeDl1v6ZtS0ur/qsa/To=; b=W5Cc6dbyCUwqDriu6vDnspeEoQ
	wHc1BmkV4buja/gDUdvtSriZ8cM6/KLfnrCBBKm2XH96xzK9vuKcNRxgb3xwEZqTsZj+FfLhiF92F
	UxrzA/m84DMLFNwrpQffiC9mpZtUUmYtXPxmzSZyOnzZXjkKBcbSYleCeLWAkJ5KTnSqgA8R0PH+4
	63AXFsbnpCtC5ZBkPhoH2iuxI/DC4xA5IczqIkiraSP4H/GHCzQXdNK8EkIG/LzXcVCdgHn5oaOL/
	s3W3see6oRg9Qw2kGDHj2UZVsg+SRAhMgM6EN0WXf3fVeEidpUYhMhqh3pJkFBesXdbs3FzuhYmlQ
	V01jtS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBRs-00000007EhN-3oIF;
	Wed, 11 Nov 2026 16:45:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBRs-00000007Eh6-0WUa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:45:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B63CA47404;
	Wed, 11 Nov 2026 16:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522A01F00A05;
	Wed, 11 Nov 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415523;
	bh=h7jKhgW2MQavDeYA5DvZZ06yeDl1v6ZtS0ur/qsa/To=;
	h=From:To:Cc:Subject:Date;
	b=bCdudd452ELxWqGQCoyC336cufFyki3Z4ZUyrtUobMnejdC5KGFvKDLrpgaaxe0Et
	 8FAd8CFYzWgZmvK+A2rEtJPjn2ohFWwJ1DaVWoWNEdbLztZIXitFFT5kl5o6NL4Mtq
	 Ko3VJlnFFGTIfbsneDLuqjZL0aw3M0Fc2HYWfgxAx58dYeWjmL1FQcWn4q1LmBQHXU
	 Cw1XUtd1SzJdjUeo0L3yYeaxjlNKvtQ2WqwFVbxgOYRvoDUyQcAyY4IkjYV6zUyPJv
	 sRRlLQyHTmyaRK20YwnQXBP8wHBwPXNLUhhc0gPAUAPi2sRpA8fVLN32uBryu+VhWJ
	 JsICkMsKe/XPw==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH RESEND] arm64: patching: Annotate text_addrs, new_insns with __counted_by_ptr()
Date: Wed, 11 Nov 2026 17:45:14 +0100
Message-ID: <20261111164515.77988-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=blum@kernel.org; h=from:subject; bh=BbljLzGPofMIqi5g5mgMPpwGq6qmez95yloL4CR6jK8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlfZs8OqvzxpL26Ybrp7IuO/as3zX8mYFl67o7MacMI6 b3SN9J4OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiwWcZ/ko+Ltvx64DPPYn1 Ky0zPto8PZgsvX1VaEaD4+55LwL+yBgx/JXy9FMpVuz/I+uzR/XbofaTUxqEaoUunr327eZtZwN THW4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

Add __counted_by_ptr() to aarch64_insn_patch::text_addrs and
aarch64_insn_patch::new_insns to enable access bounds checking via
CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/patching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 09f019c6547a..5fc7805a93f0 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -194,8 +194,8 @@ int __kprobes aarch64_insn_patch_text_nosync(void *addr, u32 insn)
 }
 
 struct aarch64_insn_patch {
-	void		**text_addrs;
-	u32		*new_insns;
+	void		**text_addrs __counted_by_ptr(insn_cnt);
+	u32		*new_insns __counted_by_ptr(insn_cnt);
 	int		insn_cnt;
 	atomic_t	cpu_count;
 };


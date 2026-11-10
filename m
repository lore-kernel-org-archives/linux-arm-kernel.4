Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DHd7GgaA;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=La40Nucr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mMAZKQAFME8P3yklgR9smhNvOT7whcwIN/YXkT24B7k=; b=DHd7GgaA2TmGDsT932oVnq9zXi
	DfOrKJWIghIg8WRYGHR5VshA8E+1UkaSQ8MzWWTEq3mltW+HBr6MMrQgHrBMrmhTZouUkg80Z6p2j
	RpSYlEWYxeQhuy1g6mlTtcfJ63DLDRqCgejrXPH8lRN472SxnzjyCnQeSMkGeNiKJyvClm/PlkH4I
	cPGD1RWkVXCPROk7tLe+F9RaCpMZT4iv3QrFwimh/lCCJ8aHS8UFaSEVge9ODH67u6pBSMi06hYEZ
	6yjoHcTTUqneko6dNHJxQe8WaZmTPfCnT2ZUzbuXmClWi172niZVWxTacNECTWmv0E4R2gEzlGckH
	N31NJcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAu-000000058sC-0pP7;
	Tue, 10 Nov 2026 22:18:44 +0000
Received: from out-156.mta0.migadu.com ([2001:41d0:1004:224b::9c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuAr-000000058rB-0dxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:18:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fJko3etiBFrEh3/Db7V6Hp/x1IoP6O70SfBSmJFkESg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349118; v=1; x=1794953918;
 b=La40Nucr2UDJ8QIyB5cj2B3za8riJvJPVAzIUIW6jpX8Ls2zCFuHM5aDhjBhHzLIS+/c7xQh
 MUBC1MQkD2XFRMejo6wX3sBMK0gVaXRqv6Xs5Mdn7F8EfFdIGyy8EGqY8IlbA3EBjBe4pWUvvhR
 OAwWyHgsRJXxX15eSs0PclVQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id bd0672650117ca00;
	Tue, 10 Nov 2026 22:18:38 +0000
X-Mizu-Trace-ID: bd0672650117ca00
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev
Subject: [PATCH 0/2] arm64: signal: Fix ZT restore without ZA and clean up bounds check
Date: Tue, 10 Nov 2026 22:18:34 +0000
Message-ID: <20261110221836.3265929-1-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_141841_907703_B9EF600F 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses two separate issues in the arm64 signal frame
parsing and restoration code:

Patch 1 fixes a bug where ZT state could be restored without ZA state.
If user.za was omitted from the signal frame, restore_za_context() was
never invoked. When a signal handler touched SME before calling
rt_sigreturn(), thread_za_enabled(&current->thread) evaluated to true,
causing restore_zt_context() to overwrite ZT without restoring ZA.
We now mandate that user->za is present before restoring ZT context.

Patch 2 drops a duplicate limit - offset < size bounds check in
parse_user_sigframe() that was left over after the switch block from the
2017 frame layout rework.

Bradley Morgan (2):
  arm64/fpsimd: signal: Require ZA context when restoring ZT context
  arm64: signal: drop redundant bounds check in parse_user_sigframe()

 arch/arm64/kernel/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.53.0



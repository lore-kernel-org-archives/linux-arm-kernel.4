Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F78606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xXvW8Kz3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NOrbCY2W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8ksBKm+pzxuuq+S/3andYFYeVp/N1SmT8kmvLEwpdiM=; b=xXvW8Kz3gRnnAU
	bt6WbNvhBhlFTWwz1jnS+zWfsbcmroSL8cgl61XWoJcL/jVzWLYrwvoJACRwFkyhI8+S5MmBeJN4k
	56T/TDilMYOWorowwLx7chmE7RBI55/P0UqF91hZgjpVfOcHZYImbFFUVsqTwYiFRPh+gC8tkQKpX
	mq+bsLzPIqhhD/n3iJfViAv4INISe4Cw3XyhPrvcC1cRT38b2Pg3rKc4fav5PkstzgkrEamHI6KI0
	EUS00ouBcIhmBQ1jYsVpcNG4eW2YijCgXi3DhLIm64+mekFp7hEZ2Ky7YBfxdbSxRTCgiJDlBnU2Q
	24A42JQWU8HOGsYlc17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCHB-00000009rXx-0Qfd;
	Wed, 25 Nov 2026 12:39:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCH8-00000009rXJ-3luV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2F32F;
	Wed, 25 Nov 2026 04:38:57 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29D83F86C;
	Wed, 25 Nov 2026 04:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795610340; bh=cmw1itbte3IzHLZQjDwA+gCBb29y9QBqMepaxZQDr1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NOrbCY2WFx1gwZJX7Wx1i7fm4XXe2zPom8L5eAedmsmxMPBfiaBWikKdBGOk7bjHS
	 mHVKCa9/zp6coBzVCeCbxTt1If7iDivGxte3uh7DK+9cMls6f2Qv71tpRMJQ9jLZUW
	 oBbGSjYObKlRGV4l6GLPWtMDYoT/emhCsRY+ZCY8=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Cc: mark.rutland@arm.com,
	dylanbhatch@google.com,
	song@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ardb@kernel.org
Subject: Re: [PATCH v3] arm64: module: Use text-poke for late PLT/veneer emission
Date: Wed, 25 Nov 2026 12:24:17 +0000
Message-ID: <179560945711.1480244.17746046705685189549.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117113535.399407-1-qirui.001@bytedance.com>
References: <20261117113535.399407-1-qirui.001@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043902_992885_FCAF745D 
X-CRM114-Status: GOOD (  16.90  )
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 19:35:35 +0800, Rui Qi wrote:
> module_emit_plt_entry() and module_emit_veneer_for_adrp() write PLT
> entries into the .plt section by direct assignment.  Once a module is
> fully formed its .plt is read-only/executable, so a late (livepatch)
> relocation that falls back to PLT emission -- an out-of-range
> R_AARCH64_CALL26/JUMP26, or an ADRP under CONFIG_ARM64_ERRATUM_843419
> -- triggers a synchronous Data Abort and panics.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: module: Use text-poke for late PLT/veneer emission
      https://git.kernel.org/arm64/c/a7e632493acf

I folded in a small fix which addresses Sashiko's comment: the bounds
check before the write must allow i == plt_max_entries since .plt has
plt_max_entries + 1 slots (the last one is where a duplicate of the
final entry is built before being discarded). I restored the
plt_num_entries check after the duplicate test as well.

I moved the module_write_place() prototype to asm/module.h, next
to the other PLT emitters. I concluded it's a better fit than
text-patching.h. My concern on v2 was the macro but now it's an
out-of-line function. I also dropped the const from the val argument,
which removes the (void *) cast when calling aarch64_insn_copy(). All
callers pass non-const locals anyway. It would be a good cleanup in the
future but that should also add const to aarch64_insn_copy().

Please check that I got these right.

Sashiko had some comments on v2 which we concluded are existing
problems, just exposed because we no longer take a fault. If you have
time for a livepatch reload follow-up (probably not cc stable), there
are two separate problems when the target module is unloaded and loaded
again:

- The livepatch module's .plt slots are reserved once but used again on
  every klp_module_coming(), so a reload eventually hits the WARN and
  the target module is rejected. This is safe but we need some slot
  rewinding or a clear_relocate_add().

- With the A53 erratum 843419 workaround, if the first application
  replaced an ADRP with a B to a veneer, reloc_insn_adrp() reads the
  B back on reload as if it were an ADRP. It either encodes the ADR
  immediate into the B or decodes Rd from the branch offset. This
  corrupts the livepatch code silently on the first reload (unrelated to
  how many slots are left). Not sure yet how to fix this, maybe the
  original instruction needs restoring on unload (or saving).

Thanks.

-- 
Catalin


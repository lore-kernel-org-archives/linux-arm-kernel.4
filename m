Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE2606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvskDgwe;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=E6W1UrtA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Subject:
	Content-Transfer-Encoding:Message-Id:From:References:In-Reply-To:Content-Type
	:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WWvXwf/HB1PDEXpuXx9F2cLGqVaTcytjyLMkY2k569Y=; b=OvskDgweJ/dOS1
	l4N5x/OLsIoZyJuBKNVud9V07ODT35MB9NDml7I+ou/5bxI6bxrslOKDVJUt5C7/DVti8nY4Onc/E
	JEP0x67dOkg6rUhv5PwjnCnKtp5oR2bNcjwo6BTTOkQkrrWcHiYmZrekvsfCFArtv0YkWlQVB9SXI
	G2m2DOAMZOSpN6n+QNy5hiPK5ONoCaAVQ/AkrCbmOu70//7snI7wUq5upBYjJVhXOVU1iUs2zowFz
	T8Pi/Lxd4ZZGnm7t076FjBHU3dAi1j038x6+ittDwfK1/YXKElL1vG5VHkbiIDJQBFA3sY6FFl5Rf
	0I8CSjdWmwXwPwOITPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Ck-00000005pL6-2oxk;
	Wed, 11 Nov 2026 06:53:10 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2Ci-00000005pKW-2FvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794379982; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WWvXwf/HB1PDEXpuXx9F2cLGqVaTcytjyLMkY2k569Y=;
 b=E6W1UrtA69SYn1W9a9oorBiMtgz06JLW2RILWngLuFkAhHst94f8FrlGbzl+jW+LfjS+K9
 uEXThHvux72CdXGLDCCu30W6QsBuw+yBzhVM6fBf3UV9nLm4Asd3F0W7CeaMrt+qTm0WZN
 cfNXrOJPQJyKi4KpQid6UrK5lEwTlnnISjsvrGOYlcZ/Vq9Ol57bNyjyfsaoOpFIE3qXry
 Jo6amyaN6aJ4A2eUd/aqxzsOxFrPjnWtssjze08Z8BIgXrHGpBaaINTw/zwS4Hg5EaXp/z
 5PlUohLyKwuMfJ+1wta8+3uFwp1yqykDd83oFj4EG0aEoVxvD0ms0HK53ajMJQ==
To: "Catalin Marinas" <catalin.marinas@arm.com>
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>, 
	<song@kernel.org>, <dylanbhatch@google.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <atEGBsR3eI3cXKay@arm.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com> <20261010085055.2200241-1-qirui.001@bytedance.com> <atEGBsR3eI3cXKay@arm.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <3b540bc9-69b3-42a8-8431-75dd6079bf4f@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] arm64: patching: Fix instruction byte order in aarch64_insn_set()
Date: Wed, 11 Nov 2026 14:52:44 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26af410cc+f68250+lists.infradead.org+qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_225308_667020_EF19FD4B 
X-CRM114-Status: GOOD (  12.04  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 12:57 AM, Catalin Marinas wrote:
> On Sat, Oct 10, 2026 at 04:50:54PM +0800, Rui Qi wrote:
>> aarch64_insn_set() passes the host-endian u32 instruction straight to
>> text_poke_memset(), which memset32()'s it into memory in host byte order.
>> AArch64 instructions must be little-endian in memory, so on a big-endian
>> kernel the written bytes are reversed and the CPU takes an UNDEFINED
>> instruction exception when fetching them.  The sibling aarch64_insn_write()
>> already converts with cpu_to_le32(); aarch64_insn_set() does not.
>>
>> This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
>> regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
>> selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
>> BE kernels with BPF JIT.  The direct-fill loop in the same file already
>> cpu_to_le32()'s the constant, confirming the expected byte order.
>>
>> Convert the instruction to little-endian before the memset, mirroring
>> aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
>> unchanged.
> 
> We are just about to remove big-endian support (in 7.4).
> 

Understood.  In -next arm64 no longer has a config CPU_BIG_ENDIAN and
nothing selects it, so 1/3 and 2/3 are fixing a configuration that no
longer exists.  I'll drop both.

3/3 ("arm64: module: Use text-poke for late PLT/veneer emission") is
independent of the byte-order work: it routes
module_emit_plt_entry() / module_emit_veneer_for_adrp() through
aarch64_insn_copy() so a late livepatch relocation that falls back to
PLT emission does not write into the ROX .plt and Data Abort.  That
path is reachable on LE today (klp_write_section_relocs() on a
MODULE_STATE_LIVE patch module), so it is not BE-specific; it carries
Fixes: 91b89a634487 and Cc: stable.

I'll resend 3/3 as a standalone patch in a new thread.  Happy to route
it a particular way if you'd prefer.


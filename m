Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17292606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1fWwJAZ;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=LdIjUzer
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:In-Reply-To:Cc:References:Date:To:
	Message-Id:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j9ckxeIVbxf6YdC+lFxjKeacm1K4q7wcuucIH0pUPdA=; b=v1fWwJAZ309CxrRzmw80gXUVpb
	cdP5iHtRrP26KDkrKUf32RbzkVu7HgNuiqgrGl7FZoa+IqjV7ncAXJeHE0ARwL98uk+pzfet3hD+K
	hU+ng/I2ygqjZVMbuW4oRYZSJkisJSch5Or2pWluVY8mNhhsRtqK3Wz4oKz13nwACzD5Qd60Z6LJC
	UwSmKIUzmkNgYPq4JnqnJQK5yJsEV7r0ibTy3GTJEeSvRFqhyLn2XQyLWZUUCCOpP4YD4qivgV9iG
	SiO/nFh88K6t7YHMQg3hZJw/KBSChuXJyIxKJfFlB9Vs8Tts6al1li1FTMwSERWoDOCNJatuf6DWt
	EdSTz31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYYt-0000000D93j-0D9T;
	Thu, 26 Nov 2026 12:26:51 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYYl-0000000D8zq-2VPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795695993; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=j9ckxeIVbxf6YdC+lFxjKeacm1K4q7wcuucIH0pUPdA=;
 b=LdIjUzeraRq4imel3CjPY348Ih89uTaohNT0ujBKuiVqecNdxzBvJ53dDYgz5YX5MPL3Lm
 LmTfk3JmBndpzDO47qWYPlBj7U4vstdiH0V1vZkVIhCL7Lsvksk2o3XuxGIIhiASgd4CjV
 UVc/DlnKqefqpg0hhva8ukDyL+wF5gq9BDBv4miqzBcV+S5UZrFG7GvKjIDCpeNALk4ngd
 e1cueIHzUjZk10vSkrAoop4jOd/XXH8gT2uUL5m7IqBYE2oLVzU1Z2ZUM+VTW6zukgtVcj
 gSF6fFe2evXxSCvwEoSDrpkBe1r2tdvHdMQzfMazkkS25cmg0nFTRjdKa3tI4Q==
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <6b3b684d-9f6c-4490-8c8d-aedffe35cc49@bytedance.com>
X-Lms-Return-Path: <lba+26b082577+8bbe71+lists.infradead.org+qirui.001@bytedance.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>, <will@kernel.org>
Date: Thu, 26 Nov 2026 20:26:15 +0800
References: <20261117113535.399407-1-qirui.001@bytedance.com> <179560945711.1480244.17746046705685189549.b4-ty@b4>
User-Agent: Mozilla Thunderbird
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: <mark.rutland@arm.com>, <dylanbhatch@google.com>, <song@kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>, <ardb@kernel.org>
In-Reply-To: <179560945711.1480244.17746046705685189549.b4-ty@b4>
Subject: Re: [PATCH v3] arm64: module: Use text-poke for late PLT/veneer emission
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_042643_720929_776E61DB 
X-CRM114-Status: GOOD (  26.23  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 8:24 PM, Catalin Marinas wrote:
> On Tue, 17 Nov 2026 19:35:35 +0800, Rui Qi wrote:
>> module_emit_plt_entry() and module_emit_veneer_for_adrp() write PLT
>> entries into the .plt section by direct assignment.  Once a module is
>> fully formed its .plt is read-only/executable, so a late (livepatch)
>> relocation that falls back to PLT emission -- an out-of-range
>> R_AARCH64_CALL26/JUMP26, or an ADRP under CONFIG_ARM64_ERRATUM_843419
>> -- triggers a synchronous Data Abort and panics.
>>
>> [...]
> 
> Applied to arm64 (for-next/fixes), thanks!
> 
> [1/1] arm64: module: Use text-poke for late PLT/veneer emission
>       https://git.kernel.org/arm64/c/a7e632493acf
> 
> I folded in a small fix which addresses Sashiko's comment: the bounds
> check before the write must allow i == plt_max_entries since .plt has
> plt_max_entries + 1 slots (the last one is where a duplicate of the
> final entry is built before being discarded). I restored the
> plt_num_entries check after the duplicate test as well.
> 
> I moved the module_write_place() prototype to asm/module.h, next
> to the other PLT emitters. I concluded it's a better fit than
> text-patching.h. My concern on v2 was the macro but now it's an
> out-of-line function. I also dropped the const from the val argument,
> which removes the (void *) cast when calling aarch64_insn_copy(). All
> callers pass non-const locals anyway. It would be a good cleanup in the
> future but that should also add const to aarch64_insn_copy().
> 
> Please check that I got these right.

Thanks for applying the patch and for the adjustments.

I've checked the resulting patch, and the folded-in changes look correct
to me. Allowing i == plt_max_entries preserves the spare slot used to
build a candidate for the duplicate check, while the restored
post-duplicate check prevents a non-duplicate entry from exceeding the
reserved capacity.

Moving the declaration to asm/module.h makes sense now that the helper
is an out-of-line function. Dropping const also matches the current
aarch64_insn_copy() interface and avoids the cast.


> 
> Sashiko had some comments on v2 which we concluded are existing
> problems, just exposed because we no longer take a fault. If you have
> time for a livepatch reload follow-up (probably not cc stable), there
> are two separate problems when the target module is unloaded and loaded
> again:
> 
> - The livepatch module's .plt slots are reserved once but used again on
>   every klp_module_coming(), so a reload eventually hits the WARN and
>   the target module is rejected. This is safe but we need some slot
>   rewinding or a clear_relocate_add().
> 
> - With the A53 erratum 843419 workaround, if the first application
>   replaced an ADRP with a B to a veneer, reloc_insn_adrp() reads the
>   B back on reload as if it were an ADRP. It either encodes the ADR
>   immediate into the B or decodes Rd from the branch offset. This
>   corrupts the livepatch code silently on the first reload (unrelated to
>   how many slots are left). Not sure yet how to fix this, maybe the
>   original instruction needs restoring on unload (or saving).
> 
> Thanks.
> 


Thanks for detailing the reload issues. I agree that they need separate
handling: reclaiming PLT slots alone would not address the ADRP-to-B
case, since reapplying the relocation also needs the original
instruction, including its destination register. I'll look into the slot
lifecycle and instruction restoration for a separate follow-up,
initially without Cc'ing stable.

Thanks,
Rui


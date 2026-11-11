Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pTPuRJew;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=lVgzjNlx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:
	References:From:To:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Cc
	:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kj1qT7xH8KbzLy1DvoEj1CIR3+rqk8hL80hQOakjzyQ=; b=pTPuRJewUCg1qv
	JygEEeDYshjZ1Lum9T3TqhWlF0brqEbZjlAnLPjyH/sH0ebBG61ddspZzLaT87oe/2h7wi2MOgrLG
	9FxeWpa3M4CkVlKgQlEvfLCoWRKNK6uOxt+Z/Y/aEO1K36/2dak5wIYi/NeVIbLqk1YSUbcukmUX4
	6gPQqrPbk2+WoY0O+pyQMQKevUsSiu2YBFF8waKXxiFDrFmW46ff4hYeCuABX9XNAdxOXjivN9H2k
	47k116SoePtunzRQtD1P4RevVTtGXRLtN1qvK26RwXPUqQelPPxT1ut8FZOTx+sSnKrP+kCoBgDU4
	OWQLweOz3rENWoXDKvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2AJ-00000005p8W-17lm;
	Wed, 11 Nov 2026 06:50:39 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2AG-00000005p7z-2wWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794379823; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Kj1qT7xH8KbzLy1DvoEj1CIR3+rqk8hL80hQOakjzyQ=;
 b=lVgzjNlxC0tldr/JJeoiDkcEdSM7j8o/kzT08ZaQaxf2ITVnQqFJPBMrY+A9JVC65x4FTm
 e3d2ctbXKPjwv+pf0YVgtmOmJXR3gzQBKtBTnLeZHf47UeiNR2s8ZFjWaO8o48jTohxV9M
 36F+9Lryoq+GrfR+ZYvKz6CddNzh9nKUrojdUJMAg/p6hePxL6R2SwANeJ9Qf2WqcUZ0ck
 c2im54Pkj0kEhQ3DM01/3R8I1AbSsDPGYwnxP7vK+Kn9DnfgIDlLG3OcEAZhlfLdacTU+k
 TptAhgVAkcn/BpGO6/1ESxOaWf7BXokH0yyiMb/R7IoWzNYA1c1CWl3U+3tn4w==
Message-Id: <f1f27a57-70e8-452a-9528-0af9b4247514@bytedance.com>
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>, 
	<song@kernel.org>, <dylanbhatch@google.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Date: Wed, 11 Nov 2026 14:50:05 +0800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <auoXmvKObg3IWWTD@arm.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
From: "Rui Qi" <qirui.001@bytedance.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com> <20261010085055.2200241-1-qirui.001@bytedance.com> <20261010085055.2200241-2-qirui.001@bytedance.com> <auoXmvKObg3IWWTD@arm.com>
X-Lms-Return-Path: <lba+26af4102d+2bb895+lists.infradead.org+qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: module: Use text-poke for late PLT/veneer emission
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_225037_021990_B3053932 
X-CRM114-Status: GOOD (  18.52  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 1:19 AM, Catalin Marinas wrote:
> On Sat, Oct 10, 2026 at 04:50:55PM +0800, Rui Qi wrote:
>> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
>> index 7afd370da9f4..fa89ed014bd1 100644
>> --- a/arch/arm64/kernel/module-plts.c
>> +++ b/arch/arm64/kernel/module-plts.c
>> @@ -9,6 +9,29 @@
>>  #include <linux/module.h>
>>  #include <linux/moduleloader.h>
>>  #include <linux/sort.h>
>> +#include <linux/text-patching.h>
>> +
>> +/*
>> + * The .plt section is marked ROX once the module is fully formed, so
>> + * late (livepatch) relocations that emit PLT entries cannot use direct
>> + * assignment.  Mirror WRITE_PLACE() and route the write through the
>> + * text-poke API when the module is already loaded.
>> + *
>> + * Return: 0 on success, -EINVAL if the text-poke write failed.
>> + */
>> +static int plt_entry_write(struct plt_entry *plt,
>> +			   struct plt_entry *entry, struct module *mod)
>> +{
>> +	if (mod->state == MODULE_STATE_UNFORMED) {
>> +		*plt = *entry;
>> +		return 0;
>> +	}
>> +
>> +	if (!aarch64_insn_copy(plt, entry, sizeof(*plt)))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> 
> As your comment says, this is fairly similar to WRITE_PLACE(). Can we
> have a single macro that's used in both places (and maybe give it an
> arm64 specific name if it ends up in a header)?
> 
> Also do we need the !NULL check? plt and entry should be 4-byte aligned
> already, so it's an unnecessary check. WRITE_PLACE() doesn't do this
> either.
> 

Hi Catalin,
Agreed on both points, and they interact nicely -- unifying the two
removes the redundant NULL check as a side effect.
On the NULL check: aarch64_insn_copy() returns NULL only when its dst
is not 4-byte aligned -- that alignment check is the sole failure path,
since __text_poke() always returns addr. &plt[i] is a struct plt_entry
made of __le32 fields in the .plt array, so it is always 4-byte aligned
and the check guards a condition that cannot occur. WRITE_PLACE() omits
the check for the same reason.
On unification: I moved WRITE_PLACE() into a shared header (asm/module.h,
where struct plt_entry already lives), gave it a module_-prefixed name,
and have module-plts.c use it directly. That drops the plt_entry_write()
helper and its error-return path entirely.
Addressed in v2.


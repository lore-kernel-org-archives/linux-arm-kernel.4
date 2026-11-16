Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF3606A881
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11PaF1iA;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p7B5FBbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a+hYdH54f+sS241KpvlRkLIjI3AE72cZFVonC5GKs+M=; b=11PaF1iApfMleQ
	l2lQv+6BoYVf7KkC7t1ok+hOJAL8x8rPmF0hy5d/Dv81MDAdZu15hGZKJZn9kdqnK5ecE3lG2zIN/
	4OZzdGlWNeyvC8DhXIIx2bEsNniCCRZaOpxb3X7irx0N8Q4xrr0diE6AEQa8o839RZjtUknKXyXbE
	ISQi0c130nvCJsp8jkansP58VH5s0reyaV3lLafa52z20R1ivfqf770a9jy2KrjpxEOjK8/NDn/0n
	ANej0HdfmEq5yXrwZFoFcGmdaPsDEMc9RbWjq9NG4ZbKLHZ2xjYsxoMPT0CCZCFVGc/4s0mPO7dha
	2D9s58F6PNYM5GImIIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nH-0000000476W-0C9i;
	Mon, 16 Nov 2026 23:07:23 +0000
Received: from out-251.mta1.migadu.com ([95.215.58.251] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nD-000000046z8-2xIA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:07:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=M2H1x15UjPv2kZktOtjNGI9ClwYTfjmxFkJmOPCqrTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794870436; v=1; x=1795475236;
 b=p7B5FBbkbMugUYm2cba2oEp46Dx35gPJhwdBxYpEOxtetG+/PWyu1I0vmdzh3UrLbCPQqWbK
 I8aSclJ5LnKWaqCMteiq+2DCiddA42HnkatqufgihNmYbKQCTXYb901TOezZLycvjyqhqPbVaYx
 esCr6Ru8PnE/s0cXr2l3AktE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 339ddca2aeb1bab4;
	Mon, 16 Nov 2026 23:07:15 +0000
X-Mizu-Trace-ID: 339ddca2aeb1bab4
X-Migadu-Flow: FLOW_OUT
Message-ID: <a5b278b7-9e9e-43d0-9fcb-a937d3e2a0b5@linux.dev>
Date: Mon, 16 Nov 2026 23:07:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/fpsimd: signal: Require ZA context when
 restoring ZT context
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
 <20261110221836.3265929-2-bradley.morgan@linux.dev>
 <ee1998f2-69dc-419a-b388-dd4e08cc68d6@sirena.org.uk>
Content-Language: en-US
From: Bradley Morgan <bradley.morgan@linux.dev>
In-Reply-To: <ee1998f2-69dc-419a-b388-dd4e08cc68d6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150719_968771_2CA71DE7 
X-CRM114-Status: GOOD (  12.40  )
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/16/26 10:48 PM, Mark Brown wrote:
> On Tue, Nov 10, 2026 at 10:18:35PM +0000, Bradley Morgan wrote:
>> When restoring the signal frame, restore_zt_context() checks whether ZA
>> is enabled via thread_za_enabled(&current->thread). However, if user.za
>> is omitted from the signal frame, restore_za_context() is skipped entirely.
>> If the signal handler touched SME prior to rt_sigreturn(), ZA remains
>> enabled in current->thread.svcr from the handler context, causing
>> thread_za_enabled() to succeed and restore_zt_context() to write userspace
>> ZT data without restoring ZA state.
>>
>> Require user->za to be present in the signal frame before restoring ZT.
> I supposed there's an argument that the signal handler might've intended
> this but still, this does feel more sensible:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
>
> though as the Sashiko report identifies we still leave ZA untouched if
> both ZA and ZT are omitted from the signal frame.  I'm not sure if it's
> safer to reject any attempt to return from a signal with PSTATE.ZA set
> but no ZA signal frame or if we should restore PSTATE.ZA to 0, the
> former is safer but the latter is more in line with the handling here.


Thx, do you suggest any remedies, id say sashiko is correct, but id hate 
for code

to get hairy :)


--- Thanks!



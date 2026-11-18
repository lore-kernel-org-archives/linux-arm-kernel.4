Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TuqXGRSw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AY961Grj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rTWxd+TS4ly6rOYqNqxpzFbo7LihUChogpGzZ95RqUM=; b=TuqXGRSwrot1rbnTFDIBvMv0lj
	xvKyTkUGdCpdwhaK0KoPihwPxwHa7PDLdQqcwUNPPo2UByhaXJ/eoK7/K6OFNW1Ul602xCKVOr1Xm
	9u9VErghfSj5SbjyRVYNUabIWq/Nxn96mHBGlFW2zyW76RQZ3YvWjrT9yW/uplre803mDjtQuwbx5
	pD37/0NyGKfG4F1HGTruV//6tB/KDENSTnYPek+jDow+PIbIV/FrOmFK+Avxmf6PcFDeWch7O6pQ2
	R0UExrhSX4KtlH6mxaoDbguX3g7GX5eCtJcUs9VD9l46PRC63gXhNtCfw19mWQntLdXpFW3jZqZoL
	O7/1/9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThoz-00000009M1a-2Bo7;
	Wed, 18 Nov 2026 15:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThox-00000009M0f-1df0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2714B339;
	Wed, 18 Nov 2026 07:43:35 -0800 (PST)
Received: from [10.2.213.11] (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4AD3F632;
	Wed, 18 Nov 2026 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016618; bh=rTWxd+TS4ly6rOYqNqxpzFbo7LihUChogpGzZ95RqUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AY961GrjxVInsjIcP+G2smTYjeTeREZ6UIg2fO6tKabgjt5V7KOWtZZhTpJ8grCFh
	 y6oE38jOUvE03V8mbnvKAO0UiJZlaWWOBKdPN82bVDGeT4jKFbXHbdP/YBr70eEcXf
	 8GeNkmHR1NWoyzUbaRAXtEqDVQIhP9xqpNiQMMhg=
Message-ID: <dddc12e4-bb27-4a55-98fb-de5c3d56e726@arm.com>
Date: Wed, 18 Nov 2026 15:43:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: entry: sdei: save and restore PMR for
 pseudo-NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-3-ada.coupriediaz@arm.com>
 <628b2774-30bc-4399-98c3-2d99ad5090b6@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <628b2774-30bc-4399-98c3-2d99ad5090b6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074339_473336_E4900A1E 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

On 18/11/2026 09:58, Vladimir Murzin wrote:
> Hi Ada,
>
> On 11/17/26 17:48, Ada Couprie Diaz wrote:
>> If using pseudo-NMI, PMR must be saved and restored on exception
>> entry/exit. We do so, and set it to a known value reflecting that DAIF
>> is masking all interrupts, in the regular entry path.
>>
>> Do the same for SDEI, as it can interrupt the kernel at any point
>> and does not mandate firmware to touch PMR, but does mandate masking DAIF.
>> This avoids potentially returning with a different PMR than interrupted,
>> and SDEI having the DAIF/PMR pair in a unexpected state compared to
>> the rest of the kernel.
>>
> I think we need to save/restore PMR into/from pt_regs similarly to regular
> entry path, otherwise regs_irqs_disabled() is still broken, like it was
> pointed in the thread [1] (and Sashiko has raised the same concern on
> FEAT_NMI series)
>
> Cheers
> Vladimir
>
> [1] https://lore.kernel.org/all/auzM-l40BLsT3clg@arm.com/

Thanks for checking, that's definitely what should be done, I was
a bit hasty...
Given it's a very simple code change (I rewrote the commit message
accordingly) I sent the proper fix as a reply to the patch directly.
Happy to send a full v2 if that would be better !

Kind regards,
Ada



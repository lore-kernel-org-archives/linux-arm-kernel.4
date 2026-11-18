Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96215606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBIR6nVE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JJ2dafGg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K4NkyNQl55qkbJjnFAwd9jt86qI8on7Uk9yqZAYyTso=; b=pBIR6nVEoxELpi
	KzDE/yphSGziCgpgHFbymsQWsVXYWVxVOpL5xggnXzIurlgcBgy54PXNWKOaUwb6qBr7JzlII8NX9
	XSNKm69f7Z6Vk/7fDIgBDQO6PIKUxQh5iArx+Scmlc2AjMt0R8MUFlkrty4RXCVqiSpj48tZ2ZClc
	FziL6VdwEGChuAMwPmIwbm5IRcpw1rK3oTHWc2IYs28TFQ51JkgOMGCa7JGD0+G610rZUAfVc0SwR
	uAKMcFkytqr4YzVpqPeWJ7fAr73gdfV0MBsRPg8cHyJppjisZ0/R4ZC1eVidflcVEU9sNxvOIEBQO
	0AdRIfrSmsMsgHGUSTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThT1-00000009FjH-2QbA;
	Wed, 18 Nov 2026 15:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSm-00000009FZc-1qfm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:20:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087701477;
	Wed, 18 Nov 2026 07:20:40 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4412B3F632;
	Wed, 18 Nov 2026 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015242; bh=EJfYRN3LhwoQl9ywZq/dF+WYhcJd4c60aePueCvbsdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJ2dafGgTzsI7JTe1SkpTkjx+Vpbr8HbUCX61I8vnoAtrWkQA0XJkt51FdkasQTpX
	 KEuyMVkiahZ8/nQYlkTTFiZmEVw3xr5rL2MaWWhSlcZsDCnatIpJ742Tdt79z8pDzE
	 XNnSfdyloiEsCdIMJUixnRQRvFN0jmlqJ0D/QS8I=
Message-ID: <66c8de52-298d-4772-892d-3e43d9e7e7eb@arm.com>
Date: Wed, 18 Nov 2026 15:20:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon> <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
 <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072044_553528_0369ADB6 
X-CRM114-Status: GOOD (  17.29  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 15:16, Fuad Tabba wrote:
> Hi Sascha, Lorenzo,
> 
> On Wed, 18 Nov 2026 at 14:59, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
> [...]
>> I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device
>> table before making it valid" in v3!
> 
> Thanks.

No, thank you!

> 
>>>>>
>>>>> The latter, though freeing memory on timeout wasn't a good idea given
>>>>> that there is no way to cancel the respective, pending, mapping.
>>>>
>>>> Thanks, that answers it. If you'd like a patch that doesn't free the
>>>> memory on a timeout, let me know and I'll send one.
>>>
>>> Thanks. Again, if that timeout expires I think we have more serious
>>> problems than the IST mapping but I do agree that freeing memory
>>> is not the answer; not urgent - please send a patch given that
>>> you spotted it, can obviously do it too.
>>
>> I've got some patches addressing the ITT and IST mapping issues in the
>> host driver, which I can include in v3 if you haven't already started
>> working on these. I'll make sure to include the appropriate Reported-by
>> tags, of course!
>>
>> I'll post a fix for the VMT separately as it doesn't belong in this series.
> 
> I haven't started on anything, so I'll leave this with you then.

Perfect - I was trying to avoid the duplication of work :)

> 
> Cheers,
> /fuad

Sascha


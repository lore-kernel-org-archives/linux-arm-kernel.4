Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkBp47+W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tera4tdh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z9c1zFsWXDHo689mQwpOhi6Fn3DBrnj+Q9G41hJhu+E=; b=TkBp47+WjE75029CpX8KAeCmxk
	+ZozxmtkYTlLxkQdDkB3KRWgFHsoAoKBs8mXo+4mN9DTvC0E9minNDc2bdwWLEIbJVGD3aT6hZugR
	VBiQDiLE+eWBmqrysHTp5HozetJu81M3JLDS3fz714TRfANTYJK9Mg9ufsDYC1RS8cUtgUoj252Ze
	WRAspSTH+8ZCOdrX9LlDFN08qzxQciTAIIOMtzwJiR9dgHcAUTI4B1sY5F07ACX+zMEMtRM9sC7z2
	XVrijMITSCKq/0NEXnMpdB2dASQuAh0mMFpMdsbpc8LISF5wmn27ObIDvQz/wQogmI8H4YY+Ri+DZ
	/8rzq83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN48-00000000TLp-2ekX;
	Mon, 09 Nov 2026 10:57:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN45-00000000TLE-3lkN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:57:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E48D81576;
	Mon,  9 Nov 2026 02:57:23 -0800 (PST)
Received: from [10.2.213.24] (unknown [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5D3F3F632;
	Mon,  9 Nov 2026 02:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794221846; bh=Z9c1zFsWXDHo689mQwpOhi6Fn3DBrnj+Q9G41hJhu+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tera4tdhCJ9uhUnrCN+O/Y3S9ujYF/Brro2cvC/AyUHVJJlATHBn7msiUYxjnFMqN
	 BiiCudGO471/42SyaiaC7pCz0Cq3tOeVe0mfnmYgyv+913It9DxXWGkYjk80YuzxWV
	 wY+/Va4fZbToqzB5GjMpjr9WoSXO6RjSwH9FFYQc=
Message-ID: <4f143547-0e12-4dd5-9a20-32ad27642834@arm.com>
Date: Mon, 9 Nov 2026 10:57:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
To: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
 <1bae50ad-a65e-4ccb-b247-8d9544e4c5ee@arm.com> <au4eDdjGkb9tn_T_@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <au4eDdjGkb9tn_T_@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_025730_001327_D99D6A7B 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, Kiryl Shutsemau <kirill@shutemov.name>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On 06/11/2026 18:35, Catalin Marinas wrote:
> Hi Ada,
>
> On Fri, Nov 06, 2026 at 04:14:56PM +0000, Ada Couprie Diaz wrote:
>> What are your thoughts ?
>> I understand that this is a completely different approach, but I feel it
>> would be more in line with what we already do for other entry paths.
> I agree moving this closer to the normal entry path makes sense and the
> PMR handling probably belongs there as well. However, I think there are
> implications for VHE (the handler runs at EL2 with VBAR_EL2) and for an
> event that interrupts a KVM world switch on the hyp vectors. I need to
> dig some more into this.
Ah, I was unsure about KVM, but that makes sense...
> In the meantime, I queued Kiryl's two patches, they're small enough for
> stable. Any entry.S rework can come on top of them for future kernels.

That sounds good, given handling KVM properly otherwise would
require more digging. I would be happy to have a look at such a rework
at some point ; I will bring it up with Mark R.

> Thanks.
Thanks,
Ada


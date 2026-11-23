Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F398606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fthqINs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BlDbpH9G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ssgL7DxzXbUZ7tJgWltGij1VtPlNzWyPW+YycDs+SSQ=; b=4fthqINsctR6cvDzhj9Tpr1f2+
	zevvTv2AJCRYBEuPLw7Hoeu2ECyUCLeBuvbT6INj1uI+PDmVFP27e0FpUubAFRsvq5BP0aC5Qco5I
	gbDHBNJSu8bxQuSNQjQQrNtu5QcdH36ySnlOfEE6gYPQk4cDLxtcWt67P7w26kQeM95xS9P+S4dKC
	BSZOQ1iIU+55i3jp1JNDu4+O++gSYey/pWe3KtSf4OPbR4sB1lXx7XkTRHJviZoTzOwX7imS/5w9Q
	xb9T90wofkw4ZLfxCt789pjbpnTR4vgspFyTMQKKzsr58PxsY/Hcq2U2IewJWTD0Pm8n5vwSeyyt2
	VAygFfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSD8-00000003BGq-2mRq;
	Mon, 23 Nov 2026 11:27:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSD6-00000003BGB-43eZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:27:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45116143D;
	Mon, 23 Nov 2026 03:27:45 -0800 (PST)
Received: from [10.2.213.11] (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D7323F882;
	Mon, 23 Nov 2026 03:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795433268; bh=ssgL7DxzXbUZ7tJgWltGij1VtPlNzWyPW+YycDs+SSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BlDbpH9GOBYSN/1fZzJq1X8wn0398nEuLJMN7Lftbd1i1Z+673bgMeFgBM73EZ+fD
	 TMCWiWL0SrE0T/ocQVq5iEnYFkaa7E9tkSksb8AWEWegoyBO6JmnO4ZNj+OyTh4ymr
	 R0cO5BUY8o0g9BEdQeTg7Xi2MY6QF7ixE36FCq/E=
Message-ID: <9b0461dd-0616-4c7e-9c03-6eca1e452a3d@arm.com>
Date: Mon, 23 Nov 2026 11:27:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: head: set __entry_task along with task setup
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-4-ada.coupriediaz@arm.com>
 <f232d0ff-3286-4d85-b9e3-cad8c6bc7178@arm.com>
 <2ce350f9-4dc4-480f-8a53-07ef9586d49b@arm.com>
 <av8sxUCg4m492Tx6@shutemov.name>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <av8sxUCg4m492Tx6@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032749_056978_5FFC5FB4 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Dawei Li <dawei.li@linux.dev>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kyril,

On 19/11/2026 17:09, Kiryl Shutsemau (Meta) wrote:
> On Wed, Nov 18, 2026 at 03:30:06PM +0000, Ada Couprie Diaz wrote:
>> However, as far as I can tell this is not the case for secondaries :
>> their first task on boot is set to the idle task, which they go to
>> without switching until (and unless) something gets scheduled on the core.
>> This would be the same path taken for CPU hotplug.
> Secondaries brought up at boot have run their cpuhp thread before SDEI
> probes: smp_init() comes before the initcalls. A CPU that was online
> before still has its idle task in __entry_task. So only a CPU onlined
> for the first time after SDEI probed can see NULL there.
That makes sense, thanks for clarifying.
So there is a very small window, only on first booting secondaries,
where we could see this issue, but it does exist.

Kind regards,
Ada



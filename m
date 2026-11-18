Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE27606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VDraVDbL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DG6E96UZ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BcWNdAZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pb2DkYgnWmb9+bw97jIJiTPdWJPNRHPP0cb+PUXqyRQ=; b=VDraVDbLferjOe
	rUXXs35jrQGJoEIji7KZjVJPSUq1PM4ogcxk488TJGH7/SrH8YQN9lN6m18uJaFI0jT34weL6u2j1
	ixspRMBhvpoz3TyloSf5K7cOC7fZJGMmndQL/GukPtmAHU7b1TzSTfH06CxeGpZd8iLJhjp8CEA90
	1qdmLblvYoSWH9Ik+DYYaWQx+zdThjawwPnXf0w8jzdfhVI8N2rxGzSXX/XpfAzyrlmSop2magIay
	H46vMvKcBLRzRmbpekBnsWo2D2DJNd6EM90u4/1AP1wh5bQk1G5XBIBGAi4bgIhc+7hP37cTJ7sLW
	WVRd46O4yQUekXzvtLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcC-00000009Imq-0aj7;
	Wed, 18 Nov 2026 15:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcB-00000009Ilg-1cDv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pb2DkYgnWmb9+bw97jIJiTPdWJPNRHPP0cb+PUXqyRQ=; b=DG6E96UZfUa8sKHX/cqlNMJtTj
	GfRPxjifmSuDD+0DVhGT1TzW4sxRtKVokF3l2Pm4kIHfmW6ZuxyxdGmunx+Ox61JqtXmhjoaLfR4K
	akQLVQ13peJtSFAuIe//WdwL1vw5HcSagFfpKgH6R1e2D2fUTG57kWRxcTHcKH+6MlWCKXN1DPfqC
	JxwNQvH+4MgPGr96njpA0VnL9t8RMo1gHorVO5gc6B1eNDp5EiKk4j8DRycYpN7DLpGTQZjDxBgQj
	Dk99IiarZqcHU+Wsuk2UsZ/gVsHWK2cTqxwbJDR4W51Erg5khOnbVWcC7ov39eDarb5kVzvc1H0Ci
	Zyr+eyQg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbw-0000000GD7M-2zxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CF641477;
	Wed, 18 Nov 2026 07:30:07 -0800 (PST)
Received: from [10.2.213.11] (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2FB03F632;
	Wed, 18 Nov 2026 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015810; bh=pe0bYMQLHpKIt4goswPEy6JNKEehOuA2ys1dJsrtcB4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=BcWNdAZPfIauVt3J95yHNQoW8WzeY7FQl0Rfy0Uzx7/YOqT2Fx2uKi70Mps5DtHbo
	 CKhVXiqqZfeCtl0LJfbCVuT3h2T8LErJ7edGpFIw4zyblTlMUKofqkahLtDrn+wcr8
	 No4tvr3RE7FbS+OwdcyDTJnmrR326HP4z1/xPvXM=
Message-ID: <2ce350f9-4dc4-480f-8a53-07ef9586d49b@arm.com>
Date: Wed, 18 Nov 2026 15:30:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Subject: Re: [PATCH 3/3] arm64: head: set __entry_task along with task setup
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
 Breno Leitao <leitao@debian.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Doug Anderson <dianders@chromium.org>, Linus Walleij <linusw@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Huth <thuth@redhat.com>,
 Dawei Li <dawei.li@linux.dev>, mrigendrachaubey
 <mrigendra.chaubey@gmail.com>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261117174814.95936-1-ada.coupriediaz@arm.com>
 <20261117174814.95936-4-ada.coupriediaz@arm.com>
 <f232d0ff-3286-4d85-b9e3-cad8c6bc7178@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <f232d0ff-3286-4d85-b9e3-cad8c6bc7178@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153020_671486_0364C48D 
X-CRM114-Status: GOOD (  20.50  )
X-Spam-Score: -2.5 (--)
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

[Resending for the lists, as I forgot to disable sending HTML,
  sorry for the noise !]

Hi Vladimir,

On 18/11/2026 11:01, Vladimir Murzin wrote:
> Hi Ada,
>
> On 11/17/26 17:48, Ada Couprie Diaz wrote:
>> `__entry_task` is only set after the first `switch_to()`, despite
>> a proper task being set up in SP_EL0 as soon as CPUs go through
>> `__{primary,secondary}_switched()`.
>>
>> As SDEI can interrupt execution at any time, it can interrupt before
>> the first `switch_to()` and use a null `__entry_task` to set
>> its current task.
>>
> TBH I do not know much about SDEI, but don't we need opt-in for
> SDEI before we can get any SDEI events? If so, can we really
> receive SDEI event before first switch_to()?
>
> Cheers
> Vladimir

I honestly do not know much either !
But, looking into the driver, we register the SDEI entrypoint
as part of the driver init in `arch_initcall`, with a few notifiers
(CPU hotplug among them).
If using SDEI NMI, we register an SDEI event callback within in this
driver init, in `device_initcall`.

Both of those are done in "late" in the boot process, in
	rest_init()
	-> kernel_init()
	   -> kernel_init_freeable()
	      -> do_basic_setup()

This is as part of the init task, before excve into userspace,
but after kthreadd is set up and has switched to the init task.

So, I think that it is not possible to be interrupted by SDEI
on the boot CPU before the first `switch_to`, as we would have
`switch_to()`'d the init task by immediately scheduling
from the idle task.

However, as far as I can tell this is not the case for secondaries :
their first task on boot is set to the idle task, which they go to
without switching until (and unless) something gets scheduled on the core.
This would be the same path taken for CPU hotplug.



Unless I am misunderstanding something, which would not surprise me
given the amount of things happening before getting to init, I think
that is is indeed impossible to get an SDEI interrupt before the first
`switch_to()` on the boot CPU, but that it is on secondaries
or after hotplug.


Hopefully this makes sense and, more importantly, is correct !
Thanks for bringing the question up.
Kind regards,
Ada



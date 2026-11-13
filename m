Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C2606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXB8dF9Y;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BsMAsBYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IRfMR7Uysivn/OfTnuJMGtnQ1T6ilEyAGllqjpAtomA=; b=rXB8dF9YUvAuRx
	+QCZXUL1SR4Vz4+2lxdmQom34zm9KXPFeQjNj6m5NaJD0lzkU15WcvcTcCy3JcdqZ/BHlnCsvdzND
	ue8UpS08gJNywfMaa+KxBdcWNtwaYsbzdez8bOAspuSshgljrhnhhVo1Gd6aWmd1WMOMBSiKyriiZ
	IQ/RX6xvp9vudYmmKa84hYQ8Bt9jpMhpEvX39ENLaOyLiE701DJNoWvbUQFOyLVXcqcI/WV9HrqyM
	1ZSpTo9BWOQJ6eUJ1XJzYXXOvm6okt34CUcswFrdfhegvbi7sX9PnM8MKX33+tYT/VsyUVk/32Ghe
	fErd9pFxwX5aeYC+uIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnXh-0000000CDRM-1VkY;
	Fri, 13 Nov 2026 09:25:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnXd-0000000CDQL-3Tul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:25:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F5061650;
	Fri, 13 Nov 2026 01:25:49 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A363F85F;
	Fri, 13 Nov 2026 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794561952; bh=mkkfCTT9dl5gUVAJ1cMVQKES2g/s7PDxr3Vhek1wXJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BsMAsBYKWrgwDGn2s4LbSq1Dg8vIjB3+d1v0sk8pdGZ7glVynu6xrm5vXEujAVWWs
	 3izI8QSpCkKMHPneoaHfooR1btuzLv0EcQft5qVsmtR7LUUlGl0Bg6C0oAC9ktaX0A
	 Yuk1Xp/t1TF7Jb09XEa7gENvNgdUkzXDFOtT6tO4=
Message-ID: <aef5eb45-66b9-41da-a784-4e4f5cc85f87@arm.com>
Date: Fri, 13 Nov 2026 09:25:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Content-Language: en-GB
To: Igor Velkov <iav@iav.lv>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113-coresight-pmpcsr-question-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_012554_145736_79C74E2A 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Igor

On 13/11/2026 05:46, Igor Velkov wrote:
> Hi,
> 
> Cortex-A55 (Amlogic S905X3) reports EDDEVID.PCSample = 0, so
> coresight-cpu-debug cannot use it. The PC is available through PMPCSR
> in the external PMU frame (debug frame + 0x20000, PMDEVID.PCSample = 1).
> A lab module reading PMPCSR caught the PC of a CPU stuck on a PCIe bus
> access with IRQs off; on this GICv2 SoC the stop IPI never reaches it.
> 
> Two observations:
> - A panic notifier samples too late: the other CPUs are stopped by
>    then, and on this SoC reading the PMU frame of a stopped CPU raises a
>    synchronous external abort. Sampling on entry to smp_send_stop()
>    works.
> - Marvell has an out-of-tree patch, "coresight: cpu-debug: Add support
>    to dump PMPCSR" (2023, carried in linux-yocto); I could not find it
>    on the lists.
> 
> Is PMPCSR support in coresight-cpu-debug planned or welcome? And how

Patches are definitely welcome, as such I don't know of anyone working
on it from within Arm. So, please go ahead and post it.

> should such a PMU frame be described in DT: arm,coresight-cpu-debug or
> a new compatible?

If the support can be detected using the "standard" cpu-debug frame,
via the DEVID registers, I don't think we need a new compatible.

But we can debate on it with the patch review.

Cheers
Suzuki

> 
> Thanks,
> Igor



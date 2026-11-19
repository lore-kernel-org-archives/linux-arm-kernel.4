Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZBAJDohD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OLFzMi3C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qhDgewckhTAxZg4Q1EFNbufCPZJ9KI9zsF3kjBoEHIo=; b=ZBAJDohDHm1k+J
	YAZneQsxdbCQkZNrYHJC/rI3XquHddJVKf+wVjtiasjKvFYZg2EWxMphfSdmSroRcn+dnfi2j1L8c
	OrMx3pamuQbDfBFaW27efjcMRROzN/Pj+/BRhq92XsnNGlM0pgyqv1J3iV1mS6pZtK5+3OElwqiI1
	OVNdmBffhQ/wo5I+BFcuGg1JNlkD4vMRUhs/4VlZnS9yfIflhcNkPeiHXxDR3ABrxXI78sep5720J
	TJypIul90ss+Qoo5MlqEmtYkeE5CtgTVSlQfXlRpXNI+bkM+CsufNosGoV3V48S9uxtZ9qbekbLC2
	RdyQv23aWck4j9f03y6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU09X-0000000BgIl-27rr;
	Thu, 19 Nov 2026 11:18:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU09V-0000000BgIE-1gRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:18:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20A41575;
	Thu, 19 Nov 2026 03:18:01 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875A03F882;
	Thu, 19 Nov 2026 03:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087084; bh=1VA80xa1IFSFRtdjJoZJWXCUehvXf434icXy0RCCMAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OLFzMi3CVpO2+N1dhvSV4dS8fwj529oImdkh32YHRZBjnxR2cANNeMm0o7fjv/WYH
	 tFvt2fdty8XtszEqHrucU518D++3f/Q/iL5IwD7hX4RJV9e5ncBPpx0qSW6zNTOVx7
	 kHu8poLQzDXfAd1IdjdtzZESdHjY/zE86afa4oMU=
Message-ID: <a2922d4d-8a52-40b8-b714-aa77fbbf1ba8@arm.com>
Date: Thu, 19 Nov 2026 11:18:00 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
 ruanjinjie@huawei.com, liaochang1@huawei.com, maz@kernel.org,
 Ashok Raj <ashoraj@qti.qualcomm.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <avfriMfmwF2Nzh0_@hu-ashoraj-lv.qualcomm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <avfriMfmwF2Nzh0_@hu-ashoraj-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_031805_502650_2B68C68A 
X-CRM114-Status: GOOD (  17.95  )
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

Hi Ashok,

On 11/14/26 05:03, Ashok Raj wrote:
> On Thu, Nov 12, 2026 at 01:20:03PM +0000, Vladimir Murzin wrote:
>> FEAT_NMI provides an architected mechanism for supporting non-maskable
>> interrupts (NMIs) and less-masked interrupts (LMIs).
>>
>> Since we already support pseudo-NMIs via priority masking, introducing
>> another flavour of NMI on top of the existing infrastructure could
>> easily become messy, making the code harder to follow and reason
>> about.
>>
>> To avoid that, this series first makes room for the new NMI "tenant"
>> by restructuring the existing exception masking logic.
>>
>> The main idea is to separate the logical view of exception state from
>> its hardware representation. To achieve this, we introduce logical
>> exception contexts that can be mapped onto the corresponding hardware
>> state. This naturally consolidates the hardware-specific handling into
>> a small number of places, while allowing the rest of the code to
>> operate purely in terms of logical exception contexts.
>>
>> Since this restructuring is non-trivial and carries a risk of subtle
>> behavioural changes, the series adds extensive debug checks to verify
>> that the hardware state always matches the expected logical state.
>>
>> With this restructuring in place, wiring FEAT_NMI into the new
>> framework becomes much more manageable. GIC support for NMI is build
>> on top.
>>
>> This work would not have been possible without the contributions of
>> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
>> them for everything that works well. Any remaining bugs or issues are
>> entirely my own.
>>
>> Most of the testing has been done on QEMU, Fast Model and pre-silicon
>> environment, so the series definitely benefit from extensive testing
>> on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).
> Thanks Vladimir
> 
> I have tested this series on QEMU and also another dev platform and they
> work.
> 

Thanks for testing!

> I have a small change, I'll submit after sanitizing my patch and running
> couple more tests. 
> 
> I haven't reviewed the series which I'll do next :-)
> 

Great!

Cheers
Vladimir

> Cheers,
> Ashok
> 



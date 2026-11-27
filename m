Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B52606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nzRz3jkv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XwawPmii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zx1oVhA6VmSJRgH/LGhZzA7qtz4N/i4xfifsR87MlB0=; b=nzRz3jkvmCXX/O
	dEaQAlHHW6RBkKuOttDaFEkt7fQ/QI7AIUqtNTifklosFTsNpY2uUOqZ06Tx9vriKhTACaBMN+K3H
	BW8a4/3GR+/jHh9m1XEeSTG3r+ytQjY3v6jrLr9EOPtJkl/unwIbS9v/TEisY09c8MOP43P4BXSQc
	cxz3/kdm8xIYDpfPgRTAZSCZWsh7nxABPdwqf/y57slSgCKtrWNAOBVNr0JGzaFDMXFtcUp9TB4l0
	2PZymVTeKQSLgg4NgZSVKL9RIbPPDh3sHfy0ad0dcE4LXYegqsAHprHXkAra1JeeQtd0+hlfJcHes
	GZS0npjiRejFw99t852w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyz7-0000000H7GU-2var;
	Fri, 27 Nov 2026 16:39:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyz3-0000000H7Ej-15Qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:39:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58E991570;
	Fri, 27 Nov 2026 08:39:33 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42E43F632;
	Fri, 27 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795797576; bh=XhGanY3aQ88emXTEaZk5qtH//VWHLvLWmlIfZRuWgzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XwawPmiiVgcGo4ddaZzciv06Q6JB/9Lp/Eiogo+D3FaM/zA2ofPdcYbP+1GvM0K5K
	 POTvta/F84ACVss1o4NNS/k+zjq8dApUR30yJj39bXs/u2SfmUwNdP1pg716b+DXXZ
	 AuncDOc2l1RekhOkfHV7jeCNKKwyGrvkfASsxkL8=
Message-ID: <73cf359b-365f-48fb-ae46-b6b3e13e1794@arm.com>
Date: Fri, 27 Nov 2026 16:39:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Enhance TLP packet decoder with field-level
 parsing and versioning
Content-Language: en-GB
To: Arnaldo Melo <arnaldo.melo@gmail.com>, linux-perf-users@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Sizhe Liu <liusizhe5@huawei.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bhelgaas@google.com,
 yangyccccc@gmail.com, jic23@kernel.org, john.g.garry@oracle.com,
 will@kernel.org, james.clark@linaro.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com, wuzongyu1@huawei.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linuxarm@huawei.com, prime.zeng@hisilicon.com
References: <20260908140509.2485649-1-liusizhe5@huawei.com>
 <aqB37YCMUYKodo3N@x2> <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
 <D6C7F85D-0A2C-4569-98FD-ADB616FA106E@gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <D6C7F85D-0A2C-4569-98FD-ADB616FA106E@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_083937_955921_1DB278EA 
X-CRM114-Status: GOOD (  11.20  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 16:31, Arnaldo Melo wrote:
> 
> 
> On November 27, 2026 12:12:14 PM GMT-03:00, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>> Hi Arnaldo,
>>
>> On 08/09/2026 22:02, Arnaldo Carvalho de Melo wrote:
>>> On Tue, Sep 08, 2026 at 10:05:01PM +0800, Sizhe Liu wrote:
>>>> The original hisi-ptt-decoder only prints raw hex values with generic field
>>>> names for DW0/DW1/DW2/DW3, without classifying TLP types or decoding
>>>> DW0/DW1/DW2/DW3 fields according to the hardware-defined packet format.
>>>>
>>>> This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
>>>> decoder in perf tool to provide detailed field-level parsing of TLP headers
>>>> based on message type, and adds a versioning mechanism for backward
>>>> compatibility both in hisi_ptt driver and perf tool.
>>>
>>> Series is sashiko clean by now, has a Reviewed-by, but it touches both
>>> kernel and tools, I wouldn't have a problem if it was processed by
>>> whoever maintains the kernel part.
>>>
>>> - Arnaldo
>>
>> Please could you add your Ack on the series, so that I can pick it via
>> Coresight tree.
> 
> Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Thanks !

> 
> But you could have taken my "I don't have a problem if this gets processed" by somebody else as an Acked-by me, documentation says so.

Alright, didn't know that.

Cheers
Suzuki



> 
> - Arnaldo



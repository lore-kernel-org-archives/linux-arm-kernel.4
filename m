Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91632606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJ6qpRLV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eMADFPTn;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnAfKrCM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tO0ZbVOvLqHdVD96cZJ5I5CAW5SvREXD0z4PFqcFHoY=; b=FJ6qpRLVIvoZ4L
	qCEa8+XJ1yy4jL47BRVLfkskjxePUrurCowI7AaWJutDTKTN8fX1ePyx/aFcOn814C1iLx+Cb/VBY
	cad16gLwlDvIEMLF1W9VBjb1vAPhXp4T0K8uwwNHWkiZeIv4qQUaP8ibcSw4pg2NrS/2lXdPzOPTp
	C0BcRfyP9ONlh2rE1hDUIu1Rw0FNan1E4UcSHVy9gl2HKW2nBiWiYhJ7xbzBAaytwU3Gns4jsNNBx
	gYdObVWTUii61mgBYwWdnRZ+UiM9lrge6neSLo93t3/kId70Vgj6k9qO8mc7oeyn0N8s+06Jv81od
	dbutoPUpNbqgPWqV6rlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsF9-0000000FRK5-2NO9;
	Fri, 27 Nov 2026 09:27:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsF5-0000000FRI3-0lEi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tO0ZbVOvLqHdVD96cZJ5I5CAW5SvREXD0z4PFqcFHoY=; b=eMADFPTnpRI6lNhqx4+DT125e7
	TjjY+2yIYh9/OWop9VRH4c0SvOpsnUWS9p6OFjqGLy4gmsdi2k9BZFkGM6vzXaavX346i8VLcSOua
	7kcp8mk+P182vQ7ZbeGuMIgF35w+pV7SO5pJrntqFPMqXBXjwVhnA+y6w7VmdV25e/XTp02bID66W
	SL9XQB/VajaYwTWwsvGuxdpnXZXGo/tWtZCq6GBN5VXqj5L7S//wXTWgGutCTmvgZDG/S/d36FqKr
	fHKzwOqwiloFw0ViWqv9C3AmdcYxk7OTvCqkfXEHxMjFJXM42vD24C7b7Ovt3JkBWq0gYFR9SL98f
	/Wqh14aA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsF1-00000007W5o-1qdo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:27:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6E7A1758;
	Fri, 27 Nov 2026 01:27:34 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D3F3F632;
	Fri, 27 Nov 2026 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771657; bh=daFvf/uPQyO5xYYQlAsUmRTZA1yhelIgKqaSBtUjSAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FnAfKrCMwrKa+dj6msQa5K4JLL4Et3Eb2mvzUrDDnjTZRMZ+WSpKAuzzyl4zEetfR
	 WgB2W8XY4YO9/tzOY2yR4moVHflxlS9UExsZCcxrpwqMlhojfMMS/5j+6LaZetlfFJ
	 OgooA0DaJ/6caXdyyOK9w7iqomTfLU+gvfz0o4H8=
Message-ID: <baf725aa-8814-4f0b-865a-150028d1a561@arm.com>
Date: Fri, 27 Nov 2026 09:27:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
 <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
 <20261111160528.GD9176@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261111160528.GD9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092739_580128_2BF14950 
X-CRM114-Status: GOOD (  14.56  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 16:05, Leo Yan wrote:
> On Wed, Nov 11, 2026 at 10:47:10AM +0000, Suzuki K Poulose wrote:
> 
>>> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>>>    		 * errors and as such buffer is empty.
>>>    		 */
>>>    		if (act != TRBE_FAULT_ACT_WRAP) {
>>> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>>
>> Do we need this though ? If the buffer has space left, we shouldn't use
>> TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
>> needs to re-enable the event.
> 
> Here setting TRUNCATED flag is intentional for fatal faults. The following
> patch restricts this handling to TRBE_FAULT_ACT_FATAL only.
> 
> We can consider this from two perspectives:
> 
>   1. We distinguish TRUNCATED from PARTIAL (see patch 23). PARTIAL
>      indicates a recoverable trace gap without disabling the perf event,
>      requiring tools to reset the decoder explicitly.
> 
>      In contrast, TRUNCATED streams contain ASYNC packets for decoder
>      synchronization, so reset decoder is not needed.
>   
>   2. The AUX sampling calls update buffer callback [1], any fatal faults
>      will set TRUNCATED to disable hardware and waiting for userspace to
>      re-enable.
> 
> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-16-35cf6f297d20@arm.com/

Fair enough,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


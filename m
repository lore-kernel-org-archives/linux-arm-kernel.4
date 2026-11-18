Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD30606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LJo4rOLI;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=TGHllOXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I3smdXzbgBpgrivukeP0fqIaIFjz2n/NTWdA0NUSV/Y=; b=LJo4rOLIs7urGP
	WobxUiQj4vVgkXU8CgqvKw7CuvNx1DxVw20DxmByw8rQZX+xHd9oVhcvXrQXCk2gplfYfO0dnQuew
	8cVmnQNi9Bh3bEfoaTS9rsXf4UHI2DhPhkZi7y90q0rlFO3ef+qDHY5dLSF5bRN4aQCInSx2mCqUX
	YVuC3VqO39Y8+lbLQdG/RkyjJnk0YWfCqGjCoTCuWZiR7MSZjvr0JVNA+dGWlnCkpPpFJveGsLNKA
	G/umIgWqGSD3skgD3njNRTdtaGIIbKQ/9FQniXM7Zy3kEzqANJY3edIbqRyCd11mwTYJmiT1uOJT6
	v7A4BXJPWdEqn2gTWRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc1M-00000008OBE-188n;
	Wed, 18 Nov 2026 09:32:04 +0000
Received: from mail-m1973172.qiye.163.com ([220.197.31.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc1I-00000008OA6-2rTX;
	Wed, 18 Nov 2026 09:32:02 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551f9ad52;
	Wed, 18 Nov 2026 17:16:55 +0800 (GMT+08:00)
Message-ID: <daea6316-bf37-4b9d-92a7-945f34cd719d@rock-chips.com>
Date: Wed, 18 Nov 2026 17:16:54 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in
 rocket_job_handle_irq
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Drake <ddrake@baylibre.com>, Chaoyi Chen <kernel@airkyi.com>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
 <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
 <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1edf1e46a03a7kunm2355c227669381
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0pOVkIaSUwaHU9IGB8eQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TGHllOXgyJL+s/aCvjVJ5CotwyJ8QVPI/4twhwqsW0yPCG59Dyci1TvNZNY8uF8lkHn6iTHPcu3BYeeZYEJT9vDcaSjDLjsPIqJAta/qrMpcE3P2omQfiW8faKgRjBQWz6EtL+tRQMpKvJkTaMMD1RO2aMNdNB/oU9TNuILOP3c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=I3smdXzbgBpgrivukeP0fqIaIFjz2n/NTWdA0NUSV/Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_013201_202805_96C0126A 
X-CRM114-Status: GOOD (  22.97  )
X-Spam-Score: -2.1 (--)
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

Hi Tomeu,

On 11/18/2026 4:58 PM, Tomeu Vizoso wrote:
> Hi Chaoyi and Daniel,
> 
> On Wed, Nov 18, 2026 at 3:29 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Daniel,
>>
>> On 11/18/2026 5:53 AM, Daniel Drake wrote:
>>> On 14/08/2026 03:24, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
>>>> in rocket_job_handle_irq(). Calling  iommu_group_get() in
>>>> rocket_job_handle_irq() causes the reference count to increase
>>>> unexpectedly. And this causes rocket_core_fini() to fail to release the
>>>> IOMMU group, leading to a resource leak.
>>>
>>>
>>> While there is a leak here, I think sashiko correct in saying this change would introduce a crash because core->iommu_group can be set to NULL before this codepath is reached.  That might be a simple fix.
>>>
>>>> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
>>>
>>>
>>> Wrong commit mentioned here.
> 
> I fixed this one when applying.
> 
>> Thanks for you review. This is indeed a problem.
> 
> I'm sorry but I had already applied this patch to drm-misc-fixes and
> pushed when I read this. I have looked at fixing just this crash, but
> have decided against it because we anyway crash in drm_sched on core
> unbind whenever a client is active (no need to have a job in flight),
> due to the sched entities keeping a reference to the stale scheduler.
>

Oh, that's true, but it seems no merge notification email was sent out? 

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c4aeafcac8c46be7b08b86795baa64453eb68aa
 
>> And it has been a long time since I sent this series. :)
>>
>> During this time, I have seen a lot of similar work. For example, work
>> similar to patch1 is here[0]. And some of the issues mentioned by
>> Sashikoare also being fixed by in-flight patches like[1].
> 
> Core removal needs to be fixed as a whole: detach the open files'
> entities from the scheduler that goes away, complete or cancel the job
> in flight, and quiesce the job interrupt before the resources it uses
> are released.
> 
>> I'm not sure whether I should slow down the submission, since it seems
>> Tomeu is quite busy and hasn't gotten to some of the backlogged patches.
> 
> I'm sorry about the big backlog of patches. With Heiko and Daniel's
> help I expect to get it cleared soon and be more responsive.
> 

Thanks for your excellent work! I think patch4 could also be merged? 
That way, people on the rockchip mailing list can also conveniently help
us review these patches. :-)

-- 
Best, 
Chaoyi


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AciBnqXA;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ef/WcXmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YqKHThxqhV+Nx5LE0AW1AJg3y+A6AtDJSvDAZKmD6X0=; b=AciBnqXAXBjyHq
	JeUYsMhCzVQbV5CzngtHnPRUqkQNNyJljOvspygHP3eQ9h77pmQL+uDuMxKwo/VdNdsU7CsOV9dG3
	aa/mY9zkihvWXUkG2vn6khZVNzMeeXXJiqt7c9SpRbFQwYao9AUuO0+fUC/IKv2RHxEvDQZxLh3MT
	TGyObW6WU6a3Q2d3ctL93n4HUD3pJ0diKkjS3H7MtDR31WFGaB3ADuXVBvL2XOoQKKGtX46jr8QfN
	MBqp6OpUlSTHwE7Bt8JKdNupMX6WBDPi5tmBO7LydEnlAdl6M+TFWKInYJ7eQnr6hxlVN5sNi80Cw
	T5qihh5jQy9fFX9EseiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVQc-00000007X68-2tKD;
	Wed, 18 Nov 2026 02:29:42 +0000
Received: from mail-m8151.xmail.ntesmail.com ([156.224.81.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVQZ-00000007X55-0qAd;
	Wed, 18 Nov 2026 02:29:41 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551083689;
	Wed, 18 Nov 2026 10:29:28 +0800 (GMT+08:00)
Message-ID: <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
Date: Wed, 18 Nov 2026 10:29:26 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in
 rocket_job_handle_irq
To: Daniel Drake <ddrake@baylibre.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260814022453.437-1-kernel@airkyi.com>
 <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ec7cde4b03a7kunm8a7c13a3602732
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lCVh4YGUseSkwZSEoeTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ef/WcXmRp3/JbdOl57cgcDsCjcrruOWIRVodPFUgqkBMQqGs1kxCk0jmzFrzuctBz/6RlanWo3XJ1Cv0IwLohI21kkIj7ZIDhYhpR0KgqQxS4A6eoDGr/XCwY6y1812V19zHiluIVZLBRYmffrSRlcepE1R4QcMPncOQLR5Fd4o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YqKHThxqhV+Nx5LE0AW1AJg3y+A6AtDJSvDAZKmD6X0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_182939_867316_10EA69E7 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Daniel,

On 11/18/2026 5:53 AM, Daniel Drake wrote:
> On 14/08/2026 03:24, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The rocket attaches the IOMMU group in rocket_job_run() and detaches it
>> in rocket_job_handle_irq(). Calling  iommu_group_get() in
>> rocket_job_handle_irq() causes the reference count to increase
>> unexpectedly. And this causes rocket_core_fini() to fail to release the
>> IOMMU group, leading to a resource leak.
> 
> 
> While there is a leak here, I think sashiko correct in saying this change would introduce a crash because core->iommu_group can be set to NULL before this codepath is reached.  That might be a simple fix.
> 
>> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> 
> 
> Wrong commit mentioned here.

Thanks for you review. This is indeed a problem.

And it has been a long time since I sent this series. :)

During this time, I have seen a lot of similar work. For example, work
similar to patch1 is here[0]. And some of the issues mentioned by 
Sashikoare also being fixed by in-flight patches like[1].

I'm not sure whether I should slow down the submission, since it seems
Tomeu is quite busy and hasn't gotten to some of the backlogged patches.

[0]: https://lore.kernel.org/all/20260915041152.1725014-1-vulab@iscas.ac.cn/
[1]: https://lore.kernel.org/all/18667b2afdcaae217fa1038f5348ab23ed756bdc.1794615323.git.gahing@gahingwoo.com/

-- 
Best, 
Chaoyi


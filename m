Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18626606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lVLeRr3j;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hCIlTlgF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yuxn6nAj6P3P6ckbI3C72QXKUgrDwijmCt+4xPmcvBg=; b=lVLeRr3jmIaQH1
	1mR3SghXYxbXHdWWP5XRVdzCuGozyZFeVJplPtfuls2p4JLLJiMw3L8DQgslgPrMYw4L2ic7q0VYk
	2/dud4mQuZ8iSg2UYhiJZldkof4jIszc6bWN27OYa6UYrpdWn/f9n7+/492r516R4AXMeyApdIyrO
	/EFTabSqfycuW+hq0CciuZpKJOlWmNBq33yRV3AaGcXW186O25gtdff+fN5DyQrPw/MT0wKibNxW+
	7VR4ve4Uk6DjOKcquTAXWxxYJ/40bzli6zctzCbFEksq34rxrEcnhBJ3sONSw2CDDTkA/PP84Kbj0
	kJgm2QOK7p8R3uyKdhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3I2-00000005yp0-00r7;
	Wed, 11 Nov 2026 08:02:42 +0000
Received: from mail-m16023653109.xmail.ntesmail.com ([160.236.53.109])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Hx-00000005yns-16DG;
	Wed, 11 Nov 2026 08:02:40 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54484c7da;
	Wed, 11 Nov 2026 16:02:32 +0800 (GMT+08:00)
Message-ID: <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
Date: Wed, 11 Nov 2026 16:02:30 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, aiyengar1990@gmail.com,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <7e053777-31ee-4127-af53-0820e852d375@rock-chips.com>
 <10924894.NyiUUSuA9g@diego>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <10924894.NyiUUSuA9g@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c9a1463a03a4kunm2b6e8798a32d5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk1DQlYYHUNKTR9OSU
	5PH0pWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hCIlTlgFF/kKTXUuZVx/XhX8o7QJdJ+96qL0DuZYrqBXvyGZPtEdoBeK+UO2IOftGEVA1yGcuB+UBEdSIvIcdwHKA4SjzmpOygnm9r+Dem6PagJBcf0HDmlACy3u6ESAGYis6gwxdbHTUhLuAuu4JaNmq1l/tS+DGnRhn5VOxMI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Yuxn6nAj6P3P6ckbI3C72QXKUgrDwijmCt+4xPmcvBg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000237_900529_9CCB2D74 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Heiko

在 2026/11/10 星期二 16:49, Heiko Stübner 写道:
> Am Dienstag, 10. November 2026, 09:40:44 Mitteleuropäische Normalzeit schrieb Shawn Lin:
>> Cc: Simon and Finley
>>
>> 在 2026/11/10 星期二 15:11, Arun Iyengar via B4 Relay 写道:
>>> The MMU-600 in front of the PCIe controllers of the Rockchip RK3588
>>> (mmu600_pcie) is enabled for every RK3588 board, but its node describes
>>> neither the power domain it lives in (RK3588_PD_PCIE) nor its clock
>>> (ACLK_MMU_PCIE). Both are held by any enabled PCIe controller, which is
>>> why nobody noticed: on a board that enables no PCIe controller in that
>>> domain (an Orange Pi 5 with its M.2 slot in SATA mode, or any RK3588
>>> board without PCIe), genpd powers the domain off and the clock framework
>>> gates the clock as unused after boot, while arm-smmu-v3 stays bound.
>>> At reboot, arm_smmu_device_shutdown() then writes CR0 and polls CR0ACK on
>>> the dead block, the interconnect stalls, "reboot: Restarting system" is
>>> never reached and the board only comes back ~90 s later when the
>>> watchdog fires.
> 
> We have a work-around for that in some boards, manually disabling the
> smmu until now. As the SMMU is part of the SoC and always present
> the general DT practice is to have it always enabled, as it does not
> depend on the actual board design.
> 
> Hence we end up in the situation described above.
> 

I notice that mmu600_php is disabled in rk3588-base.dtsi. If describing
the SMMU that way is incorrect, should we enable mmu600_php as well? I'm
asking because I see a different picture in the RK3588 TRM: both
mmu600_php and mmu600_pcie reside under PD_PHP, not PD_PCIE. Therefore,
even without any PCIe controller enabled, PD_PHP should remain powered
on (it is never added in rk3588-base.dtsi, so it should be outside the
kernel’s scope). How does the original problem occur in that case?

> So this series fixes the actual underlying problem, making these
> workarounds unnecessary in the future :-)
> 
> 
> So definitly thanks a lot
> Heiko
> 
> 
> 



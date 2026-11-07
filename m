Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 02:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=InuP0mNO;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hvJR7mQK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z8Cc7N+D8LwMYtORpVehAaXnRfBR/5w4HT9eKf1jaIE=; b=InuP0mNOxZjP76
	QDD/q7GPiEcudI1Ty56FMEh0g7gHARVdR28q5L+EkD1D8QRgvUBSf7p4x932JexrwD/jsKr/Crjb5
	FwU05xHoKAsa1EAr2KpoxozvZiuhwnJbI97ND6Du9QJPRSpG/lgSF3QE3LMeUdrtOMMomZaSkzrmA
	5y1rbCKMGdoxUnAI5MH2lbuhBO5+Il2xmbYJWPqZp3Eyvtbt32Lics5XZLYrMx6er+Ym7lQM0aMae
	mwQIdN2ZI9Ed//3Z+0rb4/5OhUhDT6VOFKsxd6JLUfBvB6TQrBx74LF047n9fEr2qb1cUZzrCyEeA
	aEFaKGf5Xb1Q9lfyCiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWH3-0000000E54Z-0AJW;
	Sat, 07 Nov 2026 02:35:21 +0000
Received: from mail-m822136198.xmail.ntesmail.com ([8.221.36.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWGy-0000000E52h-394w;
	Sat, 07 Nov 2026 02:35:19 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53d327815;
	Sat, 7 Nov 2026 10:35:05 +0800 (GMT+08:00)
Message-ID: <6c9adabe-d632-471e-8fc1-aafe62115167@rock-chips.com>
Date: Sat, 7 Nov 2026 10:35:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, =?UTF-8?Q?Enrique_Hern=C3=A1ndez_Bello?=
 <ehbello@gmail.com>, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, robh@kernel.org, heiko@sntech.de,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset
 a JMB585 on RK3399
To: Igor Velkov <iav@iav.lv>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
 <4316c1da-f7ff-4fa5-a330-512800474e45@rock-chips.com>
 <20261026-rockchip-pcie-shawn-reply-1@iav.lv>
 <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
 <20261028173117.3457220-1-ehbello@gmail.com>
 <20261030-rockchip-pcie-s2idle-a53-1@iav.lv>
 <20261106-rockchip-pcie-ltssm-trace-1@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261106-rockchip-pcie-ltssm-trace-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1b3dc0c7703a4kunm35aff5ba43fb5c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH05IVkodTkMdQ0MaQ05DQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hvJR7mQKfA7FUkt0VirpverykUfmFAKCqEGfnoaFE19hYtPSjIDT+bQoNAzsni6ZjJ95cow7WggmSs3Gwjfm/stmx3uITTnBYv6AeFs0jQ/stl/IBgUbjN5LMFgjxQuqQuh+G7tvz2bLzeP3wYkGUl53+ShdslJ2whRbz7l7gWA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Z8Cc7N+D8LwMYtORpVehAaXnRfBR/5w4HT9eKf1jaIE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_183517_776742_EA86C17C 
X-CRM114-Status: GOOD (  22.78  )
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

在 2026/11/06 星期五 13:09, Igor Velkov 写道:
> Hi Shawn,
> 
> I traced the LTSSM on the Helios64 (RK3399 + JMB585, x2, 2.5 GT/s) by
> polling PCIE_CLIENT_DEBUG_OUT_0 about every 2 us during link training
> and the waits after it. This changes what the RFC said, so here are the
> data and a question.
> 
> A failing link bring-up looks like this:
> 
> - the LTSSM reaches L0 as fast as in a good one;
> - then it leaves L0 for Recovery (RcvrLock/RcvrCfg/Idle, about 5 us)
>    every 199..204 us, for as long as I watch: 488 times per 100 ms;
> - link_st in BASIC_STATUS1 becomes 3 only 15..47 ms after training
>    starts, or not within 700 ms; the latter is the "link training gen1
>    timeout" with LTSSM 0x10;
> - the RC shows nothing: AER and the device status are clear, and a dump
>    of the client, core management and root port config registers is
>    identical to a good bring-up.
> 
> A good bring-up has no Recovery entry after L0. A config read on a bad
> link gets no completion; that is the abort I reported. 200 us is the
> optional Flow Control Update timeout, so I suspect that one side does
> not see the DLLPs of the other.
> 
> The state survives Recovery but not Detect: a port re-init or a hot
> reset is just one more bring-up, with the same odds. So the hot reset
> of patch 2/2 does not cure anything, and the time the link takes to
> return is not a reliable sign either.
> 
> Unbind/bind cycles with a bad bring-up (a cycle is one training plus
> one hot reset):
> 
>    Helios64, JMB585, x2                     6 of 104
>    same, PHY refclk 100 MHz from NPLL       4 of 33
>    same, num-lanes = <1>                    0 of 104
>    ROCK Pi 4A, WD SN770 NVMe, x4            0 of 100
>    same, num-lanes = <2>                    0 of 100
> 
> So it takes both lanes and the JMB585.
> 
> Is anything like this known for the RK3399 with a two-lane endpoint,
> for example lane-to-lane skew of the transmitter, or a PHY setting that

I didn't know an issue like this. But yes, there is an option to disable
the automatic deskew adjusting algorithm by:
phy_wr_cfg(rk_phy, 0x6, BIT(1)); // dis auto deskew
phy_wr_cfg(rk_phy, 0x4, deskew trim value); // deskew value, 0x0 <-> 0xf
phy_wr_cfg(rk_phy, 0xb, deskew magnitude vale); //Default 00 is 2x, 01
is 1x, 11 is 3x and 10 turns it off


> affects it? And is there a bit in DEBUG_OUT_0/1 that tells which side
> directs the Recovery?
> 

These debug section lies on  Appendix section of PCIe chanpter, RK3399
TRM. You could try to find some clue by dumping DEBUG_DATA_OUT info.
Most kinds of these problems should be obvious to the PCIe analyzer
but might not be easy to check from the register IMO.

> Both boards ran the same build: v7.3.1 with the Armbian patches and the
> tracing. The Helios64 DT has no ep-gpios there, the ROCK Pi 4A DT has.
> 
> Thanks,
> Igor
> 



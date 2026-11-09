Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A2606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lakrt+wQ;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RSzMaBpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=We4ESE2til4bSkM1vEMn0soL7vZrg8WY8DZ2Y26nFnk=; b=Lakrt+wQAIHUAz
	iTuRyCZ9VPfKBTh2GV2hE+3sgOr5QE+f0aIylkMjE/Y6E2pRZzfOnEAJ7UzCysSrtOzs66RVeTud+
	8BxYL1xjB9zc94KRzWrhDke0wWE0DzVeLQweiy8nzsPovXkv62j0cLFW9P9Dgp/6Hy+a79gey23br
	cKpmp8ZXCSYLwCSiKLmvXAjepk7crIe6kUFRFaMkgYySk9PikNlZjyb5/EqheDwOeHlCOAyhLepXX
	Rx4qgvx5My+tRa8dP/tWA1CzJigREm7+ABstOrj0wWxKsotgYgEdwij8KTF7GS3F+cKYQBybgNdiX
	kLCAFszqJQyTbQ5D8ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEmr-0000000H6NO-0Zoj;
	Mon, 09 Nov 2026 02:07:09 +0000
Received: from mail-m9352.xmail.ntesmail.com ([103.126.93.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEmo-0000000H6Mv-01r6;
	Mon, 09 Nov 2026 02:07:08 +0000
Received: from [172.16.12.48] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53eeadfd9;
	Mon, 9 Nov 2026 10:06:57 +0800 (GMT+08:00)
Message-ID: <60fbb95c-63cc-4d22-9e2b-51332a50054d@rock-chips.com>
Date: Mon, 9 Nov 2026 10:06:55 +0800
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
 <20261106-rockchip-pcie-ltssm-trace-1@iav.lv>
 <6c9adabe-d632-471e-8fc1-aafe62115167@rock-chips.com>
 <20261109-rockchip-pcie-deskew-result-1@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261109-rockchip-pcie-deskew-result-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1be0f01f703a4kunm84dec09857da6c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0hKGlZIH01CGUNDTk
	5MQk9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUJCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=RSzMaBpzKBX5tqLpuWQ15ZQyFDH114v8q2IeBzHG+Vp+GQV3bxrhL7Kcukqj4D585i+sB7hqCNAmmV5+6/8cW1TRIEKMKs7Cvk18QPkUaOOQk3gusQTpcjDlblAIqw8/pktunXi45CRaK61wjrAV/kL9AvGg/8sY2nt5fnKVZUg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=We4ESE2til4bSkM1vEMn0soL7vZrg8WY8DZ2Y26nFnk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180706_615483_3C16E329 
X-CRM114-Status: GOOD (  15.11  )
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

在 2026/11/09 星期一 7:05, Igor Velkov 写道:
> Hi Shawn,
> 
> Thanks. Deskew makes no difference. Helios64, x2, bind/unbind, variants
> alternating every cycle, bad link bring-ups:
> 
>    defaults 6/104, auto deskew off + trim 0xf: 5/104
>    defaults 6/104, magnitude off: 6/104
> 
> Your mail has the magnitude at 0xb, but TRM V1.3 part 2, 17.6.10.1 has
> TX_TERMINATION_TRIM there and DESKEW_MAGNITUDE at 0xc, so I wrote 0xc.

Sorry, my typo.

> 
> DEBUG_DATA_OUT did show something. With Debug Mux Control (0x208) = 5,
> share of samples with in_dllp0_data_valid set, 100 ms window after hot reset:
> 
>    good bring-ups 0.16% (99), bad bring-ups 51% (3, range 45-53)
> 
> The first training looks the same: 0.15% (97) against 47% (5). mgmt_dllp_error,
> crc32_error and in_tlp_error stay 0 in all of them. With the mux at 4,
> start_replay, replay timeout and dl_protocol_error stay 0 too.
> 
> So in a bad bring-up the RC receives a constant error-free stream of DLLPs.
> I read that as the JMB585 repeating flow control init because it does not
> get what the RC sends, but this bus does not show the DLLP type. It would put
> the fault in the RC to JMB585 direction, on x2 only.
> 
> Is there an RC transmitter setting worth trying for that, such as swing or
> de-emphasis? If not, I will stop looking for the cause here.
> 

Reg 0xa is for swing, it says: "This value should be set to (64-56*0 .9/
VDD09) depending on actual voltage of VDD09"

But de-emphasis is fixed in each kind of bus speed.

> Igor
> 



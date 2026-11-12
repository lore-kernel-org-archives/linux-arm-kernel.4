Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDD606A880
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L0izdgUc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=NAA3skTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b/4UOiXvF4Fr1l92XLmjcr1eg7nNlBSU5NS1Fo/IyFE=; b=L0izdgUcSZk/0Z
	UcRvOQIurNmKzDzbN/Pgn7nkHQpq3ee7td0sKA/hgG+KeMmny3tnWB6LjG2AYWKHQbyl5H8E0Ling
	73ZVRi23s7NEB0yPxYXXyLu1XSEaOzcIZBV7U7JZxqX3No9uT2QZ6gekL2eFAzW7oJgvx19+uYaaa
	tFedkVKrAimuersgnZldJEbJGY6chxHVVmpnQ23TVBIx3jDwCApTKIU9IhL2rHpKoBXIeHT03VF2q
	RsBiQnksaKHPeoSZfYoO/a2Hquds229gbewbrDMNU4ZSVTrd72gMrlbiuzWhT7ppJ5C6ghN5TIZj1
	uZxbwMysBGxp3I7ROnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVZ7-0000000ADQc-3fYk;
	Thu, 12 Nov 2026 14:14:13 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVZ4-0000000ADPp-4AGb;
	Thu, 12 Nov 2026 14:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794492841; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LuyQY12bW/Z83IwfAOxYJxZ41E4wry34UxveT0D7p1+KeG7vuh/g3/Z4PL/QiweY1cAObHPOqdNN/ST9ovLVoulqLB6bQcsSTjpu6+AM2Ic610a4k2B4uTEqtRfchqN3tPwu9RVXJDXtLkU6M0IGvzogik9csYMt7ietj2/S8js=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794492841; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b/4UOiXvF4Fr1l92XLmjcr1eg7nNlBSU5NS1Fo/IyFE=; 
	b=Jh3Jwp/xcKr3QKgJDQDf4E73hZu+wtI6ebEk8TbtrWlJP3CZ3MCU6v+pPsoAksowh2AxTMeOVC88QvUJRBWyiUjmn39z10Wfj6SFAwyNTbQsd4y688beAE9MMxDrreNbjzLFt1UAHYle0tb/I2Nc2jHyyiRzD5tU14dDYcElZ2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=NAA3skTkaOCGS4WxaR16OMOYO4CU8JVVcpLMtoI7vIovt4Dfwq56POyv8ssffi5G2sLrZk5OMqH5Z9I5dqeVZXLfMkODQj1dVWmhQg9vXsc96zy1cvmu6WHRHj/Gvwhr50LP6e9o0juz27pfKKS/2LPFjTjLzkGAov5QTWIWmCM=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=b/4UOiXvF4Fr1l92XLmjcr1eg7nNlBSU5NS1Fo/IyFE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794492839836438.0202804362593;
	Thu, 12 Nov 2026 06:13:59 -0800 (PST)
Message-ID: <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
Date: Thu, 12 Nov 2026 15:13:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Philipp Zabel <p.zabel@pengutronix.de>, aiyengar1990@gmail.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>,
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com>
 <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061411_163012_FC622B49 
X-CRM114-Status: GOOD (  10.84  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Le 12/11/2026 à 11:19, Philipp Zabel a écrit :
> On Do, 2026-11-12 at 08:30 +0000, Arun Iyengar via B4 Relay wrote:
>> From: Arun Iyengar <aiyengar1990@gmail.com>
>>
>> On the RK3588, the resets of the AV1 decoder include the AXI and APB
>> bus interface resets (SRST_A_AV1_BIU, SRST_P_AV1_BIU), which also cover
>> the Verisilicon IOMMU of the decoder. When the driver is unbound, the
>> driver core runtime resumes the device and, through the runtime PM
>> device link, its IOMMU. hantro_remove() then asserts the resets, and
>> when the IOMMU autosuspends 100 ms later, vsi_iommu_suspend() writes to
>> its registers while they are held in reset, which raises an SError and
>> panics the system:
> If vsi-iommu accesses require these bus interface resets to be
> deasserted at certain points, why doesn't it request its own reset
> controls?
>
> Depending on implicit assumptions like another driver not asserting its
> exclusively controlled resets seems fragile.

There is a side note on IOMMU doc saying that once the IOMMU has been
enabled it can't be disabled for security reasons.
That means that writing 0 on VSI_MMU_AHB_CONTROL_BASE register in vsi_iommu_disable()
could raise an SError so I would suggest to remove this line from IOMMU driver.

Regards,
Benjamin

>
> regards
> Philipp


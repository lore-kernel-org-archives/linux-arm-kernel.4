Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C98606B661
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nNUi+Vay;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=WC6QlWbz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IcVw3g/JBjj6GtqZdIE2sYgdy1L6jP6M45BK0w8hcZ4=; b=nNUi+Vayp/lpXF
	nESSDbHI+YCVtYM7jAZvJ5XaTKfgGN5Jw31n0zILDMOhqbIDk+/pE49SehwGy2ibMAJBknPhHNsoq
	OkDyHqncu1x0oTR6urn8CRGaL47wfYYOC4X4FLWGLThBRW/5qPCyhx0F7WtkOnvHnhBt1j8X9ziZ9
	cjmXYv3MtUWZSJcvkTNITZYJCDJpXkKVNfQHujWCt5yRYiJteMhnHJae7WeWArFWh4fhXcySHQzNM
	WJTyS/WzeN50tPKHfAjnb+FtcrotNDkyezqtaezmBVaaQP4bUSa1F9qnLFb/0jyMW4MYDL8Ejzarm
	dZeDtsfp74xQHwcheSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl1C-0000000BnpS-3Uis;
	Fri, 13 Nov 2026 06:44:14 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl18-0000000Bnp3-407C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:44:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF34310E5DE;
	Fri, 13 Nov 2026 07:43:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794552240;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IcVw3g/JBjj6GtqZdIE2sYgdy1L6jP6M45BK0w8hcZ4=;
	b=WC6QlWbzVFDK0TvsKdEBz/ON16SyDumh36HZf7TAzJQ6/KYt/ANF8PKz/46gaRMxDI9Ul9
	uNvgEOfQStPaE4BVsZeDmndmomSEzu3Qp2WUulW1h6cMLdVzgqlw1jATr5L+3Bx/S6Ye11
	oIIAr6MyZ81BZqaI48ryS+aRKaZ0076X46BImlWcwrnvFNxL1UVGPzcMMaRiwt3s6LNECp
	HP3EFlnxc5JLZ4M44aZQAGzuBMsKdOYduFwnU8NNWTpOj80j2G0/Iz4FPzxMTmMCM9cznQ
	oBu1C46pMDMJgL6yOOzAIqIzDEsjSosIodwD8vB46dx5MEVJI5p8uh+1KhJoqg==
Message-ID: <077477f7-3b1e-4ed5-ac53-45ebc01c47d9@nabladev.com>
Date: Thu, 12 Nov 2026 13:35:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can:
 Document Microchip ATA6563
To: Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <179447423905.428303.6835437411622016722.b4-ty@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <179447423905.428303.6835437411622016722.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_224411_224419_3E1900C8 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 10:03 AM, Vinod Koul wrote:
> 
> On Wed, 30 Sep 2026 23:46:38 +0200, Marek Vasut wrote:
>> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
>> It is pin-compatible with TI TCAN1042 and has a compatible programming
>> model, therefore use ti,tcan1042 as fallback compatible.
>>
>>
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
>        commit: b338621a7e68bb9dc91d08e1774262deb0db50f6
Thank you.

Frank, I think you can now proceed with the rest ?


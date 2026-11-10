Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D444606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zo8XoRRX;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jBG5EcGP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5LxM/zW32Rd01ubKGpE8Na9mT8q2E7+7oK0A4eJKMjo=; b=zo8XoRRXpmL6M1
	9chmrylXeIbI/GGFjlqeMNWLL6ODe8LsZZto7Pxo2Un9Z+oJF+lfYM3nJmauxbY5bl/DPmM5VTANg
	2jH2zFPINvNzcZlizLpoYwI3JTc4nIEf1BGKTLB0FRFinlwN5A5cbsUJlx0mRGdkBF8ALRRZ1eNCu
	UHLyxjj5ELGVdKDwGim+r5Tn6K1ohkelZs+ezgydmvAdG5z7JfH8GkcP5SJthGWId1IavBbVgUQpn
	VGSNH0k/NO1MKHj/vHn2FXhGR4lB+oAaQCkb9rlCW0Y7UbEnZy88QN7g/uMSEQ4ggf7L5yEi8sJvQ
	r380WWCzrWnsl1jePegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjD-00000005ars-2UdG;
	Wed, 11 Nov 2026 04:14:31 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjA-00000005arX-16sO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:14:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1EB710DCE8;
	Wed, 11 Nov 2026 05:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794370460;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5LxM/zW32Rd01ubKGpE8Na9mT8q2E7+7oK0A4eJKMjo=;
	b=jBG5EcGPj0USytRC6I/igvoroGRuYoLBX87GgPWn1WWLEuqCxdpNV1dQcgXaz6EI6VezNI
	+Xdwsbx3mvxUat0M1o3GZquUuPcHsTI8tMSBX3ZOdW4TR6vIbcJvXDq79M8J0zVf3y04Ox
	rkx6jDo2yPfgUas0yemQuiFq4j00ys5J6++dVnDRVuwrnfP5fIpDFgBsLEcTRGXzYzUTzC
	o/OjJ1MlWP0I6VQYpCR8L+PIKF7lE0j4yKGhbh/IQln8a9Dib/aMr2LCus8Vh2WHlyP1IO
	/ap7ToQ2aImYknUFIPFs4f15heXThefab97+6SpdVno6nTDYqsWxxTy3/vJrlQ==
Message-ID: <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
Date: Tue, 10 Nov 2026 14:59:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
 <auGdT2kdxwfbB_ol@parshuram>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <auGdT2kdxwfbB_ol@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_201428_556055_80250185 
X-CRM114-Status: GOOD (  11.44  )
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
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 7:59 AM, Vinod Koul wrote:
> On 27-10-26, 18:18, Marek Vasut wrote:
>> On 9/30/26 11:46 PM, Marek Vasut wrote:
>>> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
>>> It is pin-compatible with TI TCAN1042 and has a compatible programming
>>> model, therefore use ti,tcan1042 as fallback compatible.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>> ---
>>> Cc: Aswath Govindraju <a-govindraju@ti.com>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Frank Li <Frank.Li@nxp.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: imx@lists.linux.dev
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-can@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>> V2: No change
>>> V3: No change
>>> V4: No change
>>> V5: Add RB from Krzysztof
>>> V6: No change
>>> ---
>>>    Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> index 0cf5fa21106b6..e97b1bc0a2e45 100644
>>> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> @@ -18,6 +18,7 @@ properties:
>>>          - items:
>>>              - enum:
>>>                  - microchip,ata6561
>>> +              - microchip,ata6563
>>>                  - ti,tcan1051
>>>              - const: ti,tcan1042
>>>          - items:
>>
>> +CC Vinod, is this patch OK with you ?
> 
> Looks good to me, I will pick this after rc1 (monday)
I would like to do a brief reminder here, so this won't get lost, since 
rc1 is now out and I don't see this in dmaengine.git.

Thank you for your help!

